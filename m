Received: from 210-54-242-124.adsl.xtra.co.nz ([210.54.242.124]
	helo=openmail.open.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195IJ0-0007z0-9r
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 05:44:26 +0100
Message-ID: <DEA23DB61B62D4118B5900508B323B840105552F@OPENMAIL>
From: Jeremy Bowen <Jeremy.Bowen@opennw.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 15 Apr 2003 16:40:42 +1200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Unable to write to some JFFS partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I'm having some difficulty with JFFS filesystems on my PPC Embedded Planet
RPXlite 850 board. I have 8Mb of AMD29LV160BB flash arranged as a single
bank made up of 4 flash chips.

I'm running unpatched Linux v2.4.20 from kernel.org

My flash partitions are described as folows:

bash-2.05# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00010000 00010000 "environment"
mtd1: 00010000 00008000 "spare"
mtd2: 00020000 00020000 "FPGA"
mtd3: 00440000 00040000 "user"
mtd4: 00100000 00040000 "kernel"
mtd5: 00180000 00040000 "initrd"
mtd6: 00040000 00040000 "u-boot"
mtd7: 000c0000 00040000 "jffs"

I am able to successfully mount and use the "user" partition but I am unable
to write to either the "spare" or "jffs" partitions.

The following is with /dev/mtdblock/1 mounted:

bash-2.05# date > /mnt/jffs/date.txt
jffs_create(): dir: 0xc0a840f0, name: "date.txt"
jffs_write_node(): filename = "date.txt", ino = 2, total_size = 68
jffs_create(): jffs_write_node() failed.
bash: /mnt/jffs/date.txt: No space left on device


I can however write to the character device:
bash-2.05# date > /dev/mtd/1
bash-2.05# hexdump /dev/mtd/1
0000000 5765 6420 4175 6720 3139 2031 343a 3130
0000010 3a35 3320 2f65 7463 2f6c 6f63 616c 7469
0000020 6d65 2032 3031 350a ffff ffff ffff ffff
0000030 ffff ffff ffff ffff ffff ffff ffff ffff
*
0010000

(I'm erasing these partitions externally as "eraseall" simply doesn't work.
See below)

With my limited understanding of JFFS I'm beginning to think that I need
more than 2 empty sectors on the flash chips if I want to use a JFFS
filesystem. The "spare" partition is made up of 2 x 16k sectors and the
"jffs" partition is made up of 3 x 256k sectors.

Can someone please confirm if this is useable or do I need more
free/unallocated sectors before I can use JFFS.

I'm also unable to "eraseall" any partitions. I get the following error:
bash-2.05# eraseall /dev/mtdblock/3
eraseall: /dev/mtdblock/3: unable to get MTD device info

Thanks in advance.
Jeremy Bowen
OPEN Networks Ltd
Wellington
New Zealand


Some (possibly) useful information from my boot console....

JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications
AB.
...
...
RPX Lite or CLLF flash device: 2000000 at fe000000
 Amd/Fujitsu Extended Query Table v1.0 at 0x0040
number of CFI chips: 1
RPX flash: Using partition definitions
Creating 8 MTD partitions on "RPX":
0x00000000-0x00010000 : "environment"
mtd: Giving out device 0 to environment
0x00010000-0x00020000 : "spare"
mtd: Giving out device 1 to spare
0x00020000-0x00040000 : "FPGA"
mtd: Giving out device 2 to FPGA
0x00040000-0x00480000 : "user"
mtd: Giving out device 3 to user
0x00480000-0x00580000 : "kernel"
mtd: Giving out device 4 to kernel
0x00580000-0x00700000 : "initrd"
mtd: Giving out device 5 to initrd
0x00700000-0x00740000 : "u-boot"
mtd: Giving out device 6 to u-boot
0x00740000-0x00800000 : "jffs"
mtd: Giving out device 7 to jffs
$Id: ftl.c,v 1.43 2002/02/13 15:31:37 dwmw2 Exp $
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
