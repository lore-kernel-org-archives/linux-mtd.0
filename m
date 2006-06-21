Received: from darwaza.gdatech.com ([66.237.41.98])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft5k5-0001JY-85
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 12:39:54 -0400
Received: from darwaza.gdatech.com ([192.168.200.118])
	by [127.0.0.1] ([127.0.0.1]) (port 7027) (Abaca EPG outproxy filter
	1.3.4.5154-maint13 $Rev: 5154 $) id r66l093947D-00-c875
	for dwmw2@infradead.org linux-mtd@lists.infradead.org
	davide.cascone@st.com; Wed, 21 Jun 2006 09:39:47 -0700
Message-ID: <002601c69551$4a545c10$99c8a8c0@jrakeshsw>
From: "Jagota Rakesh" <jrakesh@gdatech.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Davide CASCONE" <davide.cascone@st.com>
References: <003501c69510$e7e9c370$253682a4@nap.st.com>
	<1150881965.3176.584.camel@pmac.infradead.org>
Subject: Re: Linux Boot Time measurements and JFFS2 file system mounting
Date: Wed, 21 Jun 2006 09:39:39 -0700
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0023_01C69516.9D7BE740"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0023_01C69516.9D7BE740
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Hi,

I am using linux kernel-2.6.12 for custom design board based on mips 
processsor. I want to reduce my bootup time. Can you suggest some step to 
optimise the boot up speed? Currently its taking ~30-40sec to bootup.

I have one more issue while mopunting jffs2 file system I am getting the 
kernel panic error..not able to open mtdblock. Pl see the attached log 
message. Can you suggest something here to sort out this issue.

Thanks & Regards,
Rakesh Jagota

Thanks & Regards,
Rakesh
----- Original Message ----- 
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Davide CASCONE" <davide.cascone@st.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Wednesday, June 21, 2006 2:26 AM
Subject: Re: Linux Boot Time measurements


> On Wed, 2006-06-21 at 10:58 +0200, Davide CASCONE wrote:
>> 2. about 1.2s to mount the JFFS2 file system on a 16MByte partion
>> (13MByte of used space and 3MByte of free space)
>>
>> What do you think about these measurements?
>> Any suggestion to improve the performances?
>
> Profile it. Then quadruple INOCACHE_HASHSIZE and profile it again :)
>
> Are you using summary? We can halve the amount of data we have to read
> from the flash.... I've had that half-implemented for about two weeks
> now. Must get it done before the 2.6.18 merge window closes...
>
> -- 
> dwmw2
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

------=_NextPart_000_0023_01C69516.9D7BE740
Content-Type: text/plain; format=flowed; name="jffs2_dump_06202006.txt";
	reply-type=original
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="jffs2_dump_06202006.txt"

## Booting image at 00200000 on cpu 0 ...
   Image Name:   Linux image
   Created:      2006-06-21   0:17:45 UTC
   Image Type:   MIPS Linux Kernel Image (gzip compressed)
   Data Size:    1431247 Bytes =3D  1.4 MB
   Load Address: 80001000
   Entry Point:  80333000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK

Starting kernel ...

Linux version 2.6.12-rc2 (root@new-host-1.gdatech.com) (gcc version =
3.3.4) #11 Tue Jun 20 17:17:36 PDT 2006
Physical Memory Size: 131072 kB
Total Linux Memory: 110588 kB
Peripheral DMA: Chip 0x7108
CPU revision is: 00019064
Determined physical RAM map:
 memory: 00c00000 @ 00000000 (usable)
 memory: 05fff000 @ 02000000 (usable)
Built 1 zonelists
Kernel command line: root=3D/dev/mtdblock3 rw rootfstype=3Djffs2 =
console=3DttyS0,9600
Primary instruction cache 24kB, physically tagged, 3-way, linesize 16 =
bytes.
Primary data cache 24kB, 3-way, linesize 16 bytes.
Synthesized TLB refill handler (20 instructions).
Synthesized TLB load handler fastpath (32 instructions).
Synthesized TLB store handler fastpath (32 instructions).
Synthesized TLB modify handler fastpath (31 instructions).
PID hash table entries: 512 (order: 9, 8192 bytes)
CPU frequency 165.00 MHz
Using 82.500 MHz high precision timer.
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 105684k/110588k available (2694k kernel code, 4744k reserved, =
573k data, 128k init, 0k highmem)
Mount-cache hash table entries: 512
Checking for 'wait' instruction...  available.
NET: Registered protocol family 16
Can't analyze prologue code at 802a0d04
Boot Environment: 0x803535e0
nvram: x8 mode, 8192 bytes @0xc0000000
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
Initializing Cryptographic API
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing =
disabled
ttyS0 at MMIO 0x18400000 (irq =3D 23) is a 16550A
ttyS1 at MMIO 0x18480000 (irq =3D 24) is a 16550A
ttyS0 at MMIO 0x18400000 (irq =3D 23) is a 16550A
ttyS1 at MMIO 0x18480000 (irq =3D 24) is a 16550A
lirc_serial: port b8400000 already in use, proceeding anyway
lirc_serial: compile the serial port driver as module and
lirc_serial: make sure this module is loaded first
Trying to free nonexistent resource <b8400000-b8400007>
lirc_serial: auto-detected active low receiver
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
loop: loaded (max 8 devices)
Ethernet Address: 00:11:22:33:44:55
go-emac: Registered eth0 at 0x18380000 irq 22
eth0: MII PHY found at address 1, status 0x786d.
ieee80211: 802.11 data/management/control stack, 1.0.3
ieee80211: Copyright (C) 2004-2005 Intel Corporation =
<jketreno@linux.intel.com>
Loaded prism54 driver, version 1.2
Linux video capture interface: v1.00
Registering slave CPU 1, msg_base=3Da14a0000
go7x8x: registering new Go7x8x encoder
go7x8x: registered GO7x8x I2C controller at 0x0x18300100
wis-ov7640: starting probe for adapter GO7x8x I2C Adapter (0x810000)
wis-ov7640: initializing OV7640 at address 33 on GO7x8x I2C Adapter
wis-ov7640: error initializing OV7640
wis-saa7115: starting probe for adapter GO7x8x I2C Adapter (0x810000)
wis-saa7115: initializing SAA7115 at address 32 on GO7x8x I2C Adapter
msp3400: chip reset failed
msp3400: no chip found
tuner 0-0068: chip found @ 0xd0 (GO7x8x I2C Adapter)
WISChip 7x8x FLASH: probing 8-bit flash bus
WISChip 7x8x FLASH: Found 1 x16 devices at 0x0 in 8-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 4 MTD partitions on "WISChip 7x8x FLASH":
0x00000000-0x00030000 : "Boot (192K)"
0x00002000-0x00004000 : "Environment (8K)"
0x00030000-0x001b0000 : "Kernel (1.5M)"
0x001b0000-0x007b0000 : "JFFS2 File system (6.0M)"
physmap flash device: 800000 at 1f400000
phys_mapped_flash: Found 1 x16 devices at 0x0 in 8-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
cmdlinepart partition parsing not available
RedBoot partition parsing not available
i2c /dev entries driver
Inside ds1337 rtc driver
<7>i2c_adapter i2c-0: found normal i2c entry for adapter 0, addr 21
Advanced Linux Sound Architecture Driver Version 1.0.9rc2  (Thu Mar 24 =
10:33:39 2005 UTC).
go7x8x-i2s: Trying to register GO7x8x I2S device
ALSA go7x8x I2S PCM capture driver initialized
ALSA device list:
  #0: go7x8x-i2s
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
NET: Registered protocol family 1
NET: Registered protocol family 17
VFS: Cannot open root device "mtdblock3" or unknown-block(31,3)
Please append a correct "root=3D" boot option
Kernel panic - not syncing: VFS: Unable to mount root fs on =
unknown-block(31,3)

------=_NextPart_000_0023_01C69516.9D7BE740
Content-Type: application/octet-stream;
	name="config_jffs"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="config_jffs"

#=0A=
# Automatically generated make config: don't edit=0A=
# Linux kernel version: 2.6.12-rc2=0A=
# Tue Jun 20 17:56:49 2006=0A=
#=0A=
CONFIG_MIPS=3Dy=0A=
# CONFIG_MIPS64 is not set=0A=
# CONFIG_64BIT is not set=0A=
CONFIG_MIPS32=3Dy=0A=
=0A=
#=0A=
# Code maturity level options=0A=
#=0A=
CONFIG_EXPERIMENTAL=3Dy=0A=
# CONFIG_CLEAN_COMPILE is not set=0A=
CONFIG_BROKEN=3Dy=0A=
CONFIG_BROKEN_ON_SMP=3Dy=0A=
CONFIG_INIT_ENV_ARG_LIMIT=3D32=0A=
=0A=
#=0A=
# General setup=0A=
#=0A=
CONFIG_LOCALVERSION=3D""=0A=
# CONFIG_SWAP is not set=0A=
CONFIG_SYSVIPC=3Dy=0A=
# CONFIG_POSIX_MQUEUE is not set=0A=
# CONFIG_BSD_PROCESS_ACCT is not set=0A=
CONFIG_SYSCTL=3Dy=0A=
# CONFIG_AUDIT is not set=0A=
CONFIG_HOTPLUG=3Dy=0A=
CONFIG_KOBJECT_UEVENT=3Dy=0A=
# CONFIG_IKCONFIG is not set=0A=
CONFIG_EMBEDDED=3Dy=0A=
CONFIG_KALLSYMS=3Dy=0A=
# CONFIG_KALLSYMS_ALL is not set=0A=
# CONFIG_KALLSYMS_EXTRA_PASS is not set=0A=
CONFIG_BASE_FULL=3Dy=0A=
CONFIG_FUTEX=3Dy=0A=
CONFIG_EPOLL=3Dy=0A=
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set=0A=
# CONFIG_SHMEM is not set=0A=
CONFIG_CC_ALIGN_FUNCTIONS=3D0=0A=
CONFIG_CC_ALIGN_LABELS=3D0=0A=
CONFIG_CC_ALIGN_LOOPS=3D0=0A=
CONFIG_CC_ALIGN_JUMPS=3D0=0A=
CONFIG_TINY_SHMEM=3Dy=0A=
CONFIG_BASE_SMALL=3D0=0A=
=0A=
#=0A=
# Loadable module support=0A=
#=0A=
CONFIG_MODULES=3Dy=0A=
CONFIG_MODULE_UNLOAD=3Dy=0A=
# CONFIG_MODULE_FORCE_UNLOAD is not set=0A=
CONFIG_OBSOLETE_MODPARM=3Dy=0A=
# CONFIG_MODVERSIONS is not set=0A=
# CONFIG_MODULE_SRCVERSION_ALL is not set=0A=
CONFIG_KMOD=3Dy=0A=
=0A=
#=0A=
# Machine selection=0A=
#=0A=
# CONFIG_MACH_JAZZ is not set=0A=
# CONFIG_MACH_VR41XX is not set=0A=
# CONFIG_TOSHIBA_JMR3927 is not set=0A=
# CONFIG_MIPS_COBALT is not set=0A=
# CONFIG_MACH_DECSTATION is not set=0A=
# CONFIG_MIPS_EV64120 is not set=0A=
# CONFIG_MIPS_EV96100 is not set=0A=
# CONFIG_MIPS_IVR is not set=0A=
# CONFIG_LASAT is not set=0A=
# CONFIG_MIPS_ITE8172 is not set=0A=
# CONFIG_MIPS_ATLAS is not set=0A=
# CONFIG_MIPS_MALTA is not set=0A=
# CONFIG_MIPS_SEAD is not set=0A=
# CONFIG_MOMENCO_OCELOT is not set=0A=
# CONFIG_MOMENCO_OCELOT_G is not set=0A=
# CONFIG_MOMENCO_OCELOT_C is not set=0A=
# CONFIG_MOMENCO_OCELOT_3 is not set=0A=
# CONFIG_MOMENCO_JAGUAR_ATX is not set=0A=
# CONFIG_PMC_YOSEMITE is not set=0A=
# CONFIG_DDB5074 is not set=0A=
# CONFIG_DDB5476 is not set=0A=
# CONFIG_DDB5477 is not set=0A=
# CONFIG_NEC_OSPREY is not set=0A=
# CONFIG_SGI_IP22 is not set=0A=
# CONFIG_SOC_AU1X00 is not set=0A=
# CONFIG_SIBYTE_SB1xxx_SOC is not set=0A=
CONFIG_MIPS_GO700X=3Dy=0A=
# CONFIG_MIPS_GO700X_IPCAM is not set=0A=
# CONFIG_SNI_RM200_PCI is not set=0A=
# CONFIG_TOSHIBA_RBTX4927 is not set=0A=
CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy=0A=
CONFIG_GENERIC_CALIBRATE_DELAY=3Dy=0A=
CONFIG_HAVE_DEC_LOCK=3Dy=0A=
CONFIG_DMA_NONCOHERENT=3Dy=0A=
CONFIG_CPU_LITTLE_ENDIAN=3Dy=0A=
CONFIG_IRQ_CPU=3Dy=0A=
CONFIG_SWAP_IO_SPACE=3Dy=0A=
CONFIG_MIPS_L1_CACHE_SHIFT=3D5=0A=
# CONFIG_FB is not set=0A=
=0A=
#=0A=
# CPU selection=0A=
#=0A=
CONFIG_CPU_MIPS32=3Dy=0A=
# CONFIG_CPU_MIPS64 is not set=0A=
# CONFIG_CPU_R3000 is not set=0A=
# CONFIG_CPU_TX39XX is not set=0A=
# CONFIG_CPU_VR41XX is not set=0A=
# CONFIG_CPU_R4300 is not set=0A=
# CONFIG_CPU_R4X00 is not set=0A=
# CONFIG_CPU_TX49XX is not set=0A=
# CONFIG_CPU_R5000 is not set=0A=
# CONFIG_CPU_R5432 is not set=0A=
# CONFIG_CPU_R6000 is not set=0A=
# CONFIG_CPU_NEVADA is not set=0A=
# CONFIG_CPU_R8000 is not set=0A=
# CONFIG_CPU_R10000 is not set=0A=
# CONFIG_CPU_RM7000 is not set=0A=
# CONFIG_CPU_RM9000 is not set=0A=
# CONFIG_CPU_SB1 is not set=0A=
CONFIG_PAGE_SIZE_4KB=3Dy=0A=
# CONFIG_PAGE_SIZE_8KB is not set=0A=
# CONFIG_PAGE_SIZE_16KB is not set=0A=
# CONFIG_PAGE_SIZE_64KB is not set=0A=
CONFIG_CPU_HAS_PREFETCH=3Dy=0A=
# CONFIG_VTAG_ICACHE is not set=0A=
# CONFIG_64BIT_PHYS_ADDR is not set=0A=
# CONFIG_CPU_ADVANCED is not set=0A=
CONFIG_CPU_HAS_LLSC=3Dy=0A=
CONFIG_CPU_HAS_SYNC=3Dy=0A=
# CONFIG_PREEMPT is not set=0A=
=0A=
#=0A=
# Bus options (PCI, PCMCIA, EISA, ISA, TC)=0A=
#=0A=
CONFIG_HW_HAS_PCI=3Dy=0A=
CONFIG_PCI=3Dy=0A=
# CONFIG_PCI_LEGACY_PROC is not set=0A=
# CONFIG_PCI_NAMES is not set=0A=
# CONFIG_PCI_DEBUG is not set=0A=
CONFIG_MMU=3Dy=0A=
=0A=
#=0A=
# PCCARD (PCMCIA/CardBus) support=0A=
#=0A=
# CONFIG_PCCARD is not set=0A=
=0A=
#=0A=
# PCI Hotplug Support=0A=
#=0A=
# CONFIG_HOTPLUG_PCI is not set=0A=
=0A=
#=0A=
# Executable file formats=0A=
#=0A=
CONFIG_BINFMT_ELF=3Dy=0A=
# CONFIG_BINFMT_MISC is not set=0A=
CONFIG_TRAD_SIGNALS=3Dy=0A=
=0A=
#=0A=
# Device Drivers=0A=
#=0A=
=0A=
#=0A=
# Generic Driver Options=0A=
#=0A=
CONFIG_STANDALONE=3Dy=0A=
CONFIG_PREVENT_FIRMWARE_BUILD=3Dy=0A=
CONFIG_FW_LOADER=3Dy=0A=
# CONFIG_DEBUG_DRIVER is not set=0A=
=0A=
#=0A=
# Memory Technology Devices (MTD)=0A=
#=0A=
CONFIG_MTD=3Dy=0A=
# CONFIG_MTD_DEBUG is not set=0A=
# CONFIG_MTD_CONCAT is not set=0A=
CONFIG_MTD_PARTITIONS=3Dy=0A=
# CONFIG_MTD_REDBOOT_PARTS is not set=0A=
# CONFIG_MTD_CMDLINE_PARTS is not set=0A=
=0A=
#=0A=
# User Modules And Translation Layers=0A=
#=0A=
CONFIG_MTD_CHAR=3Dy=0A=
CONFIG_MTD_BLOCK=3Dy=0A=
# CONFIG_FTL is not set=0A=
# CONFIG_NFTL is not set=0A=
# CONFIG_INFTL is not set=0A=
=0A=
#=0A=
# RAM/ROM/Flash chip drivers=0A=
#=0A=
CONFIG_MTD_CFI=3Dy=0A=
# CONFIG_MTD_JEDECPROBE is not set=0A=
CONFIG_MTD_GEN_PROBE=3Dy=0A=
CONFIG_MTD_CFI_ADV_OPTIONS=3Dy=0A=
CONFIG_MTD_CFI_NOSWAP=3Dy=0A=
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set=0A=
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set=0A=
CONFIG_MTD_CFI_GEOMETRY=3Dy=0A=
CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy=0A=
CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy=0A=
CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy=0A=
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set=0A=
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set=0A=
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set=0A=
CONFIG_MTD_CFI_I1=3Dy=0A=
# CONFIG_MTD_CFI_I2 is not set=0A=
# CONFIG_MTD_CFI_I4 is not set=0A=
# CONFIG_MTD_CFI_I8 is not set=0A=
# CONFIG_MTD_CFI_INTELEXT is not set=0A=
CONFIG_MTD_CFI_AMDSTD=3Dy=0A=
CONFIG_MTD_CFI_AMDSTD_RETRY=3D0=0A=
# CONFIG_MTD_CFI_STAA is not set=0A=
CONFIG_MTD_CFI_UTIL=3Dy=0A=
# CONFIG_MTD_RAM is not set=0A=
CONFIG_MTD_ROM=3Dy=0A=
# CONFIG_MTD_ABSENT is not set=0A=
# CONFIG_MTD_OBSOLETE_CHIPS is not set=0A=
=0A=
#=0A=
# Mapping drivers for chip access=0A=
#=0A=
# CONFIG_MTD_COMPLEX_MAPPINGS is not set=0A=
CONFIG_MTD_PHYSMAP=3Dy=0A=
CONFIG_MTD_PHYSMAP_START=3D0x1F400000=0A=
CONFIG_MTD_PHYSMAP_LEN=3D0x00800000=0A=
CONFIG_MTD_PHYSMAP_BANKWIDTH=3D1=0A=
CONFIG_WISC7X8X_FLASH=3Dy=0A=
=0A=
#=0A=
# Self-contained MTD device drivers=0A=
#=0A=
# CONFIG_MTD_PMC551 is not set=0A=
# CONFIG_MTD_SLRAM is not set=0A=
# CONFIG_MTD_PHRAM is not set=0A=
# CONFIG_MTD_MTDRAM is not set=0A=
# CONFIG_MTD_BLKMTD is not set=0A=
# CONFIG_MTD_BLOCK2MTD is not set=0A=
=0A=
#=0A=
# Disk-On-Chip Device Drivers=0A=
#=0A=
# CONFIG_MTD_DOC2000 is not set=0A=
# CONFIG_MTD_DOC2001 is not set=0A=
# CONFIG_MTD_DOC2001PLUS is not set=0A=
=0A=
#=0A=
# NAND Flash Device Drivers=0A=
#=0A=
# CONFIG_MTD_NAND is not set=0A=
=0A=
#=0A=
# Parallel port support=0A=
#=0A=
# CONFIG_PARPORT is not set=0A=
=0A=
#=0A=
# Plug and Play support=0A=
#=0A=
=0A=
#=0A=
# Block devices=0A=
#=0A=
# CONFIG_BLK_DEV_FD is not set=0A=
# CONFIG_BLK_CPQ_DA is not set=0A=
# CONFIG_BLK_CPQ_CISS_DA is not set=0A=
# CONFIG_BLK_DEV_DAC960 is not set=0A=
# CONFIG_BLK_DEV_UMEM is not set=0A=
# CONFIG_BLK_DEV_COW_COMMON is not set=0A=
CONFIG_BLK_DEV_LOOP=3Dy=0A=
# CONFIG_BLK_DEV_CRYPTOLOOP is not set=0A=
# CONFIG_BLK_DEV_NBD is not set=0A=
# CONFIG_BLK_DEV_SX8 is not set=0A=
# CONFIG_BLK_DEV_RAM is not set=0A=
CONFIG_BLK_DEV_RAM_COUNT=3D16=0A=
CONFIG_INITRAMFS_SOURCE=3D""=0A=
# CONFIG_LBD is not set=0A=
# CONFIG_CDROM_PKTCDVD is not set=0A=
=0A=
#=0A=
# IO Schedulers=0A=
#=0A=
CONFIG_IOSCHED_NOOP=3Dy=0A=
CONFIG_IOSCHED_AS=3Dy=0A=
CONFIG_IOSCHED_DEADLINE=3Dy=0A=
CONFIG_IOSCHED_CFQ=3Dy=0A=
# CONFIG_ATA_OVER_ETH is not set=0A=
=0A=
#=0A=
# ATA/ATAPI/MFM/RLL support=0A=
#=0A=
# CONFIG_IDE is not set=0A=
=0A=
#=0A=
# SCSI device support=0A=
#=0A=
# CONFIG_SCSI is not set=0A=
=0A=
#=0A=
# Multi-device support (RAID and LVM)=0A=
#=0A=
# CONFIG_MD is not set=0A=
=0A=
#=0A=
# Fusion MPT device support=0A=
#=0A=
=0A=
#=0A=
# IEEE 1394 (FireWire) support=0A=
#=0A=
# CONFIG_IEEE1394 is not set=0A=
=0A=
#=0A=
# I2O device support=0A=
#=0A=
# CONFIG_I2O is not set=0A=
=0A=
#=0A=
# Networking support=0A=
#=0A=
CONFIG_NET=3Dy=0A=
=0A=
#=0A=
# Networking options=0A=
#=0A=
CONFIG_PACKET=3Dy=0A=
# CONFIG_PACKET_MMAP is not set=0A=
CONFIG_UNIX=3Dy=0A=
# CONFIG_NET_KEY is not set=0A=
CONFIG_INET=3Dy=0A=
CONFIG_IP_MULTICAST=3Dy=0A=
# CONFIG_IP_ADVANCED_ROUTER is not set=0A=
CONFIG_IP_PNP=3Dy=0A=
# CONFIG_IP_PNP_DHCP is not set=0A=
# CONFIG_IP_PNP_BOOTP is not set=0A=
CONFIG_IP_PNP_RARP=3Dy=0A=
# CONFIG_NET_IPIP is not set=0A=
# CONFIG_NET_IPGRE is not set=0A=
# CONFIG_IP_MROUTE is not set=0A=
# CONFIG_ARPD is not set=0A=
# CONFIG_SYN_COOKIES is not set=0A=
# CONFIG_INET_AH is not set=0A=
# CONFIG_INET_ESP is not set=0A=
# CONFIG_INET_IPCOMP is not set=0A=
# CONFIG_INET_TUNNEL is not set=0A=
CONFIG_IP_TCPDIAG=3Dy=0A=
# CONFIG_IP_TCPDIAG_IPV6 is not set=0A=
# CONFIG_IPV6 is not set=0A=
# CONFIG_NETFILTER is not set=0A=
=0A=
#=0A=
# SCTP Configuration (EXPERIMENTAL)=0A=
#=0A=
# CONFIG_IP_SCTP is not set=0A=
# CONFIG_ATM is not set=0A=
# CONFIG_BRIDGE is not set=0A=
# CONFIG_VLAN_8021Q is not set=0A=
# CONFIG_DECNET is not set=0A=
# CONFIG_LLC2 is not set=0A=
# CONFIG_IPX is not set=0A=
# CONFIG_ATALK is not set=0A=
# CONFIG_X25 is not set=0A=
# CONFIG_LAPB is not set=0A=
# CONFIG_NET_DIVERT is not set=0A=
# CONFIG_ECONET is not set=0A=
# CONFIG_WAN_ROUTER is not set=0A=
=0A=
#=0A=
# QoS and/or fair queueing=0A=
#=0A=
# CONFIG_NET_SCHED is not set=0A=
# CONFIG_NET_CLS_ROUTE is not set=0A=
=0A=
#=0A=
# Network testing=0A=
#=0A=
# CONFIG_NET_PKTGEN is not set=0A=
# CONFIG_NETPOLL is not set=0A=
# CONFIG_NET_POLL_CONTROLLER is not set=0A=
# CONFIG_HAMRADIO is not set=0A=
# CONFIG_IRDA is not set=0A=
# CONFIG_BT is not set=0A=
CONFIG_NETDEVICES=3Dy=0A=
# CONFIG_DUMMY is not set=0A=
# CONFIG_BONDING is not set=0A=
# CONFIG_EQUALIZER is not set=0A=
# CONFIG_TUN is not set=0A=
=0A=
#=0A=
# ARCnet devices=0A=
#=0A=
# CONFIG_ARCNET is not set=0A=
=0A=
#=0A=
# Ethernet (10 or 100Mbit)=0A=
#=0A=
CONFIG_NET_ETHERNET=3Dy=0A=
CONFIG_MII=3Dy=0A=
CONFIG_GO_EMAC=3Dy=0A=
# CONFIG_HAPPYMEAL is not set=0A=
# CONFIG_SUNGEM is not set=0A=
# CONFIG_NET_VENDOR_3COM is not set=0A=
=0A=
#=0A=
# Tulip family network device support=0A=
#=0A=
# CONFIG_NET_TULIP is not set=0A=
# CONFIG_HP100 is not set=0A=
CONFIG_NET_PCI=3Dy=0A=
# CONFIG_PCNET32 is not set=0A=
# CONFIG_AMD8111_ETH is not set=0A=
# CONFIG_ADAPTEC_STARFIRE is not set=0A=
# CONFIG_B44 is not set=0A=
# CONFIG_FORCEDETH is not set=0A=
# CONFIG_DGRS is not set=0A=
# CONFIG_EEPRO100 is not set=0A=
# CONFIG_E100 is not set=0A=
# CONFIG_FEALNX is not set=0A=
# CONFIG_NATSEMI is not set=0A=
# CONFIG_NE2K_PCI is not set=0A=
# CONFIG_8139CP is not set=0A=
CONFIG_8139TOO=3Dy=0A=
# CONFIG_8139TOO_PIO is not set=0A=
# CONFIG_8139TOO_TUNE_TWISTER is not set=0A=
# CONFIG_8139TOO_8129 is not set=0A=
# CONFIG_8139_OLD_RX_RESET is not set=0A=
# CONFIG_SIS900 is not set=0A=
# CONFIG_EPIC100 is not set=0A=
# CONFIG_SUNDANCE is not set=0A=
# CONFIG_TLAN is not set=0A=
# CONFIG_VIA_RHINE is not set=0A=
# CONFIG_LAN_SAA9730 is not set=0A=
=0A=
#=0A=
# Ethernet (1000 Mbit)=0A=
#=0A=
# CONFIG_ACENIC is not set=0A=
# CONFIG_DL2K is not set=0A=
# CONFIG_E1000 is not set=0A=
# CONFIG_NS83820 is not set=0A=
# CONFIG_HAMACHI is not set=0A=
# CONFIG_YELLOWFIN is not set=0A=
# CONFIG_R8169 is not set=0A=
# CONFIG_SK98LIN is not set=0A=
# CONFIG_VIA_VELOCITY is not set=0A=
# CONFIG_TIGON3 is not set=0A=
=0A=
#=0A=
# Ethernet (10000 Mbit)=0A=
#=0A=
# CONFIG_IXGB is not set=0A=
# CONFIG_S2IO is not set=0A=
=0A=
#=0A=
# Token Ring devices=0A=
#=0A=
# CONFIG_TR is not set=0A=
=0A=
#=0A=
# Wireless LAN (non-hamradio)=0A=
#=0A=
CONFIG_NET_RADIO=3Dy=0A=
=0A=
#=0A=
# Obsolete Wireless cards support (pre-802.11)=0A=
#=0A=
# CONFIG_STRIP is not set=0A=
=0A=
#=0A=
# New Wireless cards support (802.11 a/b/g)=0A=
#=0A=
CONFIG_IEEE80211=3Dy=0A=
=0A=
#=0A=
# Wireless 802.11b ISA/PCI cards support=0A=
#=0A=
# CONFIG_HERMES is not set=0A=
# CONFIG_ATMEL is not set=0A=
=0A=
#=0A=
# Prism GT/Duette 802.11(a/b/g) PCI/Cardbus support=0A=
#=0A=
CONFIG_PRISM54=3Dy=0A=
CONFIG_NET_WIRELESS=3Dy=0A=
=0A=
#=0A=
# Wan interfaces=0A=
#=0A=
# CONFIG_WAN is not set=0A=
# CONFIG_FDDI is not set=0A=
# CONFIG_HIPPI is not set=0A=
# CONFIG_PPP is not set=0A=
# CONFIG_SLIP is not set=0A=
# CONFIG_SHAPER is not set=0A=
# CONFIG_NETCONSOLE is not set=0A=
=0A=
#=0A=
# ISDN subsystem=0A=
#=0A=
# CONFIG_ISDN is not set=0A=
=0A=
#=0A=
# Telephony Support=0A=
#=0A=
# CONFIG_PHONE is not set=0A=
=0A=
#=0A=
# Input device support=0A=
#=0A=
# CONFIG_INPUT is not set=0A=
=0A=
#=0A=
# Hardware I/O ports=0A=
#=0A=
CONFIG_SERIO=3Dy=0A=
# CONFIG_SERIO_I8042 is not set=0A=
# CONFIG_SERIO_SERPORT is not set=0A=
# CONFIG_SERIO_PCIPS2 is not set=0A=
# CONFIG_SERIO_LIBPS2 is not set=0A=
# CONFIG_SERIO_RAW is not set=0A=
# CONFIG_GAMEPORT is not set=0A=
CONFIG_SOUND_GAMEPORT=3Dy=0A=
=0A=
#=0A=
# Character devices=0A=
#=0A=
# CONFIG_VT is not set=0A=
# CONFIG_SERIAL_NONSTANDARD is not set=0A=
=0A=
#=0A=
# Serial drivers=0A=
#=0A=
CONFIG_SERIAL_8250=3Dy=0A=
CONFIG_SERIAL_8250_CONSOLE=3Dy=0A=
CONFIG_SERIAL_8250_NR_UARTS=3D4=0A=
# CONFIG_SERIAL_8250_EXTENDED is not set=0A=
=0A=
#=0A=
# Non-8250 serial port support=0A=
#=0A=
CONFIG_SERIAL_CORE=3Dy=0A=
CONFIG_SERIAL_CORE_CONSOLE=3Dy=0A=
# CONFIG_SERIAL_JSM is not set=0A=
CONFIG_UNIX98_PTYS=3Dy=0A=
# CONFIG_LEGACY_PTYS is not set=0A=
=0A=
#=0A=
# IPMI=0A=
#=0A=
# CONFIG_IPMI_HANDLER is not set=0A=
=0A=
#=0A=
# Watchdog Cards=0A=
#=0A=
# CONFIG_WATCHDOG is not set=0A=
# CONFIG_RTC is not set=0A=
# CONFIG_GEN_RTC is not set=0A=
# CONFIG_DTLK is not set=0A=
# CONFIG_R3964 is not set=0A=
# CONFIG_APPLICOM is not set=0A=
=0A=
#=0A=
# Ftape, the floppy tape device driver=0A=
#=0A=
# CONFIG_DRM is not set=0A=
# CONFIG_RAW_DRIVER is not set=0A=
=0A=
#=0A=
# TPM devices=0A=
#=0A=
# CONFIG_TCG_TPM is not set=0A=
=0A=
#=0A=
# I2C support=0A=
#=0A=
CONFIG_I2C=3Dy=0A=
CONFIG_I2C_CHARDEV=3Dy=0A=
=0A=
#=0A=
# I2C Algorithms=0A=
#=0A=
CONFIG_I2C_ALGOBIT=3Dy=0A=
CONFIG_I2C_ALGOPCF=3Dy=0A=
CONFIG_I2C_ALGOPCA=3Dy=0A=
CONFIG_I2C_ALGO_PVCI=3Dy=0A=
=0A=
#=0A=
# I2C Hardware Bus support=0A=
#=0A=
# CONFIG_I2C_ALI1535 is not set=0A=
# CONFIG_I2C_ALI1563 is not set=0A=
# CONFIG_I2C_ALI15X3 is not set=0A=
# CONFIG_I2C_AMD756 is not set=0A=
# CONFIG_I2C_AMD8111 is not set=0A=
# CONFIG_I2C_I801 is not set=0A=
# CONFIG_I2C_I810 is not set=0A=
# CONFIG_I2C_PIIX4 is not set=0A=
# CONFIG_I2C_ISA is not set=0A=
# CONFIG_I2C_NFORCE2 is not set=0A=
# CONFIG_I2C_PARPORT_LIGHT is not set=0A=
# CONFIG_I2C_PROSAVAGE is not set=0A=
# CONFIG_I2C_SAVAGE4 is not set=0A=
# CONFIG_SCx200_ACB is not set=0A=
# CONFIG_I2C_SIS5595 is not set=0A=
# CONFIG_I2C_SIS630 is not set=0A=
# CONFIG_I2C_SIS96X is not set=0A=
# CONFIG_I2C_STUB is not set=0A=
# CONFIG_I2C_VIA is not set=0A=
# CONFIG_I2C_VIAPRO is not set=0A=
# CONFIG_I2C_VOODOO3 is not set=0A=
# CONFIG_I2C_PCA_ISA is not set=0A=
CONFIG_I2C_GO7X8X=3Dy=0A=
=0A=
#=0A=
# Hardware Sensors Chip support=0A=
#=0A=
CONFIG_I2C_SENSOR=3Dy=0A=
# CONFIG_SENSORS_ADM1021 is not set=0A=
# CONFIG_SENSORS_ADM1025 is not set=0A=
# CONFIG_SENSORS_ADM1026 is not set=0A=
# CONFIG_SENSORS_ADM1031 is not set=0A=
# CONFIG_SENSORS_ASB100 is not set=0A=
# CONFIG_SENSORS_DS1621 is not set=0A=
# CONFIG_SENSORS_FSCHER is not set=0A=
# CONFIG_SENSORS_FSCPOS is not set=0A=
# CONFIG_SENSORS_GL518SM is not set=0A=
# CONFIG_SENSORS_GL520SM is not set=0A=
# CONFIG_SENSORS_IT87 is not set=0A=
# CONFIG_SENSORS_LM63 is not set=0A=
# CONFIG_SENSORS_LM75 is not set=0A=
# CONFIG_SENSORS_LM77 is not set=0A=
# CONFIG_SENSORS_LM78 is not set=0A=
# CONFIG_SENSORS_LM80 is not set=0A=
# CONFIG_SENSORS_LM83 is not set=0A=
# CONFIG_SENSORS_LM85 is not set=0A=
# CONFIG_SENSORS_LM87 is not set=0A=
# CONFIG_SENSORS_LM90 is not set=0A=
# CONFIG_SENSORS_LM92 is not set=0A=
# CONFIG_SENSORS_MAX1619 is not set=0A=
# CONFIG_SENSORS_PC87360 is not set=0A=
# CONFIG_SENSORS_SMSC47B397 is not set=0A=
# CONFIG_SENSORS_SIS5595 is not set=0A=
# CONFIG_SENSORS_SMSC47M1 is not set=0A=
# CONFIG_SENSORS_VIA686A is not set=0A=
# CONFIG_SENSORS_W83781D is not set=0A=
# CONFIG_SENSORS_W83L785TS is not set=0A=
# CONFIG_SENSORS_W83627HF is not set=0A=
=0A=
#=0A=
# Other I2C Chip support=0A=
#=0A=
CONFIG_SENSORS_DS1337=3Dy=0A=
# CONFIG_SENSORS_EEPROM is not set=0A=
CONFIG_SENSORS_PCF8574=3Dy=0A=
# CONFIG_SENSORS_PCF8591 is not set=0A=
# CONFIG_SENSORS_RTC8564 is not set=0A=
# CONFIG_I2C_DEBUG_CORE is not set=0A=
# CONFIG_I2C_DEBUG_ALGO is not set=0A=
# CONFIG_I2C_DEBUG_BUS is not set=0A=
CONFIG_I2C_DEBUG_CHIP=3Dy=0A=
=0A=
#=0A=
# Dallas's 1-wire bus=0A=
#=0A=
# CONFIG_W1 is not set=0A=
=0A=
#=0A=
# Misc devices=0A=
#=0A=
=0A=
#=0A=
# Multimedia devices=0A=
#=0A=
CONFIG_VIDEO_DEV=3Dy=0A=
=0A=
#=0A=
# Video For Linux=0A=
#=0A=
=0A=
#=0A=
# Video Adapters=0A=
#=0A=
# CONFIG_VIDEO_BT848 is not set=0A=
# CONFIG_VIDEO_CPIA is not set=0A=
# CONFIG_VIDEO_SAA5246A is not set=0A=
# CONFIG_VIDEO_SAA5249 is not set=0A=
# CONFIG_TUNER_3036 is not set=0A=
# CONFIG_TUNER_XCEIVE is not set=0A=
# CONFIG_VIDEO_STRADIS is not set=0A=
# CONFIG_VIDEO_ZORAN is not set=0A=
# CONFIG_VIDEO_ZR36120 is not set=0A=
# CONFIG_VIDEO_SAA7134 is not set=0A=
# CONFIG_VIDEO_MXB is not set=0A=
# CONFIG_VIDEO_DPC is not set=0A=
# CONFIG_VIDEO_HEXIUM_ORION is not set=0A=
# CONFIG_VIDEO_HEXIUM_GEMINI is not set=0A=
# CONFIG_VIDEO_CX88 is not set=0A=
# CONFIG_VIDEO_OVCAMCHIP is not set=0A=
CONFIG_VIDEO_GO7X8X_V4L2=3Dy=0A=
# CONFIG_VIDEO_GO7X8X_DEC_V4L2 is not set=0A=
=0A=
#=0A=
# Radio Adapters=0A=
#=0A=
# CONFIG_RADIO_GEMTEK_PCI is not set=0A=
# CONFIG_RADIO_MAXIRADIO is not set=0A=
# CONFIG_RADIO_MAESTRO is not set=0A=
=0A=
#=0A=
# Digital Video Broadcasting Devices=0A=
#=0A=
# CONFIG_DVB is not set=0A=
CONFIG_VIDEO_TUNER=3Dy=0A=
=0A=
#=0A=
# Graphics support=0A=
#=0A=
=0A=
#=0A=
# Sound=0A=
#=0A=
CONFIG_SOUND=3Dy=0A=
=0A=
#=0A=
# Advanced Linux Sound Architecture=0A=
#=0A=
CONFIG_SND=3Dy=0A=
CONFIG_SND_TIMER=3Dy=0A=
CONFIG_SND_PCM=3Dy=0A=
# CONFIG_SND_SEQUENCER is not set=0A=
CONFIG_SND_OSSEMUL=3Dy=0A=
CONFIG_SND_MIXER_OSS=3Dy=0A=
CONFIG_SND_PCM_OSS=3Dy=0A=
CONFIG_SND_VERBOSE_PRINTK=3Dy=0A=
CONFIG_SND_DEBUG=3Dy=0A=
CONFIG_SND_DEBUG_MEMORY=3Dy=0A=
CONFIG_SND_DEBUG_DETECT=3Dy=0A=
=0A=
#=0A=
# Generic devices=0A=
#=0A=
# CONFIG_SND_DUMMY is not set=0A=
# CONFIG_SND_MTPAV is not set=0A=
# CONFIG_SND_SERIAL_U16550 is not set=0A=
# CONFIG_SND_MPU401 is not set=0A=
=0A=
#=0A=
# PCI devices=0A=
#=0A=
# CONFIG_SND_ALI5451 is not set=0A=
# CONFIG_SND_ATIIXP is not set=0A=
# CONFIG_SND_ATIIXP_MODEM is not set=0A=
# CONFIG_SND_AU8810 is not set=0A=
# CONFIG_SND_AU8820 is not set=0A=
# CONFIG_SND_AU8830 is not set=0A=
# CONFIG_SND_AZT3328 is not set=0A=
# CONFIG_SND_BT87X is not set=0A=
# CONFIG_SND_CS46XX is not set=0A=
# CONFIG_SND_CS4281 is not set=0A=
# CONFIG_SND_EMU10K1 is not set=0A=
# CONFIG_SND_EMU10K1X is not set=0A=
# CONFIG_SND_CA0106 is not set=0A=
# CONFIG_SND_KORG1212 is not set=0A=
# CONFIG_SND_MIXART is not set=0A=
# CONFIG_SND_NM256 is not set=0A=
# CONFIG_SND_RME32 is not set=0A=
# CONFIG_SND_RME96 is not set=0A=
# CONFIG_SND_RME9652 is not set=0A=
# CONFIG_SND_HDSP is not set=0A=
# CONFIG_SND_TRIDENT is not set=0A=
# CONFIG_SND_YMFPCI is not set=0A=
# CONFIG_SND_ALS4000 is not set=0A=
# CONFIG_SND_CMIPCI is not set=0A=
# CONFIG_SND_ENS1370 is not set=0A=
# CONFIG_SND_ENS1371 is not set=0A=
# CONFIG_SND_ES1938 is not set=0A=
# CONFIG_SND_ES1968 is not set=0A=
# CONFIG_SND_MAESTRO3 is not set=0A=
# CONFIG_SND_FM801 is not set=0A=
# CONFIG_SND_ICE1712 is not set=0A=
# CONFIG_SND_ICE1724 is not set=0A=
# CONFIG_SND_INTEL8X0 is not set=0A=
# CONFIG_SND_INTEL8X0M is not set=0A=
# CONFIG_SND_SONICVIBES is not set=0A=
# CONFIG_SND_VIA82XX is not set=0A=
# CONFIG_SND_VIA82XX_MODEM is not set=0A=
# CONFIG_SND_VX222 is not set=0A=
# CONFIG_SND_HDA_INTEL is not set=0A=
=0A=
#=0A=
# ALSA MIPS devices=0A=
#=0A=
CONFIG_SND_GO7X8X=3Dy=0A=
=0A=
#=0A=
# Open Sound System=0A=
#=0A=
# CONFIG_SOUND_PRIME is not set=0A=
=0A=
#=0A=
# USB support=0A=
#=0A=
CONFIG_USB_ARCH_HAS_HCD=3Dy=0A=
CONFIG_USB_ARCH_HAS_OHCI=3Dy=0A=
# CONFIG_USB is not set=0A=
=0A=
#=0A=
# USB Gadget Support=0A=
#=0A=
# CONFIG_USB_GADGET is not set=0A=
=0A=
#=0A=
# MMC/SD Card support=0A=
#=0A=
# CONFIG_MMC is not set=0A=
=0A=
#=0A=
# InfiniBand support=0A=
#=0A=
# CONFIG_INFINIBAND is not set=0A=
=0A=
#=0A=
# File systems=0A=
#=0A=
CONFIG_EXT2_FS=3Dy=0A=
# CONFIG_EXT2_FS_XATTR is not set=0A=
CONFIG_EXT3_FS=3Dy=0A=
CONFIG_EXT3_FS_XATTR=3Dy=0A=
# CONFIG_EXT3_FS_POSIX_ACL is not set=0A=
# CONFIG_EXT3_FS_SECURITY is not set=0A=
CONFIG_JBD=3Dy=0A=
# CONFIG_JBD_DEBUG is not set=0A=
CONFIG_FS_MBCACHE=3Dy=0A=
# CONFIG_REISERFS_FS is not set=0A=
# CONFIG_JFS_FS is not set=0A=
=0A=
#=0A=
# XFS support=0A=
#=0A=
# CONFIG_XFS_FS is not set=0A=
CONFIG_MINIX_FS=3Dy=0A=
CONFIG_ROMFS_FS=3Dy=0A=
# CONFIG_QUOTA is not set=0A=
CONFIG_DNOTIFY=3Dy=0A=
# CONFIG_AUTOFS_FS is not set=0A=
# CONFIG_AUTOFS4_FS is not set=0A=
=0A=
#=0A=
# CD-ROM/DVD Filesystems=0A=
#=0A=
CONFIG_ISO9660_FS=3Dy=0A=
CONFIG_JOLIET=3Dy=0A=
# CONFIG_ZISOFS is not set=0A=
# CONFIG_UDF_FS is not set=0A=
=0A=
#=0A=
# DOS/FAT/NT Filesystems=0A=
#=0A=
CONFIG_FAT_FS=3Dy=0A=
CONFIG_MSDOS_FS=3Dy=0A=
CONFIG_VFAT_FS=3Dy=0A=
CONFIG_FAT_DEFAULT_CODEPAGE=3D437=0A=
CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"=0A=
# CONFIG_NTFS_FS is not set=0A=
=0A=
#=0A=
# Pseudo filesystems=0A=
#=0A=
CONFIG_PROC_FS=3Dy=0A=
CONFIG_PROC_KCORE=3Dy=0A=
CONFIG_SYSFS=3Dy=0A=
# CONFIG_DEVFS_FS is not set=0A=
# CONFIG_DEVPTS_FS_XATTR is not set=0A=
# CONFIG_TMPFS is not set=0A=
# CONFIG_HUGETLBFS is not set=0A=
# CONFIG_HUGETLB_PAGE is not set=0A=
CONFIG_RAMFS=3Dy=0A=
=0A=
#=0A=
# Miscellaneous filesystems=0A=
#=0A=
# CONFIG_ADFS_FS is not set=0A=
# CONFIG_AFFS_FS is not set=0A=
# CONFIG_HFS_FS is not set=0A=
# CONFIG_HFSPLUS_FS is not set=0A=
# CONFIG_BEFS_FS is not set=0A=
# CONFIG_BFS_FS is not set=0A=
# CONFIG_EFS_FS is not set=0A=
# CONFIG_JFFS_FS is not set=0A=
CONFIG_JFFS2_FS=3Dy=0A=
CONFIG_JFFS2_FS_DEBUG=3D2=0A=
# CONFIG_JFFS2_FS_NAND is not set=0A=
# CONFIG_JFFS2_FS_NOR_ECC is not set=0A=
CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy=0A=
CONFIG_JFFS2_ZLIB=3Dy=0A=
CONFIG_JFFS2_RTIME=3Dy=0A=
# CONFIG_JFFS2_RUBIN is not set=0A=
# CONFIG_JFFS2_CMODE_NONE is not set=0A=
CONFIG_JFFS2_CMODE_PRIORITY=3Dy=0A=
# CONFIG_JFFS2_CMODE_SIZE is not set=0A=
# CONFIG_CRAMFS is not set=0A=
# CONFIG_VXFS_FS is not set=0A=
# CONFIG_HPFS_FS is not set=0A=
# CONFIG_QNX4FS_FS is not set=0A=
# CONFIG_SYSV_FS is not set=0A=
# CONFIG_UFS_FS is not set=0A=
=0A=
#=0A=
# Network File Systems=0A=
#=0A=
CONFIG_NFS_FS=3Dy=0A=
# CONFIG_NFS_V3 is not set=0A=
# CONFIG_NFS_V4 is not set=0A=
# CONFIG_NFS_DIRECTIO is not set=0A=
# CONFIG_NFSD is not set=0A=
CONFIG_ROOT_NFS=3Dy=0A=
CONFIG_LOCKD=3Dy=0A=
CONFIG_SUNRPC=3Dy=0A=
# CONFIG_RPCSEC_GSS_KRB5 is not set=0A=
# CONFIG_RPCSEC_GSS_SPKM3 is not set=0A=
# CONFIG_SMB_FS is not set=0A=
# CONFIG_CIFS is not set=0A=
# CONFIG_NCP_FS is not set=0A=
# CONFIG_CODA_FS is not set=0A=
# CONFIG_AFS_FS is not set=0A=
=0A=
#=0A=
# Partition Types=0A=
#=0A=
# CONFIG_PARTITION_ADVANCED is not set=0A=
CONFIG_MSDOS_PARTITION=3Dy=0A=
=0A=
#=0A=
# Native Language Support=0A=
#=0A=
CONFIG_NLS=3Dy=0A=
CONFIG_NLS_DEFAULT=3D"iso8859-1"=0A=
CONFIG_NLS_CODEPAGE_437=3Dy=0A=
# CONFIG_NLS_CODEPAGE_737 is not set=0A=
# CONFIG_NLS_CODEPAGE_775 is not set=0A=
# CONFIG_NLS_CODEPAGE_850 is not set=0A=
# CONFIG_NLS_CODEPAGE_852 is not set=0A=
# CONFIG_NLS_CODEPAGE_855 is not set=0A=
# CONFIG_NLS_CODEPAGE_857 is not set=0A=
# CONFIG_NLS_CODEPAGE_860 is not set=0A=
# CONFIG_NLS_CODEPAGE_861 is not set=0A=
# CONFIG_NLS_CODEPAGE_862 is not set=0A=
# CONFIG_NLS_CODEPAGE_863 is not set=0A=
# CONFIG_NLS_CODEPAGE_864 is not set=0A=
# CONFIG_NLS_CODEPAGE_865 is not set=0A=
# CONFIG_NLS_CODEPAGE_866 is not set=0A=
# CONFIG_NLS_CODEPAGE_869 is not set=0A=
# CONFIG_NLS_CODEPAGE_936 is not set=0A=
# CONFIG_NLS_CODEPAGE_950 is not set=0A=
# CONFIG_NLS_CODEPAGE_932 is not set=0A=
# CONFIG_NLS_CODEPAGE_949 is not set=0A=
# CONFIG_NLS_CODEPAGE_874 is not set=0A=
# CONFIG_NLS_ISO8859_8 is not set=0A=
# CONFIG_NLS_CODEPAGE_1250 is not set=0A=
# CONFIG_NLS_CODEPAGE_1251 is not set=0A=
# CONFIG_NLS_ASCII is not set=0A=
CONFIG_NLS_ISO8859_1=3Dy=0A=
# CONFIG_NLS_ISO8859_2 is not set=0A=
# CONFIG_NLS_ISO8859_3 is not set=0A=
# CONFIG_NLS_ISO8859_4 is not set=0A=
# CONFIG_NLS_ISO8859_5 is not set=0A=
# CONFIG_NLS_ISO8859_6 is not set=0A=
# CONFIG_NLS_ISO8859_7 is not set=0A=
# CONFIG_NLS_ISO8859_9 is not set=0A=
# CONFIG_NLS_ISO8859_13 is not set=0A=
# CONFIG_NLS_ISO8859_14 is not set=0A=
# CONFIG_NLS_ISO8859_15 is not set=0A=
# CONFIG_NLS_KOI8_R is not set=0A=
# CONFIG_NLS_KOI8_U is not set=0A=
# CONFIG_NLS_UTF8 is not set=0A=
=0A=
#=0A=
# Kernel hacking=0A=
#=0A=
# CONFIG_PRINTK_TIME is not set=0A=
CONFIG_DEBUG_KERNEL=3Dy=0A=
# CONFIG_MAGIC_SYSRQ is not set=0A=
CONFIG_LOG_BUF_SHIFT=3D14=0A=
# CONFIG_SCHEDSTATS is not set=0A=
# CONFIG_DEBUG_SLAB is not set=0A=
# CONFIG_DEBUG_SPINLOCK is not set=0A=
# CONFIG_DEBUG_SPINLOCK_SLEEP is not set=0A=
# CONFIG_DEBUG_KOBJECT is not set=0A=
# CONFIG_DEBUG_INFO is not set=0A=
# CONFIG_DEBUG_FS is not set=0A=
CONFIG_CROSSCOMPILE=3Dy=0A=
CONFIG_CMDLINE=3D"mem=3D20M@0,96M@32M"=0A=
# CONFIG_DEBUG_STACK_USAGE is not set=0A=
# CONFIG_KGDB is not set=0A=
# CONFIG_RUNTIME_DEBUG is not set=0A=
# CONFIG_MIPS_UNCACHED is not set=0A=
=0A=
#=0A=
# Security options=0A=
#=0A=
# CONFIG_KEYS is not set=0A=
# CONFIG_SECURITY is not set=0A=
=0A=
#=0A=
# Cryptographic options=0A=
#=0A=
CONFIG_CRYPTO=3Dy=0A=
# CONFIG_CRYPTO_HMAC is not set=0A=
# CONFIG_CRYPTO_NULL is not set=0A=
# CONFIG_CRYPTO_MD4 is not set=0A=
# CONFIG_CRYPTO_MD5 is not set=0A=
# CONFIG_CRYPTO_SHA1 is not set=0A=
# CONFIG_CRYPTO_SHA256 is not set=0A=
# CONFIG_CRYPTO_SHA512 is not set=0A=
# CONFIG_CRYPTO_WP512 is not set=0A=
# CONFIG_CRYPTO_TGR192 is not set=0A=
# CONFIG_CRYPTO_DES is not set=0A=
# CONFIG_CRYPTO_BLOWFISH is not set=0A=
# CONFIG_CRYPTO_TWOFISH is not set=0A=
# CONFIG_CRYPTO_SERPENT is not set=0A=
CONFIG_CRYPTO_AES=3Dy=0A=
# CONFIG_CRYPTO_CAST5 is not set=0A=
# CONFIG_CRYPTO_CAST6 is not set=0A=
# CONFIG_CRYPTO_TEA is not set=0A=
CONFIG_CRYPTO_ARC4=3Dy=0A=
# CONFIG_CRYPTO_KHAZAD is not set=0A=
# CONFIG_CRYPTO_ANUBIS is not set=0A=
# CONFIG_CRYPTO_DEFLATE is not set=0A=
CONFIG_CRYPTO_MICHAEL_MIC=3Dy=0A=
CONFIG_CRYPTO_CRC32C=3Dy=0A=
# CONFIG_CRYPTO_TEST is not set=0A=
=0A=
#=0A=
# OCF Configuration=0A=
#=0A=
# CONFIG_OCF_OCF is not set=0A=
=0A=
#=0A=
# Hardware crypto devices=0A=
#=0A=
=0A=
#=0A=
# Library routines=0A=
#=0A=
# CONFIG_CRC_CCITT is not set=0A=
CONFIG_CRC32=3Dy=0A=
CONFIG_LIBCRC32C=3Dy=0A=
CONFIG_ZLIB_INFLATE=3Dy=0A=
CONFIG_ZLIB_DEFLATE=3Dy=0A=
CONFIG_GENERIC_HARDIRQS=3Dy=0A=
CONFIG_GENERIC_IRQ_PROBE=3Dy=0A=

------=_NextPart_000_0023_01C69516.9D7BE740--
