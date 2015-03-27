/*	$ssdlinux: runled_bx1.c,v 1.17 2014/01/07 07:19:06 yamagata Exp $	*/
/*
 * Copyright (c) 2008-2014 Plat'Home CO., LTD.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the Plat'Home CO., LTD. nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <string.h>
#include <termios.h>
#include <unistd.h>
#include <errno.h>

#define DEFAULT_MODEM "/dev/ttyACM3"
#define POWERSW "/sys/class/gpio/gpio165/value"
#define LED_R "/sys/class/gpio/gpio47/value"
#define LED_G "/sys/class/gpio/gpio48/value"
#define LED_B "/sys/class/gpio/gpio49/value"
#define TIMEOUT 5
#define BUFSZ 2048

#define CMD_PON "PON"
#define CMD_POFF "POFF"
#define CMD_PRST "PRST"
#define CMD_SMONI "SMONI"
#define CMD_SIND "SIND"
#define CMD_CCID "CCID"
#define CMD_CSQ "CSQ"
#define CMD_ATI "ATI"

#define AT_AT "at\r\n"
#define AT_POFF "at^smso\r\n"
#define AT_SMONI "at^smoni\r\n"
#define AT_SIND "at^sind?\r\n"
#define AT_CCID "at+ccid\r\n"
#define AT_CSQ "at+csq\r\n"
#define AT_ATI "ati\r\n"

static struct termios old;
static char MODEM[32];

void usage(char *fname)
{
	printf("3G modem support program for gemalto cinterion EHS6\n");
	printf("# %s [option] CMD CMD CMD ...\n", fname);
	printf("CMD :\n");
	printf("PON\t= power on modem\n"); 
	printf("POFF\t= power off modem\n");
	printf("PRST\t= reboot modem\n");
	printf("SMONI\t= get signal strength(dBm)\n");
	printf("SIND\t= get time\n");
	printf("CSQ\t= get signal quality(dBm)\n");
	printf("CCID\t= get USIM card identification number\n");
	printf("ATI\t= get product identification information\n");
	printf("\n");
	printf("option:\n");
	printf("\t-d modemdevice (default is /dev/ttyACM3)\n");
	printf("\n");
}

int set_power(char *val)
{
	int fd;

	if((fd = open(POWERSW, O_RDWR)) == -1){
		printf("%d: %s\n", __LINE__, strerror(errno));
		return -1;
	}
	if(write(fd, val, 1) == -1){
		printf("%d: %s\n", __LINE__, strerror(errno));
		close(fd);
		return -1;
	}
	close(fd);
	return 0;
}

int init_modem(int *fd)
{
	int ret;
	struct termios new;

	/* permission */
	if(chmod(MODEM, S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH) == -1){
		printf("%d: %s\n", __LINE__, strerror(errno));
		return -1;
	}
	/* open modem */
	if((*fd = open(MODEM, O_RDWR|O_NOCTTY|O_NONBLOCK)) == -1){
		printf("%d: %s\n", __LINE__, strerror(errno));
		return -1;
	}
	/* check MODEM */
	if(ioctl(*fd, TIOCMGET, &ret) == -1){
		printf("%d: %s\n", __LINE__, strerror(errno));
		return -1;
	}
	if(tcgetattr(*fd, &old) == -1){
		printf("%d: %s\n", __LINE__, strerror(errno));
		return -1;
	}
	memset(&new, 0x0, sizeof(struct termios));
	new.c_cflag = B115200|CRTSCTS|CREAD|CS8|CLOCAL;
	new.c_iflag = IGNPAR|ICRNL;
	new.c_cc[VINTR] = 0;
	new.c_cc[VQUIT] = 0;
	new.c_cc[VERASE] = 0;
	new.c_cc[VKILL] = 0;
	new.c_cc[VEOF] = 4;
	new.c_cc[VTIME] = 0;
	new.c_cc[VMIN] = 1;
	new.c_cc[VSWTC] = 0;
	new.c_cc[VSTART] = 0;
	new.c_cc[VSTOP] = 0;
	new.c_cc[VSUSP] = 0;
	new.c_cc[VEOL] = 0;
	new.c_cc[VREPRINT] = 0;
	new.c_cc[VDISCARD] = 0;
	new.c_cc[VWERASE] = 0;
	new.c_cc[VLNEXT] = 0;
	new.c_cc[VEOL2] = 0;

	tcflush(*fd, TCIFLUSH);
	if(tcsetattr(*fd, TCSANOW, &new) == -1){
		printf("%d: %s\n", __LINE__, strerror(errno));
		return -1;
	}
	return 0;
}

int send_atcmd(int fd, char *cmd, char *buf, int wait)
{
	int ret;
	fd_set fds;
	struct timeval tv;

	if(write(fd, cmd, strlen(cmd)) == -1){
		printf("%d: %s\n", __LINE__, strerror(errno));
		return -1;
	}

	FD_ZERO(&fds);
	FD_SET(fd, &fds);

	tv.tv_sec = TIMEOUT;
	tv.tv_usec = 0;

	if((ret = select(fd+1, &fds, NULL, NULL, &tv)) == -1){
		printf("%d: %s\n", __LINE__, strerror(errno));
		return -1;
	}
	else if(ret){
		sleep(wait);
		if((ret = read(fd, buf, BUFSZ)) == -1){
			printf("%d: %s\n", __LINE__, strerror(errno));
			return -1;
		}
		buf[ret] = 0x0;
	}
	else{
		printf("%d: receive timeout\n", __LINE__);
		return -1;
	}
	return 0;
}

void end_modem(int fd)
{
	if(fd){
		tcsetattr(fd, TCSANOW, &old);
		close(fd);
	}
}

#if 0
void put_led(char *str)
{
	long val;

	val = strtol(str, NULL, 10);
	if(val == LONG_MAX || val == LONG_MIN)
		return;

	if(val >= -77){						/* antena 5 */
	}
	else if(val <= -78 && val >= -87){	/* antena 4 */
	}
	else if(val <= -88 && val >= -98){	/* antena 3 */
	}
	else if(val <= -99 && val >= -106){	/* antena 2 */
	}
	else if(val <= -107 && val >= -129){/* antena 1 */
	}
	else{	/* under -130 , out of area */
	}
}
#endif

int get_dbm(char *buf)
{
	int i;
	char *p1, *p2;
	char val[BUFSZ];

#ifdef _DEBUG_
//printf("buf=%s\n", buf);
#endif
	/* check error */
	if(strstr(buf, "ERROR")){
		return -1;
	}
	if(strstr(buf, "SEARCH")){
		return -1;
	}
	/* get start point */
	p1 = buf;
	for(i=1; i<5; i++){
		p1 = strchr(p1, ',');
		p1++;
	}
	if(p1 == NULL){
		return -1;
	}
	/* get end point */
	p2 = strchr(p1+1, ',');
	if(p2 == NULL){
		return -1;
	}
	memcpy(val, p1, p2-p1);
	val[p2-p1] = 0;
	printf("%s\n", val);
#if 0
	put_led(val);
#endif

	return 0;
}

int get_time(char *buf)
{
#define NITZ "nitz"
	int i;
	char *p1;
	char year[3], mon[3], day[3], hour[3], min[3], sec[3];

//printf("buf=%s\n", buf);
	/* check error */
	if(strstr(buf, "ERROR")){
		return -1;
	}
	if(strstr(buf, "SEARCH")){
		return -1;
	}
	/* get start point */
	if((p1 = strstr(buf, NITZ)) == NULL){
		return -1;
	}
	for(i=0; i<2; i++){
		if((p1 = strchr(p1, ',')) == NULL){
			return -1;
		}
		p1++;
	}
	p1++;	// skip '"'

//printf("p1=%s\n", p1);
	// get year
	memcpy(year, p1, 2);
	year[2] =0;
	p1 += 3;
	// get month
	memcpy(mon, p1, 2);
	mon[2] =0;
	p1 += 3;
	// get day
	memcpy(day, p1, 2);
	day[2] =0;
	p1 += 3;
	// get hour
	memcpy(hour, p1, 2);
	hour[2] =0;
	p1 += 3;
	// get min
	memcpy(min, p1, 2);
	min[2] =0;
	p1 += 3;
	// get sec
	memcpy(sec, p1, 2);
	sec[2] =0;
	p1 += 2;
	if( *p1 != '"'){	// check '"'
		return -1;
	}
	printf("%s/%s/%s %s:%s:%s\n", mon, day, year, hour, min, sec);

	return 0;
}

int get_quality(char *buf)
{
#define HEAD "+CSQ: "
	char *p1, *p2;
	char val[BUFSZ];
	long rssi;

#ifdef _DEBUG_
//printf("buf=%s\n", buf);
#endif
	/* check error */
	if(strstr(buf, "ERROR")){
		return -1;
	}
	if(strstr(buf, "SEARCH")){
		return -1;
	}
	/* get start point */
	if((p1 = strstr(buf, HEAD)) == NULL){
		return -1;
	}
	p1 += strlen(HEAD);

	/* get end point */
	p2 = strchr(p1+1, ',');
	if(p2 == NULL){
		return -1;
	}
	memcpy(val, p1, p2-p1);
	val[p2-p1] = 0;
	rssi = strtol(val, NULL, 10);
	printf("%ld\n", (-113 + rssi * 2));

	return 0;
}

int get_ccid(char *buf)
{
#define CCIDLEN 19
	char *p1;

	/* check error */
	if(strstr(buf, "ERROR")){
		return -1;
	}
	/* search top */
	if((p1 = strchr(buf, ':')) == NULL){
		return -1;
	}
	p1 += 2;
	p1[CCIDLEN] = 0x0;
	printf("%s\n", p1);
	return 0;
}

int get_ati(char *buf)
{
	/* check error */
	if(strstr(buf, "ERROR")){
		return -1;
	}
	printf("%s\n", buf);
	return 0;
}

int main(int ac, char *av[])
{
	int fd=0;
	int i=1, j=0;
	int pon_flag=0;
	char buf[BUFSZ];
	int ret;

	if(ac == 1){
		usage(av[0]);
		return 1;
	}

	if(strncmp(av[1], "-d", 2) == 0){
		strncpy(MODEM, av[2], sizeof(MODEM) - 1);
		i = 3;
	}
	else{
		memcpy(MODEM, DEFAULT_MODEM, sizeof(DEFAULT_MODEM));
		i = 1;
	}

	for(; i<ac; i++){
		if(strncmp(CMD_PON, av[i], sizeof(CMD_PON)) == 0){
			set_power("1");
			sleep(12);
			pon_flag=1;
		}
		else if(strncmp(CMD_POFF, av[i], sizeof(CMD_POFF)) == 0){
			if(fd == 0 && init_modem(&fd)){
				end_modem(fd);
				return -1;
			}
			set_power("0");
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_POFF, buf, 1);
		}
		else if(strncmp(CMD_PRST, av[i], sizeof(CMD_PRST)) == 0){
			if(fd == 0 && init_modem(&fd)){
				end_modem(fd);
				return -1;
			}
			set_power("1");
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_POFF, buf, 1);
		}
		else if(strncmp(CMD_SMONI, av[i], sizeof(CMD_SMONI)) == 0){
			if(fd == 0 && init_modem(&fd)){
				end_modem(fd);
				return -1;
			}
			if(pon_flag)
				sleep(18);
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_SMONI, buf, 3);
			if(get_dbm(buf)){
//				printf("%d: unknown response\n", __LINE__);
				return -1;
			}
		}
		else if(strncmp(CMD_CSQ, av[i], sizeof(CMD_CSQ)) == 0){
			if(fd == 0 && init_modem(&fd)){
				end_modem(fd);
				return -1;
			}
			if(pon_flag)
				sleep(18);
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_CSQ, buf, 3);
			if(get_quality(buf)){
//				printf("%d: unknown response\n", __LINE__);
				return -1;
			}
		}
		else if(strncmp(CMD_CCID, av[i], sizeof(CMD_CCID)) == 0){
			if(fd == 0 && init_modem(&fd)){
				end_modem(fd);
				return -1;
			}
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_CCID, buf, 1);
			if(get_ccid(buf)){
//				printf("%d: unknown response\n", __LINE__);
				return -1;
			}
		}
		else if(strncmp(CMD_ATI, av[i], sizeof(CMD_ATI)) == 0){
			if(fd == 0 && init_modem(&fd)){
				end_modem(fd);
				return -1;
			}
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_ATI, buf, 1);
			if(get_ati(buf)){
//				printf("%d: unknown response\n", __LINE__);
				return -1;
			}
		}
		else if(strncmp(CMD_SIND, av[i], sizeof(CMD_SIND)) == 0){
			if(fd == 0 && init_modem(&fd)){
				end_modem(fd);
				return -1;
			}
			if(pon_flag)
				sleep(18);
			send_atcmd(fd, AT_AT, buf, 1);
			send_atcmd(fd, AT_AT, buf, 1);
			for(j=0; j<12; i++){
				send_atcmd(fd, AT_SIND, buf, 3);
				if(!get_time(buf)){
					break;
				}
				sleep(5);
			}
		}
		else{
			printf("unknown CMD(%s)\n", av[i]);
			break;
		}
	}
	end_modem(fd);
	return 0;
}
