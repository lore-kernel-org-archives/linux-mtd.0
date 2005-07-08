Received: from fall-curlleaf.atl.sa.earthlink.net ([207.69.195.105])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dr0jm-0004nj-Vu
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2005 17:50:25 -0400
Received: from pop-canoe.atl.sa.earthlink.net ([207.69.195.66])
	by fall-curlleaf.atl.sa.earthlink.net with esmtp (Exim 3.36 #4)
	id 1Dqzso-00075s-00
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2005 16:55:38 -0400
Received: from ar56.lsanca1-4.16.254.159.lsanca1.elnk.dsl.genuity.net
	([4.16.254.159] helo=gregs875)
	by pop-canoe.atl.sa.earthlink.net with smtp (Exim 3.36 #10)
	id 1DqzsZ-0000Dg-00
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2005 16:55:24 -0400
From: "Greg Lindberg" <gl4jalopi@earthlink.net>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 8 Jul 2005 13:59:49 -0700
Message-ID: <MPEAJFOFNNOAIMOHBACICEIOEBAA.gl4jalopi@earthlink.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Configure in Linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to move an embedded system based on an Intel PXA255 from the 2.4
kernel to the 2.6 kernel.  I've gotten to the point that the MTD system is
recognizing the partition and adding it to the system.  When I try to mount
it using the Linux command line option 'root=/dev/mtd0' I get an error.
Here is the output from the Linux start up:

Linux version 2.6.11.9 (greg@rh9dev) (gcc version 3.3.4) #45 Fri Jul 8
12:50:05 PDT 2005
CPU: XScale-PXA255 [69052d06] revision 6 (ARMv5TE)
CPU0: D VIVT undefined 5 cache
CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
Machine: InHand Electronics Fingertip3
Memory policy: ECC disabled, Data cache writeback
Memory clock: 99.53MHz (*27)
Run Mode clock: 199.07MHz (*2)
Turbo Mode clock: 199.07MHz (*1.0, inactive)
Built 1 zonelists
Kernel command line: console=ttyS0,38400 noinitrd root=/dev/mtd0 rw
init=/bin/bash
PID hash table entries: 128 (order: 7, 2048 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Memory: 16MB = 16MB total
Memory: 14776KB available (1091K code, 239K data, 56K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
Linux NoNET1.0 for Linux 2.6
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
ttyS0 at MMIO 0x40100000 (irq = 15) is a FFUART
ttyS1 at MMIO 0x40200000 (irq = 14) is a BTUART
ttyS2 at MMIO 0x40700000 (irq = 13) is a STUART
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
Probing InHand Fingertip3 flash at physical address 0x00000000
InHand Linux Flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Using static partition definition
Creating 1 MTD partitions on "InHand Linux Flash":
0x00160000-0x02000000 : "ihfs"
mtd: Giving out device 0 to ihfs
mice: PS/2 mouse device common for all mice
i2c /dev entries driver
VFS: Cannot open root device "mtd0" or unknown-block(0,0)
Please append a correct "root=" boot option
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

Here are the relevant portions of the .config file: (I've removed all of not
set variables)

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y

#
# User Modules And Translation Layers
#
# nothing is set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_UTIL=y

#
# Mapping drivers for chip access
#
CONFIG_MTD_INHANDFTIP3=y
# nothing else is set

#
# Self-contained MTD device drivers
#
# nothing is set

#
# Disk-On-Chip Device Drivers
#
# nothing is set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set

#
# Miscellaneous filesystems
#
# CONFIG_JFFS_FS is not set
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=2
CONFIG_JFFS2_FS_WRITEBUFFER=y
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
# CONFIG_JFFS2_RUBIN is not set

I'm obviously missing something in the configuration for mtd and jffs2.
Any help that anyone could give would be greatly appreciated.

Greg Wilson-Lindberg

;Secrecy, being an instrument of conspiracy, ought never to be the system of
;a regular government. -Jeremy Bentham, jurist and philosopher (1748-1832)
