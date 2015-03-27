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

(cd ${ETCDIR};sort exclude.list > /tmp/exclude.list.new; mv -f /tmp/exclude.list.new exclude.list)

(cd ${ETCDIR};tar --exclude=CVS -cf - .)| tar xf - -C ${DISTDIR}/etc/
(cd ${ETCDIR_ADD};tar --exclude=CVS -cf - .)| tar xf - -C ${DISTDIR}/etc/

(cd ${DISTDIR}/etc; (cd ${ETCDIR};find . -type f) | xargs chown root:root ${DISTDIR}/etc)

(cd ${DISTDIR}/etc; (cd ${ETCDIR_ADD};find . -type f) | xargs chown root:root ${DISTDIR}/etc)

for sh in openblocks-setup pshd ;do
	chmod 755 ${DISTDIR}/etc/init.d/$sh
	chroot ${DISTDIR} /usr/sbin/update-rc.d -f $sh remove
	case $sh in
	openblocks-setup)
		chroot ${DISTDIR} /usr/sbin/update-rc.d $sh start 3 S . stop 1 0 6 .
		;;
	*)
		chroot ${DISTDIR} /usr/sbin/update-rc.d $sh defaults
		;;
	esac
done

if [ ${TARGET} == "obsbx1" ]; then
	chmod 755 ${DISTDIR}/etc/init.d/wd-keepalive
	chroot ${DISTDIR} /usr/sbin/update-rc.d -f wd-keepalive remove
	chroot ${DISTDIR} /usr/sbin/update-rc.d wd-keepalive  stop 1 0 6 .
	chmod 755 ${DISTDIR}/etc/init.d/bluetooth
	chroot ${DISTDIR} /usr/sbin/update-rc.d -f bluetooth remove
	chroot ${DISTDIR} /usr/sbin/update-rc.d bluetooth defaults
	chmod 755 ${DISTDIR}/etc/init.d/runled
	chroot ${DISTDIR} /usr/sbin/update-rc.d -f runled remove
	chroot ${DISTDIR} /usr/sbin/update-rc.d runled defaults
	chmod 755 ${DISTDIR}/etc/init.d/pshd
	chroot ${DISTDIR} /usr/sbin/update-rc.d -f pshd remove
	chroot ${DISTDIR} /usr/sbin/update-rc.d pshd defaults
	chmod 755 ${DISTDIR}/etc/init.d/disable-modem
	chroot ${DISTDIR} /usr/sbin/update-rc.d -f disable-modem remove
	chroot ${DISTDIR} /usr/sbin/update-rc.d disable-modem  stop 1 0 6 .
	if [ ${ENA_BX1PM} == "true" ]; then
		chmod 755 ${DISTDIR}/etc/init.d/enable-pm
		chroot ${DISTDIR} /usr/sbin/update-rc.d -f enable-pm remove
		chroot ${DISTDIR} /usr/sbin/update-rc.d enable-pm defaults
	fi
	chroot ${DISTDIR} /usr/sbin/update-rc.d -f hwclock.sh remove
	chroot ${DISTDIR} /usr/sbin/update-rc.d hwclock.sh start 4 S .
	chmod 755 ${DISTDIR}/etc/init.d/nitz
	chroot ${DISTDIR} /usr/sbin/update-rc.d -f nitz remove
	chroot ${DISTDIR} /usr/sbin/update-rc.d nitz start 1 2 3 4 5 .

	chroot ${DISTDIR} /sbin/insserv
fi

touch ${DISTDIR}/etc/init.d/.legacy-bootordering

if [ ${TARGET} == "obsbx1" ]; then
	printf "0.000000 1425017450 0.000000\n1425017450\nUTC\n" > ${DISTDIR}/etc/adjtime
else
	printf "0.0 0 0.0\n0\nLOCAL\n" > ${DISTDIR}/etc/adjtime
fi

if [ -f ${DISTDIR}/etc/modules ]; then
	if grep -q "^ipv6" ${DISTDIR}/etc/modules
	then
		echo "/etc/modules: The line, ipv6, exists"
	else
		echo "ipv6" >> ${DISTDIR}/etc/modules
	fi
fi

if [ "$ENA_VIRT" == "true" ]; then
	if grep -q "^kvm-intel" ${DISTDIR}/etc/modules
	then
		echo "/etc/modules: The line, kvm-intel, exists"
	else
		echo "kvm-intel" >> ${DISTDIR}/etc/modules
	fi
fi
