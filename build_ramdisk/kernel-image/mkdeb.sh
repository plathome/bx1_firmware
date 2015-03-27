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

#set -x

if [ "$#" -ne "8" ] ; then
	echo
	echo "usage: $0 [VERSION] [ARCH] [TARGET] [bzImage] [ramdisk.gz] [grub.cfg] [flashcfg] [MD5]"
	echo
	echo "ex) $0 1.0.0-0 amd64 bpv4 bzImage ramdisk-bpv.img.gz grub.cfg flashcfg MD5.bpv4"
	echo
	exit 1
fi

VERSION=$1
ARCH=$2
MODEL=$3
FIRM=$4
INITRD=$5
GRUB=$6
FLASHCFG=$7
MD5=$8
FIRM_DIR=$(dirname $FIRM)
if [ "$MODEL" == "obsbx1" ]; then
	DESCRIPTION="Linux firmware for OpenBlocks IoT BX1"
else
	DESCRIPTION="Linux firmware for Based Platform V"
fi

pkgdir=kernel-image-${VERSION}-${MODEL}

rm -rf  $pkgdir
mkdir -p $pkgdir
(cd template;tar --exclude=CVS -cf - .) | tar -xvf - -C $pkgdir/

echo $VERSION > $pkgdir/etc/openblocks-release
sed -e "s|__VERSION__|$VERSION|" \
    -e "s|__ARCH__|$ARCH|" \
    -e "s|__PACKAGE__|kernel-image-$TARGET|" \
    -e "s|__DESCRIPTION__|$DESCRIPTION|" \
	< $pkgdir/DEBIAN/control > /tmp/control.new
mv -f /tmp/control.new $pkgdir/DEBIAN/control

cp -f $FIRM $pkgdir/etc/
echo "MODEL=$MODEL"
case $MODEL in
bpv4*|bpv8)
cp -f $INITRD $pkgdir/etc/ramdisk-bpv.img.gz
sed -e "s|__VERSION__|$VERSION|" \
	< $GRUB > /tmp/grub.cfg.new
mv -f /tmp/grub.cfg.new $pkgdir/etc/grub.cfg
chmod 444 $pkgdir/etc/grub.cfg
cp -f $INITRD $pkgdir/etc/
;;
*)
cp -f $INITRD $pkgdir/etc/ramdisk-wheezy.${MODEL}.img.gz
;;
esac
cp -f $FLASHCFG $pkgdir/etc/
if [ -e $MD5 ]; then
	cp -f $MD5 $pkgdir/etc/
fi

rm -rf ${pkgdir}.deb

dpkg-deb --build $pkgdir

[ "$FIRM_DIR" != "." ] && mv -fv $pkgdir.deb $FIRM_DIR/

rm -rf $pkgdir

