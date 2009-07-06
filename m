Received: from mail-qy0-f200.google.com ([209.85.221.200])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MNm8J-0002lT-UZ
	for linux-mtd@lists.infradead.org; Mon, 06 Jul 2009 11:13:23 +0000
Received: by qyk38 with SMTP id 38so3938158qyk.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jul 2009 04:13:14 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 6 Jul 2009 16:43:14 +0530
Message-ID: <6d53329e0907060413h4a2a1d64nddc8e066f2e3c2d@mail.gmail.com>
Subject: kernel crashing with jffs2 (32MB NAND Flash and 32MB SDRAM )
From: venki kaps <venkiece2005@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

 We are facing some memory issues with ATMEL AT91SAM9G20 Board.
 By changing the uboot environment variable =96bootargs
setenv bootargs console=3DttyS0,115200 root=3D/dev/mtdblock2 rootfstype=3Dj=
ffs2 mem=3D8M
mem=3D8M
mem=3D16M
mem=3D24M
mem=3D32M
On changing the value of mem variable the boards behaves in different way.

At 8M,16M the Linux is coming up but after the kernel prompt it is
crashing in between.
At 32M-the Linux is not coming up over board. Before kernel prompt
it=92s crashing.
The size of SDRAM is 32MB.but we are not able to utilize it fully.

Is it u-boot or Kernel or jffs2 or SDRAM problem?

Am updating below the kernel config as well as boot logs.

Kernel config:
-------------------
#
# Automatically generated make config: don't edit
# Linux kernel version: 2.6.27
# Thu Jun 18 16:23:27 2009
#
CONFIG_ARM=3Dy
CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
CONFIG_GENERIC_GPIO=3Dy
CONFIG_GENERIC_TIME=3Dy
CONFIG_GENERIC_CLOCKEVENTS=3Dy
CONFIG_MMU=3Dy
# CONFIG_NO_IOPORT is not set
CONFIG_GENERIC_HARDIRQS=3Dy
CONFIG_STACKTRACE_SUPPORT=3Dy
CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
CONFIG_LOCKDEP_SUPPORT=3Dy
CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
CONFIG_HARDIRQS_SW_RESEND=3Dy
CONFIG_GENERIC_IRQ_PROBE=3Dy
CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
# CONFIG_ARCH_HAS_ILOG2_U32 is not set
# CONFIG_ARCH_HAS_ILOG2_U64 is not set
CONFIG_GENERIC_HWEIGHT=3Dy
CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
CONFIG_ARCH_SUPPORTS_AOUT=3Dy
CONFIG_ZONE_DMA=3Dy
CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
CONFIG_VECTORS_BASE=3D0xffff0000
CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"

#
# General setup
#
CONFIG_EXPERIMENTAL=3Dy
CONFIG_BROKEN_ON_SMP=3Dy
CONFIG_INIT_ENV_ARG_LIMIT=3D32
CONFIG_LOCALVERSION=3D""
# CONFIG_LOCALVERSION_AUTO is not set
# CONFIG_SWAP is not set
CONFIG_SYSVIPC=3Dy
CONFIG_SYSVIPC_SYSCTL=3Dy
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_IKCONFIG is not set
CONFIG_LOG_BUF_SHIFT=3D14
# CONFIG_CGROUPS is not set
# CONFIG_GROUP_SCHED is not set
CONFIG_SYSFS_DEPRECATED=3Dy
CONFIG_SYSFS_DEPRECATED_V2=3Dy
# CONFIG_RELAY is not set
CONFIG_NAMESPACES=3Dy
# CONFIG_UTS_NS is not set
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
CONFIG_BLK_DEV_INITRD=3Dy
CONFIG_INITRAMFS_SOURCE=3D""
CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
CONFIG_SYSCTL=3Dy
# CONFIG_EMBEDDED is not set
CONFIG_UID16=3Dy
CONFIG_SYSCTL_SYSCALL=3Dy
CONFIG_KALLSYMS=3Dy
# CONFIG_KALLSYMS_EXTRA_PASS is not set
CONFIG_HOTPLUG=3Dy
CONFIG_PRINTK=3Dy
CONFIG_BUG=3Dy
CONFIG_ELF_CORE=3Dy
CONFIG_COMPAT_BRK=3Dy
CONFIG_BASE_FULL=3Dy
CONFIG_FUTEX=3Dy
CONFIG_ANON_INODES=3Dy
CONFIG_EPOLL=3Dy
CONFIG_SIGNALFD=3Dy
CONFIG_TIMERFD=3Dy
CONFIG_EVENTFD=3Dy
CONFIG_SHMEM=3Dy
CONFIG_VM_EVENT_COUNTERS=3Dy
CONFIG_SLAB=3Dy
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
# CONFIG_PROFILING is not set
# CONFIG_MARKERS is not set
CONFIG_HAVE_OPROFILE=3Dy
# CONFIG_KPROBES is not set
# CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
# CONFIG_HAVE_IOREMAP_PROT is not set
CONFIG_HAVE_KPROBES=3Dy
CONFIG_HAVE_KRETPROBES=3Dy
# CONFIG_HAVE_ARCH_TRACEHOOK is not set
# CONFIG_HAVE_DMA_ATTRS is not set
# CONFIG_USE_GENERIC_SMP_HELPERS is not set
CONFIG_HAVE_CLK=3Dy
CONFIG_PROC_PAGE_MONITOR=3Dy
CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
CONFIG_SLABINFO=3Dy
CONFIG_RT_MUTEXES=3Dy
# CONFIG_TINY_SHMEM is not set
CONFIG_BASE_SMALL=3D0
CONFIG_MODULES=3Dy
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=3Dy
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_KMOD=3Dy
CONFIG_BLOCK=3Dy
# CONFIG_LBD is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
# CONFIG_LSF is not set
# CONFIG_BLK_DEV_BSG is not set
# CONFIG_BLK_DEV_INTEGRITY is not set

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=3Dy
CONFIG_IOSCHED_AS=3Dy
# CONFIG_IOSCHED_DEADLINE is not set
# CONFIG_IOSCHED_CFQ is not set
CONFIG_DEFAULT_AS=3Dy
# CONFIG_DEFAULT_DEADLINE is not set
# CONFIG_DEFAULT_CFQ is not set
# CONFIG_DEFAULT_NOOP is not set
CONFIG_DEFAULT_IOSCHED=3D"anticipatory"
CONFIG_CLASSIC_RCU=3Dy

#
# System Type
#
# CONFIG_ARCH_AAEC2000 is not set
# CONFIG_ARCH_INTEGRATOR is not set
# CONFIG_ARCH_REALVIEW is not set
# CONFIG_ARCH_VERSATILE is not set
CONFIG_ARCH_AT91=3Dy
# CONFIG_ARCH_CLPS7500 is not set
# CONFIG_ARCH_CLPS711X is not set
# CONFIG_ARCH_EBSA110 is not set
# CONFIG_ARCH_EP93XX is not set
# CONFIG_ARCH_FOOTBRIDGE is not set
# CONFIG_ARCH_NETX is not set
# CONFIG_ARCH_H720X is not set
# CONFIG_ARCH_IMX is not set
# CONFIG_ARCH_IOP13XX is not set
# CONFIG_ARCH_IOP32X is not set
# CONFIG_ARCH_IOP33X is not set
# CONFIG_ARCH_IXP23XX is not set
# CONFIG_ARCH_IXP2000 is not set
# CONFIG_ARCH_IXP4XX is not set
# CONFIG_ARCH_L7200 is not set
# CONFIG_ARCH_KIRKWOOD is not set
# CONFIG_ARCH_KS8695 is not set
# CONFIG_ARCH_NS9XXX is not set
# CONFIG_ARCH_LOKI is not set
# CONFIG_ARCH_MV78XX0 is not set
# CONFIG_ARCH_MXC is not set
# CONFIG_ARCH_ORION5X is not set
# CONFIG_ARCH_PNX4008 is not set
# CONFIG_ARCH_PXA is not set
# CONFIG_ARCH_RPC is not set
# CONFIG_ARCH_SA1100 is not set
# CONFIG_ARCH_S3C2410 is not set
# CONFIG_ARCH_SHARK is not set
# CONFIG_ARCH_LH7A40X is not set
# CONFIG_ARCH_DAVINCI is not set
# CONFIG_ARCH_OMAP is not set
# CONFIG_ARCH_MSM7X00A is not set

#
# Boot options
#

#
# Power management
#

#
# Atmel AT91 System-on-Chip
#
# CONFIG_ARCH_AT91RM9200 is not set
# CONFIG_ARCH_AT91SAM9260 is not set
# CONFIG_ARCH_AT91SAM9261 is not set
# CONFIG_ARCH_AT91SAM9G10 is not set
# CONFIG_ARCH_AT91SAM9263 is not set
# CONFIG_ARCH_AT91SAM9RL is not set
CONFIG_ARCH_AT91SAM9G20=3Dy
# CONFIG_ARCH_AT91SAM9G45 is not set
# CONFIG_ARCH_AT91CAP9 is not set
# CONFIG_ARCH_AT91X40 is not set
CONFIG_AT91_PMC_UNIT=3Dy

#
# AT91SAM9G20 Board Type
#
CONFIG_MACH_AT91SAM9G20EK=3Dy

#
# AT91 Board Options
#
CONFIG_MTD_AT91_DATAFLASH_CARD=3Dy
# CONFIG_MTD_NAND_ATMEL_BUSWIDTH_16 is not set

#
# AT91 Feature Selections
#
CONFIG_AT91_PROGRAMMABLE_CLOCKS=3Dy
CONFIG_AT91_TIMER_HZ=3D100
CONFIG_AT91_EARLY_DBGU=3Dy
# CONFIG_AT91_EARLY_USART0 is not set
# CONFIG_AT91_EARLY_USART1 is not set
# CONFIG_AT91_EARLY_USART2 is not set
# CONFIG_AT91_EARLY_USART3 is not set
# CONFIG_AT91_EARLY_USART4 is not set
# CONFIG_AT91_EARLY_USART5 is not set

#
# Processor Type
#
CONFIG_CPU_32=3Dy
CONFIG_CPU_ARM926T=3Dy
CONFIG_CPU_32v5=3Dy
CONFIG_CPU_ABRT_EV5TJ=3Dy
CONFIG_CPU_PABRT_NOIFAR=3Dy
CONFIG_CPU_CACHE_VIVT=3Dy
CONFIG_CPU_COPY_V4WB=3Dy
CONFIG_CPU_TLB_V4WBI=3Dy
CONFIG_CPU_CP15=3Dy
CONFIG_CPU_CP15_MMU=3Dy

#
# Processor Features
#
# CONFIG_ARM_THUMB is not set
# CONFIG_CPU_ICACHE_DISABLE is not set
# CONFIG_CPU_DCACHE_DISABLE is not set
# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
# CONFIG_OUTER_CACHE is not set

#
# Bus support
#
# CONFIG_PCI_SYSCALL is not set
# CONFIG_ARCH_SUPPORTS_MSI is not set
# CONFIG_PCCARD is not set

#
# Kernel Features
#
# CONFIG_TICK_ONESHOT is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
# CONFIG_PREEMPT is not set
CONFIG_HZ=3D100
CONFIG_AEABI=3Dy
CONFIG_OABI_COMPAT=3Dy
CONFIG_ARCH_FLATMEM_HAS_HOLES=3Dy
# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
CONFIG_SELECT_MEMORY_MODEL=3Dy
CONFIG_FLATMEM_MANUAL=3Dy
# CONFIG_DISCONTIGMEM_MANUAL is not set
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_FLATMEM=3Dy
CONFIG_FLAT_NODE_MEM_MAP=3Dy
# CONFIG_SPARSEMEM_STATIC is not set
# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
CONFIG_PAGEFLAGS_EXTENDED=3Dy
CONFIG_SPLIT_PTLOCK_CPUS=3D4096
# CONFIG_RESOURCES_64BIT is not set
CONFIG_ZONE_DMA_FLAG=3D1
CONFIG_BOUNCE=3Dy
CONFIG_VIRT_TO_BUS=3Dy
# CONFIG_LEDS is not set
CONFIG_ALIGNMENT_TRAP=3Dy

#
# Boot options
#
CONFIG_ZBOOT_ROM_TEXT=3D0x0
CONFIG_ZBOOT_ROM_BSS=3D0x0
CONFIG_CMDLINE=3D"mem=3D32M console=3DttyS0,115200 root=3D/dev/mtdblock1 rw
rootfstype=3Djffs2"
# CONFIG_XIP_KERNEL is not set
# CONFIG_KEXEC is not set

#
# Floating point emulation
#

#
# At least one emulation must be selected
#
CONFIG_FPE_NWFPE=3Dy
# CONFIG_FPE_NWFPE_XP is not set
# CONFIG_FPE_FASTFPE is not set
# CONFIG_VFP is not set

#
# Userspace binary formats
#
CONFIG_BINFMT_ELF=3Dy
# CONFIG_BINFMT_AOUT is not set
# CONFIG_BINFMT_MISC is not set

#
# Power management options
#
# CONFIG_PM is not set
CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
# CONFIG_NET is not set

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
CONFIG_STANDALONE=3Dy
CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
CONFIG_FW_LOADER=3Dy
CONFIG_FIRMWARE_IN_KERNEL=3Dy
CONFIG_EXTRA_FIRMWARE=3D""
# CONFIG_SYS_HYPERVISOR is not set
CONFIG_MTD=3Dy
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_CONCAT=3Dy
CONFIG_MTD_PARTITIONS=3Dy
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=3Dy
# CONFIG_MTD_AFS_PARTS is not set
# CONFIG_MTD_AR7_PARTS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=3Dy
CONFIG_MTD_BLKDEVS=3Dy
CONFIG_MTD_BLOCK=3Dy
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set
# CONFIG_MTD_OOPS is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=3Dy
CONFIG_MTD_CFI_I2=3Dy
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_PLATRAM is not set

#
# Self-contained MTD device drivers
#
CONFIG_MTD_DATAFLASH=3Dy
# CONFIG_MTD_M25P80 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set
CONFIG_MTD_NAND=3Dy
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
# CONFIG_MTD_NAND_ECC_SMC is not set
# CONFIG_MTD_NAND_MUSEUM_IDS is not set
CONFIG_MTD_NAND_IDS=3Dy
# CONFIG_MTD_NAND_DISKONCHIP is not set
CONFIG_MTD_NAND_ATMEL=3Dy
# CONFIG_MTD_NAND_ATMEL_ECC_HW is not set
# CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO is not set
CONFIG_MTD_NAND_ATMEL_ECC_SOFT=3Dy
# CONFIG_MTD_NAND_ATMEL_ECC_NONE is not set
# CONFIG_MTD_NAND_NANDSIM is not set
# CONFIG_MTD_NAND_PLATFORM is not set
# CONFIG_MTD_ONENAND is not set

#
# UBI - Unsorted block images
#
# CONFIG_MTD_UBI is not set
# CONFIG_PARPORT is not set
CONFIG_BLK_DEV=3Dy
# CONFIG_BLK_DEV_COW_COMMON is not set
# CONFIG_BLK_DEV_LOOP is not set
CONFIG_BLK_DEV_RAM=3Dy
CONFIG_BLK_DEV_RAM_COUNT=3D16
CONFIG_BLK_DEV_RAM_SIZE=3D4096
# CONFIG_BLK_DEV_XIP is not set
# CONFIG_CDROM_PKTCDVD is not set
CONFIG_MISC_DEVICES=3Dy
# CONFIG_ATMEL_TCLIB is not set
# CONFIG_EEPROM_93CX6 is not set
CONFIG_ATMEL_SSC=3Dy
# CONFIG_ENCLOSURE_SERVICES is not set
CONFIG_HAVE_IDE=3Dy
# CONFIG_IDE is not set

#
# SCSI device support
#
# CONFIG_RAID_ATTRS is not set
# CONFIG_SCSI is not set
# CONFIG_SCSI_DMA is not set
# CONFIG_SCSI_NETLINK is not set
# CONFIG_ATA is not set
# CONFIG_MD is not set

#
# Input device support
#
CONFIG_INPUT=3Dy
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_POLLDEV is not set

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=3Dy
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D320
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D240
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set

#
# Hardware I/O ports
#
# CONFIG_SERIO is not set
# CONFIG_GAMEPORT is not set

#
# Character devices
#
CONFIG_VT=3Dy
CONFIG_CONSOLE_TRANSLATIONS=3Dy
CONFIG_VT_CONSOLE=3Dy
CONFIG_HW_CONSOLE=3Dy
# CONFIG_VT_HW_CONSOLE_BINDING is not set
# CONFIG_DEVKMEM is not set
# CONFIG_SERIAL_NONSTANDARD is not set

#
# Serial drivers
#
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_ATMEL=3Dy
CONFIG_SERIAL_ATMEL_CONSOLE=3Dy
CONFIG_SERIAL_ATMEL_PDC=3Dy
# CONFIG_SERIAL_ATMEL_TTYAT is not set
CONFIG_SERIAL_CORE=3Dy
CONFIG_SERIAL_CORE_CONSOLE=3Dy
CONFIG_UNIX98_PTYS=3Dy
# CONFIG_LEGACY_PTYS is not set
# CONFIG_IPMI_HANDLER is not set
CONFIG_HW_RANDOM=3Dy
# CONFIG_NVRAM is not set
# CONFIG_R3964 is not set
# CONFIG_RAW_DRIVER is not set
# CONFIG_TCG_TPM is not set
# CONFIG_AT91_SPI is not set
# CONFIG_AT91_SPIDEV is not set
# CONFIG_I2C is not set
CONFIG_SPI=3Dy
CONFIG_SPI_MASTER=3Dy

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ATMEL=3Dy
# CONFIG_SPI_BITBANG is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_AT25 is not set
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_W1 is not set
# CONFIG_POWER_SUPPLY is not set
# CONFIG_HWMON is not set
# CONFIG_WATCHDOG is not set

#
# Sonics Silicon Backplane
#
CONFIG_SSB_POSSIBLE=3Dy
# CONFIG_SSB is not set

#
# Multifunction device drivers
#
# CONFIG_MFD_CORE is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_MFD_TMIO is not set
# CONFIG_MFD_T7L66XB is not set
# CONFIG_MFD_TC6387XB is not set

#
# Multimedia devices
#

#
# Multimedia core support
#
# CONFIG_VIDEO_DEV is not set
# CONFIG_VIDEO_MEDIA is not set

#
# Multimedia drivers
#
# CONFIG_DAB is not set

#
# Graphics support
#
# CONFIG_VGASTATE is not set
# CONFIG_VIDEO_OUTPUT_CONTROL is not set
# CONFIG_FB is not set
# CONFIG_BACKLIGHT_LCD_SUPPORT is not set

#
# Display device support
#
CONFIG_DISPLAY_SUPPORT=3Dy

#
# Display hardware drivers
#

#
# Console display driver support
#
# CONFIG_VGA_CONSOLE is not set
CONFIG_DUMMY_CONSOLE=3Dy
# CONFIG_SOUND is not set
# CONFIG_HID_SUPPORT is not set
CONFIG_USB_SUPPORT=3Dy
CONFIG_USB_ARCH_HAS_HCD=3Dy
CONFIG_USB_ARCH_HAS_OHCI=3Dy
# CONFIG_USB_ARCH_HAS_EHCI is not set
# CONFIG_USB is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_GADGET_MUSB_HDRC is not set

#
# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
#
CONFIG_USB_GADGET=3Dy
# CONFIG_USB_GADGET_DEBUG_FILES is not set
CONFIG_USB_GADGET_SELECTED=3Dy
# CONFIG_USB_GADGET_AMD5536UDC is not set
# CONFIG_USB_GADGET_ATMEL_USBA is not set
# CONFIG_USB_GADGET_FSL_USB2 is not set
# CONFIG_USB_GADGET_NET2280 is not set
# CONFIG_USB_GADGET_PXA25X is not set
# CONFIG_USB_GADGET_M66592 is not set
# CONFIG_USB_GADGET_PXA27X is not set
# CONFIG_USB_GADGET_GOKU is not set
# CONFIG_USB_GADGET_LH7A40X is not set
# CONFIG_USB_GADGET_OMAP is not set
# CONFIG_USB_GADGET_S3C2410 is not set
CONFIG_USB_GADGET_AT91=3Dy
CONFIG_USB_AT91=3Dy
# CONFIG_USB_GADGET_DUMMY_HCD is not set
# CONFIG_USB_GADGET_DUALSPEED is not set
CONFIG_USB_ZERO=3Dm
# CONFIG_USB_ETH is not set
CONFIG_USB_GADGETFS=3Dm
CONFIG_USB_FILE_STORAGE=3Dm
# CONFIG_USB_FILE_STORAGE_TEST is not set
CONFIG_USB_G_SERIAL=3Dm
# CONFIG_USB_MIDI_GADGET is not set
# CONFIG_USB_G_PRINTER is not set
# CONFIG_USB_CDC_COMPOSITE is not set
# CONFIG_MMC is not set
CONFIG_NEW_LEDS=3Dy
CONFIG_LEDS_CLASS=3Dy

#
# LED drivers
#
CONFIG_LEDS_GPIO=3Dy

#
# LED Triggers
#
# CONFIG_LEDS_TRIGGERS is not set
CONFIG_RTC_LIB=3Dy
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# Voltage and Current regulators
#
# CONFIG_REGULATOR is not set
# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
# CONFIG_REGULATOR_BQ24022 is not set
# CONFIG_UIO is not set

#
# File systems
#
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
# CONFIG_EXT4DEV_FS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_FS_POSIX_ACL is not set
# CONFIG_XFS_FS is not set
CONFIG_DNOTIFY=3Dy
CONFIG_INOTIFY=3Dy
CONFIG_INOTIFY_USER=3Dy
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_FUSE_FS is not set

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set

#
# DOS/FAT/NT Filesystems
#
# CONFIG_MSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=3Dy
CONFIG_PROC_SYSCTL=3Dy
CONFIG_SYSFS=3Dy
# CONFIG_TMPFS is not set
# CONFIG_HUGETLB_PAGE is not set
# CONFIG_CONFIGFS_FS is not set

#
# Miscellaneous filesystems
#
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_JFFS2_FS=3Dy
CONFIG_JFFS2_FS_DEBUG=3D0
CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
CONFIG_JFFS2_SUMMARY=3Dy
# CONFIG_JFFS2_FS_XATTR is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=3Dy
# CONFIG_JFFS2_LZO is not set
CONFIG_JFFS2_RTIME=3Dy
# CONFIG_JFFS2_RUBIN is not set
CONFIG_CRAMFS=3Dy
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_ROMFS_FS is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=3Dy
CONFIG_NLS=3Dy
CONFIG_NLS_DEFAULT=3D"iso8859-1"
CONFIG_NLS_CODEPAGE_437=3Dy
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=3Dy
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=3Dy
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
CONFIG_NLS_ISO8859_15=3Dy
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_UTF8=3Dy

#
# Kernel hacking
#
# CONFIG_PRINTK_TIME is not set
CONFIG_ENABLE_WARN_DEPRECATED=3Dy
CONFIG_ENABLE_MUST_CHECK=3Dy
CONFIG_FRAME_WARN=3D1024
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_DEBUG_FS is not set
# CONFIG_HEADERS_CHECK is not set
# CONFIG_DEBUG_KERNEL is not set
CONFIG_DEBUG_BUGVERBOSE=3Dy
CONFIG_DEBUG_MEMORY_INIT=3Dy
CONFIG_FRAME_POINTER=3Dy
# CONFIG_LATENCYTOP is not set
# CONFIG_SYSCTL_SYSCALL_CHECK is not set
CONFIG_HAVE_FTRACE=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
# CONFIG_FTRACE is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_CONTEXT_SWITCH_TRACER is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=3Dy
CONFIG_DEBUG_USER=3Dy

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITY_FILE_CAPABILITIES is not set
# CONFIG_CRYPTO is not set

#
# Library routines
#
CONFIG_BITREVERSE=3Dy
# CONFIG_GENERIC_FIND_FIRST_BIT is not set
# CONFIG_GENERIC_FIND_NEXT_BIT is not set
# CONFIG_CRC_CCITT is not set
# CONFIG_CRC16 is not set
CONFIG_CRC_T10DIF=3Dy
# CONFIG_CRC_ITU_T is not set
CONFIG_CRC32=3Dy
# CONFIG_CRC7 is not set
# CONFIG_LIBCRC32C is not set
CONFIG_ZLIB_INFLATE=3Dy
CONFIG_ZLIB_DEFLATE=3Dy
CONFIG_PLIST=3Dy
CONFIG_HAS_IOMEM=3Dy
CONFIG_HAS_IOPORT=3Dy
CONFIG_HAS_DMA=3Dy

boot log:
=3D=3D=3D=3D=3D=3D
RomBOOT
Start AT91Bootstrap...

Bootstrap executed. Starting U-boot...


U-Boot 2008.10 (Jun 15 2009 - 22:11:01)

DRAM:  32 MB
NAND:  256 MiB
In:    serial
Out:   serial
Err:   serial
Net:   macb0
macb0: link up, 10Mbps half-duplex (lpa: 0xffff)
Hit any key to stop autoboot:  0

NAND read: device 0 offset 0x400000, size 0x200000
 2097152 bytes read: OK
## Booting kernel from Legacy Image at 22000000 ...
   Image Name:   Linux-2.6.27
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    878924 Bytes =3D 858.3 kB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux........................................................=
...
done, booting the kernel.
Linux version 2.6.27 (root@A2MD02477L) (gcc version 4.2.0 20070413
(prerelease) (CodeSourcery Sourcery G++ Lite 2007q1-10)) #30 Fri Jun
26 18:11:28 IST 2009
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177
Machine: Atmel AT91SAM9G20-EK
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 221 MHz, master 110 MHz, main 18.432 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 32768 bytes, associativity 4, 32 byte lines, 256 sets
CPU0: D cache: 32768 bytes, associativity 4, 32 byte lines, 256 sets
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 8128
Kernel command line: console=3DttyS0,115200 root=3D/dev/mtdblock2 rootfstyp=
e=3Djffs2
AT91: 96 gpio irqs in 3 banks
PID hash table entries: 128 (order: 7, 512 bytes)
Console: colour dummy device 80x30
console [ttyS0] enabled
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Memory: 32MB =3D 32MB total
Memory: 30580KB available (1604K code, 160K data, 88K init)
Calibrating delay loop... 110.18 BogoMIPS (lpj=3D550912)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
net_namespace: 288 bytes
NET: Registered protocol family 16
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) (SUMMARY)  =A9 2001-2006 Red Hat, Inc.
msgmni has been set to 59
io scheduler noop registered
io scheduler anticipatory registered (default)
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq =3D 1) is a ATMEL_SERIAL
atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq =3D 6) is a ATMEL_SERIAL
atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq =3D 7) is a ATMEL_SERIAL
brd: module loaded
ssc ssc.0: Atmel SSC device at 0xc2870000 (irq 14)
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron NAND 256MiB
3,3V 8-bit)
AT91 NAND: 8-bit, Software ECC
Scanning device for bad blocks
Bad eraseblock 576 at 0x04800000
Bad eraseblock 1344 at 0x0a800000
Bad eraseblock 1411 at 0x0b060000
Creating 3 MTD partitions on "atmel_nand":
0x00000000-0x00400000 : "Bootstrap"
0x00400000-0x04000000 : "Partition 1"
0x04000000-0x10000000 : "Partition 2"
atmel_spi atmel_spi.0: Atmel SPI Controller at 0xfffc8000 (irq 12)
udc: at91_udc version 3 May 2006
mice: PS/2 mouse device common for all mice
Registered led device: ds5
Registered led device: ds1
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
Empty flash at 0x01989004 ends at 0x01989800
Empty flash at 0x0198c1c8 ends at 0x0198c800
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 88K
Unable to handle kernel NULL pointer dereference at virtual address 0000003=
e
pgd =3D c0004000
[0000003e] *pgd=3D00000000
Internal error: Oops: 1 [#1]
Modules linked in:
CPU: 0    Not tainted  (2.6.27 #30)
PC is at __kmalloc+0x60/0xd0
LR is at jffs2_read_dnode+0x200/0x430
pc : [<c0072e20>]    lr : [<c00b9e50>]    psr: a0000093
sp : c1c17be8  ip : c1c17c08  fp : c1c17c04
r10: c1c70988  r9 : c1402000  r8 : 00000000
r7 : 000000d0  r6 : c1c006c0  r5 : a0000013  r4 : c1d29528
r3 : a0000093  r2 : 0000045d  r1 : 0000003e  r0 : c01ba690
Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0005317f  Table: 20004000  DAC: 00000017
Process swapper (pid: 1, stack limit =3D 0xc1c16268)
Stack: (0xc1c17be8 to 0xc1c18000)
7be0:                   c1d29528 00000044 c1c74ec0 c1402000 c1c17c54 c1c17c=
08
7c00: c00b9e50 c0072dd0 00000044 c1c17c24 c1d29528 c1c04960 c1807588 c1d6e0=
00
7c20: 000000d0 00000044 c1c17c74 00000800 00002000 c1c74ec0 c1402000 000000=
04
7c40: c1807588 00003000 c1c17c94 c1c17c58 c00ba190 c00b9c60 00000000 000008=
00
7c60: 00000001 c1d6e000 c1c17c94 c0202040 c1807588 c1807648 00200200 000000=
04
7c80: 00000001 00100100 c1c17cb4 c1c17c98 c00b846c c00ba090 00001000 001001=
00
7ca0: c1c17ccc c0202040 c1c17ccc c1c17cb8 c00b8518 c00b8414 c0202040 c18075=
88
7cc0: c1c17ce4 c1c17cd0 c00b8560 c00b8514 c0202040 00000002 c1c17d24 c1c17c=
e8
7ce0: c005fb94 c00b853c c1c873c0 00000095 c0202078 c0202078 c1806d58 c1c874=
08
7d00: 00000020 00000000 c1807648 c1c873c0 c1807648 00000000 c1c17d54 c1c17d=
28
7d20: c005fe8c c005fa00 00000003 c01c2488 c01c2464 00000001 00000001 000000=
00
7d40: 00000000 c1c873c0 c1c17d6c c1c17d58 c005ff7c c005fd54 00000000 000000=
01
7d60: c1c17dec c1c17d70 c0059c88 c005ff58 00000001 c01c2488 00000000 000000=
01
7d80: c1c87408 c1c17df8 00000000 00000000 00000fff 00000001 c18075b0 c1c17e=
88
7da0: ffffffff 00000001 60000013 00000000 00000080 c1c72480 00000000 000000=
80
7dc0: c005d414 c1c17df8 c1c873c0 c1c17df8 c1c17e88 c1c17ee0 00000000 fffffd=
ee
7de0: c1c17eb4 c1c17df0 c0075bf8 c0059a9c 00000000 00000000 00000000 000000=
d0
7e00: 00000000 00000001 ffffffff c1c873c0 00000000 00000000 00000000 000000=
00
7e20: c1c14c40 c1c17e30 00000000 00000000 00000000 c1c14c40 c0046b7c c1c17e=
3c
7e40: c1c17e3c 4c751c80 00000000 00000000 c002f29c c002f1f4 c01c3aa0 c1c14c=
78
7e60: 00000080 c1c17e70 c002f37c c002f288 00000001 c1c16000 c1c14c40 c1c14d=
9c
7e80: c01b39c8 c01c3aa0 c1c72480 00000080 c1c873c0 c1c72480 c1c17ee0 000000=
80
7ea0: c01b3940 c1c17f50 c1c17edc c1c17eb8 c007651c c0075b4c 00000000 c1c17f=
50
7ec0: 00000000 00000000 c1c17ee0 c01b39c8 c1c17f04 c1c17ee0 c0079e34 c00764=
78
7ee0: 00000000 00000000 fffffeff c1c72480 00000000 c018cacc c1c17f1c c1c17f=
08
7f00: c0079f38 c0079dec 00000002 c1c72480 c1c17f4c c1c17f20 c007ad90 c0079e=
78
7f20: c008024c 00000000 c018cacc c01b3940 c01b39c8 c1c17f50 00000000 000000=
00
7f40: c1c17fb4 c1c17f50 c0022154 c007ace4 00000000 00000000 00000000 000000=
00
7f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
7f80: 00000000 00000000 00000000 00000000 00000000 00000000 c01c3000 c001b6=
f0
7fa0: 00000000 00000000 c1c17fc4 c1c17fb8 c001e400 c0022124 c1c17fdc c1c17f=
c8
7fc0: c001e4b4 c001e3f0 c01c3000 c01c3000 c1c17ff4 c1c17fe0 c0008784 c001e4=
18
7fe0: 00000000 00000000 00000000 c1c17ff8 c00361b8 c00086e0 99940a9a b81410=
c6
Backtrace:
[<c0072dc0>] (__kmalloc+0x0/0xd0) from [<c00b9e50>]
(jffs2_read_dnode+0x200/0x430)
 r7:c1402000 r6:c1c74ec0 r5:00000044 r4:c1d29528
[<c00b9c50>] (jffs2_read_dnode+0x0/0x430) from [<c00ba190>]
(jffs2_read_inode_range+0x110/0x15c)
[<c00ba080>] (jffs2_read_inode_range+0x0/0x15c) from [<c00b846c>]
(jffs2_do_readpage_nolock+0x68/0x100)
[<c00b8404>] (jffs2_do_readpage_nolock+0x0/0x100) from [<c00b8518>]
(jffs2_do_readpage_unlock+0x14/0x28)
 r4:c0202040
[<c00b8504>] (jffs2_do_readpage_unlock+0x0/0x28) from [<c00b8560>]
(jffs2_readpage+0x34/0x48)
 r5:c1807588 r4:c0202040
[<c00b852c>] (jffs2_readpage+0x0/0x48) from [<c005fb94>]
(__do_page_cache_readahead+0x1a4/0x1f4)
 r5:00000002 r4:c0202040
[<c005f9f0>] (__do_page_cache_readahead+0x0/0x1f4) from [<c005fe8c>]
(ondemand_readahead+0x148/0x158)
[<c005fd44>] (ondemand_readahead+0x0/0x158) from [<c005ff7c>]
(page_cache_sync_readahead+0x34/0x3c)
 r8:c1c873c0 r7:00000000 r6:00000000 r5:00000001 r4:00000001
[<c005ff48>] (page_cache_sync_readahead+0x0/0x3c) from [<c0059c88>]
(generic_file_aio_read+0x1fc/0x604)
[<c0059a8c>] (generic_file_aio_read+0x0/0x604) from [<c0075bf8>]
(do_sync_read+0xbc/0x10c)
[<c0075b3c>] (do_sync_read+0x0/0x10c) from [<c007651c>] (vfs_read+0xb4/0x14=
4)
[<c0076468>] (vfs_read+0x0/0x144) from [<c0079e34>] (kernel_read+0x58/0x8c)
 r7:c01b39c8 r6:c1c17ee0 r5:00000000 r4:00000000
[<c0079ddc>] (kernel_read+0x0/0x8c) from [<c0079f38>] (prepare_binprm+0xd0/=
0xe0)
 r6:c018cacc r5:00000000 r4:c1c72480
[<c0079e68>] (prepare_binprm+0x0/0xe0) from [<c007ad90>] (do_execve+0xbc/0x=
1d0)
 r5:c1c72480 r4:00000002
[<c007acd4>] (do_execve+0x0/0x1d0) from [<c0022154>] (kernel_execve+0x40/0x=
88)
[<c0022114>] (kernel_execve+0x0/0x88) from [<c001e400>]
(run_init_process+0x20/0x28)
 r7:00000000 r6:00000000 r5:c001b6f0 r4:c01c3000
[<c001e3e0>] (run_init_process+0x0/0x28) from [<c001e4b4>] (init_post+0xac/=
0xf4)
[<c001e408>] (init_post+0x0/0xf4) from [<c0008784>] (kernel_init+0xb4/0xd8)
 r4:c01c3000
[<c00086d0>] (kernel_init+0x0/0xd8) from [<c00361b8>] (do_exit+0x0/0x6e4)
 r5:00000000 r4:00000000
Code: e10f5000 e3853080 e121f003 e5961000 (e5913000)
---[ end trace c1e56a23f80f8ca8 ]---
Unable to handle kernel NULL pointer dereference at virtual address 0000000=
0
pgd =3D c0004000
[00000000] *pgd=3D00000000
Internal error: Oops: 5 [#2]
Modules linked in:
CPU: 0    Tainted: G      D    (2.6.27 #30)
PC is at kfree+0x7c/0xc0
LR is at jffs2_get_inode_nodes+0xfa8/0x1090
pc : [<c0072118>]    lr : [<c00bc2d4>]    psr: 00000093
sp : c1d2bd90  ip : c1d2bdb0  fp : c1d2bdac
r10: 000007f0  r9 : c1d6e000  r8 : 00000007
r7 : 00000000  r6 : c1d33000  r5 : a0000013  r4 : 00000000
r3 : 00000080  r2 : bfdda000  r1 : 00000080  r0 : c1c00780
Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0005317f  Table: 20004000  DAC: 00000017
Process jffs2_gcd_mtd2 (pid: 211, stack limit =3D 0xc1d2a268)
Stack: (0xc1d2bd90 to 0xc1d2c000)
bd80:                                     c00baeb0 c1c71840 c1d33000 c1c712=
60
bda0: c1d2be14 c1d2bdb0 c00bc2d4 c00720ac 000007f0 c1d2bde4 c1d33000 c00def=
dc
bdc0: c1d2be14 00000000 00000000 c1d2be3c c1d4ac00 00000000 c1d2a000 000000=
00
bde0: c1d6e118 000007f0 c1c14c70 c1d2be3c c1d1c8f0 c1d2be94 c1d4ac00 c1d2bf=
50
be00: 00000000 c1d6e000 c1d2be8c c1d2be18 c00bc3f8 c00bb33c 00000044 c1d2be=
5c
be20: c1d2be94 00000003 c1d2be5c 00000001 00000000 00000000 00000400 c1c718=
40
be40: 00000000 00000001 00000000 00000000 00000000 00000000 c1d6e000 c1d6e0=
00
be60: c1d2be8c c1d4ac00 c1d1c8f0 c1d6e000 c1d6e000 c1d2bf50 00000000 c1d6e0=
2c
be80: c1d2bef4 c1d2be90 c00bcd60 c00bc3cc c01c3aa0 c1c6bc70 c01c3ad0 c1c6bc=
70
bea0: 0098963b 4848ff00 c1d2becc c1d2beb8 c002f29c c002f1f4 c01c3aa0 c1c6bc=
78
bec0: c1d2befc c1d2bed0 c002f37c c002f288 00000001 00000000 c1c6bc40 c1d1c8=
f0
bee0: 00000001 c1d6e000 c1d2bf4c c1d2bef8 c00c138c c00bcd14 c0151f34 c002f2=
f0
bf00: c1d2bf2c 00000000 c1d2a000 c1d6e000 00000084 c1d2bf50 c1d2bf3c c1d2bf=
28
bf20: c003ed4c 00000000 c1d2a000 c1d6e000 00000084 c1d2bf50 00000000 000000=
00
bf40: c1d2bff4 c1d2bf50 c00c2aac c00c1244 00000001 00000000 c1c6bc40 c1c6bd=
9c
bf60: 00000000 c01c3aa0 00000001 c1d2a000 c1d2bfac c1d2bf80 c0151f34 c002f2=
f0
bf80: c1d2a000 00000000 00000000 00000000 00000000 00000001 c1d2a000 000000=
00
bfa0: 00000000 c1d2bfb0 c001ec14 c0151e18 00000000 c1d6e000 c00c29b8 c00361=
b8
bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
bfe0: 00000000 00000000 00000000 c1d2bff8 c00361b8 c00c29c8 3284665e 2e1453=
66
Backtrace:
[<c007209c>] (kfree+0x0/0xc0) from [<c00bc2d4>]
(jffs2_get_inode_nodes+0xfa8/0x1090)
 r6:c1c71260 r5:c1d33000 r4:c1c71840
[<c00bb32c>] (jffs2_get_inode_nodes+0x0/0x1090) from [<c00bc3f8>]
(jffs2_do_read_inode_internal+0x3c/0x948)
[<c00bc3bc>] (jffs2_do_read_inode_internal+0x0/0x948) from
[<c00bcd60>] (jffs2_do_crccheck_inode+0x5c/0x9c)
[<c00bcd04>] (jffs2_do_crccheck_inode+0x0/0x9c) from [<c00c138c>]
(jffs2_garbage_collect_pass+0x158/0x680)
 r6:c1d6e000 r5:00000001 r4:c1d1c8f0
[<c00c1234>] (jffs2_garbage_collect_pass+0x0/0x680) from [<c00c2aac>]
(jffs2_garbage_collect_thread+0xf4/0x11c)
[<c00c29b8>] (jffs2_garbage_collect_thread+0x0/0x11c) from
[<c00361b8>] (do_exit+0x0/0x6e4)
 r8:00000000 r7:00000000 r6:00000000 r5:00000000 r4:00000000
Code: e59f1048 ebfec229 e5900018 e5904000 (e894000a)
---[ end trace c1e56a23f80f8ca8 ]---
Unable to handle kernel NULL pointer dereference at virtual address 0000010=
5
pgd =3D c0004000
[00000105] *pgd=3D00000000
Internal error: Oops: 1 [#3]
Modules linked in:
CPU: 0    Tainted: G      D    (2.6.27 #30)
PC is at kfree+0x7c/0xc0
LR is at free_proc_entry+0x4c/0x54
pc : [<c0072118>]    lr : [<c00acf6c>]    psr: 00000093
sp : c1c17808  ip : c1c17828  fp : c1c17824
r10: c1805238  r9 : c1c879c0  r8 : 00100100
r7 : 00200200  r6 : c1d6fe60  r5 : a0000013  r4 : 00000105
r3 : 00000080  r2 : bfdda000  r1 : 00000080  r0 : c1c00240
Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0005317f  Table: 20004000  DAC: 00000017
Process swapper (pid: 1, stack limit =3D 0xc1c16268)
Stack: (0xc1c17808 to 0xc1c18000)
7800:                   c1d6feb0 c1d6fe60 c1d6fea4 c1d6feb0 c1c1783c c1c178=
28
7820: c00acf6c c00720ac c00ace80 c1d6fe60 c1c1788c c1c17840 c00ad110 c00acf=
30
7840: c00312ac 00000000 c1c14c40 c01ca120 00000001 c1c12a80 89705f41 000000=
00
7860: c1c17884 c1d6feb8 c003cae8 80000013 c1d6d2c0 00000001 c01d7150 c1c72b=
98
7880: c1c1789c c1c17890 c0056328 c00acf84 c1c178bc c1c178a0 c0054aac c00563=
08
78a0: c01d7150 c1c50c40 c01d7150 c01d7150 c1c178d4 c1c178c0 c010425c c00549=
e8
78c0: 00000013 c1c50c40 c1c178f4 c1c178d8 c0100ff0 c0104204 c1c72b80 a00000=
13
78e0: c1c72b80 c1c97000 c1c1791c c1c178f8 c0101fe8 c0100f38 c003816c 000000=
00
7900: c1c97000 00000000 00000000 00000000 c1c179a4 c1c17920 c00ee808 c0101e=
e8
7920: c1c1793c c1c17930 c0038450 00000000 00000000 c1c63d18 57a879e1 000000=
09
7940: c1c17974 c1c17950 c002f274 c00dea3c c01c3aa0 c1c63d10 c1c1798c c1c179=
68
7960: c004a4e4 c0029588 c1c1798c c1c3c01c c1c14c40 00000017 c1c63ce0 c1c879=
c0
7980: c1807af0 00000008 c1c18bc8 00000000 c1c0c320 c1805238 c1c179b4 c1c179=
a8
79a0: c00eeaec c00ee664 c1c179ec c1c179b8 c0076cb8 c00eeae8 00000000 c00305=
20
79c0: c003816c c1c879c0 00000000 c1c18bc0 c1c18bc8 00000000 60000093 000000=
00
79e0: c1c179fc c1c179f0 c0077004 c0076c14 c1c17a1c c1c17a00 c0073d80 c0076f=
e0
7a00: c015222c c1c18bc0 00000001 00000008 c1c17a44 c1c17a20 c0034fec c0073d=
18
7a20: c1c16000 c1c14c40 0000000b 00000001 0000003e 00000001 c1c17a54 c1c17a=
48
7a40: c0035068 c0034f7c c1c17a6c c1c17a58 c0036354 c0035050 c0033458 c00333=
58
7a60: c1c17a7c c1c17a70 c0022e3c c00361c8 c1c17a9c c1c17a80 c0024eb0 c0022c=
98
7a80: e5913000 00000000 c1c17ba0 c0072e20 c1c17ab4 c1c17aa0 c002515c c0024e=
54
7aa0: e5913000 00000000 c1c17aec c1c17ab8 c0026cf0 c002510c c01171cc c1cf40=
80
7ac0: 00000044 000080d1 ffffffff c01b3dd0 00000001 c1c17ba0 0000003e c1c709=
88
7ae0: c1c17b9c c1c17af0 c001e214 c0026ab0 00000000 00000000 c1c17b14 600000=
13
7b00: 00000000 c1d30118 00000000 04068860 00000000 c1d6e000 c1c17b44 c1c17b=
28
7b20: c002e6f4 c002e654 00000000 c1c17b38 c01148d4 c1d30000 c1c17b5c c1c17b=
48
7b40: c0114ee8 c002e6d8 00000000 c1d30000 c1c17b8c c1c17b60 c0116268 c0114e=
b4
7b60: c1d300e4 c284f2ec c284f52c 00068860 00000000 c1c72780 00000004 ffffff=
ff
7b80: c1c17bd4 c1c006c0 000000d0 00000000 c1c17c04 c1c17ba0 c001e7ec c001e1=
e8
7ba0: c01ba690 0000003e 0000045d a0000093 c1d29528 a0000013 c1c006c0 000000=
d0
7bc0: 00000000 c1402000 c1c70988 c1c17c04 c1c17c08 c1c17be8 c00b9e50 c0072e=
20
7be0: a0000093 ffffffff c1d29528 00000044 c1c74ec0 c1402000 c1c17c54 c1c17c=
08
7c00: c00b9e50 c0072dd0 00000044 c1c17c24 c1d29528 c1c04960 c1807588 c1d6e0=
00
7c20: 000000d0 00000044 c1c17c74 00000800 00002000 c1c74ec0 c1402000 000000=
04
7c40: c1807588 00003000 c1c17c94 c1c17c58 c00ba190 c00b9c60 00000000 000008=
00
7c60: 00000001 c1d6e000 c1c17c94 c0202040 c1807588 c1807648 00200200 000000=
04
7c80: 00000001 00100100 c1c17cb4 c1c17c98 c00b846c c00ba090 00001000 001001=
00
7ca0: c1c17ccc c0202040 c1c17ccc c1c17cb8 c00b8518 c00b8414 c0202040 c18075=
88
7cc0: c1c17ce4 c1c17cd0 c00b8560 c00b8514 c0202040 00000002 c1c17d24 c1c17c=
e8
7ce0: c005fb94 c00b853c c1c873c0 00000095 c0202078 c0202078 c1806d58 c1c874=
08
7d00: 00000020 00000000 c1807648 c1c873c0 c1807648 00000000 c1c17d54 c1c17d=
28
7d20: c005fe8c c005fa00 00000003 c01c2488 c01c2464 00000001 00000001 000000=
00
7d40: 00000000 c1c873c0 c1c17d6c c1c17d58 c005ff7c c005fd54 00000000 000000=
01
7d60: c1c17dec c1c17d70 c0059c88 c005ff58 00000001 c01c2488 00000000 000000=
01
7d80: c1c87408 c1c17df8 00000000 00000000 00000fff 00000001 c18075b0 c1c17e=
88
7da0: ffffffff 00000001 60000013 00000000 00000080 c1c72480 00000000 000000=
80
7dc0: c005d414 c1c17df8 c1c873c0 c1c17df8 c1c17e88 c1c17ee0 00000000 fffffd=
ee
7de0: c1c17eb4 c1c17df0 c0075bf8 c0059a9c 00000000 00000000 00000000 000000=
d0
7e00: 00000000 00000001 ffffffff c1c873c0 00000000 00000000 00000000 000000=
00
7e20: c1c14c40 c1c17e30 00000000 00000000 00000000 c1c14c40 c0046b7c c1c17e=
3c
7e40: c1c17e3c 4c751c80 00000000 00000000 c002f29c c002f1f4 c01c3aa0 c1c14c=
78
7e60: 00000080 c1c17e70 c002f37c c002f288 00000001 c1c16000 c1c14c40 c1c14d=
9c
7e80: c01b39c8 c01c3aa0 c1c72480 00000080 c1c873c0 c1c72480 c1c17ee0 000000=
80
7ea0: c01b3940 c1c17f50 c1c17edc c1c17eb8 c007651c c0075b4c 00000000 c1c17f=
50
7ec0: 00000000 00000000 c1c17ee0 c01b39c8 c1c17f04 c1c17ee0 c0079e34 c00764=
78
7ee0: 00000000 00000000 fffffeff c1c72480 00000000 c018cacc c1c17f1c c1c17f=
08
7f00: c0079f38 c0079dec 00000002 c1c72480 c1c17f4c c1c17f20 c007ad90 c0079e=
78
7f20: c008024c 00000000 c018cacc c01b3940 c01b39c8 c1c17f50 00000000 000000=
00
7f40: c1c17fb4 c1c17f50 c0022154 c007ace4 00000000 00000000 00000000 000000=
00
7f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
7f80: 00000000 00000000 00000000 00000000 00000000 00000000 c01c3000 c001b6=
f0
7fa0: 00000000 00000000 c1c17fc4 c1c17fb8 c001e400 c0022124 c1c17fdc c1c17f=
c8
7fc0: c001e4b4 c001e3f0 c01c3000 c01c3000 c1c17ff4 c1c17fe0 c0008784 c001e4=
18
7fe0: 00000000 00000000 00000000 c1c17ff8 c00361b8 c00086e0 99940a9a b81410=
c6
Backtrace:
[<c007209c>] (kfree+0x0/0xc0) from [<c00acf6c>] (free_proc_entry+0x4c/0x54)
 r6:c1d6feb0 r5:c1d6fea4 r4:c1d6fe60
[<c00acf20>] (free_proc_entry+0x0/0x54) from [<c00ad110>]
(remove_proc_entry+0x19c/0x1bc)
 r4:c1d6fe60
[<c00acf74>] (remove_proc_entry+0x0/0x1bc) from [<c0056328>]
(unregister_handler_proc+0x30/0x38)
 r8:c1c72b98 r7:c01d7150 r6:00000001 r5:c1d6d2c0 r4:80000013
[<c00562f8>] (unregister_handler_proc+0x0/0x38) from [<c0054aac>]
(free_irq+0xd4/0x104)
[<c00549d8>] (free_irq+0x0/0x104) from [<c010425c>] (atmel_shutdown+0x68/0x=
88)
 r7:c01d7150 r6:c01d7150 r5:c1c50c40 r4:c01d7150
[<c01041f4>] (atmel_shutdown+0x0/0x88) from [<c0100ff0>]
(uart_shutdown+0xc8/0xf0)
 r5:c1c50c40 r4:00000013
[<c0100f28>] (uart_shutdown+0x0/0xf0) from [<c0101fe8>] (uart_close+0x110/0=
x1c0)
 r6:c1c97000 r5:c1c72b80 r4:a0000013
[<c0101ed8>] (uart_close+0x0/0x1c0) from [<c00ee808>] (release_dev+0x1b4/0x=
484)
 r8:00000000 r7:00000000 r6:00000000 r5:c1c97000 r4:00000000
[<c00ee654>] (release_dev+0x0/0x484) from [<c00eeaec>] (tty_release+0x14/0x=
1c)
[<c00eead8>] (tty_release+0x0/0x1c) from [<c0076cb8>] (__fput+0xb4/0x16c)
[<c0076c04>] (__fput+0x0/0x16c) from [<c0077004>] (fput+0x34/0x38)
[<c0076fd0>] (fput+0x0/0x38) from [<c0073d80>] (filp_close+0x78/0x84)
[<c0073d08>] (filp_close+0x0/0x84) from [<c0034fec>]
(put_files_struct+0x80/0xd4)
 r6:00000008 r5:00000001 r4:c1c18bc0
[<c0034f6c>] (put_files_struct+0x0/0xd4) from [<c0035068>]
(exit_files+0x28/0x2c)
[<c0035040>] (exit_files+0x0/0x2c) from [<c0036354>] (do_exit+0x19c/0x6e4)
[<c00361b8>] (do_exit+0x0/0x6e4) from [<c0022e3c>] (die+0x1b4/0x200)
[<c0022c88>] (die+0x0/0x200) from [<c0024eb0>] (__do_kernel_fault+0x6c/0x7c=
)
[<c0024e44>] (__do_kernel_fault+0x0/0x7c) from [<c002515c>]
(do_bad_area+0x60/0x6c)
 r7:c0072e20 r6:c1c17ba0 r5:00000000 r4:e5913000
[<c00250fc>] (do_bad_area+0x0/0x6c) from [<c0026cf0>] (do_alignment+0x250/0=
x360)
[<c0026aa0>] (do_alignment+0x0/0x360) from [<c001e214>] (do_DataAbort+0x3c/=
0xa0)
[<c001e1d8>] (do_DataAbort+0x0/0xa0) from [<c001e7ec>] (__dabt_svc+0x4c/0x6=
0)
Exception stack(0xc1c17ba0 to 0xc1c17be8)
7ba0: c01ba690 0000003e 0000045d a0000093 c1d29528 a0000013 c1c006c0 000000=
d0
7bc0: 00000000 c1402000 c1c70988 c1c17c04 c1c17c08 c1c17be8 c00b9e50 c0072e=
20
7be0: a0000093 ffffffff
 r8:00000000 r7:000000d0 r6:c1c006c0 r5:c1c17bd4 r4:ffffffff
[<c0072dc0>] (__kmalloc+0x0/0xd0) from [<c00b9e50>]
(jffs2_read_dnode+0x200/0x430)
 r7:c1402000 r6:c1c74ec0 r5:00000044 r4:c1d29528
[<c00b9c50>] (jffs2_read_dnode+0x0/0x430) from [<c00ba190>]
(jffs2_read_inode_range+0x110/0x15c)
[<c00ba080>] (jffs2_read_inode_range+0x0/0x15c) from [<c00b846c>]
(jffs2_do_readpage_nolock+0x68/0x100)
[<c00b8404>] (jffs2_do_readpage_nolock+0x0/0x100) from [<c00b8518>]
(jffs2_do_readpage_unlock+0x14/0x28)
 r4:c0202040
[<c00b8504>] (jffs2_do_readpage_unlock+0x0/0x28) from [<c00b8560>]
(jffs2_readpage+0x34/0x48)
 r5:c1807588 r4:c0202040
[<c00b852c>] (jffs2_readpage+0x0/0x48) from [<c005fb94>]
(__do_page_cache_readahead+0x1a4/0x1f4)
 r5:00000002 r4:c0202040
[<c005f9f0>] (__do_page_cache_readahead+0x0/0x1f4) from [<c005fe8c>]
(ondemand_readahead+0x148/0x158)
[<c005fd44>] (ondemand_readahead+0x0/0x158) from [<c005ff7c>]
(page_cache_sync_readahead+0x34/0x3c)
 r8:c1c873c0 r7:00000000 r6:00000000 r5:00000001 r4:00000001
[<c005ff48>] (page_cache_sync_readahead+0x0/0x3c) from [<c0059c88>]
(generic_file_aio_read+0x1fc/0x604)
[<c0059a8c>] (generic_file_aio_read+0x0/0x604) from [<c0075bf8>]
(do_sync_read+0xbc/0x10c)
[<c0075b3c>] (do_sync_read+0x0/0x10c) from [<c007651c>] (vfs_read+0xb4/0x14=
4)
[<c0076468>] (vfs_read+0x0/0x144) from [<c0079e34>] (kernel_read+0x58/0x8c)
 r7:c01b39c8 r6:c1c17ee0 r5:00000000 r4:00000000
[<c0079ddc>] (kernel_read+0x0/0x8c) from [<c0079f38>] (prepare_binprm+0xd0/=
0xe0)
 r6:c018cacc r5:00000000 r4:c1c72480
[<c0079e68>] (prepare_binprm+0x0/0xe0) from [<c007ad90>] (do_execve+0xbc/0x=
1d0)
 r5:c1c72480 r4:00000002
[<c007acd4>] (do_execve+0x0/0x1d0) from [<c0022154>] (kernel_execve+0x40/0x=
88)
[<c0022114>] (kernel_execve+0x0/0x88) from [<c001e400>]
(run_init_process+0x20/0x28)
 r7:00000000 r6:00000000 r5:c001b6f0 r4:c01c3000
[<c001e3e0>] (run_init_process+0x0/0x28) from [<c001e4b4>] (init_post+0xac/=
0xf4)
[<c001e408>] (init_post+0x0/0xf4) from [<c0008784>] (kernel_init+0xb4/0xd8)
 r4:c01c3000
[<c00086d0>] (kernel_init+0x0/0xd8) from [<c00361b8>] (do_exit+0x0/0x6e4)
 r5:00000000 r4:00000000
Code: e59f1048 ebfec229 e5900018 e5904000 (e894000a)
---[ end trace c1e56a23f80f8ca8 ]---
Fixing recursive fault but reboot is needed!
Unable to handle kernel NULL pointer dereference at virtual address 0000002=
0
pgd =3D c0004000
[00000020] *pgd=3D00000000
Internal error: Oops: 5 [#4]
Modules linked in:
CPU: 0    Tainted: G      D    (2.6.27 #30)
PC is at delayed_work_timer_fn+0x1c/0x28
LR is at run_timer_softirq+0x16c/0x200
pc : [<c0043194>]    lr : [<c003c604>]    psr: 20000013
sp : c01b1e90  ip : c01b1ea0  fp : c01b1e9c
r10: c01c9948  r9 : c01c9748  r8 : c01c9b48
r7 : c01b0000  r6 : c0043178  r5 : 00000100  r4 : c01c8d40
r3 : 00000020  r2 : 00200200  r1 : c01cb590  r0 : c01cb590
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0005317f  Table: 20004000  DAC: 00000017
Process swapper (pid: 0, stack limit =3D 0xc01b0268)
Stack: (0xc01b1e90 to 0xc01b2000)
1e80:                                     c01b1ee4 c01b1ea0 c003c604 c00431=
88
1ea0: c01b1ecc c01b1eb0 c01c3a64 c01c9548 c01b1eb0 c01b1eb0 41069265 c01c8b=
64
1ec0: 00000001 c01c8b60 0000000a 00000001 c01cb2c4 00000000 c01b1f14 c01b1e=
e8
1ee0: c003811c c003c4a8 00000001 00000001 c01b7728 00000000 c01c38c4 2001b1=
d4
1f00: 41069265 2001b1a0 c01b1f24 c01b1f18 c0038450 c00380c4 c01b1f44 c01b1f=
28
1f20: c001e058 c003841c c1c14640 ffffffff fefff000 00000001 c01b1f9c c01b1f=
48
1f40: c001e834 c001e010 00000000 0005317f 0005217f 60000013 c0020278 c01b00=
00
1f60: c0020278 c01c38c4 2001b1d4 41069265 2001b1a0 c01b1f9c 600000d3 c01b1f=
90
1f80: c00202bc c00202c8 60000013 ffffffff c01b1fbc c01b1fa0 c0020154 c00202=
88
1fa0: c01cb564 c01c346c c001cf18 c01b3bf0 c01b1fcc c01b1fc0 c0150a2c c00201=
28
1fc0: c01b1ff4 c01b1fd0 c0008a34 c01509e8 c0008394 00000000 00000000 c001cf=
1c
1fe0: 00053175 c01c3980 00000000 c01b1ff8 20008034 c00087b8 00000000 000000=
00
Backtrace:
[<c0043178>] (delayed_work_timer_fn+0x0/0x28) from [<c003c604>]
(run_timer_softirq+0x16c/0x200)
[<c003c498>] (run_timer_softirq+0x0/0x200) from [<c003811c>]
(__do_softirq+0x68/0xc4)
[<c00380b4>] (__do_softirq+0x0/0xc4) from [<c0038450>] (irq_exit+0x44/0x4c)
[<c003840c>] (irq_exit+0x0/0x4c) from [<c001e058>] (asm_do_IRQ+0x58/0x70)
[<c001e000>] (asm_do_IRQ+0x0/0x70) from [<c001e834>] (__irq_svc+0x34/0x60)
Exception stack(0xc01b1f48 to 0xc01b1f90)
1f40:                   00000000 0005317f 0005217f 60000013 c0020278 c01b00=
00
1f60: c0020278 c01c38c4 2001b1d4 41069265 2001b1a0 c01b1f9c 600000d3 c01b1f=
90
1f80: c00202bc c00202c8 60000013 ffffffff
 r6:00000001 r5:fefff000 r4:ffffffff
[<c0020278>] (default_idle+0x0/0x58) from [<c0020154>] (cpu_idle+0x3c/0x58)
[<c0020118>] (cpu_idle+0x0/0x58) from [<c0150a2c>] (rest_init+0x54/0x68)
 r7:c01b3bf0 r6:c001cf18 r5:c01c346c r4:c01cb564
[<c01509d8>] (rest_init+0x0/0x68) from [<c0008a34>] (start_kernel+0x28c/0x2=
ec)
[<c00087a8>] (start_kernel+0x0/0x2ec) from [<20008034>] (0x20008034)
 r5:c01c3980 r4:00053175
Code: e5903000 e1a01000 e3c33003 e5933014 (e5930000)
Kernel panic - not syncing: Fatal exception in interrupt


Please assiste me to solve the above problem.

Thanks in advance.

Thanks & Regards,
Venkappa
