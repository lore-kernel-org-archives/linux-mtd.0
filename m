Received: from smtp.orbitel.bg ([195.24.32.22])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EezOy-0001wz-C0
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 13:31:37 -0500
Message-ID: <4384B3E8.5030707@e-card.bg>
Date: Wed, 23 Nov 2005 20:24:40 +0200
From: Bozhidar Batsov <lordbad@e-card.bg>
MIME-Version: 1.0
To: linux-arm-kernel@lists.arm.linux.org.uk,
 linux-mtd@lists.infradead.org
References: <437DD790.6070304@e-card.bg>
	<43813C26.1020009@magellan-technology.com>
	<43847E96.3090204@e-card.bg>
	<Pine.LNX.4.64.0511230952490.6022@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0511230952490.6022@localhost.localdomain>
Content-Type: multipart/mixed; boundary="------------000800070709060801040504"
Cc: 
Subject: Re: Adding a new architecture to the kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000800070709060801040504
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Yes, I'm sorry for the confusion - I needed to add a new board, not a
new arch - arch is PXA25x of course. I have a dev board here similar to
lubbock, and the latest kernel for it by its manifacturer was 2.6.7. I
need at least 2.6.10 for my current project, but this board has an ASIX
AX88796 controller which does not have build in kernel support, so I
have to use the driver from the 2.6.7 kernel. Anyway are you certain
that this are all the step required to add a new board because a
followed them exactly but with the new board the kernel won't boot:
ARMboot 1.2.0 by Voipac <www.voipac.com> (Nov 24 2004 - 14:29:51)

ARMboot code: a1000000 -> a1019034
CPU: Intel XScale-PXA255 (ARM 5TE) revision A0
Clock: Mem=99.53MHz (*27), Run=199.07MHz (*2), Turbo=199.07MHz
(*1.0,inactive)
DRAM Configuration:
Bank #0: a0000000 16 MB
Bank #1: a4000000 0 KB
Bank #2: a8000000 0 KB
Bank #3: ac000000 0 KB
Flash: 16 MB
Hit any key to stop autoboot:  0

Starting Linux kernel image at 0x40000
         Architecture type: 89
         Command line: mem=16M root=/dev/mtdblock2 rootfstype=jffs2
console=ttyS0,115200

Uncompressing
Linux......................................................... done,
booting the kernel.

And that is all. The two boards are very simillar, I had to change but a
few things in lubbock.c to create the new voipac.c. Can someone take a
look at their source files (there quite small) and tell me if has some
idea what could be wrong. This 2.6.11 kernel works file with lubbock.c...
Nicolas Pitre wrote:

>On Wed, 23 Nov 2005, Bozhidar Batsov wrote:
>
>  
>
>>ARMboot code: a1000000 -> a1019034
>>CPU: Intel XScale-PXA255 (ARM 5TE) revision A0
>>Clock: Mem=99.53MHz (*27), Run=199.07MHz (*2), Turbo=199.07MHz
>>(*1.0,inactive)
>>DRAM Configuration:
>>Bank #0: a0000000 16 MB
>>Bank #1: a4000000 0 KB
>>Bank #2: a8000000 0 KB
>>Bank #3: ac000000 0 KB
>>Flash: 16 MB
>>Hit any key to stop autoboot:  0
>>
>>Starting Linux kernel image at 0x40000
>>        Architecture type: 89
>>        Command line: mem=16M root=/dev/mtdblock2 rootfstype=jffs2
>>console=ttyS0,115200
>>
>>Uncompressing
>>Linux......................................................... done,
>>booting the kernel.
>>    
>>
>
>Try enabling CONFIG_DEBUG_KERNEL and CONFIG_DEBUG_LL.
>
>
>Nicolas
>  
>
Somehow I got the kernel booting, but now I have some problems with
lubbock-flash.c and since I noticed you have written it I'd like to ask
for your help.
Lubbock configured to boot from ROM (bank 0)
Probing Lubbock Boot ROM at physical address 0x00000000 (16-bit bankwidth)
Lubbock Boot ROM: Found 1 x16 devices at 0x0 in 16-bit bank
Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
RedBoot partition parsing not available
cmdlinepart partition parsing not available
Probing Lubbock Application Flash at physical address 0x04000000 (16-bit
bankwidth)
Using static partitions on Lubbock Boot ROM
Creating 3 MTD partitions on "Lubbock Boot ROM":
0x00000000-0x00040000 : "Bootloader"
0x00040000-0x00140000 : "Kernel"
0x00140000-0x01000000 : "Filesystem"
Lubbock Application Flash is absent. Skipping
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP established hash table entries: 1024 (order: 1, 8192 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
NET: Registered protocol family 1
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(31,2)

I haven't changed the mappings at all. With lubbock board it works OK,
but with mine - kernel panic. Root fs is of course at the correct
address. I have edited appropriately(or at least I think so) all the
Kconfig and Makefiles. And the difference between lubbock.c and voipac.c
- as you can see prost my previous letter is pretty much minimal. I'm
out of ideas and would really appreciate any help that I can get.

TIA,
Bozhidar


--------------000800070709060801040504
Content-Type: text/plain;
 name="config"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="config"

#
# Automatically generated make config: don't edit
# Linux kernel version: 2.6.11
# Wed Nov 23 17:37:50 2005
#
CONFIG_ARM=y
CONFIG_MMU=y
CONFIG_UID16=y
CONFIG_RWSEM_GENERIC_SPINLOCK=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_GENERIC_IOMAP=y

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=y
CONFIG_CLEAN_COMPILE=y
CONFIG_BROKEN_ON_SMP=y

#
# General setup
#
CONFIG_LOCALVERSION=""
# CONFIG_SWAP is not set
# CONFIG_SYSVIPC is not set
# CONFIG_POSIX_MQUEUE is not set
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_SYSCTL=y
# CONFIG_AUDIT is not set
CONFIG_LOG_BUF_SHIFT=14
# CONFIG_HOTPLUG is not set
CONFIG_KOBJECT_UEVENT=y
# CONFIG_IKCONFIG is not set
CONFIG_EMBEDDED=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_ALL is not set
# CONFIG_KALLSYMS_EXTRA_PASS is not set
CONFIG_FUTEX=y
CONFIG_EPOLL=y
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SHMEM=y
CONFIG_CC_ALIGN_FUNCTIONS=0
CONFIG_CC_ALIGN_LABELS=0
CONFIG_CC_ALIGN_LOOPS=0
CONFIG_CC_ALIGN_JUMPS=0
# CONFIG_TINY_SHMEM is not set

#
# Loadable module support
#
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
CONFIG_MODULE_FORCE_UNLOAD=y
CONFIG_OBSOLETE_MODPARM=y
CONFIG_MODVERSIONS=y
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_KMOD=y

#
# System Type
#
# CONFIG_ARCH_CLPS7500 is not set
# CONFIG_ARCH_CLPS711X is not set
# CONFIG_ARCH_CO285 is not set
# CONFIG_ARCH_EBSA110 is not set
# CONFIG_ARCH_CAMELOT is not set
# CONFIG_ARCH_FOOTBRIDGE is not set
# CONFIG_ARCH_INTEGRATOR is not set
# CONFIG_ARCH_IOP3XX is not set
# CONFIG_ARCH_IXP4XX is not set
# CONFIG_ARCH_IXP2000 is not set
# CONFIG_ARCH_L7200 is not set
CONFIG_ARCH_PXA=y
# CONFIG_ARCH_RPC is not set
# CONFIG_ARCH_SA1100 is not set
# CONFIG_ARCH_S3C2410 is not set
# CONFIG_ARCH_SHARK is not set
# CONFIG_ARCH_LH7A40X is not set
# CONFIG_ARCH_OMAP is not set
# CONFIG_ARCH_VERSATILE is not set
# CONFIG_ARCH_IMX is not set
# CONFIG_ARCH_H720X is not set

#
# Intel PXA2xx Implementations
#
# CONFIG_ARCH_LUBBOCK is not set
CONFIG_ARCH_VOIPAC=y
# CONFIG_MACH_MAINSTONE is not set
# CONFIG_ARCH_PXA_IDP is not set
# CONFIG_PXA_SHARPSL is not set
CONFIG_PXA25x=y
CONFIG_SA1111=y
CONFIG_FORCE_MAX_ZONEORDER=9
CONFIG_DMABOUNCE=y

#
# Processor Type
#
CONFIG_CPU_32=y
CONFIG_CPU_XSCALE=y
CONFIG_CPU_32v5=y
CONFIG_CPU_ABRT_EV5T=y
CONFIG_CPU_CACHE_VIVT=y
CONFIG_CPU_TLB_V4WBI=y
CONFIG_CPU_MINICACHE=y

#
# Processor Features
#
CONFIG_ARM_THUMB=y
CONFIG_XSCALE_PMU=y

#
# General setup
#
CONFIG_ZBOOT_ROM_TEXT=0x40000
CONFIG_ZBOOT_ROM_BSS=0xa0400000
CONFIG_ZBOOT_ROM=y

#
# PCCARD (PCMCIA/CardBus) support
#
# CONFIG_PCCARD is not set

#
# PC-card bridges
#

#
# At least one math emulation must be selected
#
CONFIG_FPE_NWFPE=y
# CONFIG_FPE_NWFPE_XP is not set
# CONFIG_FPE_FASTFPE is not set
CONFIG_BINFMT_ELF=y
# CONFIG_BINFMT_AOUT is not set
# CONFIG_BINFMT_MISC is not set

#
# Generic Driver Options
#
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y
# CONFIG_FW_LOADER is not set
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_PM is not set
# CONFIG_PREEMPT is not set
# CONFIG_ARTHUR is not set
CONFIG_CMDLINE="mem=32M root=/dev/mtdblock2 rootfstype=jffs2 console=ttyS0,115200"
# CONFIG_LEDS is not set
CONFIG_ALIGNMENT_TRAP=y

#
# Parallel port support
#
# CONFIG_PARPORT is not set

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_AFS_PARTS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
CONFIG_MTD_CFI_INTELEXT=y
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_XIP is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_LUBBOCK=y
# CONFIG_MTD_ARM_INTEGRATOR is not set
# CONFIG_MTD_EDB7312 is not set
# CONFIG_MTD_SHARP_SL is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set

#
# Plug and Play support
#

#
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_COW_COMMON is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_NBD is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
# CONFIG_BLK_DEV_INITRD is not set
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_CDROM_PKTCDVD is not set

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_AS=y
CONFIG_IOSCHED_DEADLINE=y
CONFIG_IOSCHED_CFQ=y
# CONFIG_ATA_OVER_ETH is not set

#
# Multi-device support (RAID and LVM)
#
# CONFIG_MD is not set

#
# Networking support
#
CONFIG_NET=y

#
# Networking options
#
# CONFIG_PACKET is not set
# CONFIG_NETLINK_DEV is not set
CONFIG_UNIX=y
# CONFIG_NET_KEY is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_ARPD is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
# CONFIG_INET_TUNNEL is not set
CONFIG_IP_TCPDIAG=y
# CONFIG_IP_TCPDIAG_IPV6 is not set
# CONFIG_IPV6 is not set
# CONFIG_NETFILTER is not set

#
# SCTP Configuration (EXPERIMENTAL)
#
# CONFIG_IP_SCTP is not set
# CONFIG_ATM is not set
# CONFIG_BRIDGE is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_NET_DIVERT is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set

#
# QoS and/or fair queueing
#
# CONFIG_NET_SCHED is not set
# CONFIG_NET_CLS_ROUTE is not set

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NETPOLL is not set
# CONFIG_NET_POLL_CONTROLLER is not set
# CONFIG_HAMRADIO is not set
# CONFIG_IRDA is not set
# CONFIG_BT is not set
CONFIG_NETDEVICES=y
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_TUN is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=y
# CONFIG_MII is not set
CONFIG_ARM_AX88796=y
# CONFIG_SMC91X is not set
CONFIG_NE2000=y

#
# Ethernet (1000 Mbit)
#

#
# Ethernet (10000 Mbit)
#

#
# Token Ring devices
#

#
# Wireless LAN (non-hamradio)
#
# CONFIG_NET_RADIO is not set

#
# Wan interfaces
#
# CONFIG_WAN is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
# CONFIG_SHAPER is not set
# CONFIG_NETCONSOLE is not set

#
# ATA/ATAPI/MFM/RLL support
#
# CONFIG_IDE is not set

#
# SCSI device support
#
# CONFIG_SCSI is not set

#
# Fusion MPT device support
#

#
# IEEE 1394 (FireWire) support
#

#
# I2O device support
#

#
# ISDN subsystem
#
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_TSDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input I/O drivers
#
# CONFIG_GAMEPORT is not set
CONFIG_SOUND_GAMEPORT=y
# CONFIG_SERIO is not set

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set

#
# Character devices
#
CONFIG_VT=y
# CONFIG_VT_CONSOLE is not set
CONFIG_HW_CONSOLE=y
# CONFIG_SERIAL_NONSTANDARD is not set

#
# Serial drivers
#
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_PXA=y
CONFIG_SERIAL_PXA_CONSOLE=y
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set

#
# IPMI
#
# CONFIG_IPMI_HANDLER is not set

#
# Watchdog Cards
#
# CONFIG_WATCHDOG is not set
# CONFIG_NVRAM is not set
# CONFIG_RTC is not set
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_DRM is not set
# CONFIG_RAW_DRIVER is not set

#
# I2C support
#
# CONFIG_I2C is not set

#
# Multimedia devices
#
# CONFIG_VIDEO_DEV is not set

#
# Digital Video Broadcasting Devices
#
# CONFIG_DVB is not set

#
# File systems
#
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
# CONFIG_JBD is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set

#
# XFS support
#
# CONFIG_XFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_ROMFS_FS is not set
# CONFIG_QUOTA is not set
CONFIG_DNOTIFY=y
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set

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
CONFIG_PROC_FS=y
CONFIG_SYSFS=y
# CONFIG_DEVFS_FS is not set
# CONFIG_DEVPTS_FS_XATTR is not set
CONFIG_TMPFS=y
# CONFIG_TMPFS_XATTR is not set
# CONFIG_HUGETLB_PAGE is not set
CONFIG_RAMFS=y

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
# CONFIG_JFFS_FS is not set
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
# CONFIG_JFFS2_FS_NAND is not set
# CONFIG_JFFS2_FS_NOR_ECC is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
# CONFIG_JFFS2_RUBIN is not set
# CONFIG_CRAMFS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set

#
# Network File Systems
#
# CONFIG_NFS_FS is not set
# CONFIG_NFSD is not set
# CONFIG_SMB_FS is not set
# CONFIG_CIFS is not set
# CONFIG_NCP_FS is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_OSF_PARTITION is not set
# CONFIG_AMIGA_PARTITION is not set
# CONFIG_ATARI_PARTITION is not set
# CONFIG_MAC_PARTITION is not set
CONFIG_MSDOS_PARTITION=y
# CONFIG_BSD_DISKLABEL is not set
# CONFIG_MINIX_SUBPARTITION is not set
# CONFIG_SOLARIS_X86_PARTITION is not set
# CONFIG_UNIXWARE_DISKLABEL is not set
# CONFIG_LDM_PARTITION is not set
# CONFIG_SGI_PARTITION is not set
# CONFIG_ULTRIX_PARTITION is not set
# CONFIG_SUN_PARTITION is not set
# CONFIG_EFI_PARTITION is not set

#
# Native Language Support
#
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
# CONFIG_NLS_CODEPAGE_850 is not set
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
# CONFIG_NLS_ISO8859_1 is not set
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_UTF8 is not set

#
# Profiling support
#
# CONFIG_PROFILING is not set

#
# Graphics support
#
CONFIG_FB=y
# CONFIG_FB_MODE_HELPERS is not set
# CONFIG_FB_TILEBLITTING is not set
CONFIG_FB_PXA=y
# CONFIG_FB_PXA_PARAMETERS is not set
CONFIG_FB_VIRTUAL=y

#
# Console display driver support
#
# CONFIG_VGA_CONSOLE is not set
CONFIG_DUMMY_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE is not set

#
# Logo configuration
#
CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# CONFIG_BACKLIGHT_LCD_SUPPORT is not set

#
# Sound
#
# CONFIG_SOUND is not set

#
# Misc devices
#

#
# USB support
#
# CONFIG_USB is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB_ARCH_HAS_OHCI=y

#
# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support' may also be needed; see USB_STORAGE Help for more information
#

#
# USB Gadget Support
#
# CONFIG_USB_GADGET is not set

#
# MMC/SD Card support
#
# CONFIG_MMC is not set

#
# Kernel hacking
#
CONFIG_DEBUG_KERNEL=y
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_SCHEDSTATS is not set
# CONFIG_DEBUG_SLAB is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_KOBJECT is not set
# CONFIG_DEBUG_BUGVERBOSE is not set
# CONFIG_DEBUG_INFO is not set
# CONFIG_DEBUG_FS is not set
CONFIG_FRAME_POINTER=y
# CONFIG_DEBUG_USER is not set
# CONFIG_DEBUG_WAITQ is not set
CONFIG_DEBUG_ERRORS=y
CONFIG_DEBUG_LL=y
# CONFIG_DEBUG_ICEDCC is not set

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY is not set

#
# Cryptographic options
#
# CONFIG_CRYPTO is not set

#
# Hardware crypto devices
#

#
# Library routines
#
# CONFIG_CRC_CCITT is not set
CONFIG_CRC32=y
# CONFIG_LIBCRC32C is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y

--------------000800070709060801040504
Content-Type: text/x-csrc;
 name="lubbock.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lubbock.c"

/*
 *  linux/arch/arm/mach-pxa/lubbock.c
 *
 *  Support for the Intel DBPXA250 Development Platform.
 *
 *  Author:	Nicolas Pitre
 *  Created:	Jun 15, 2001
 *  Copyright:	MontaVista Software Inc.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License version 2 as
 *  published by the Free Software Foundation.
 */
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/device.h>
#include <linux/major.h>
#include <linux/fb.h>
#include <linux/interrupt.h>

#include <asm/setup.h>
#include <asm/memory.h>
#include <asm/mach-types.h>
#include <asm/hardware.h>
#include <asm/irq.h>

#include <asm/mach/arch.h>
#include <asm/mach/map.h>
#include <asm/mach/irq.h>

#include <asm/hardware/sa1111.h>

#include <asm/arch/pxa-regs.h>
#include <asm/arch/lubbock.h>
#include <asm/arch/udc.h>
#include <asm/arch/pxafb.h>
#include <asm/arch/mmc.h>

#include "generic.h"


#define LUB_MISC_WR		__LUB_REG(LUBBOCK_FPGA_PHYS + 0x080)

void lubbock_set_misc_wr(unsigned int mask, unsigned int set)
{
	unsigned long flags;

	local_irq_save(flags);
	LUB_MISC_WR = (LUB_MISC_WR & ~mask) | (set & mask);
	local_irq_restore(flags);
}
EXPORT_SYMBOL(lubbock_set_misc_wr);

static unsigned long lubbock_irq_enabled;

static void lubbock_mask_irq(unsigned int irq)
{
	int lubbock_irq = (irq - LUBBOCK_IRQ(0));
	LUB_IRQ_MASK_EN = (lubbock_irq_enabled &= ~(1 << lubbock_irq));
}

static void lubbock_unmask_irq(unsigned int irq)
{
	int lubbock_irq = (irq - LUBBOCK_IRQ(0));
	/* the irq can be acknowledged only if deasserted, so it's done here */
	LUB_IRQ_SET_CLR &= ~(1 << lubbock_irq);
	LUB_IRQ_MASK_EN = (lubbock_irq_enabled |= (1 << lubbock_irq));
}

static struct irqchip lubbock_irq_chip = {
	.ack		= lubbock_mask_irq,
	.mask		= lubbock_mask_irq,
	.unmask		= lubbock_unmask_irq,
};

static void lubbock_irq_handler(unsigned int irq, struct irqdesc *desc,
				struct pt_regs *regs)
{
	unsigned long pending = LUB_IRQ_SET_CLR & lubbock_irq_enabled;
	do {
		GEDR(0) = GPIO_bit(0);	/* clear our parent irq */
		if (likely(pending)) {
			irq = LUBBOCK_IRQ(0) + __ffs(pending);
			desc = irq_desc + irq;
			desc->handle(irq, desc, regs);
		}
		pending = LUB_IRQ_SET_CLR & lubbock_irq_enabled;
	} while (pending);
}

static void __init lubbock_init_irq(void)
{
	int irq;

	pxa_init_irq();

	/* setup extra lubbock irqs */
	for (irq = LUBBOCK_IRQ(0); irq <= LUBBOCK_LAST_IRQ; irq++) {
		set_irq_chip(irq, &lubbock_irq_chip);
		set_irq_handler(irq, do_level_IRQ);
		set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
	}

	set_irq_chained_handler(IRQ_GPIO(0), lubbock_irq_handler);
	set_irq_type(IRQ_GPIO(0), IRQT_FALLING);
}

static int lubbock_udc_is_connected(void)
{
	return (LUB_MISC_RD & (1 << 9)) == 0;
}

static struct pxa2xx_udc_mach_info udc_info __initdata = {
	.udc_is_connected	= lubbock_udc_is_connected,
	// no D+ pullup; lubbock can't connect/disconnect in software
};

static struct resource sa1111_resources[] = {
	[0] = {
		.start	= 0x10000000,
		.end	= 0x10001fff,
		.flags	= IORESOURCE_MEM,
	},
	[1] = {
		.start	= LUBBOCK_SA1111_IRQ,
		.end	= LUBBOCK_SA1111_IRQ,
		.flags	= IORESOURCE_IRQ,
	},
};

static struct platform_device sa1111_device = {
	.name		= "sa1111",
	.id		= -1,
	.num_resources	= ARRAY_SIZE(sa1111_resources),
	.resource	= sa1111_resources,
};

static struct resource smc91x_resources[] = {
	[0] = {
		.start	= 0x0c000000,
		.end	= 0x0c0fffff,
		.flags	= IORESOURCE_MEM,
	},
	[1] = {
		.start	= LUBBOCK_ETH_IRQ,
		.end	= LUBBOCK_ETH_IRQ,
		.flags	= IORESOURCE_IRQ,
	},
	[2] = {
		.start	= 0x0e000000,
		.end	= 0x0e0fffff,
		.flags	= IORESOURCE_MEM,
	},
};

static struct platform_device smc91x_device = {
	.name		= "smc91x",
	.id		= -1,
	.num_resources	= ARRAY_SIZE(smc91x_resources),
	.resource	= smc91x_resources,
};

static struct platform_device *devices[] __initdata = {
	&sa1111_device,
	&smc91x_device,
};

static struct pxafb_mach_info sharp_lm8v31 __initdata = {
	.pixclock	= 270000,
	.xres		= 640,
	.yres		= 480,
	.bpp		= 16,
	.hsync_len	= 1,
	.left_margin	= 3,
	.right_margin	= 3,
	.vsync_len	= 1,
	.upper_margin	= 0,
	.lower_margin	= 0,
	.sync		= FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
	.cmap_greyscale	= 0,
	.cmap_inverse	= 0,
	.cmap_static	= 0,
	.lccr0		= LCCR0_SDS,
	.lccr3		= LCCR3_PCP | LCCR3_Acb(255),
};

static int lubbock_mci_init(struct device *dev, irqreturn_t (*lubbock_detect_int)(int, void *, struct pt_regs *), void *data)
{
	/* setup GPIO for PXA25x MMC controller	*/
	pxa_gpio_mode(GPIO6_MMCCLK_MD);
	pxa_gpio_mode(GPIO8_MMCCS0_MD);

	return 0;
}

static struct pxamci_platform_data lubbock_mci_platform_data = {
	.ocr_mask	= MMC_VDD_32_33|MMC_VDD_33_34,
	.init 		= lubbock_mci_init,
};

static void __init lubbock_init(void)
{
	pxa_set_udc_info(&udc_info);
	set_pxa_fb_info(&sharp_lm8v31);
	pxa_set_mci_info(&lubbock_mci_platform_data);
	(void) platform_add_devices(devices, ARRAY_SIZE(devices));
}

static struct map_desc lubbock_io_desc[] __initdata = {
  { LUBBOCK_FPGA_VIRT, LUBBOCK_FPGA_PHYS, 0x00100000, MT_DEVICE }, /* CPLD */
};

static void __init lubbock_map_io(void)
{
	pxa_map_io();
	iotable_init(lubbock_io_desc, ARRAY_SIZE(lubbock_io_desc));

	/* This enables the BTUART */
	pxa_gpio_mode(GPIO42_BTRXD_MD);
	pxa_gpio_mode(GPIO43_BTTXD_MD);
	pxa_gpio_mode(GPIO44_BTCTS_MD);
	pxa_gpio_mode(GPIO45_BTRTS_MD);

	/* This is for the SMC chip select */
	pxa_gpio_mode(GPIO79_nCS_3_MD);

	/* setup sleep mode values */
	PWER  = 0x00000002;
	PFER  = 0x00000000;
	PRER  = 0x00000002;
	PGSR0 = 0x00008000;
	PGSR1 = 0x003F0202;
	PGSR2 = 0x0001C000;
	PCFR |= PCFR_OPDE;
}

MACHINE_START(LUBBOCK, "Intel DBPXA250 Development Platform (aka Lubbock)")
	MAINTAINER("MontaVista Software Inc.")
	BOOT_MEM(0xa0000000, 0x40000000, io_p2v(0x40000000))
	MAPIO(lubbock_map_io)
	INITIRQ(lubbock_init_irq)
	.timer		= &pxa_timer,
	INIT_MACHINE(lubbock_init)
MACHINE_END

--------------000800070709060801040504
Content-Type: text/x-csrc;
 name="voipac.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="voipac.c"

/*
 *  linux/arch/arm/mach-pxa/voipac.c
 *
 *  Support for the Voipac XScale Development Platform.
 *
 *  Author:	Bozhidar Batsov
 *  Created:	Nov 22, 2005
 *  Copyright:	Jet Systems Ltd.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License version 2 as
 *  published by the Free Software Foundation.
 */
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/device.h>
#include <linux/major.h>
#include <linux/fb.h>
#include <linux/interrupt.h>

#include <asm/setup.h>
#include <asm/memory.h>
#include <asm/mach-types.h>
#include <asm/hardware.h>
#include <asm/irq.h>

#include <asm/mach/arch.h>
#include <asm/mach/map.h>
#include <asm/mach/irq.h>
#include <asm-arm/arch-pxa/bitfield.h>

#ifdef CONFIG_SA1111
#include <asm/hardware/sa1111.h>
#endif

#include <asm/arch/pxa-regs.h>
#include <asm/arch/lubbock.h>
#include <asm/arch/udc.h>
#include <asm/arch/pxafb.h>
#include <asm/arch/mmc.h>

#include "generic.h"


#define LUB_MISC_WR		__LUB_REG(LUBBOCK_FPGA_PHYS + 0x080)

void lubbock_set_misc_wr(unsigned int mask, unsigned int set)
{
	unsigned long flags;

	local_irq_save(flags);
	LUB_MISC_WR = (LUB_MISC_WR & ~mask) | (set & mask);
	local_irq_restore(flags);
}
EXPORT_SYMBOL(lubbock_set_misc_wr);

static unsigned long lubbock_irq_enabled;

static void lubbock_mask_irq(unsigned int irq)
{
	int lubbock_irq = (irq - LUBBOCK_IRQ(0));
	LUB_IRQ_MASK_EN = (lubbock_irq_enabled &= ~(1 << lubbock_irq));
}

static void lubbock_unmask_irq(unsigned int irq)
{
	int lubbock_irq = (irq - LUBBOCK_IRQ(0));
	/* the irq can be acknowledged only if deasserted, so it's done here */
	LUB_IRQ_SET_CLR &= ~(1 << lubbock_irq);
	LUB_IRQ_MASK_EN = (lubbock_irq_enabled |= (1 << lubbock_irq));
}

static struct irqchip lubbock_irq_chip = {
	.ack		= lubbock_mask_irq,
	.mask		= lubbock_mask_irq,
	.unmask		= lubbock_unmask_irq,
};

#ifdef CONFIG_SA1111
static void lubbock_irq_handler(unsigned int irq, struct irqdesc *desc,
				struct pt_regs *regs)
{
	unsigned long pending = LUB_IRQ_SET_CLR & lubbock_irq_enabled;
	do {
		GEDR(0) = GPIO_bit(0);	/* clear our parent irq */
		if (likely(pending)) {
			irq = LUBBOCK_IRQ(0) + __ffs(pending);
			desc = irq_desc + irq;
			desc->handle(irq, desc, regs);
		}
		pending = LUB_IRQ_SET_CLR & lubbock_irq_enabled;
	} while (pending);
}
#endif

static void __init lubbock_init_irq(void)
{
	int irq;

	pxa_init_irq();

	/* setup extra lubbock irqs */
	for (irq = LUBBOCK_IRQ(0); irq <= LUBBOCK_LAST_IRQ; irq++) {
		set_irq_chip(irq, &lubbock_irq_chip);
		set_irq_handler(irq, do_level_IRQ);
		set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
	}
#ifdef CONFIG_SA1111
	set_irq_chained_handler(IRQ_GPIO(0), lubbock_irq_handler);
	set_irq_type(IRQ_GPIO(0), IRQT_FALLING);
#endif
}

static int lubbock_udc_is_connected(void)
{
	return (LUB_MISC_RD & (1 << 9)) == 0;
}

static struct pxa2xx_udc_mach_info udc_info __initdata = {
	.udc_is_connected	= lubbock_udc_is_connected,
	// no D+ pullup; lubbock can't connect/disconnect in software
};

#ifdef CONFIG_SA1111
static struct resource sa1111_resources[] = {
	[0] = {
		.start	= 0x10000000,
		.end	= 0x10001fff,
		.flags	= IORESOURCE_MEM,
	},
	[1] = {
		.start	= LUBBOCK_SA1111_IRQ,
		.end	= LUBBOCK_SA1111_IRQ,
		.flags	= IORESOURCE_IRQ,
	},
};

static struct platform_device sa1111_device = {
	.name		= "sa1111",
	.id		= -1,
	.num_resources	= ARRAY_SIZE(sa1111_resources),
	.resource	= sa1111_resources,
};
#endif

#ifdef CONFIG_ARM_SMC91X
static struct resource smc91x_resources[] = {
	[0] = {
		.start	= 0x0c000000,
		.end	= 0x0c0fffff,
		.flags	= IORESOURCE_MEM,
	},
	[1] = {
		.start	= LUBBOCK_ETH_IRQ,
		.end	= LUBBOCK_ETH_IRQ,
		.flags	= IORESOURCE_IRQ,
	},
	[2] = {
		.start	= 0x0e000000,
		.end	= 0x0e0fffff,
		.flags	= IORESOURCE_MEM,
	},
};

static struct platform_device smc91x_device = {
	.name		= "smc91x",
	.id		= -1,
	.num_resources	= ARRAY_SIZE(smc91x_resources),
	.resource	= smc91x_resources,
};
#endif

#ifdef CONFIG_ARM_AX88796

#define AX88796_ETH0_IRQ_GPIO   20
#define AX88796_ETH1_IRQ_GPIO   19

static struct resource ax88796_resources_0[] = {
	 [0] = {
	     .start  = 0xf0000400,
	     .end    = 0xf00fffff,
	     .flags  = IORESOURCE_MEM,
	 },
	 [1] = {
	     .start  = IRQ_GPIO(AX88796_ETH0_IRQ_GPIO),
	     .end    = IRQ_GPIO(AX88796_ETH0_IRQ_GPIO),
	     .flags  = IORESOURCE_IRQ,
	 },
};

static struct platform_device ax88796_device_0 = {
    .name           = "ax88796",
    .id             = 0,
    .num_resources  = ARRAY_SIZE(ax88796_resources_0),
    .resource       = ax88796_resources_0,
};

static struct resource ax88796_resources_1[] = {
     [0] = {
         .start  = 0xf1000400,
         .end    = 0xf10fffff,
         .flags  = IORESOURCE_MEM,
     },
     [1] = {
         .start  = IRQ_GPIO(AX88796_ETH1_IRQ_GPIO),
         .end    = IRQ_GPIO(AX88796_ETH1_IRQ_GPIO),
         .flags  = IORESOURCE_IRQ,
     },
};

static struct platform_device ax88796_device_1 = {
    .name           = "ax88796",
    .id             = 1,
    .num_resources  = ARRAY_SIZE(ax88796_resources_1),
    .resource       = ax88796_resources_1,
};
#endif

static struct platform_device *devices[] __initdata = {
#ifdef CONFIG_SA1111
	&sa1111_device,
#endif
#ifdef CONFIG_ARM_SMC91X
	&smc91x_device,
#endif
#ifdef CONFIG_ARM_AX88796
	&ax88796_device_0,
	&ax88796_device_1,
#endif
			
};

static struct pxafb_mach_info sharp_lm8v31 __initdata = {
	.pixclock	= 270000,
	.xres		= 640,
	.yres		= 480,
	.bpp		= 16,
	.hsync_len	= 1,
	.left_margin	= 3,
	.right_margin	= 3,
	.vsync_len	= 1,
	.upper_margin	= 0,
	.lower_margin	= 0,
	.sync		= FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
	.cmap_greyscale	= 0,
	.cmap_inverse	= 0,
	.cmap_static	= 0,
	.lccr0		= LCCR0_SDS,
	.lccr3		= LCCR3_PCP | LCCR3_Acb(255),
};

static int lubbock_mci_init(struct device *dev, irqreturn_t (*lubbock_detect_int)(int, void *, struct pt_regs *), void *data)
{
	/* setup GPIO for PXA25x MMC controller	*/
	pxa_gpio_mode(GPIO6_MMCCLK_MD);
	pxa_gpio_mode(GPIO8_MMCCS0_MD);

	return 0;
}

static struct pxamci_platform_data lubbock_mci_platform_data = {
	.ocr_mask	= MMC_VDD_32_33|MMC_VDD_33_34,
	.init 		= lubbock_mci_init,
};

static void __init lubbock_init(void)
{
	pxa_set_udc_info(&udc_info);
	set_pxa_fb_info(&sharp_lm8v31);
	pxa_set_mci_info(&lubbock_mci_platform_data);
	(void) platform_add_devices(devices, ARRAY_SIZE(devices));
}

static struct map_desc lubbock_io_desc[] __initdata = {
  { LUBBOCK_FPGA_VIRT, LUBBOCK_FPGA_PHYS, 0x00100000, MT_DEVICE }, /* CPLD */
  { 0xf0000000, 0x08000000, 0x00100000, MT_DEVICE }, /* eth0 ctrl */
  { 0xf1000000, 0x0c000000, 0x00100000, MT_DEVICE }, /* eth1 ctrl */
  { 0xf5000000, 0x20000000, 0x00100000, MT_DEVICE }, /* IDE */
};

static void __init lubbock_map_io(void)
{
	pxa_map_io();
	iotable_init(lubbock_io_desc, ARRAY_SIZE(lubbock_io_desc));

	/* This enables the BTUART */
	pxa_gpio_mode(GPIO42_BTRXD_MD);
	pxa_gpio_mode(GPIO43_BTTXD_MD);
	pxa_gpio_mode(GPIO44_BTCTS_MD);
	pxa_gpio_mode(GPIO45_BTRTS_MD);

	/* This is for the SMC chip select */
	pxa_gpio_mode(GPIO79_nCS_3_MD);

	/* setup sleep mode values */
	PWER  = 0x00000002;
	PFER  = 0x00000000;
	PRER  = 0x00000002;
	PGSR0 = 0x00008000;
	PGSR1 = 0x003F0202;
	PGSR2 = 0x0001C000;
	PCFR |= PCFR_OPDE;
}

MACHINE_START(LUBBOCK, "Voipac XScale development platform")
	MAINTAINER("Jet Systems Ltd.")
	BOOT_MEM(0xa0000000, 0x40000000, io_p2v(0x40000000))
	BOOT_PARAMS(0xa0000100)
	MAPIO(lubbock_map_io)
	INITIRQ(lubbock_init_irq)
	.timer		= &pxa_timer,
	INIT_MACHINE(lubbock_init)
MACHINE_END

--------------000800070709060801040504--
