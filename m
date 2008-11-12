Received: from mailsmtp.zilog.com ([216.103.121.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0GOa-0000D8-9D
	for linux-mtd@lists.infradead.org; Wed, 12 Nov 2008 14:08:37 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: MTD XIP related issue
Date: Wed, 12 Nov 2008 19:38:28 +0530
Message-ID: <130F820E6D339446BB9EEC7FAF40A06DDEDF4B@mailziel.zilog.org>
From: "Avik Sil" <savik@zilog.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While porting Linux kernel 2.6.26 on an ARM922T based custom board for
XIP kernel, I came across the following bug report during boot-up:

=20

...

Zilog flash device: 1000000 at 10000000

kernel BUG at include/linux/mtd/cfi.h:320!

Unable to handle kernel NULL pointer dereference at virtual address
00000000

pgd =3D c0004000

[00000000] *pgd=3D00000000

Internal error: Oops: 805 [#1]

Modules linked in:

CPU: 0    Not tainted  (2.6.26.3 #15)

PC is at __bug+0x20/0x2c

LR is at 0xc0010ce0

pc : [<bf03c514>]    lr : [<c0010ce0>]    psr: 60000093

sp : c0081e84  ip : c0010ce0  fp : c0081e90

r10: 000000aa  r9 : c0081ed4  r8 : 00000000

r7 : ffffffff  r6 : c0021004  r5 : 00000002  r4 : 00000002

r3 : 00000000  r2 : 00000001  r1 : 00000001  r0 : 0000002e

Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel

Control: 4000317f  Table: 20004000  DAC: 00000017

Process swapper (pid: 1, stack limit =3D 0xc0080260)

Stack: (0xc0081e84 to 0xc0082000)

1e80:          c0081ecc c0081e94 c001db04 bf03c504 c0081ea0 c2000000
00000000

1ea0: ff000000 00000001 00000002 00000001 c001ca98 c0080000 00000000
c0021004

1ec0: c0081f34 c0081ed0 bf175ee4 c001da40 bf037718 00000000 00000000
00000002

1ee0: 00000001 00000000 00000000 00000000 00000000 00000000 00000000
00000000

1f00: 00000000 00000000 00000000 c0021004 c001ca80 00000000 bf031940
c0080000

1f20: 00000000 bf037718 c0081f44 c0081f38 bf172f18 bf175e70 c0081f5c
c0081f48

1f40: bf172ea4 bf172f14 c0021004 00000000 c0081f70 c0081f60 bf0319c8
bf172e8c

1f60: c000a858 c0081ff4 c0081f74 bf020b54 bf031950 bf05191c bf050dec
00000000

1f80: 00000000 c0080000 00000000 c0081f00 c0081f9c bf048588 bf0484f0
00000000

1fa0: 00000000 c0081fb0 bf038ac4 bf048578 00000000 00000000 bf020ab0
bf050674

1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000

1fe0: 00000000 00000000 00000000 c0081ff8 bf050674 bf020ac0 33ecb3ce
120433a8

Backtrace:

[<bf03c4f4>] (__bug+0x0/0x2c) from [<c001db04>] (0xc001db04)

[<c001da30>] (0xc001da30) from [<bf175ee4>]
(mtd_do_chip_probe+0x84/0x348)

[<bf175e60>] (mtd_do_chip_probe+0x0/0x348) from [<bf172f18>]
(cfi_probe+0x14/0x1

c)

[<bf172f04>] (cfi_probe+0x0/0x1c) from [<bf172ea4>]
(do_map_probe+0x28/0x48)

[<bf172e7c>] (do_map_probe+0x0/0x48) from [<bf0319c8>]
(init_zilog+0x88/0xec)

 r5:00000000 r4:c0021004

[<bf031940>] (init_zilog+0x0/0xec) from [<bf020b54>]
(kernel_init+0xa4/0x240)

 r4:c000a858

[<bf020ab0>] (kernel_init+0x0/0x240) from [<bf050674>]
(do_exit+0x0/0x5d4)

Code: e1a01000 e59f000c eb004922 e3a03000 (e5833000)

---[ end trace 30377ff1adca3d03 ]---

Kernel panic - not syncing: Attempted to kill init!

=20

=20

Although it happens only for few of the bootups, otherwise it displays
following MTD partitions:

=20

...

Zilog flash device: 1000000 at 10000000

Zilog board flash device: Found 1 x16 devices at 0x0 in 16-bit bank

 Amd/Fujitsu Extended Query Table at 0x0040

Zilog board flash device: CFI does not contain boot bank location.
Assuming top.

number of CFI chips: 1

cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.

Creating 3 MTD partitions on "Zilog board flash device":

0x00000000-0x00180000 : "boot loader"

0x00180000-0x00800000 : "root fs"

0x00800000-0x00f00000 : "User fs"

Zilog flash device initialized

usbmon: debugfs is not available

...

=20

My kernel configuration is:

=20

=20

=20

#

# Automatically generated make config: don't edit

# Linux kernel version: 2.6.26.3

# Thu Nov  6 18:30:55 2008

#

CONFIG_ARM=3Dy

CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy

# CONFIG_GENERIC_GPIO is not set

# CONFIG_GENERIC_TIME is not set

# CONFIG_GENERIC_CLOCKEVENTS is not set

CONFIG_MMU=3Dy

# CONFIG_NO_IOPORT is not set

CONFIG_GENERIC_HARDIRQS=3Dy

CONFIG_STACKTRACE_SUPPORT=3Dy

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

CONFIG_ARCH_MTD_XIP=3Dy

CONFIG_VECTORS_BASE=3D0xffff0000

CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"

=20

#

# General setup

#

CONFIG_EXPERIMENTAL=3Dy

CONFIG_BROKEN_ON_SMP=3Dy

CONFIG_INIT_ENV_ARG_LIMIT=3D32

CONFIG_LOCALVERSION=3D""

# CONFIG_LOCALVERSION_AUTO is not set

CONFIG_SWAP=3Dy

CONFIG_SYSVIPC=3Dy

CONFIG_SYSVIPC_SYSCTL=3Dy

# CONFIG_POSIX_MQUEUE is not set

# CONFIG_BSD_PROCESS_ACCT is not set

# CONFIG_TASKSTATS is not set

# CONFIG_AUDIT is not set

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

CONFIG_SYSCTL_SYSCALL_CHECK=3Dy

CONFIG_KALLSYMS=3Dy

# CONFIG_KALLSYMS_ALL is not set

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

# CONFIG_HAVE_KPROBES is not set

# CONFIG_HAVE_KRETPROBES is not set

# CONFIG_HAVE_DMA_ATTRS is not set

CONFIG_PROC_PAGE_MONITOR=3Dy

CONFIG_SLABINFO=3Dy

CONFIG_RT_MUTEXES=3Dy

# CONFIG_TINY_SHMEM is not set

CONFIG_BASE_SMALL=3D0

CONFIG_MODULES=3Dy

# CONFIG_MODULE_FORCE_LOAD is not set

CONFIG_MODULE_UNLOAD=3Dy

CONFIG_MODULE_FORCE_UNLOAD=3Dy

# CONFIG_MODVERSIONS is not set

# CONFIG_MODULE_SRCVERSION_ALL is not set

# CONFIG_KMOD is not set

CONFIG_BLOCK=3Dy

# CONFIG_LBD is not set

# CONFIG_BLK_DEV_IO_TRACE is not set

# CONFIG_LSF is not set

# CONFIG_BLK_DEV_BSG is not set

=20

#

# IO Schedulers

#

CONFIG_IOSCHED_NOOP=3Dy

CONFIG_IOSCHED_AS=3Dy

CONFIG_IOSCHED_DEADLINE=3Dy

CONFIG_IOSCHED_CFQ=3Dy

CONFIG_DEFAULT_AS=3Dy

# CONFIG_DEFAULT_DEADLINE is not set

# CONFIG_DEFAULT_CFQ is not set

# CONFIG_DEFAULT_NOOP is not set

CONFIG_DEFAULT_IOSCHED=3D"anticipatory"

CONFIG_CLASSIC_RCU=3Dy

=20

#

# System Type

#

# CONFIG_ARCH_AAEC2000 is not set

# CONFIG_ARCH_INTEGRATOR is not set

# CONFIG_ARCH_REALVIEW is not set

# CONFIG_ARCH_VERSATILE is not set

# CONFIG_ARCH_AT91 is not set

# CONFIG_ARCH_CLPS7500 is not set

# CONFIG_ARCH_CLPS711X is not set

# CONFIG_ARCH_CO285 is not set

# CONFIG_ARCH_EBSA110 is not set

# CONFIG_ARCH_EP93XX is not set

# CONFIG_ARCH_ZILOG_ZA9L is not set

CONFIG_ARCH_Z32AN=3Dy

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

# CONFIG_ARCH_KS8695 is not set

# CONFIG_ARCH_NS9XXX is not set

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

=20

#

# Boot options

#

=20

#

# Power management

#

=20

#

# Processor Type

#

CONFIG_CPU_32=3Dy

CONFIG_CPU_ARM922T=3Dy

CONFIG_CPU_32v4T=3Dy

CONFIG_CPU_ABRT_EV4T=3Dy

CONFIG_CPU_PABRT_NOIFAR=3Dy

CONFIG_CPU_CACHE_V4WT=3Dy

CONFIG_CPU_CACHE_VIVT=3Dy

CONFIG_CPU_COPY_V4WB=3Dy

CONFIG_CPU_TLB_V4WBI=3Dy

CONFIG_CPU_CP15=3Dy

CONFIG_CPU_CP15_MMU=3Dy

=20

#

# Processor Features

#

CONFIG_ARM_THUMB=3Dy

# CONFIG_CPU_ICACHE_DISABLE is not set

# CONFIG_CPU_DCACHE_DISABLE is not set

# CONFIG_CPU_DCACHE_WRITETHROUGH is not set

# CONFIG_OUTER_CACHE is not set

=20

#

# Bus support

#

# CONFIG_PCI_SYSCALL is not set

# CONFIG_ARCH_SUPPORTS_MSI is not set

# CONFIG_PCCARD is not set

=20

#

# Kernel Features

#

# CONFIG_TICK_ONESHOT is not set

# CONFIG_PREEMPT is not set

# CONFIG_NO_IDLE_HZ is not set

CONFIG_HZ=3D100

# CONFIG_AEABI is not set

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

CONFIG_ALIGNMENT_TRAP=3Dy

=20

#

# Boot options

#

CONFIG_ZBOOT_ROM_TEXT=3D0x20008000

CONFIG_ZBOOT_ROM_BSS=3D0x20200000

# CONFIG_ZBOOT_ROM is not set

CONFIG_CMDLINE=3D"mem=3D16M console=3DttyS0,115200 init=3D/linuxrc =
root=3D/dev/nfs
rw ip=3Ddhcp nfsroot=3D172.16.6.50:/home/aviksil/atlas_linux/rootfs"

CONFIG_XIP_KERNEL=3Dy

CONFIG_XIP_PHYS_ADDR=3D0x10020000

# CONFIG_KEXEC is not set

=20

#

# Floating point emulation

#

=20

#

# At least one emulation must be selected

#

CONFIG_FPE_NWFPE=3Dy

# CONFIG_FPE_NWFPE_XP is not set

# CONFIG_FPE_FASTFPE is not set

=20

#

# Userspace binary formats

#

CONFIG_BINFMT_ELF=3Dy

# CONFIG_BINFMT_AOUT is not set

# CONFIG_BINFMT_MISC is not set

# CONFIG_ARTHUR is not set

=20

#

# Power management options

#

CONFIG_PM=3Dy

# CONFIG_PM_DEBUG is not set

CONFIG_PM_SLEEP=3Dy

CONFIG_SUSPEND=3Dy

CONFIG_SUSPEND_FREEZER=3Dy

# CONFIG_APM_EMULATION is not set

CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy

=20

#

# Networking

#

CONFIG_NET=3Dy

=20

#

# Networking options

#

CONFIG_PACKET=3Dy

# CONFIG_PACKET_MMAP is not set

CONFIG_UNIX=3Dy

CONFIG_XFRM=3Dy

# CONFIG_XFRM_USER is not set

# CONFIG_XFRM_SUB_POLICY is not set

# CONFIG_XFRM_MIGRATE is not set

# CONFIG_XFRM_STATISTICS is not set

# CONFIG_NET_KEY is not set

CONFIG_INET=3Dy

# CONFIG_IP_MULTICAST is not set

# CONFIG_IP_ADVANCED_ROUTER is not set

CONFIG_IP_FIB_HASH=3Dy

CONFIG_IP_PNP=3Dy

CONFIG_IP_PNP_DHCP=3Dy

CONFIG_IP_PNP_BOOTP=3Dy

# CONFIG_IP_PNP_RARP is not set

# CONFIG_NET_IPIP is not set

# CONFIG_NET_IPGRE is not set

# CONFIG_ARPD is not set

# CONFIG_SYN_COOKIES is not set

# CONFIG_INET_AH is not set

# CONFIG_INET_ESP is not set

# CONFIG_INET_IPCOMP is not set

# CONFIG_INET_XFRM_TUNNEL is not set

# CONFIG_INET_TUNNEL is not set

CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy

CONFIG_INET_XFRM_MODE_TUNNEL=3Dy

CONFIG_INET_XFRM_MODE_BEET=3Dy

# CONFIG_INET_LRO is not set

CONFIG_INET_DIAG=3Dy

CONFIG_INET_TCP_DIAG=3Dy

# CONFIG_TCP_CONG_ADVANCED is not set

CONFIG_TCP_CONG_CUBIC=3Dy

CONFIG_DEFAULT_TCP_CONG=3D"cubic"

# CONFIG_TCP_MD5SIG is not set

# CONFIG_IPV6 is not set

# CONFIG_NETWORK_SECMARK is not set

# CONFIG_NETFILTER is not set

# CONFIG_IP_DCCP is not set

# CONFIG_IP_SCTP is not set

# CONFIG_TIPC is not set

# CONFIG_ATM is not set

# CONFIG_BRIDGE is not set

# CONFIG_VLAN_8021Q is not set

# CONFIG_DECNET is not set

# CONFIG_LLC2 is not set

# CONFIG_IPX is not set

# CONFIG_ATALK is not set

# CONFIG_X25 is not set

# CONFIG_LAPB is not set

# CONFIG_ECONET is not set

# CONFIG_WAN_ROUTER is not set

# CONFIG_NET_SCHED is not set

=20

#

# Network testing

#

# CONFIG_NET_PKTGEN is not set

# CONFIG_HAMRADIO is not set

# CONFIG_CAN is not set

# CONFIG_IRDA is not set

# CONFIG_BT is not set

# CONFIG_AF_RXRPC is not set

=20

#

# Wireless

#

# CONFIG_CFG80211 is not set

# CONFIG_WIRELESS_EXT is not set

# CONFIG_MAC80211 is not set

# CONFIG_IEEE80211 is not set

# CONFIG_RFKILL is not set

# CONFIG_NET_9P is not set

=20

#

# Device Drivers

#

=20

#

# Generic Driver Options

#

CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"

CONFIG_STANDALONE=3Dy

CONFIG_PREVENT_FIRMWARE_BUILD=3Dy

# CONFIG_FW_LOADER is not set

# CONFIG_DEBUG_DRIVER is not set

# CONFIG_DEBUG_DEVRES is not set

# CONFIG_SYS_HYPERVISOR is not set

# CONFIG_CONNECTOR is not set

CONFIG_MTD=3Dy

# CONFIG_MTD_DEBUG is not set

# CONFIG_MTD_CONCAT is not set

CONFIG_MTD_PARTITIONS=3Dy

# CONFIG_MTD_REDBOOT_PARTS is not set

# CONFIG_MTD_CMDLINE_PARTS is not set

# CONFIG_MTD_AFS_PARTS is not set

# CONFIG_MTD_AR7_PARTS is not set

=20

#

# User Modules And Translation Layers

#

# CONFIG_MTD_CHAR is not set

CONFIG_MTD_BLKDEVS=3Dy

CONFIG_MTD_BLOCK=3Dy

# CONFIG_FTL is not set

# CONFIG_NFTL is not set

# CONFIG_INFTL is not set

# CONFIG_RFD_FTL is not set

# CONFIG_SSFDC is not set

# CONFIG_MTD_OOPS is not set

=20

#

# RAM/ROM/Flash chip drivers

#

CONFIG_MTD_CFI=3Dy

# CONFIG_MTD_JEDECPROBE is not set

CONFIG_MTD_GEN_PROBE=3Dy

# CONFIG_MTD_CFI_ADV_OPTIONS is not set

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

# CONFIG_MTD_CFI_INTELEXT is not set

CONFIG_MTD_CFI_AMDSTD=3Dy

# CONFIG_MTD_CFI_STAA is not set

CONFIG_MTD_CFI_UTIL=3Dy

# CONFIG_MTD_RAM is not set

# CONFIG_MTD_ROM is not set

# CONFIG_MTD_ABSENT is not set

CONFIG_MTD_XIP=3Dy

=20

#

# Mapping drivers for chip access

#

# CONFIG_MTD_COMPLEX_MAPPINGS is not set

# CONFIG_MTD_PHYSMAP is not set

# CONFIG_MTD_ARM_INTEGRATOR is not set

CONFIG_MTD_ZILOG=3Dy

# CONFIG_MTD_PLATRAM is not set

=20

#

# Self-contained MTD device drivers

#

# CONFIG_MTD_DATAFLASH is not set

# CONFIG_MTD_M25P80 is not set

# CONFIG_MTD_SLRAM is not set

# CONFIG_MTD_PHRAM is not set

# CONFIG_MTD_MTDRAM is not set

# CONFIG_MTD_BLOCK2MTD is not set

=20

#

# Disk-On-Chip Device Drivers

#

# CONFIG_MTD_DOC2000 is not set

# CONFIG_MTD_DOC2001 is not set

# CONFIG_MTD_DOC2001PLUS is not set

# CONFIG_MTD_NAND is not set

# CONFIG_MTD_ONENAND is not set

=20

#

# UBI - Unsorted block images

#

# CONFIG_MTD_UBI is not set

# CONFIG_PARPORT is not set

CONFIG_BLK_DEV=3Dy

# CONFIG_BLK_DEV_COW_COMMON is not set

CONFIG_BLK_DEV_LOOP=3Dy

# CONFIG_BLK_DEV_CRYPTOLOOP is not set

# CONFIG_BLK_DEV_NBD is not set

# CONFIG_BLK_DEV_UB is not set

CONFIG_BLK_DEV_RAM=3Dy

CONFIG_BLK_DEV_RAM_COUNT=3D16

CONFIG_BLK_DEV_RAM_SIZE=3D8192

# CONFIG_BLK_DEV_XIP is not set

# CONFIG_CDROM_PKTCDVD is not set

# CONFIG_ATA_OVER_ETH is not set

CONFIG_MISC_DEVICES=3Dy

# CONFIG_EEPROM_93CX6 is not set

# CONFIG_ENCLOSURE_SERVICES is not set

CONFIG_HAVE_IDE=3Dy

# CONFIG_IDE is not set

=20

#

# SCSI device support

#

# CONFIG_RAID_ATTRS is not set

CONFIG_SCSI=3Dy

CONFIG_SCSI_DMA=3Dy

# CONFIG_SCSI_TGT is not set

# CONFIG_SCSI_NETLINK is not set

CONFIG_SCSI_PROC_FS=3Dy

=20

#

# SCSI support type (disk, tape, CD-ROM)

#

CONFIG_BLK_DEV_SD=3Dy

# CONFIG_CHR_DEV_ST is not set

# CONFIG_CHR_DEV_OSST is not set

# CONFIG_BLK_DEV_SR is not set

# CONFIG_CHR_DEV_SG is not set

# CONFIG_CHR_DEV_SCH is not set

=20

#

# Some SCSI devices (e.g. CD jukebox) support multiple LUNs

#

# CONFIG_SCSI_MULTI_LUN is not set

# CONFIG_SCSI_CONSTANTS is not set

# CONFIG_SCSI_LOGGING is not set

# CONFIG_SCSI_SCAN_ASYNC is not set

CONFIG_SCSI_WAIT_SCAN=3Dm

=20

#

# SCSI Transports

#

# CONFIG_SCSI_SPI_ATTRS is not set

# CONFIG_SCSI_FC_ATTRS is not set

# CONFIG_SCSI_ISCSI_ATTRS is not set

# CONFIG_SCSI_SAS_LIBSAS is not set

# CONFIG_SCSI_SRP_ATTRS is not set

CONFIG_SCSI_LOWLEVEL=3Dy

# CONFIG_ISCSI_TCP is not set

# CONFIG_SCSI_DEBUG is not set

# CONFIG_ATA is not set

# CONFIG_MD is not set

CONFIG_NETDEVICES=3Dy

# CONFIG_NETDEVICES_MULTIQUEUE is not set

# CONFIG_DUMMY is not set

# CONFIG_BONDING is not set

# CONFIG_MACVLAN is not set

# CONFIG_EQUALIZER is not set

# CONFIG_TUN is not set

# CONFIG_VETH is not set

# CONFIG_PHYLIB is not set

CONFIG_NET_ETHERNET=3Dy

CONFIG_MII=3Dy

# CONFIG_AX88796 is not set

CONFIG_SMC91X=3Dy

# CONFIG_DM9000 is not set

# CONFIG_ENC28J60 is not set

# CONFIG_IBM_NEW_EMAC_ZMII is not set

# CONFIG_IBM_NEW_EMAC_RGMII is not set

# CONFIG_IBM_NEW_EMAC_TAH is not set

# CONFIG_IBM_NEW_EMAC_EMAC4 is not set

# CONFIG_B44 is not set

CONFIG_NETDEV_1000=3Dy

# CONFIG_E1000E_ENABLED is not set

CONFIG_NETDEV_10000=3Dy

=20

#

# Wireless LAN

#

# CONFIG_WLAN_PRE80211 is not set

# CONFIG_WLAN_80211 is not set

# CONFIG_IWLWIFI_LEDS is not set

=20

#

# USB Network Adapters

#

# CONFIG_USB_CATC is not set

# CONFIG_USB_KAWETH is not set

# CONFIG_USB_PEGASUS is not set

# CONFIG_USB_RTL8150 is not set

# CONFIG_USB_USBNET is not set

# CONFIG_WAN is not set

# CONFIG_PPP is not set

# CONFIG_SLIP is not set

# CONFIG_NETCONSOLE is not set

# CONFIG_NETPOLL is not set

# CONFIG_NET_POLL_CONTROLLER is not set

# CONFIG_ISDN is not set

=20

#

# Input device support

#

CONFIG_INPUT=3Dy

# CONFIG_INPUT_FF_MEMLESS is not set

# CONFIG_INPUT_POLLDEV is not set

=20

#

# Userland interfaces

#

CONFIG_INPUT_MOUSEDEV=3Dy

# CONFIG_INPUT_MOUSEDEV_PSAUX is not set

CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024

CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768

# CONFIG_INPUT_JOYDEV is not set

CONFIG_INPUT_EVDEV=3Dy

# CONFIG_INPUT_EVBUG is not set

=20

#

# Input Device Drivers

#

CONFIG_INPUT_KEYBOARD=3Dy

CONFIG_KEYBOARD_ATKBD=3Dy

# CONFIG_KEYBOARD_SUNKBD is not set

# CONFIG_KEYBOARD_LKKBD is not set

# CONFIG_KEYBOARD_XTKBD is not set

# CONFIG_KEYBOARD_NEWTON is not set

# CONFIG_KEYBOARD_STOWAWAY is not set

# CONFIG_INPUT_MOUSE is not set

# CONFIG_INPUT_JOYSTICK is not set

# CONFIG_INPUT_TABLET is not set

# CONFIG_INPUT_TOUCHSCREEN is not set

# CONFIG_INPUT_MISC is not set

=20

#

# Hardware I/O ports

#

CONFIG_SERIO=3Dy

CONFIG_SERIO_SERPORT=3Dy

CONFIG_SERIO_LIBPS2=3Dy

# CONFIG_SERIO_RAW is not set

# CONFIG_GAMEPORT is not set

=20

#

# Character devices

#

CONFIG_VT=3Dy

CONFIG_VT_CONSOLE=3Dy

CONFIG_HW_CONSOLE=3Dy

# CONFIG_VT_HW_CONSOLE_BINDING is not set

CONFIG_DEVKMEM=3Dy

# CONFIG_SERIAL_NONSTANDARD is not set

=20

#

# Serial drivers

#

CONFIG_SERIAL_8250=3Dy

CONFIG_SERIAL_8250_CONSOLE=3Dy

CONFIG_SERIAL_8250_NR_UARTS=3D4

CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4

# CONFIG_SERIAL_8250_EXTENDED is not set

=20

#

# Non-8250 serial port support

#

CONFIG_SERIAL_CORE=3Dy

CONFIG_SERIAL_CORE_CONSOLE=3Dy

CONFIG_UNIX98_PTYS=3Dy

CONFIG_LEGACY_PTYS=3Dy

CONFIG_LEGACY_PTY_COUNT=3D256

# CONFIG_IPMI_HANDLER is not set

# CONFIG_HW_RANDOM is not set

# CONFIG_NVRAM is not set

# CONFIG_R3964 is not set

# CONFIG_RAW_DRIVER is not set

# CONFIG_TCG_TPM is not set

# CONFIG_I2C is not set

CONFIG_SPI=3Dy

CONFIG_SPI_DEBUG=3Dy

CONFIG_SPI_MASTER=3Dy

=20

#

# SPI Master Controller Drivers

#

# CONFIG_SPI_BITBANG is not set

=20

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

=20

#

# Sonics Silicon Backplane

#

CONFIG_SSB_POSSIBLE=3Dy

# CONFIG_SSB is not set

=20

#

# Multifunction device drivers

#

# CONFIG_MFD_SM501 is not set

# CONFIG_MFD_ASIC3 is not set

# CONFIG_HTC_PASIC3 is not set

=20

#

# Multimedia devices

#

=20

#

# Multimedia core support

#

# CONFIG_VIDEO_DEV is not set

# CONFIG_DVB_CORE is not set

# CONFIG_VIDEO_MEDIA is not set

=20

#

# Multimedia drivers

#

# CONFIG_DAB is not set

=20

#

# Graphics support

#

# CONFIG_VGASTATE is not set

# CONFIG_VIDEO_OUTPUT_CONTROL is not set

# CONFIG_FB is not set

# CONFIG_BACKLIGHT_LCD_SUPPORT is not set

=20

#

# Display device support

#

# CONFIG_DISPLAY_SUPPORT is not set

=20

#

# Console display driver support

#

# CONFIG_VGA_CONSOLE is not set

CONFIG_DUMMY_CONSOLE=3Dy

=20

#

# Sound

#

# CONFIG_SOUND is not set

CONFIG_HID_SUPPORT=3Dy

CONFIG_HID=3Dy

CONFIG_HID_DEBUG=3Dy

# CONFIG_HIDRAW is not set

=20

#

# USB Input Devices

#

# CONFIG_USB_HID is not set

=20

#

# USB HID Boot Protocol drivers

#

# CONFIG_USB_KBD is not set

# CONFIG_USB_MOUSE is not set

CONFIG_USB_SUPPORT=3Dy

CONFIG_USB_ARCH_HAS_HCD=3Dy

# CONFIG_USB_ARCH_HAS_OHCI is not set

# CONFIG_USB_ARCH_HAS_EHCI is not set

CONFIG_USB=3Dy

# CONFIG_USB_DEBUG is not set

# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

=20

#

# Miscellaneous USB options

#

# CONFIG_USB_DEVICEFS is not set

CONFIG_USB_DEVICE_CLASS=3Dy

# CONFIG_USB_DYNAMIC_MINORS is not set

CONFIG_USB_SUSPEND=3Dy

# CONFIG_USB_OTG is not set

=20

#

# USB Host Controller Drivers

#

# CONFIG_USB_C67X00_HCD is not set

# CONFIG_USB_ISP116X_HCD is not set

# CONFIG_USB_ISP1760_HCD is not set

# CONFIG_USB_SL811_HCD is not set

# CONFIG_USB_R8A66597_HCD is not set

=20

#

# USB Device Class drivers

#

# CONFIG_USB_ACM is not set

# CONFIG_USB_PRINTER is not set

# CONFIG_USB_WDM is not set

=20

#

# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'

#

=20

#

# may also be needed; see USB_STORAGE Help for more information

#

CONFIG_USB_STORAGE=3Dy

# CONFIG_USB_STORAGE_DEBUG is not set

# CONFIG_USB_STORAGE_DATAFAB is not set

# CONFIG_USB_STORAGE_FREECOM is not set

# CONFIG_USB_STORAGE_ISD200 is not set

# CONFIG_USB_STORAGE_DPCM is not set

# CONFIG_USB_STORAGE_USBAT is not set

# CONFIG_USB_STORAGE_SDDR09 is not set

# CONFIG_USB_STORAGE_SDDR55 is not set

# CONFIG_USB_STORAGE_JUMPSHOT is not set

# CONFIG_USB_STORAGE_ALAUDA is not set

# CONFIG_USB_STORAGE_ONETOUCH is not set

# CONFIG_USB_STORAGE_KARMA is not set

# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set

# CONFIG_USB_LIBUSUAL is not set

=20

#

# USB Imaging devices

#

# CONFIG_USB_MDC800 is not set

# CONFIG_USB_MICROTEK is not set

CONFIG_USB_MON=3Dy

=20

#

# USB port drivers

#

# CONFIG_USB_SERIAL is not set

=20

#

# USB Miscellaneous drivers

#

# CONFIG_USB_EMI62 is not set

# CONFIG_USB_EMI26 is not set

# CONFIG_USB_ADUTUX is not set

# CONFIG_USB_AUERSWALD is not set

# CONFIG_USB_RIO500 is not set

# CONFIG_USB_LEGOTOWER is not set

# CONFIG_USB_LCD is not set

# CONFIG_USB_BERRY_CHARGE is not set

# CONFIG_USB_LED is not set

# CONFIG_USB_CYPRESS_CY7C63 is not set

# CONFIG_USB_CYTHERM is not set

# CONFIG_USB_PHIDGET is not set

# CONFIG_USB_IDMOUSE is not set

# CONFIG_USB_FTDI_ELAN is not set

# CONFIG_USB_APPLEDISPLAY is not set

# CONFIG_USB_LD is not set

# CONFIG_USB_TRANCEVIBRATOR is not set

# CONFIG_USB_IOWARRIOR is not set

# CONFIG_USB_ISIGHTFW is not set

# CONFIG_USB_GADGET is not set

# CONFIG_MMC is not set

# CONFIG_NEW_LEDS is not set

CONFIG_RTC_LIB=3Dy

CONFIG_RTC_CLASS=3Dy

CONFIG_RTC_HCTOSYS=3Dy

CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"

# CONFIG_RTC_DEBUG is not set

=20

#

# RTC interfaces

#

# CONFIG_RTC_INTF_SYSFS is not set

CONFIG_RTC_INTF_PROC=3Dy

CONFIG_RTC_INTF_DEV=3Dy

# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set

# CONFIG_RTC_DRV_TEST is not set

=20

#

# SPI RTC drivers

#

# CONFIG_RTC_DRV_MAX6902 is not set

# CONFIG_RTC_DRV_R9701 is not set

# CONFIG_RTC_DRV_RS5C348 is not set

=20

#

# Platform RTC drivers

#

# CONFIG_RTC_DRV_CMOS is not set

# CONFIG_RTC_DRV_DS1511 is not set

# CONFIG_RTC_DRV_DS1553 is not set

# CONFIG_RTC_DRV_DS1742 is not set

# CONFIG_RTC_DRV_STK17TA8 is not set

# CONFIG_RTC_DRV_M48T86 is not set

# CONFIG_RTC_DRV_M48T59 is not set

# CONFIG_RTC_DRV_V3020 is not set

=20

#

# on-CPU RTC drivers

#

CONFIG_RTC_DRV_Z32AN=3Dy

# CONFIG_UIO is not set

=20

#

# File systems

#

CONFIG_EXT2_FS=3Dy

# CONFIG_EXT2_FS_XATTR is not set

# CONFIG_EXT2_FS_XIP is not set

# CONFIG_EXT3_FS is not set

# CONFIG_EXT4DEV_FS is not set

# CONFIG_REISERFS_FS is not set

# CONFIG_JFS_FS is not set

# CONFIG_FS_POSIX_ACL is not set

# CONFIG_XFS_FS is not set

# CONFIG_OCFS2_FS is not set

CONFIG_DNOTIFY=3Dy

CONFIG_INOTIFY=3Dy

CONFIG_INOTIFY_USER=3Dy

# CONFIG_QUOTA is not set

CONFIG_AUTOFS_FS=3Dy

CONFIG_AUTOFS4_FS=3Dy

# CONFIG_FUSE_FS is not set

=20

#

# CD-ROM/DVD Filesystems

#

# CONFIG_ISO9660_FS is not set

# CONFIG_UDF_FS is not set

=20

#

# DOS/FAT/NT Filesystems

#

CONFIG_FAT_FS=3Dy

# CONFIG_MSDOS_FS is not set

CONFIG_VFAT_FS=3Dy

CONFIG_FAT_DEFAULT_CODEPAGE=3D437

CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"

# CONFIG_NTFS_FS is not set

=20

#

# Pseudo filesystems

#

CONFIG_PROC_FS=3Dy

CONFIG_PROC_SYSCTL=3Dy

CONFIG_SYSFS=3Dy

# CONFIG_TMPFS is not set

# CONFIG_HUGETLB_PAGE is not set

# CONFIG_CONFIGFS_FS is not set

=20

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

# CONFIG_JFFS2_SUMMARY is not set

# CONFIG_JFFS2_FS_XATTR is not set

CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy

CONFIG_JFFS2_ZLIB=3Dy

# CONFIG_JFFS2_LZO is not set

CONFIG_JFFS2_RTIME=3Dy

# CONFIG_JFFS2_RUBIN is not set

# CONFIG_JFFS2_CMODE_NONE is not set

CONFIG_JFFS2_CMODE_PRIORITY=3Dy

# CONFIG_JFFS2_CMODE_SIZE is not set

# CONFIG_JFFS2_CMODE_FAVOURLZO is not set

# CONFIG_CRAMFS is not set

# CONFIG_VXFS_FS is not set

# CONFIG_MINIX_FS is not set

# CONFIG_HPFS_FS is not set

# CONFIG_QNX4FS_FS is not set

# CONFIG_ROMFS_FS is not set

# CONFIG_SYSV_FS is not set

# CONFIG_UFS_FS is not set

CONFIG_NETWORK_FILESYSTEMS=3Dy

CONFIG_NFS_FS=3Dy

CONFIG_NFS_V3=3Dy

# CONFIG_NFS_V3_ACL is not set

# CONFIG_NFS_V4 is not set

# CONFIG_NFSD is not set

CONFIG_ROOT_NFS=3Dy

CONFIG_LOCKD=3Dy

CONFIG_LOCKD_V4=3Dy

CONFIG_NFS_COMMON=3Dy

CONFIG_SUNRPC=3Dy

# CONFIG_SUNRPC_BIND34 is not set

# CONFIG_RPCSEC_GSS_KRB5 is not set

# CONFIG_RPCSEC_GSS_SPKM3 is not set

# CONFIG_SMB_FS is not set

# CONFIG_CIFS is not set

# CONFIG_NCP_FS is not set

# CONFIG_CODA_FS is not set

# CONFIG_AFS_FS is not set

=20

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

# CONFIG_NLS_ISO8859_15 is not set

# CONFIG_NLS_KOI8_R is not set

# CONFIG_NLS_KOI8_U is not set

# CONFIG_NLS_UTF8 is not set

# CONFIG_DLM is not set

=20

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

CONFIG_DEBUG_KERNEL=3Dy

# CONFIG_DEBUG_SHIRQ is not set

CONFIG_DETECT_SOFTLOCKUP=3Dy

CONFIG_SCHED_DEBUG=3Dy

# CONFIG_SCHEDSTATS is not set

# CONFIG_TIMER_STATS is not set

# CONFIG_DEBUG_OBJECTS is not set

# CONFIG_DEBUG_SLAB is not set

# CONFIG_DEBUG_RT_MUTEXES is not set

# CONFIG_RT_MUTEX_TESTER is not set

# CONFIG_DEBUG_SPINLOCK is not set

# CONFIG_DEBUG_MUTEXES is not set

# CONFIG_DEBUG_LOCK_ALLOC is not set

# CONFIG_PROVE_LOCKING is not set

# CONFIG_LOCK_STAT is not set

# CONFIG_DEBUG_SPINLOCK_SLEEP is not set

# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set

# CONFIG_DEBUG_KOBJECT is not set

CONFIG_DEBUG_BUGVERBOSE=3Dy

# CONFIG_DEBUG_INFO is not set

# CONFIG_DEBUG_VM is not set

# CONFIG_DEBUG_WRITECOUNT is not set

# CONFIG_DEBUG_LIST is not set

# CONFIG_DEBUG_SG is not set

CONFIG_FRAME_POINTER=3Dy

# CONFIG_BOOT_PRINTK_DELAY is not set

# CONFIG_RCU_TORTURE_TEST is not set

# CONFIG_BACKTRACE_SELF_TEST is not set

# CONFIG_FAULT_INJECTION is not set

# CONFIG_SAMPLES is not set

# CONFIG_DEBUG_USER is not set

# CONFIG_DEBUG_ERRORS is not set

# CONFIG_DEBUG_STACK_USAGE is not set

# CONFIG_DEBUG_LL is not set

=20

#

# Security options

#

# CONFIG_KEYS is not set

# CONFIG_SECURITY is not set

# CONFIG_SECURITY_FILE_CAPABILITIES is not set

CONFIG_CRYPTO=3Dy

=20

#

# Crypto core or helper

#

# CONFIG_CRYPTO_MANAGER is not set

# CONFIG_CRYPTO_GF128MUL is not set

# CONFIG_CRYPTO_NULL is not set

# CONFIG_CRYPTO_CRYPTD is not set

# CONFIG_CRYPTO_AUTHENC is not set

# CONFIG_CRYPTO_TEST is not set

=20

#

# Authenticated Encryption with Associated Data

#

# CONFIG_CRYPTO_CCM is not set

# CONFIG_CRYPTO_GCM is not set

# CONFIG_CRYPTO_SEQIV is not set

=20

#

# Block modes

#

# CONFIG_CRYPTO_CBC is not set

# CONFIG_CRYPTO_CTR is not set

# CONFIG_CRYPTO_CTS is not set

# CONFIG_CRYPTO_ECB is not set

# CONFIG_CRYPTO_LRW is not set

# CONFIG_CRYPTO_PCBC is not set

# CONFIG_CRYPTO_XTS is not set

=20

#

# Hash modes

#

# CONFIG_CRYPTO_HMAC is not set

# CONFIG_CRYPTO_XCBC is not set

=20

#

# Digest

#

# CONFIG_CRYPTO_CRC32C is not set

# CONFIG_CRYPTO_MD4 is not set

# CONFIG_CRYPTO_MD5 is not set

# CONFIG_CRYPTO_MICHAEL_MIC is not set

# CONFIG_CRYPTO_SHA1 is not set

# CONFIG_CRYPTO_SHA256 is not set

# CONFIG_CRYPTO_SHA512 is not set

# CONFIG_CRYPTO_TGR192 is not set

# CONFIG_CRYPTO_WP512 is not set

=20

#

# Ciphers

#

# CONFIG_CRYPTO_AES is not set

# CONFIG_CRYPTO_ANUBIS is not set

# CONFIG_CRYPTO_ARC4 is not set

# CONFIG_CRYPTO_BLOWFISH is not set

# CONFIG_CRYPTO_CAMELLIA is not set

# CONFIG_CRYPTO_CAST5 is not set

# CONFIG_CRYPTO_CAST6 is not set

# CONFIG_CRYPTO_DES is not set

# CONFIG_CRYPTO_FCRYPT is not set

# CONFIG_CRYPTO_KHAZAD is not set

# CONFIG_CRYPTO_SALSA20 is not set

# CONFIG_CRYPTO_SEED is not set

# CONFIG_CRYPTO_SERPENT is not set

# CONFIG_CRYPTO_TEA is not set

# CONFIG_CRYPTO_TWOFISH is not set

=20

#

# Compression

#

# CONFIG_CRYPTO_DEFLATE is not set

# CONFIG_CRYPTO_LZO is not set

CONFIG_CRYPTO_HW=3Dy

=20

#

# Library routines

#

CONFIG_BITREVERSE=3Dy

# CONFIG_GENERIC_FIND_FIRST_BIT is not set

# CONFIG_GENERIC_FIND_NEXT_BIT is not set

# CONFIG_CRC_CCITT is not set

# CONFIG_CRC16 is not set

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
