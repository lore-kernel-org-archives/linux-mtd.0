Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5vLm-0004px-Cx
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 08:39:00 +0000
Message-ID: <1331282453.22872.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: MIPS: lantiq: reintroduce support for cmdline
 partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
Date: Fri, 09 Mar 2012 10:40:53 +0200
In-Reply-To: <1330016389-20973-1-git-send-email-blogic@openwrt.org>
References: <1330016389-20973-1-git-send-email-blogic@openwrt.org>
Content-Type: multipart/mixed; boundary="=-CSgxmSROKw+C9YU6Nt7H"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org,
 Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-CSgxmSROKw+C9YU6Nt7H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-23 at 17:59 +0100, John Crispin wrote:
> From: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
> 
> Since commit ca97dec2ab5c87e9fbdf7e882e1820004a3966fa the
> command line parsing of MTD partitions does not work anymore.
> 
> Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
> Signed-off-by: John Crispin <blogic@openwrt.org>


I would like to compile-test this patch. I've got this error when
compiling with mips-linux-gcc-4.6.0 and the attached defconfig:

                 from include/linux/sched.h:55,
                 from arch/mips/kernel/asm-offsets.c:13:
include/linux/bitops.h: In function 'hweight_long':
include/linux/bitops.h:55:26: warning: signed and unsigned type in conditional expression [-Wsign-compare]
arch/mips/kernel/asm-offsets.c: At top level:
arch/mips/kernel/asm-offsets.c:21:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
arch/mips/kernel/asm-offsets.c:76:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
arch/mips/kernel/asm-offsets.c:88:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
arch/mips/kernel/asm-offsets.c:105:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
arch/mips/kernel/asm-offsets.c:136:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
arch/mips/kernel/asm-offsets.c:175:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
arch/mips/kernel/asm-offsets.c:211:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
arch/mips/kernel/asm-offsets.c:257:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
arch/mips/kernel/asm-offsets.c:295:6: warning: no previous prototype for 'output_irq_cpustat_t_defines' [-Wmissing-prototypes]
In file included from include/linux/kernel.h:17:0,
                 from arch/mips/kernel/cpu-probe.c:15:
include/linux/bitops.h: In function 'hweight_long':
include/linux/bitops.h:55:26: error: signed and unsigned type in conditional expression [-Werror=sign-compare]
arch/mips/kernel/cpu-probe.c: At top level:
arch/mips/kernel/cpu-probe.c:64:6: error: no previous prototype for 'r4k_wait_irqoff' [-Werror=missing-prototypes]
arch/mips/kernel/cpu-probe.c:154:13: error: no previous prototype for 'check_wait' [-Werror=missing-prototypes]
cc1: all warnings being treated as errors

I use W=1 when compiling. Any suggestions?

-- 
Best Regards,
Artem Bityutskiy

--=-CSgxmSROKw+C9YU6Nt7H
Content-Disposition: attachment; filename="l2_lantiq_defconfig"
Content-Type: text/plain; name="l2_lantiq_defconfig"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

CONFIG_LANTIQ=y
CONFIG_HZ_1000=y
# CONFIG_SECCOMP is not set
CONFIG_EXPERIMENTAL=y
CONFIG_SYSVIPC=y
CONFIG_LOG_BUF_SHIFT=14
CONFIG_EXPERT=y
# CONFIG_KALLSYMS is not set
# CONFIG_HOTPLUG is not set
# CONFIG_EPOLL is not set
# CONFIG_SIGNALFD is not set
# CONFIG_TIMERFD is not set
# CONFIG_EVENTFD is not set
CONFIG_SLAB=y
# CONFIG_BLK_DEV_BSG is not set
# CONFIG_IOSCHED_DEADLINE is not set
# CONFIG_IOSCHED_CFQ is not set
CONFIG_PCI=y
CONFIG_NET=y
CONFIG_PACKET=y
CONFIG_UNIX=y
CONFIG_INET=y
# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
# CONFIG_INET_XFRM_MODE_TUNNEL is not set
# CONFIG_INET_XFRM_MODE_BEET is not set
# CONFIG_INET_DIAG is not set
# CONFIG_IPV6 is not set
CONFIG_MTD=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_AR7_PARTS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_FTL=y
CONFIG_NFTL=y
CONFIG_NFTL_RW=y
CONFIG_INFTL=y
CONFIG_RFD_FTL=y
CONFIG_SSFDC=y
CONFIG_SM_FTL=y
CONFIG_MTD_OOPS=y
CONFIG_MTD_SWAP=y
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_CFI_I8=y
CONFIG_MTD_OTP=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_ROM=y
CONFIG_MTD_ABSENT=y
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_COMPAT=y
CONFIG_MTD_LANTIQ=y
CONFIG_MTD_PCI=y
CONFIG_MTD_GPIO_ADDR=y
CONFIG_MTD_INTEL_VR_NOR=y
CONFIG_MTD_PLATRAM=y
CONFIG_MTD_LATCH_ADDR=y
CONFIG_MTD_PMC551=y
CONFIG_MTD_PMC551_BUGFIX=y
CONFIG_MTD_PMC551_DEBUG=y
CONFIG_MTD_SLRAM=y
CONFIG_MTD_PHRAM=y
CONFIG_MTD_MTDRAM=y
CONFIG_MTD_BLOCK2MTD=y
CONFIG_MTD_DOCG3=y
CONFIG_MTD_NAND_ECC_SMC=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_ECC_BCH=y
CONFIG_MTD_NAND_MUSEUM_IDS=y
CONFIG_MTD_NAND_DENALI=y
CONFIG_MTD_NAND_RICOH=y
CONFIG_MTD_NAND_DISKONCHIP=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=y
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
CONFIG_MTD_NAND_DOCG4=y
CONFIG_MTD_NAND_CAFE=y
CONFIG_MTD_NAND_NANDSIM=y
CONFIG_MTD_NAND_PLATFORM=y
CONFIG_MTD_ONENAND=y
CONFIG_MTD_ONENAND_VERIFY_WRITE=y
CONFIG_MTD_ONENAND_GENERIC=y
CONFIG_MTD_ONENAND_OTP=y
CONFIG_MTD_ONENAND_2X_PROGRAM=y
CONFIG_MTD_ONENAND_SIM=y
CONFIG_MTD_LPDDR=y
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_GLUEBI=y
CONFIG_IDE=y
CONFIG_IDE_GENERIC=y
CONFIG_BLK_DEV_GENERIC=y
CONFIG_BLK_DEV_CMD64X=y
CONFIG_NETDEVICES=y
CONFIG_PCNET32=y
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_SERIO_RAW=y
# CONFIG_VT is not set
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
# CONFIG_SERIAL_8250_PCI is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_HWMON is not set
# CONFIG_HID_SUPPORT is not set
# CONFIG_USB_SUPPORT is not set
CONFIG_EXT2_FS=y
CONFIG_EXT3_FS=y
# CONFIG_EXT3_FS_XATTR is not set
# CONFIG_DNOTIFY is not set
CONFIG_PROC_KCORE=y
CONFIG_TMPFS=y
CONFIG_CONFIGFS_FS=y
CONFIG_JFFS2_FS=y
CONFIG_UBIFS_FS=y
CONFIG_UBIFS_FS_XATTR=y
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
CONFIG_LOGFS=y
CONFIG_CRAMFS=y
CONFIG_SQUASHFS=y
CONFIG_MAGIC_SYSRQ=y

--=-CSgxmSROKw+C9YU6Nt7H--
