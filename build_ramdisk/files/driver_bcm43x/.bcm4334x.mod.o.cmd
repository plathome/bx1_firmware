cmd_/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/bcm4334x.mod.o := gcc -Wp,-MD,/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/.bcm4334x.mod.o.d  -nostdinc -isystem /usr/local/lib/gcc/x86_64-unknown-linux-gnu/4.8.2/include -I/home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include -Iarch/x86/include/generated  -I/home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include -Iinclude -I/home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I/home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi -Iinclude/generated/uapi -include /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/kconfig.h   -I/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -m32 -msoft-float -mregparm=3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=2 -march=core2 -mtune=generic -mtune=generic -maccumulate-outgoing-args -Wa,-mtune=generic32 -ffreestanding -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -pg -fno-inline-functions-called-once -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO   -I/include   -I/home/work/debian_based_firmware/source/obsbx1/linux-3.10.17 -DCONFIG_BCMDHD=m -DCONFIG_BCM4334x=y -DCONFIG_BCMDHD_SDIO=y -DCONFIG_INTEL_PLATFORM=y -DCONFIG_DHD_USE_SCHED_SCAN=y -DUSE_4334X -Wall -Wstrict-prototypes -Dlinux -DLINUX -DBCMDRIVER -DBCMDONGLEHOST -DUNRELEASEDCHIP -DBCMDMA32 -DBCMFILEIMAGE -DDHDTHREAD -DSHOW_EVENTS -DBCMDBG -DWIFI_ACT_FRAME -DARP_OFFLOAD_SUPPORT -DKEEP_ALIVE -DGET_CUSTOM_MAC_ENABLE -DPKT_FILTER_SUPPORT -DEMBEDDED_PLATFORM -DPNO_SUPPORT -DDHD_DONOT_FORWARD_BCMEVENT_AS_NETWORK_PKT -DCUSTOMER_HW2 -DENABLE_INSMOD_NO_FW_LOAD -DLINUX_FW_REQUEST_API   -I/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x   -I/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/include   -I/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/common/include -DWL_CFG80211 -DBCMASSERT_LOG -DCUSTOM_KEEP_ALIVE_SETTING=10000 -DVSDB -DWL_SCB_TIMEOUT=10 -DWLP2P -DWLTDLS -DWLTDLS_AUTO_ENABLE -DCUSTOM_TDLS_IDLE_MODE_SETTING=40000 -DCUSTOM_TDLS_RSSI_THRESHOLD_HIGH=-60 -DCUSTOM_TDLS_RSSI_THRESHOLD_LOW=-70 -DROAM_ENABLE -DROAM_CHANNEL_CACHE -DROAM_API -DENABLE_FW_ROAM_SUSPEND -DCUSTOM_ROAM_TRIGGER_SETTING=-75 -DCUSTOM_ROAM_DELTA_SETTING=10 -DSUPPORT_PM2_ONLY -DCUSTOM_PNO_EVENT_LOCK_xTIME=10 -DMIRACAST_AMPDU_SIZE=8 -DDHD_USE_EARLYSUSPEND -DESCAN_RESULT_PATCH -DWL_SCHED_SCAN -DCONFIG_CONTROL_PM -DDHD_USE_IDLECOUNT -DDHDENABLE_TAILPAD -DWL_CFG80211_VSDB_PRIORITIZE_SCAN_REQUEST -DWL_CFG80211_STA_EVENT -DWL_IFACE_COMB_NUM_CHANNELS -DWL_ENABLE_P2P_IF -DBDC -DOOB_INTR_ONLY -DDHD_BCMEVENTS -DMMC_SDIO_ABORT -DBCMSDIO -DBCMLXSDMMC -DUSE_SDIOFIFO_IOVAR -DPROP_TXSTATUS -DPROP_TXSTATUS_VSDB -DDHD_DEBUG -DSDTEST -DSUPPORT_AUTO_CHANNEL -DOEM_ANDROID -DCUSTOM_LISTEN_INTERVAL=3 -DBOARD_INTEL -DUSE_KTHREAD_API -DCUSTOM_RXCHAIN=1 -DDHD_USE_EARLYSUSPEND -DCUSTOM_DPC_CPUCORE=0 -DCUSTOM_GLOM_SETTING=5 -DCUSTOM_SDIO_F2_BLKSIZE=128 -DPKTPRIO_OVERRIDE -DCONFIG_BCMDHD=m -DCONFIG_BCM4334x=y -DCONFIG_BCMDHD_SDIO=y -DCONFIG_INTEL_PLATFORM=y -DCONFIG_DHD_USE_SCHED_SCAN=y -DUSE_4334X -Wall -Wstrict-prototypes -Dlinux -DLINUX -DBCMDRIVER -DBCMDONGLEHOST -DUNRELEASEDCHIP -DBCMDMA32 -DBCMFILEIMAGE -DDHDTHREAD -DSHOW_EVENTS -DBCMDBG -DWIFI_ACT_FRAME -DARP_OFFLOAD_SUPPORT -DKEEP_ALIVE -DGET_CUSTOM_MAC_ENABLE -DPKT_FILTER_SUPPORT -DEMBEDDED_PLATFORM -DPNO_SUPPORT -DDHD_DONOT_FORWARD_BCMEVENT_AS_NETWORK_PKT -DCUSTOMER_HW2 -DENABLE_INSMOD_NO_FW_LOAD -DLINUX_FW_REQUEST_API   -I/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x   -I/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/include   -I/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/common/include -DWL_CFG80211 -DBCMASSERT_LOG -DCUSTOM_KEEP_ALIVE_SETTING=10000 -DVSDB -DWL_SCB_TIMEOUT=10 -DWLP2P -DWLTDLS -DWLTDLS_AUTO_ENABLE -DCUSTOM_TDLS_IDLE_MODE_SETTING=40000 -DCUSTOM_TDLS_RSSI_THRESHOLD_HIGH=-60 -DCUSTOM_TDLS_RSSI_THRESHOLD_LOW=-70 -DROAM_ENABLE -DROAM_CHANNEL_CACHE -DROAM_API -DENABLE_FW_ROAM_SUSPEND -DCUSTOM_ROAM_TRIGGER_SETTING=-75 -DCUSTOM_ROAM_DELTA_SETTING=10 -DSUPPORT_PM2_ONLY -DCUSTOM_PNO_EVENT_LOCK_xTIME=10 -DMIRACAST_AMPDU_SIZE=8 -DDHD_USE_EARLYSUSPEND -DESCAN_RESULT_PATCH -DWL_SCHED_SCAN -DCONFIG_CONTROL_PM -DDHD_USE_IDLECOUNT -DDHDENABLE_TAILPAD -DWL_CFG80211_VSDB_PRIORITIZE_SCAN_REQUEST -DWL_CFG80211_STA_EVENT -DWL_IFACE_COMB_NUM_CHANNELS -DWL_ENABLE_P2P_IF -DBDC -DOOB_INTR_ONLY -DDHD_BCMEVENTS -DMMC_SDIO_ABORT -DBCMSDIO -DBCMLXSDMMC -DUSE_SDIOFIFO_IOVAR -DPROP_TXSTATUS -DPROP_TXSTATUS_VSDB -DDHD_DEBUG -DSDTEST -DSUPPORT_AUTO_CHANNEL -DOEM_ANDROID -DCUSTOM_LISTEN_INTERVAL=3 -DBOARD_INTEL -DUSE_KTHREAD_API -DCUSTOM_RXCHAIN=1 -DDHD_USE_EARLYSUSPEND -DCUSTOM_DPC_CPUCORE=0 -DCUSTOM_GLOM_SETTING=5 -DCUSTOM_SDIO_F2_BLKSIZE=128 -DPKTPRIO_OVERRIDE -DDHD_DEBUG -DSRCBASE=\"/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x\"   -I/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/include/   -I/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(bcm4334x.mod)"  -D"KBUILD_MODNAME=KBUILD_STR(bcm4334x)" -DMODULE  -c -o /home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/bcm4334x.mod.o /home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/bcm4334x.mod.c

source_/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/bcm4334x.mod.o := /home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/bcm4334x.mod.c

deps_/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/bcm4334x.mod.o := \
    $(wildcard include/config/module/unload.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/module.h \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/debug/set/module/ronx.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/types.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/types.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/asm-generic/types.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/int-ll64.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/asm-generic/int-ll64.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/bitsperlong.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/bitsperlong.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/asm-generic/bitsperlong.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/posix_types.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/stddef.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/stddef.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/posix_types.h \
    $(wildcard include/config/x86/32.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/posix_types_32.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/asm-generic/posix_types.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/const.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/stat.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/stat.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/stat.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/ring/buffer.h) \
  /usr/local/lib/gcc/x86_64-unknown-linux-gnu/4.8.2/include/stdarg.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/linkage.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/stringify.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/x86/64.h) \
    $(wildcard include/config/x86/alignment/16.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/bitops.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/bitops.h \
    $(wildcard include/config/x86/cmov.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/alternative.h \
    $(wildcard include/config/paravirt.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/asm.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/cpufeature.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/required-features.h \
    $(wildcard include/config/x86/minimum/cpu/family.h) \
    $(wildcard include/config/math/emulation.h) \
    $(wildcard include/config/x86/pae.h) \
    $(wildcard include/config/x86/cmpxchg64.h) \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/x86/p6/nop.h) \
    $(wildcard include/config/matom.h) \
    $(wildcard include/config/mslm.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/bitops/fls64.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/bitops/sched.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/arch_hweight.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/bitops/const_hweight.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/bitops/le.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/byteorder.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/byteorder/little_endian.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/byteorder/little_endian.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/swab.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/swab.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/swab.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/byteorder/generic.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/typecheck.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/printk.h \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/kern_levels.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/dynamic_debug.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/kernel.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/sysinfo.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/div64.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/cache.h \
    $(wildcard include/config/x86/l1/cache/shift.h) \
    $(wildcard include/config/x86/internode/cache/shift.h) \
    $(wildcard include/config/x86/vsmp.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/seqlock.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/context/tracking.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/bug.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/thread_info.h \
    $(wildcard include/config/ia32/emulation.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/page.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/page_types.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/page_32_types.h \
    $(wildcard include/config/highmem4g.h) \
    $(wildcard include/config/highmem64g.h) \
    $(wildcard include/config/page/offset.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/page_32.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/x86/3dnow.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/string.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/string.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/string_32.h \
    $(wildcard include/config/kmemcheck.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/range.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/memory_model.h \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/getorder.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/processor.h \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/m486.h) \
    $(wildcard include/config/x86/debugctlmsr.h) \
    $(wildcard include/config/xen.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/vm86.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/processor-flags.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/vm86.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/ptrace.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/segment.h \
    $(wildcard include/config/x86/32/lazy/gs.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/ptrace.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/ptrace-abi.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/ptrace.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/vm86.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/math_emu.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/sigcontext.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/sigcontext.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/current.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/x86/64/smp.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/compat/vdso.h) \
    $(wildcard include/config/proc/fs.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/pgtable_32_types.h \
    $(wildcard include/config/highmem.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/pgtable-3level_types.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/pgtable-nopud.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/msr.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/msr.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/msr-index.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/ioctl.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/ioctl.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/ioctl.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/asm-generic/ioctl.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/errno.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/asm-generic/errno.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/asm-generic/errno-base.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/cpumask.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/bitmap.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/errno.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/errno.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/desc_defs.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/nops.h \
    $(wildcard include/config/mk7.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/special_insns.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/personality.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/personality.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/math64.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/err.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/irqflags.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/atomic.h \
    $(wildcard include/config/arch/has/atomic/or.h) \
    $(wildcard include/config/generic/atomic64.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/atomic.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/cmpxchg.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/cmpxchg_32.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/atomic64_32.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/atomic-long.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/bottom_half.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/barrier.h \
    $(wildcard include/config/x86/ppro/fence.h) \
    $(wildcard include/config/x86/oostore.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/spinlock_types.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/spinlock_types.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/rwlock.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/prove/rcu.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/rwlock_types.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/spinlock.h \
    $(wildcard include/config/paravirt/spinlocks.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/paravirt.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/rwlock.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/time.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/uidgid.h \
    $(wildcard include/config/uidgid/strict/type/checks.h) \
    $(wildcard include/config/user/ns.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/highuid.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/kmod.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/gfp.h \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/cma.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/wait.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/wait.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/nodemask.h \
    $(wildcard include/config/movable/node.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/memory_hotplug.h \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/notifier.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/mutex/spin/on/owner.h) \
    $(wildcard include/config/have/arch/mutex/cpu/relax.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/mutex-debug.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/rwsem.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/srcu.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/rcupdate.h \
    $(wildcard include/config/rcu/torture/test.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tree/preempt/rcu.h) \
    $(wildcard include/config/rcu/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/user/qs.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tiny/preempt/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/completion.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/rcutree.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/jiffies.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/timex.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/timex.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/param.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/param.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/asm-generic/param.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/timex.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/tsc.h \
    $(wildcard include/config/x86/tsc.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/topology.h \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
    $(wildcard include/config/sched/book.h) \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/smp.h \
    $(wildcard include/config/x86/local/apic.h) \
    $(wildcard include/config/x86/io/apic.h) \
    $(wildcard include/config/x86/32/smp.h) \
    $(wildcard include/config/debug/nmi/selftest.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/mpspec.h \
    $(wildcard include/config/x86/numaq.h) \
    $(wildcard include/config/eisa.h) \
    $(wildcard include/config/x86/mpparse.h) \
    $(wildcard include/config/acpi.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/mpspec_def.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/x86_init.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/bootparam.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/screen_info.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/screen_info.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/apm_bios.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/apm_bios.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/edd.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/edd.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/e820.h \
    $(wildcard include/config/efi.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/memtest.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/e820.h \
    $(wildcard include/config/intel/txt.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/ioport.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/ist.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/ist.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/video/edid.h \
    $(wildcard include/config/x86.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/video/edid.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/apicdef.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/apic.h \
    $(wildcard include/config/x86/x2apic.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/runtime.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/fixmap.h \
    $(wildcard include/config/paravirt/clock.h) \
    $(wildcard include/config/provide/ohci1394/dma/init.h) \
    $(wildcard include/config/x86/visws/apic.h) \
    $(wildcard include/config/pci/mmconfig.h) \
    $(wildcard include/config/x86/intel/mid.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/acpi.h \
    $(wildcard include/config/acpi/numa.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/acpi/pdc_intel.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/numa.h \
    $(wildcard include/config/numa/emu.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/topology.h \
    $(wildcard include/config/x86/ht.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/topology.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/numa_32.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/mmu.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/realmode.h \
    $(wildcard include/config/acpi/sleep.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/io.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/iomap.h \
    $(wildcard include/config/has/ioport.h) \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/generic/iomap.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/vmalloc.h \
    $(wildcard include/config/mmu.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/rbtree.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/pvclock.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/clocksource.h \
    $(wildcard include/config/arch/clocksource/data.h) \
    $(wildcard include/config/clocksource/watchdog.h) \
    $(wildcard include/config/clksrc/of.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/pvclock-abi.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/kmap_types.h \
    $(wildcard include/config/debug/highmem.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/kmap_types.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/io_apic.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/irq_vectors.h \
    $(wildcard include/config/have/kvm.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/pfn.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/sysctl.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/elf.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/elf.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/user.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/user_32.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/auxvec.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/vdso.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/desc.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/uapi/asm/ldt.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/elf.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/uapi/linux/elf-em.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/kobject.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/sysfs.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/kobject_ns.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/kref.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/tracepoint.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/static_key.h \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/arch/x86/include/asm/module.h \
    $(wildcard include/config/m586.h) \
    $(wildcard include/config/m586tsc.h) \
    $(wildcard include/config/m586mmx.h) \
    $(wildcard include/config/mcore2.h) \
    $(wildcard include/config/m686.h) \
    $(wildcard include/config/mpentiumii.h) \
    $(wildcard include/config/mpentiumiii.h) \
    $(wildcard include/config/mpentiumm.h) \
    $(wildcard include/config/mpentium4.h) \
    $(wildcard include/config/mk6.h) \
    $(wildcard include/config/mk8.h) \
    $(wildcard include/config/melan.h) \
    $(wildcard include/config/mcrusoe.h) \
    $(wildcard include/config/mefficeon.h) \
    $(wildcard include/config/mwinchipc6.h) \
    $(wildcard include/config/mwinchip3d.h) \
    $(wildcard include/config/mcyrixiii.h) \
    $(wildcard include/config/mviac3/2.h) \
    $(wildcard include/config/mviac7.h) \
    $(wildcard include/config/mgeodegx1.h) \
    $(wildcard include/config/mgeode/lx.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /home/work/debian_based_firmware/source/obsbx1/linux-3.10.17.orig/include/linux/vermagic.h \
  include/generated/utsrelease.h \

/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/bcm4334x.mod.o: $(deps_/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/bcm4334x.mod.o)

$(deps_/home/work/debian_based_firmware/build_ramdisk/files/driver_bcm43x/bcm4334x.mod.o):
