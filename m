Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14nkfS-0001GI-00
	for mtd-list@infradead.org; Thu, 12 Apr 2001 18:14:02 +0100
Received: from [199.221.73.29] (helo=marconi-gfw.marconicommerce.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14nkfL-0001GC-00
	for mtd@infradead.org; Thu, 12 Apr 2001 18:13:55 +0100
Message-ID: <A3E34B558F5CD211B4980008C7A4A99003163E52@sparrow.eng.gilbarco.com>
From: "Williams, Kevin M." <kevin.m.williams@marconi.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: jffs steps from boot prompt to mount?
Date: Thu, 12 Apr 2001 13:13:49 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David - thanks for pointing me toward jffs.  It's a much better solution
than the FTL mess used by the guy I replaced. 

I've hacked up a "map driver" to partition my mtd device into 4 partitions
when I boot.  At the bash prompt 'cat proc/mtd' now returns:

dev:    size   erasesize  name
mtd0: 00020000 00020000 "CRIND bootloader"
mtd1: 00300000 00020000 "CRIND compressed kernel image"
mtd2: 000c0000 00020000 "CRIND Linux jffs filesystem"
mtd3: 00010000 00004000 "Manufacturing Data sector and filesize info"

But now I don't know what to do.  I type "/sbin/erase /dev/mtd2 0 6", but I
get a file open error.  Open() returns a value of -1.  

Is erase the first thing I should do after I have booted?  

I need my application to be able to mount the mtd device and write/read
files.  I have selected jffs support under file systems in xconfig. Can
someone spell out the steps from bootup until mount?  I tried following the
HOWTO but got stuck here with erase not working and wondering how
mtdblock0/1/2 get created.

If erase is my next step, any ideas why I get the open error?  I can load
our 2.2.13 kernel on this same hardware and it does an ftl_format, mke2fs,
and then mounts this same memory region on dev/ftla without a problem.

I am running 2.4.3-pre3 from kernel.org with the 4-4-2001 mtd snapshot
patched in.  I have custom embedded hardware with a PowerPC860 and 2 x16
flash chips AM29DL162CT.  I copied my .config and debug output in case they
might help.

Thanks in advance.

Kevin

#
# Automatically generated make config: don't edit
#
# CONFIG_UID16 is not set

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=y

#
# Loadable module support
#
# CONFIG_MODULES is not set

#
# Platform support
#
CONFIG_PPC=y
# CONFIG_6xx is not set
# CONFIG_4xx is not set
# CONFIG_POWER3 is not set
# CONFIG_POWER4 is not set
CONFIG_8xx=y
CONFIG_SERIAL_CONSOLE=y
# CONFIG_RPXLITE is not set
# CONFIG_RPXCLASSIC is not set
# CONFIG_BSEIP is not set
# CONFIG_TQM823L is not set
# CONFIG_TQM850L is not set
# CONFIG_TQM855L is not set
# CONFIG_TQM860L is not set
# CONFIG_FPS850L is not set
# CONFIG_TQM860 is not set
# CONFIG_SPD823TS is not set
# CONFIG_IVMS8 is not set
# CONFIG_SM850 is not set
# CONFIG_MBX is not set
CONFIG_CRIND=y
# CONFIG_WINCEPT is not set
CONFIG_PPC601_SYNC_FIX=y
# CONFIG_ALL_PPC is not set
# CONFIG_SMP is not set
CONFIG_MACH_SPECIFIC=y
CONFIG_MATH_EMULATION=y

#
# General setup
#
# CONFIG_HIGHMEM is not set
# CONFIG_MOL is not set
# CONFIG_ISA is not set
# CONFIG_EISA is not set
# CONFIG_SBUS is not set
# CONFIG_MCA is not set
# CONFIG_PCI_QSPAN is not set
# CONFIG_PCI is not set
CONFIG_NET=y
CONFIG_SYSCTL=y
CONFIG_SYSVIPC=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_KCORE_ELF=y
CONFIG_BINFMT_ELF=y
CONFIG_KERNEL_ELF=y
# CONFIG_BINFMT_MISC is not set
# CONFIG_HOTPLUG is not set
# CONFIG_PCMCIA is not set

#
# Parallel port support
#
# CONFIG_PARPORT is not set

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

#
# RAM/ROM Device Drivers
#
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_MTDRAM is not set

#
# Linearly Mapped Flash Device Drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_CFI_VIRTUAL_ER is not set
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
CONFIG_MTD_CFI_BE_BYTE_SWAP=y
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LART_BIT_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
# CONFIG_MTD_CFI_B1 is not set
# CONFIG_MTD_CFI_B2 is not set
CONFIG_MTD_CFI_B4=y
# CONFIG_MTD_CFI_I1 is not set
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0xFFC00000
CONFIG_MTD_PHYSMAP_LEN=0x00400000
CONFIG_MTD_PHYSMAP_BUSWIDTH=4
# CONFIG_MTD_NORA is not set
# CONFIG_MTD_PNC2000 is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_SC520CDP is not set
# CONFIG_MTD_SA1100 is not set
# CONFIG_MTD_DC21285 is not set
# CONFIG_MTD_IQ80310 is not set
# CONFIG_MTD_CSTM_CFI_JEDEC is not set
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_JEDEC is not set
# CONFIG_MTD_ARM is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set

#
# User Modules And Translation Layers
#
# CONFIG_MTD_CHAR is not set
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# Plug and Play configuration
#
# CONFIG_PNP is not set

#
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
CONFIG_BLK_DEV_LOOP=y
# CONFIG_BLK_DEV_NBD is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_BLK_DEV_INITRD=y

#
# Multi-device support (RAID and LVM)
#
# CONFIG_MD is not set

#
# Networking options
#
# CONFIG_PACKET is not set
CONFIG_NETLINK=y
# CONFIG_RTNETLINK is not set
# CONFIG_NETLINK_DEV is not set
# CONFIG_NETFILTER is not set
# CONFIG_FILTER is not set
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_BOOTP=y
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_INET_ECN is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_IPV6 is not set
# CONFIG_KHTTPD is not set
# CONFIG_ATM is not set

#
#  
#
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_DECNET is not set
# CONFIG_BRIDGE is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_LLC is not set
# CONFIG_NET_DIVERT is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_NET_FASTROUTE is not set
# CONFIG_NET_HW_FLOWCONTROL is not set

#
# QoS and/or fair queueing
#
# CONFIG_NET_SCHED is not set

#
# ATA/IDE/MFM/RLL support
#
# CONFIG_IDE is not set
# CONFIG_BLK_DEV_IDE_MODES is not set
# CONFIG_BLK_DEV_HD is not set

#
# SCSI support
#
# CONFIG_SCSI is not set

#
# Network device support
#
CONFIG_NETDEVICES=y

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_TUN is not set
# CONFIG_ETHERTAP is not set
# CONFIG_NET_SB1000 is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=y
# CONFIG_MACE is not set
# CONFIG_BMAC is not set
# CONFIG_GMAC is not set
# CONFIG_NCR885E is not set
# CONFIG_OAKNET is not set
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_SMC is not set
# CONFIG_NET_VENDOR_RACAL is not set
# CONFIG_AT1700 is not set
# CONFIG_DEPCA is not set
# CONFIG_NET_PCI is not set
# CONFIG_NET_POCKET is not set

#
# Ethernet (1000 Mbit)
#
# CONFIG_ACENIC_OMIT_TIGON_I is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
CONFIG_PPP=y
# CONFIG_PPP_MULTILINK is not set
# CONFIG_PPP_ASYNC is not set
# CONFIG_PPP_SYNC_TTY is not set
# CONFIG_PPP_DEFLATE is not set
# CONFIG_PPP_BSDCOMP is not set
# CONFIG_PPPOE is not set
# CONFIG_SLIP is not set

#
# Wireless LAN (non-hamradio)
#
# CONFIG_NET_RADIO is not set

#
# Token Ring devices
#
# CONFIG_TR is not set
# CONFIG_NET_FC is not set
# CONFIG_SHAPER is not set

#
# Wan interfaces
#
# CONFIG_WAN is not set

#
# Amateur Radio support
#
# CONFIG_HAMRADIO is not set

#
# IrDA (infrared) support
#
# CONFIG_IRDA is not set

#
# ISDN subsystem
#
# CONFIG_ISDN is not set

#
# Old CD-ROM drivers (not SCSI, not IDE)
#
# CONFIG_CD_NO_IDESCSI is not set

#
# Console drivers
#

#
# Frame-buffer support
#
# CONFIG_FB is not set

#
# Input core support
#
# CONFIG_INPUT is not set

#
# Macintosh device drivers
#

#
# Character devices
#
# CONFIG_VT is not set
CONFIG_SERIAL=y
CONFIG_SERIAL_CONSOLE=y
CONFIG_SERIAL_EXTENDED=y
# CONFIG_SERIAL_MANY_PORTS is not set
CONFIG_SERIAL_SHARE_IRQ=y
# CONFIG_SERIAL_DETECT_IRQ is not set
# CONFIG_SERIAL_MULTIPORT is not set
# CONFIG_HUB6 is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_UNIX98_PTYS=y
CONFIG_UNIX98_PTY_COUNT=256

#
# I2C support
#
# CONFIG_I2C is not set

#
# Mice
#
# CONFIG_BUSMOUSE is not set
# CONFIG_MOUSE is not set

#
# Joysticks
#

#
# Game port support
#

#
# Gameport joysticks
#

#
# Serial port support
#

#
# Serial port joysticks
#

#
# Parallel port joysticks
#

#
#   Parport support is needed for parallel port joysticks
#
# CONFIG_QIC02_TAPE is not set

#
# Watchdog Cards
#
# CONFIG_WATCHDOG is not set
# CONFIG_NVRAM is not set
# CONFIG_RTC is not set
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
# CONFIG_AGP is not set
# CONFIG_DRM is not set

#
# Multimedia devices
#
# CONFIG_VIDEO_DEV is not set

#
# File systems
#
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_FAT_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_JFFS_FS=y
CONFIG_JFFS_FS_VERBOSE=3
# CONFIG_CRAMFS is not set
# CONFIG_RAMFS is not set
# CONFIG_ISO9660_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=y
# CONFIG_DEVFS_FS is not set
CONFIG_DEVPTS_FS=y
# CONFIG_QNX4FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=y
# CONFIG_SYSV_FS is not set
# CONFIG_UDF_FS is not set
# CONFIG_UFS_FS is not set

#
# Network File Systems
#
# CONFIG_CODA_FS is not set
CONFIG_NFS_FS=y
# CONFIG_NFS_V3 is not set
CONFIG_ROOT_NFS=y
# CONFIG_NFSD is not set
CONFIG_SUNRPC=y
CONFIG_LOCKD=y
# CONFIG_SMB_FS is not set
# CONFIG_NCP_FS is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
# CONFIG_SMB_NLS is not set
# CONFIG_NLS is not set

#
# Sound
#
# CONFIG_SOUND is not set

#
# MPC8xx CPM Options
#
# CONFIG_ENET_BIG_BUFFERS is not set
# CONFIG_8xxSMC2 is not set
# CONFIG_8xxSCC is not set

#
# Generic MPC8xx Options
#
# CONFIG_8xx_COPYBACK is not set
# CONFIG_8xx_CPU6 is not set

#
# USB support
#
# CONFIG_USB is not set

#
# Kernel hacking
#
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_KGDB is not set
# CONFIG_XMON is not set

Debug output with some extra "KMW - ..." printk's:

loaded at:     FFC20000 FFC2E580
relocated to:  00400000 0040E580
board data at: 004001C4 004001E0
relocated to:  00300100 0030011C
zimage at:     FFC2D000 FFCB1D1F
avail ram:     00301000 01000000

Linux/PPC load:
Uncompressing Linux...done.
Now booting the kernel
Linux version 2.4.3 pre3 (administrator@GREYLOCK) (gcc version 2.95.2
19991024 (release)) #375 Thu Apr 12 12:14:40 2001
On node 0 totalpages: 4096
zone(0): 4096 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/nfs rw
Decrementer Frequency = 232500000/60
Warning: real time clock seems stuck!
Calibrating delay loop... 61.64 BogoMIPS
Memory: 14504k available (992k kernel code, 512k data, 52k init, 0k highmem)
Dentry-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 1024 (order: 1, 8192 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
CPM UART driver version 0.03
ttyS00 at 0x0280 is a SMC
pty: 256 Unix98 ptys configured
block: queued sectors max/low 9557kB/3185kB, 64 slots per queue
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
eth0: CPM ENET Version 0.2 on SCC1, 00:50:83:f0:10:1b
JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
loop: loaded (max 8 devices)
Serial driver version 5.05 (2000-12-13) with SHARE_IRQ enabled
ttyS04 at 0xf1200000 (irq = 22) is a 16550A
ttyS05 at 0xf1200008 (irq = 25) is a 16550A
ttyS06 at 0xf1200010 (irq = 26) is a 16550A
ttyS07 at 0xf1200018 (irq = 27) is a 16550A
PPP generic driver version 2.4.1
physmap flash device: 400000 at ffc00000
KMW - cfi_probe
KMW - cfi_cfi_probe
KMW - cfi_probe_new_chip
KMW - cfi_probe_chip
KMW - cfi_probe_chip_1
KMW - cfi_qry_mode(0)
cfi_check_qry_or_id: base=0x00000000 interl=2 type=2 index=-1
Physically mapped flash: Found 2 x16 devices at 0x0 in 32-bit mode
Number of erase regions: 2
  Erase Region #0: BlockSize 0x2000 bytes, 8 blocks
  Erase Region #1: BlockSize 0x10000 bytes, 31 blocks
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
No Vpp line
Typical byte/word write timeout: 16 5s
Maximum byte/word write timeout: 512 5s
Full buffer write not supported
Typical block erase timeout: 1024 5s
Maximum block erase timeout: 16384 5s
Chip erase not supported
Device size: 0x200000 bytes (2 Mb)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
KMW - cfi_qry_mode(0)
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
Physically mapped flash: Swapping erase regions for broken CFI table.
number of CFI chips: 1
KMW - mtd size: 400000
0: offset=0x0,size=0x131072,blocks=31
1: offset=0x4063232,size=0x16384,blocks=8
mtd: Giving out device 0 to CRIND bootloader
mtd: Giving out device 1 to CRIND compressed kernel image
mtd: Giving out device 2 to CRIND Linux jffs filesystem
mtd: Giving out device 3 to Manufacturing Data sector and filesize info
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 1024)
pointless? printk delay before icmp_init is called...otherwise it hangs here
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 192.168.60.2, my address is 192.168.60.12
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
!!!Monochrome: Init() called - Starting Monochrome Driver!!!
Monochrome side 0 display not detected.
Monochrome side 1 display not detected.
Monochrome side A display Monochrome side 0 display not detected.
not found.
Monochrome side B display Monochrome side 1 display not detected.
not found.
LonPort Device Initialized
ngdvideoA: error: PCI BIOS not found
ngdvideoA: error: side A failed to initialize
ngdvideoB: error: PCI BIOS not found
ngdvideoB: error: side B failed to initialize
Looking up port of RPC 100003/2 on 192.168.60.2
Looking up port of RPC 100005/2 on 192.168.60.2
VFS: Mounted root (nfs filesystem).



-----Original Message-----
From: Williams, Kevin M. [mailto:kevin.m.williams@marconi.com]
Sent: Friday, April 06, 2001 4:46 PM
To: 'mtd@infradead.org'
Subject: using a portion of a FLASH device as FTL?


Hello again,

I've figured out why FTL wasn't finding the header.  It was looking at the
bottom section of the flash for the FTL data structure ("FTL100").  We store
our bootloader and some other code at the base of the FLASH.  I need to only
use part of the FLASH as FTL, the rest I want to leave alone.  The Flash
chips (AMD29DL162, ) are detected properly by the CFI probe at location
0xFFC00000 thru 0xFFFFFFFF, but I only want the FTL to use from 0xFFF20000
to FFFE0000. 

I can't see anywhere in the code where provisions for this have been added.
Any advice on modifying the existing code to accomplish this?

I know I'm a newbie, so if no one wants to reply, I'll go away, have a good
cry, and figure it out slowly on my own.

Kevin Williams

> -----Original Message-----
> From:	Williams, Kevin M. 
> Sent:	Thursday, April 05, 2001 4:44 PM
> To:	'mtd@infradead.org'
> Subject:	FTL header not found?
> 
> Hello,
> 
> I am a Linux newbie porting Linux 2.4.3 to a custom embedded PowerPC 860
> board.   I have replaced my drivers/mtd and include/linux/mtd directories
> with what's in the latest mtd snapshot off the FTP site (20010404).  I am
> not trying to do anything real fancy or cutting edge, I just want to be
> able to mount my onboard AMD flash chips as an ext2 filesystem.
> 
> The cfi_probe code in the latest mtd patch seems to identify the chips and
> configuration (coupled pair in 16 bit mode), but scan_header() in ftl.c
> seems to read incorrectly when searching for the ftl header (it doesn't
> find one...see output below).   The kernel builds and boots, but I get an
> ftl error (header not found) during boot up, and I can't mount the flash.
> I get:
> 
> 192.168.60.12:/> mount -t ext2 /dev/ftla /flash
> bad area!!
> bad area!!
> mount: /dev/ftla has wrong device number or fs type ext2 not supported
> 
> ls -l on the /dev directory shows:
> crwxr-xr-x   1 root     root      60,   0 Oct  2  2000 flash0
> brwxr-xr-x   1 root     root      44,   0 Oct  2  2000 ftla
> 
> This same hardware currently runs a hacked up version of 2.2.13 with some
> flash code merged in that has ftl and cfi functionality, but not as mtd,
> just as a device.
> 
> I'm guessing either the read routine isn't big-endian supported, or I
> don't need to find the ftl header and my problem is really elsewhere, or I
> am just doing something stupid.
> 
> Is there a HOWTO or other documentation on any of this?  
> 
> Thanks in advance for any help or ideas.
> 
> Kevin Williams
> Marconi Commerce Systems
> 
> relevant portion of debug output.............
> physmap flash device: 400000 at ffc00000
> Physically mapped flash: Found 2 x16 devices at 0x0 in 32-bit mode
>  Amd/Fujitsu Extended Query Table v1.1 at 0x0040
> Physically mapped flash: Swapping erase regions for broken CFI table.
> number of CFI chips: 1
> 0: offset=0x0,size=0x20000,blocks=31
> 1: offset=0x3e0000,size=0x4000,blocks=8
> mtd: Giving out device 0 to Physically mapped flash
> $Id: ftl.c,v 1.28 2001/03/17 17:10:21 dwmw2 Exp $
> ftl_cs: FTL header not found.
> NET4: Linux TCP/IP 1.0 for NET4.0...
> 
> .config MTD settings:
> #
> # Memory Technology Devices (MTD)
> #
> CONFIG_MTD=y
> CONFIG_MTD_DEBUG=y
> CONFIG_MTD_DEBUG_VERBOSE=3
> 
> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOC1000 is not set
> # CONFIG_MTD_DOC2000 is not set
> # CONFIG_MTD_DOC2001 is not set
> # CONFIG_MTD_DOCPROBE is not set
> 
> #
> # RAM/ROM Device Drivers
> #
> # CONFIG_MTD_SLRAM is not set
> # CONFIG_MTD_RAM is not set
> # CONFIG_MTD_ROM is not set
> # CONFIG_MTD_MTDRAM is not set
> 
> #
> # Linearly Mapped Flash Device Drivers
> #
> CONFIG_MTD_CFI=y
> # CONFIG_MTD_CFI_VIRTUAL_ER is not set
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> # CONFIG_MTD_CFI_INTELEXT is not set
> CONFIG_MTD_CFI_AMDSTD=y
> # CONFIG_MTD_AMDSTD is not set
> # CONFIG_MTD_SHARP is not set
> CONFIG_MTD_PHYSMAP=y
> CONFIG_MTD_PHYSMAP_START=0xFFC00000
> CONFIG_MTD_PHYSMAP_LEN=0x00400000
> CONFIG_MTD_PHYSMAP_BUSWIDTH=4
> # CONFIG_MTD_NORA is not set
> # CONFIG_MTD_PNC2000 is not set
> # CONFIG_MTD_RPXLITE is not set
> # CONFIG_MTD_SC520CDP is not set
> # CONFIG_MTD_SA1100 is not set
> # CONFIG_MTD_DC21285 is not set
> # CONFIG_MTD_IQ80310 is not set
> # CONFIG_MTD_CSTM_CFI_JEDEC is not set
> # CONFIG_MTD_CFI_FLAGADM is not set
> # CONFIG_MTD_JEDEC is not set
> # CONFIG_MTD_ARM is not set
> 
> #
> # NAND Flash Device Drivers
> #
> # CONFIG_MTD_NAND is not set
> 
> #
> # User Modules And Translation Layers
> #
> # CONFIG_MTD_CHAR is not set
> # CONFIG_MTD_BLOCK is not set
> # CONFIG_MTD_BLOCK_RO is not set
> CONFIG_FTL=y
> # CONFIG_NFTL is not set
> 
> 


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
