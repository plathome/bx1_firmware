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

DIST=${DIST:=wheezy}

TARGET=${TARGET:=bpv4}

COMP=${COMP:=lzma}

COMPEXT=${COMPEXT:=lzma}

export TARGET DIST

ENA_BX1PM=false

KERNEL=3.12.35
ISOFILE=debian-7.8.0-amd64-DVD-1.iso
ARCH=amd64
COMPLVL=9
COMP=gzip
COMPEXT=gz
DEFCONFIG=${TARGET}_defconfig
ENA_VIRT=true
ENA_AUDIO=false

case ${DIST} in
wheezy)
	case ${TARGET} in
	bpv4)
		PATCHLEVEL=1
		RAMDISK_SIZE=800
		ENA_VIRT=true
	;;
	bpv4-h)
		PATCHLEVEL=1
		RAMDISK_SIZE=200
		ENA_VIRT=false
	;;
	bpv8)
		PATCHLEVEL=1
		RAMDISK_SIZE=800
		ENA_VIRT=false
	;;
	obsbx1)
		KERNEL=3.10.17
		ARCH=i386
#		DEFCONFIG=obsbx1_defconfig
		ISOFILE=debian-7.8.0-i386-DVD-1.iso
		PATCHLEVEL=5
		RAMDISK_SIZE=190
		ENA_VIRT=false
		ENA_AUDIO=false
#		ENA_BX1PM=true
	;;
	*) exit 1 ;;
	esac
;;
esac

if [ -f _config.sh ] ; then
	. _config.sh
elif [ -f ../_config.sh ] ; then
	. ../_config.sh
else
	echo "could't read _config.sh"
	exit 1
fi
