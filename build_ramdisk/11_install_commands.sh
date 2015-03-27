#!/bin/bash
#
# Copyright (c) 2013, 2014 Plat'Home CO., LTD.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY PLAT'HOME CO., LTD. AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL PLAT'HOME CO., LTD. AND CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

. `dirname $0`/config.sh

case $TARGET in
bpv4*)
	BUILDDIR=/tmp/obstools.$$
	LINUX_INC=$(dirname $0)/../source/${TARGET}/linux-${KERNEL}/include

	CFLAGS="-Wall -I/usr/${KERN_ARCH}-linux-gnu${ABI}/include -L/usr/${KERN_ARCH}-linux-gnu${ABI}/lib -DCONFIG_SBC8A361"

	mkdir -p ${BUILDDIR}
	echo "PSHD"
	$CC -o ${BUILDDIR}/pshd ${FILESDIR}/pshd_amd64.c $CFLAGS

	echo;echo;echo
	(cd ${BUILDDIR}; ls -l pshd)

	for cmd in pshd; do
		(cd ${BUILDDIR}; install -c -o root -g root -m 555 $cmd ${DISTDIR}/usr/sbin/$cmd)
		$STRIP ${DISTDIR}/usr/sbin/$cmd
	done
;;
obsbx1)
	BUILDDIR=/tmp/obstools.$$
	LINUX_INC=$(dirname $0)/../source/${TARGET}/linux-${KERNEL}/include

	CFLAGS="-Wall -I/usr/include/${KERN_ARCH}-linux-gnu${ABI}/ -L/usr/lib/${KERN_ARCH}-linux-gnu${ABI}/ -m32"

	mkdir -p ${BUILDDIR}

	echo "HOSTAPD"
	if [ -d ${FILESDIR}/hostapd ]; then
		if [ ! -f ${FILESDIR}/hostapd/.config ]; then
			cp ${FILESDIR}/hostapd/hostapd/defconfig ${FILESDIR}/hostapd/hostapd/.config
		fi
		(cd ${FILESDIR}/hostapd/hostapd;CFLAGS="-MMD -O2 -Wall -m32" LDFLAGS="-m32" CC=gcc make;DESTDIR=${DISTDIR} make install)
	fi

	echo "WD-KEEPALIVE"
	$CC -o ${BUILDDIR}/wd-keepalive ${FILESDIR}/wd-keepalive.c $CFLAGS

	echo "KOSANU"
	$CC -o ${BUILDDIR}/kosanu ${FILESDIR}/kosanu.c $CFLAGS

	echo "RUNLED"
	$CC -o ${BUILDDIR}/runled ${FILESDIR}/runled_bx1.c $CFLAGS

	echo "PSHD"
	$CC -o ${BUILDDIR}/pshd ${FILESDIR}/pshd_bx1.c $CFLAGS

	echo "ATCMD"
	$CC -o ${BUILDDIR}/atcmd ${FILESDIR}/atcmd.c $CFLAGS

	echo;echo;echo
	(cd ${BUILDDIR}; ls -l wd-keepalive pshd runled kosanu atcmd)
	(cd ${FILESDIR}; ls -l  bluetooth_rfkill_event brcm_patchram_plus gatttool)

	for cmd in wd-keepalive pshd runled kosanu atcmd; do
		(cd ${BUILDDIR}; install -c -o root -g root -m 555 $cmd ${DISTDIR}/usr/sbin/$cmd)
		$STRIP ${DISTDIR}/usr/sbin/$cmd
	done
	for cmd in bluetooth_rfkill_event brcm_patchram_plus; do
		(cd ${FILESDIR}; install -c -o root -g root -m 555 $cmd ${DISTDIR}/usr/sbin/$cmd)
		$STRIP ${DISTDIR}/usr/sbin/$cmd
	done
	(cd ${FILESDIR}; install -c -o root -g root -m 555 gatttool ${DISTDIR}/usr/local/sbin/gatttool)
	$STRIP ${DISTDIR}/usr/local/sbin/gatttool
	cp ${FILESDIR}/chksignal.sh ${DISTDIR}/usr/sbin/
	chmod 555 ${DISTDIR}/usr/sbin/chksignal.sh
;;
*)
;;
esac

cp ${FILESDIR}/flashcfg.sh ${DISTDIR}/usr/sbin/flashcfg
chmod 555 ${DISTDIR}/usr/sbin/flashcfg

rm -rf ${BUILDDIR}

