/*	$ssdlinux: pshd_amd64.c,v 0.01 2014/01/07 07:19:59 yamagata Exp $	*/
/*
 * Copyright (c) 2009-2014 Plat'Home CO., LTD.
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
/*
 * Push SW deamon
 */

/*
 * Base on 
 * Axiomtek SBC8A361 Board Support Package for User mode API Library
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/io.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <time.h>
#include <signal.h>
#include <string.h>
#include <errno.h>

#define PID_FILE	"/var/run/pshd.pid"
#define GPIO_BAR 	0x500	//GPIO Base Address Register
#define GP_LVL		0x88	//0C~0Fh GPIO Level for Input or Output

#define INTERVAL	500 * 1000 * 1000
#define REBOOT		4
#define HALT		10
#define BEEPEND		13

#if 0
char* beeptbl[] = {
	NULL,
	NULL,
	NULL,
	NULL,
	"\33[10;440][11;500]\a",
	"\33[10;494][11;500]\a",
	"\33[10;554][11;500]\a",
	"\33[10;587][11;500]\a",
	"\33[10;659][11;500]\a",
	"\33[10;740][11;500]\a",
	"\33[10;830][11;500]\a",
	"\33[10;880][11;500]\a",
};
#else
char* beeptbl[] = {
	NULL,
	NULL,
	NULL,
	NULL,
	"\33[10;440][11;500]\a",
	"\33[10;440][11;500]\a",
	NULL,
	NULL,
	NULL,
	NULL,
	"\33[10;880][11;500]\a",
	"\33[10;880][11;500]\a",
	"\33[10;880][11;500]\a",
	NULL,
};
#endif

int _8a361_read_bt1(void);
int _read_gp_lvl(int);
void donothing(int);
void die(int);

static int flag = 1;	// exit() flag

#if defined(CONFIG_SBC8A361)
int _read_gp_lvl(int xbit)
{
	unsigned char rdata=0, rbit=1;
	int abit = xbit%8;
	int rate = xbit/8;
	
	if(inb(GPIO_BAR+GP_LVL+rate)){
		rdata=inb(GPIO_BAR+GP_LVL+rate);
		// printf( "DATA = %02X\n", rdata);   // Debug Message
		rdata&=(rbit<<abit);
		if(rdata==0)
			return 0;
		else{
			return 1;
		}	
		return 0;
	}
	else {
//		printf("Reading GP_LVL Error\n");
		return 1;
	}
}

int _8a361_read_bt1( void)
{
	iopl(3);
	return _read_gp_lvl(17); //ICH_GPIO17	
}
#endif

void watch_pushsw(void)
{
	struct timespec req, rem;
	FILE *fp;
	int count=0;
	char buf[16] = "now";

	memset(&req, 0x0, sizeof(req));
	memset(&rem, 0x0, sizeof(rem));

	while(flag){
		if(!_8a361_read_bt1()){		// Switch ON
			if (count < BEEPEND)
				count++;
			if(beeptbl[count] != NULL){
				fp = fopen("/dev/tty1", "w");
				fprintf(fp, "%s", beeptbl[count]);
				fclose(fp);
			}
		}
		else{						// Switch OFF
			if(count >= REBOOT && count < HALT){
				execl("/sbin/shutdown", "shutdown", "-r", buf, NULL);
			}
			else if(count >= HALT){
				execl("/sbin/shutdown", "shutdown", "-h", buf, NULL);
			}
			count=0;
		}
		req.tv_nsec = INTERVAL;
		while(nanosleep(&req, &rem) == -1)
			req.tv_nsec = rem.tv_nsec;
	}
}

int main(void)
{
	int pid, fd;

	if (getuid()) {
		fprintf(stderr, "must run super user\n");
		return 1;
	}

	if((pid = fork())){
		/* parent */
		char tmp[100];
		if ((fd = open(PID_FILE, O_CREAT|O_WRONLY|O_TRUNC)) < 0) {
			printf("%d: %s\n", __LINE__, strerror(errno));
			exit(-1);
		}
		sprintf(tmp, "%d\n", pid);
		if (write(fd, tmp, strlen(tmp)) != strlen(tmp)) {
			printf("%d: %s\n", __LINE__, strerror(errno));
			close(fd);
			exit(-2);
		}
		close(fd);
		return 0;
	}
	else{
#if 1
		/* daemon */
		close(STDIN_FILENO);
		close(STDOUT_FILENO);
		close(STDERR_FILENO);
#endif
		if(setsid() == -1) {
			exit(4);
		}

		/* child */
		signal(SIGHUP,donothing);
		signal(SIGINT,donothing);
		signal(SIGQUIT,die);
		signal(SIGILL,die);
		signal(SIGTRAP,die);
		signal(SIGABRT,die);
		signal(SIGIOT,die);
		signal(SIGBUS,die);
		signal(SIGFPE,die);
		signal(SIGUSR1,die);
		signal(SIGSEGV,die);
		signal(SIGUSR2,die);
		signal(SIGPIPE,die);
		signal(SIGALRM,die);
		signal(SIGTERM,die);
		signal(SIGCHLD,die);
		signal(SIGCONT,die);
		signal(SIGSTOP,die);
		signal(SIGTSTP,die);
		signal(SIGTTIN,die);
		signal(SIGTTOU,die);
		signal(SIGURG,die);
		signal(SIGXCPU,die);
		signal(SIGXFSZ,die);
		signal(SIGVTALRM,die);
		signal(SIGPROF,die);
		signal(SIGWINCH,die);
		signal(SIGIO,die);
		signal(SIGPWR,die);
		signal(SIGSYS,die);

		watch_pushsw();

		exit(0);
	}

	return 0;
}

void donothing(int i){
}
void die(int i){
	flag = 0;
}
