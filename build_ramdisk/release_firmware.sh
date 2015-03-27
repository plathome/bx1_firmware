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

if [ "$CROSS" == "true" ]; then
	KERN_COMPILE_OPTS="ARCH=$KERN_ARCH CROSS_COMPILE=${CROSS_COMPILE=}"
else
	KERN_COMPILE_OPTS="ARCH=$KERN_ARCH"
fi

_RAMDISK_IMG=${DISTDIR}/../${RAMDISK_IMG}

mount -o loop ${_RAMDISK_IMG} ${MOUNTDIR}

rm -rf ${MOUNTDIR}/lib/modules/${KERNEL}
rm -rf ${MOUNTDIR}/lib/firmware

VERSION=${KERNEL}-${PATCHLEVEL}

(cd ${LINUX_SRC}; make INSTALL_MOD_PATH=${MOUNTDIR} ${KERN_COMPILE_OPTS} modules_install)
cp -f ${LINUX_SRC}/System.map ${MOUNTDIR}/boot/
rm -f ${MOUNTDIR}/lib/modules/${KERNEL}/source ${MOUNTDIR}/lib/modules/${KERNEL}/build
if [ "$TARGET" == "obsbx1" ]; then
	echo "BCM4334X"
	if [ -d ${FILESDIR}/driver_bcm43x ]; then
		(cd ${FILESDIR}/driver_bcm43x;KERNEL_SRC=${LINUX_SRC} make;KERNEL_SRC=${LINUX_SRC} INSTDIR=${MOUNTDIR} make modules_install)
	fi

	mkdir -p ${MOUNTDIR}/factory
fi

umount ${MOUNTDIR}

if [ ! -d ${RELEASEDIR} ]; then
	mkdir -p ${RELEASEDIR}
fi

cp -f ${LINUX_SRC}/System.map ${RELEASEDIR}

case $TARGET in
bpv4*|bpv8)
	cp -f ${LINUX_SRC}/arch/${KERN_ARCH}/boot/bzImage ${RELEASEDIR}
	${COMP} -${COMPLVL:-3} < ${_RAMDISK_IMG} > ${RELEASEDIR}/ramdisk-bpv.img.${COMPEXT}
	cp -f ${LINUX_SRC}/arch/${KERN_ARCH}/boot/bzImage ${RELEASEDIR}/bzImage.recovery
	cp -f ${RELEASEDIR}/ramdisk-bpv.img.${COMPEXT} ${RELEASEDIR}/ramdisk-bpv.img.recovery.${COMPEXT}
	(cd ${WRKDIR}/build_ramdisk/kernel-image; ./mkdeb.sh ${VERSION} ${ARCH} ${TARGET} ${RELEASEDIR}/bzImage ${RELEASEDIR}/ramdisk-bpv.img.${COMPEXT} ${FILESDIR}/grub/grub.cfg ${FILESDIR}/flashcfg.sh ${RELEASEDIR}/MD5.${TARGET})
	(cd ${RELEASEDIR}; rm -f MD5.${TARGET}; md5sum * > MD5.${TARGET})
;;
*)
	cp -f ${LINUX_SRC}/arch/${KERN_ARCH}/boot/bzImage ${RELEASEDIR}
	${COMP} -${COMPLVL:-3} < ${_RAMDISK_IMG} > ${RELEASEDIR}/${RAMDISK_IMG}.${COMPEXT}
	(cd ${RELEASEDIR}; rm -f MD5.${TARGET}; md5sum * > MD5.${TARGET})
	(cd ${WRKDIR}/build_ramdisk/kernel-image; ./mkdeb.sh ${VERSION} ${ARCH} ${TARGET} ${RELEASEDIR}/bzImage ${RELEASEDIR}/${RAMDISK_IMG}.${COMPEXT} ${FILESDIR}/grub/grub.cfg ${FILESDIR}/flashcfg.sh ${RELEASEDIR}/MD5.${TARGET})
	(cd ${RELEASEDIR}; rm -f MD5.${TARGET}; md5sum * > MD5.${TARGET})
;;
esac
