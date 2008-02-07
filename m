Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JN9P2-0001kr-Vy
	for linux-mtd@lists.infradead.org; Thu, 07 Feb 2008 16:15:17 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JN9Ow-0002KZ-Pp
	for linux-mtd@lists.infradead.org; Thu, 07 Feb 2008 16:15:02 +0000
Received: from 82-135-208-232.ip.zebra.lt ([82.135.208.232])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2008 16:15:02 +0000
Received: from augulis.darius by 82-135-208-232.ip.zebra.lt with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2008 16:15:02 +0000
To: linux-mtd@lists.infradead.org
From: Darius <augulis.darius@gmail.com>
Subject: Problem: Can't mount jffs2 filesystem
Date: Thu, 07 Feb 2008 18:08:40 +0200
Message-ID: <fofaee$hdc$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-13; format=flowed
Content-Transfer-Encoding: 8bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have ARM920T board with two 128M 16bit NOR FLASH devices configured as 
one 256M 32bit device. I want to mount my root filesystem (jffs2) at 
boot time. There is boot log of my 2.6.24 vanilla kernel:

[    0.000000] Linux version 2.6.24 (Darius@localhost.localdomain) (gcc 
version 4.0.2) #19 Thu Feb 7 16:55:32 EET 2008
[    0.000000] CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=00003177
[    0.000000] Machine: Motorola MX1ADS
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] On node 0 totalpages: 16384
[    0.000000]   DMA zone: 128 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 16256 pages, LIFO batch:3
[    0.000000]   Normal zone: 0 pages used for memmap
[    0.000000]   Movable zone: 0 pages used for memmap
[    0.000000] CPU0: D VIVT write-back cache
[    0.000000] CPU0: I cache: 16384 bytes, associativity 64, 32 byte 
lines, 8 sets
[    0.000000] CPU0: D cache: 16384 bytes, associativity 64, 32 byte 
lines, 8 sets
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on. 
Total pages: 16256
[    0.000000] Kernel command line: 
mtdparts=physmap-flash.0:128k,2M(kernel),-(rootfs) root=/dev/mtdblock2 
rootfstype=jffs2 ro debug ignore_loglevel
[    0.000000] debug: ignoring loglevel setting.
[    0.000000] PID hash table entries: 256 (order: 8, 1024 bytes)
[    0.000000] console [ttySMX0] enabled
[    0.010000] Dentry cache hash table entries: 8192 (order: 3, 32768 
bytes)
[    0.010000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.030000] Memory: 64MB = 64MB total
[    0.030000] Memory: 63536KB available (1164K code, 103K data, 76K init)
[    0.040000] Calibrating delay loop... 47.92 BogoMIPS (lpj=239616)
[    0.230000] Mount-cache hash table entries: 512
[    0.230000] CPU: Testing write buffer coherency: ok
[    0.270000] Time: imx_timer1 clocksource has been installed.
[    0.280000] VFS: Disk quotas dquot_6.5.1
[    0.290000] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.300000] JFFS2 version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
[    0.300000] Allocated 270656 bytes for deflate workspace
[    0.310000] Allocated 42284 bytes for inflate workspace
[    0.310000] Registering JFFS2 compressor "zlib"
[    0.320000] Compressor "zlib", prio 60
[    0.320000] Registering JFFS2 compressor "rtime"
[    0.330000] Compressor "zlib", prio 60
[    0.330000] Compressor "rtime", prio 50
[    0.340000] JFFS2: default compression mode: priority
[    0.340000] fuse init (API version 7.9)
[    0.350000] io scheduler noop registered
[    0.350000] io scheduler anticipatory registered
[    0.360000] io scheduler deadline registered
[    0.360000] io scheduler cfq registered (default)
[    0.370000] Serial: IMX driver
[    0.370000] imx-uart.0: ttySMX0 at MMIO 0xe0006000 (irq = 30) is a IMX
[    0.380000] imx-uart.1: ttySMX1 at MMIO 0xe0007000 (irq = 24) is a IMX
[    0.410000] RAMDISK driver initialized: 16 RAM disks of 4096K size 
1024 blocksize
[    0.420000] physmap platform flash device: 02000000 at 10000000
[    0.430000] physmap-flash.0: Found 2 x16 devices at 0x0 in 32-bit bank
[    0.440000]  Amd/Fujitsu Extended Query Table at 0x0040
[    0.440000] physmap-flash.0: CFI does not contain boot bank location. 
Assuming top.
[    0.450000] number of CFI chips: 1
[    0.450000] cfi_cmdset_0002: Disabling erase-suspend-program due to 
code brokenness.
[    0.460000] 3 cmdlinepart partitions found on MTD device physmap-flash.0
[    0.470000] Creating 3 MTD partitions on "physmap-flash.0":
[    0.470000] 0x00000000-0x00020000 : "Partition_000"
[    0.480000] mtd: Giving out device 0 to Partition_000
[    0.480000] 0x00020000-0x00220000 : "kernel"
[    0.490000] mtd: Giving out device 1 to kernel
[    0.490000] 0x00220000-0x02000000 : "rootfs"
[    0.500000] mtd: Giving out device 2 to rootfs
[    0.500000] block2mtd: version $Revision: 1.30 $
[    0.510000] MTDSB: dev_name "/dev/root"
[    0.510000] MTDSB: path_lookup() returned 0, inode c3c69554
[    0.520000] List of all partitions:
[    0.520000] No filesystem could mount root, tried:  jffs2
[    0.530000] Kernel panic - not syncing: VFS: Unable to mount root fs 
on unknown-block(0,0)

Why VFS can't open mtdblock2? I have enabled such settings like block 
layer, all pseudo filesystems, jffs2 filesystem. All things are built in 
kernel, nothing as module.
I need hint how to access my root filesystem. Below is MTD driver config:

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set
# CONFIG_FW_LOADER is not set
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_SYS_HYPERVISOR is not set
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_CONCAT=y
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y
# CONFIG_MTD_AFS_PARTS is not set

#
# User Modules And Translation Layers
#
# CONFIG_MTD_CHAR is not set
# CONFIG_MTD_BLKDEVS is not set
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set
# CONFIG_MTD_OOPS is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
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
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_XIP is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0x10000000
CONFIG_MTD_PHYSMAP_LEN=0x2000000
CONFIG_MTD_PHYSMAP_BANKWIDTH=4
# CONFIG_MTD_ARM_INTEGRATOR is not set
# CONFIG_MTD_IMPA7 is not set
# CONFIG_MTD_PLATRAM is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
CONFIG_MTD_BLOCK2MTD=y

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set
# CONFIG_MTD_NAND is not set
# CONFIG_MTD_ONENAND is not set

#
# UBI - Unsorted block images
#
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_RESERVE=1
CONFIG_MTD_UBI_GLUEBI=y

#
# UBI debugging options
#
CONFIG_MTD_UBI_DEBUG=y
CONFIG_MTD_UBI_DEBUG_MSG=y
# CONFIG_MTD_UBI_DEBUG_PARANOID is not set
# CONFIG_MTD_UBI_DEBUG_DISABLE_BGT is not set
# CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is not set
# CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS is not set
# CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES is not set
# CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES is not set

#
# Additional UBI debugging messages
#
CONFIG_MTD_UBI_DEBUG_MSG_BLD=y
CONFIG_MTD_UBI_DEBUG_MSG_EBA=y
CONFIG_MTD_UBI_DEBUG_MSG_WL=y
CONFIG_MTD_UBI_DEBUG_MSG_IO=y
# CONFIG_PARPORT is not set
# CONFIG_PNP is not set
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_COW_COMMON is not set
# CONFIG_BLK_DEV_LOOP is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_BLK_DEV_RAM_BLOCKSIZE=1024
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_MISC_DEVICES is not set


All info about MTD and jffs2 is very welcome!

Darius.
