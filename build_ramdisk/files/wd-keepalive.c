/*	$ssdlinux: wd_keepalive.c,v 0.01 2014/01/07 07:19:59 yamagata Exp $	*/
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

#include <linux/watchdog.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <signal.h>
#include <errno.h>

#define PID_FILE "/var/run/wd-keepalive.pid"
#define WD_FILE "/dev/watchdog"
#define STOP_FILE "/sys/class/misc/watchdog/disable"
#define INTERVAL 30

int forever;

void donothing(int i){}
void die(int i)
{
	forever=0;
	exit(0);
}

void wd_keepalive()
{
	int opt=WDIOS_ENABLECARD;
	int fd;

#if defined(DEBUG)
	printf("%d: keepalive start\n", __LINE__);
#endif
	if((fd = open(WD_FILE, O_WRONLY)) < 0){
#if defined(DEBUG)
		printf("%d: %s\n", __LINE__, strerror(errno));
#endif
		exit(-4);
	}

	if(ioctl(fd, WDIOC_SETOPTIONS, &opt)){
#if defined(DEBUG)
		printf("%d: %s\n", __LINE__, strerror(errno));
#endif
		close(fd);
		exit(-5);

	}

	forever=1;
	while(forever){
		if(ioctl(fd, WDIOC_KEEPALIVE, 0) < 0){
#if defined(DEBUG)
			printf("%d: %s\n", __LINE__, strerror(errno));
#endif
			close(fd);
			exit(-6);
		}
		sleep(INTERVAL);
	}
	close(fd);
	exit(0);
}

int main(void)
{
	char buf[100];
	int pid;
	int fd;

	if(getuid()){
		printf("must run super user\n");
		return 1;
	}

	if((pid = fork())){
		/* parent */
		if((fd = open(PID_FILE, O_CREAT|O_WRONLY|O_TRUNC)) < 0){
			printf("%d: %s\n", __LINE__, strerror(errno));
			exit(-1);
		}
		sprintf(buf, "%d\n", pid);
		if(write(fd, buf, strlen(buf)) != strlen(buf)){
			printf("%d: %s\n", __LINE__, strerror(errno));
			close(fd);
			exit(-1);
		}
		close(fd);
		return 0;
		
	}
	else{
#if !defined(DEBUG)
		close(STDIN_FILENO);
		close(STDOUT_FILENO);
		close(STDERR_FILENO);
#endif

		if(setsid() == -1){
#if defined(DEBUG)
			printf("%d: %s\n", __LINE__, strerror(errno));
#endif
			exit(-1);
		}

		/* child */
		signal( SIGHUP,donothing);
		signal( SIGINT,die);
		signal( SIGQUIT,die);
		signal( SIGILL,die);
		signal( SIGTRAP,die);
		signal( SIGABRT,die);
		signal( SIGIOT,die);
		signal( SIGBUS,die);
		signal( SIGFPE,die);
		signal( SIGKILL,die);
		signal( SIGUSR1,die);
		signal( SIGSEGV,die);
		signal( SIGUSR2,die);
		signal( SIGPIPE,die);
		signal( SIGALRM,die);
		signal( SIGTERM,die);
		signal( SIGSTKFLT,die);
		signal( SIGCHLD,die);
		signal( SIGCONT,die);
		signal( SIGSTOP,die);
		signal( SIGTSTP,die);
		signal( SIGTTIN,die);
		signal( SIGTTOU,die);
		signal( SIGURG,die);
		signal( SIGXCPU,die);
		signal( SIGXFSZ,die);
		signal( SIGVTALRM,die);
		signal( SIGPROF,die);
		signal( SIGWINCH,die);
		signal( SIGIO,die);
		signal( SIGPWR,die);
		signal( SIGSYS,die);
		wd_keepalive();
	}

	return 0;
}

