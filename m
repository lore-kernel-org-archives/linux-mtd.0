Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ApiCB-0005iA-NY
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 06:13:31 +0000
Received: from 192.168.1.100 (bluefire.joshuawise.com [192.168.1.100])
	810C0FB63	for <linux-mtd@lists.infradead.org>;
	Sun,  8 Feb 2004 01:13:40 -0500 (EST)
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Sun, 8 Feb 2004 01:13:24 -0500
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200402080113.36039.joshua@joshuawise.com>
Subject: JFFS2 NAND support - Mount failure on "good" filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,

I am trying to get NAND flash working on the ipaq h1910.

The NAND part is a BGA Samsung K9F2808U0B.

I have programmed what should be a good image onto the device using a combi=
nation of erasemtd which I have ported to LAB - Linux As Bootldr, and the n=
and: device target in LAB with the jffs2 option, which is basically a port =
of nandwrite. Last time I read through this I remembered something about su=
bsequent pages of OOB data not automatically being stepped through by the N=
AND chip, as was expected by the driver, however I did not know too much ab=
out this at the time.

Anyway, I will cut to the chase and give you the debug messages which JFFS2=
 spewed into the kernel log when I had debug level 1 enabled.

Some things to notice are the slowly incrementing failcounts.

Apologies for the big email, but sometimes people think it's necessary to s=
ee a whole log, so I didn't take chances :)

joshua

>>> Debug message from user: starting mount of /dev/mtdblock/1 on /mnt now.=
=2E /dev/mtdblock/1 is the aforementioned nand filesystem=20
<7>jffs2_get_sb(): dev_name "/dev/mtdblock/1"
<7>jffs2_get_sb(): path_lookup() returned 0, inode c9f411c0
<7>jffs2_get_sb_mtd(): New superblock for device 1 ("h1910 NAND Flash")
<7>JFFS2 using software ECC
<7>Allocating readbuf of 16384 bytes
<7>jffs2_scan_eraseblock(): Scanning block at 0x0
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00000000, fail=
 count:175
<5>JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00004000, fail=
 count:0
<5>JFFS2: Erase block at 0x00004000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00008000, fail=
 count:0
<5>JFFS2: Erase block at 0x00008000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0000c000, fail=
 count:0
<5>JFFS2: Erase block at 0x0000c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x10000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00010000, fail=
 count:0
<5>JFFS2: Erase block at 0x00010000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x14000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00014000, fail=
 count:0
<5>JFFS2: Erase block at 0x00014000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x18000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00018000, fail=
 count:0
<5>JFFS2: Erase block at 0x00018000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0001c000, fail=
 count:0
<5>JFFS2: Erase block at 0x0001c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x20000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00020000, fail=
 count:1
<5>JFFS2: Erase block at 0x00020000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x24000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00024000, fail=
 count:1
<5>JFFS2: Erase block at 0x00024000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x28000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00028000, fail=
 count:1
<5>JFFS2: Erase block at 0x00028000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0002c000, fail=
 count:1
<5>JFFS2: Erase block at 0x0002c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x30000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00030000, fail=
 count:1
<5>JFFS2: Erase block at 0x00030000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x34000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00034000, fail=
 count:1
<5>JFFS2: Erase block at 0x00034000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x38000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00038000, fail=
 count:1
<5>JFFS2: Erase block at 0x00038000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0003c000, fail=
 count:1
<5>JFFS2: Erase block at 0x0003c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x40000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00040000, fail=
 count:2
<5>JFFS2: Erase block at 0x00040000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x44000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00044000, fail=
 count:2
<5>JFFS2: Erase block at 0x00044000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x48000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00048000, fail=
 count:2
<5>JFFS2: Erase block at 0x00048000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0004c000, fail=
 count:2
<5>JFFS2: Erase block at 0x0004c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x50000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00050000, fail=
 count:2
<5>JFFS2: Erase block at 0x00050000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x54000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00054000, fail=
 count:2
<5>JFFS2: Erase block at 0x00054000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x58000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00058000, fail=
 count:0
<5>JFFS2: Erase block at 0x00058000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0005c000, fail=
 count:2
<5>JFFS2: Erase block at 0x0005c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x60000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00060000, fail=
 count:3
<5>JFFS2: Erase block at 0x00060000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x64000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00064000, fail=
 count:3
<5>JFFS2: Erase block at 0x00064000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x68000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00068000, fail=
 count:3
<5>JFFS2: Erase block at 0x00068000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0006c000, fail=
 count:3
<5>JFFS2: Erase block at 0x0006c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x70000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00070000, fail=
 count:3
<5>JFFS2: Erase block at 0x00070000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x74000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00074000, fail=
 count:3
<5>JFFS2: Erase block at 0x00074000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x78000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00078000, fail=
 count:3
<5>JFFS2: Erase block at 0x00078000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0007c000, fail=
 count:3
<5>JFFS2: Erase block at 0x0007c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x80000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00080000, fail=
 count:4
<5>JFFS2: Erase block at 0x00080000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x84000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00084000, fail=
 count:4
<5>JFFS2: Erase block at 0x00084000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x88000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00088000, fail=
 count:4
<5>JFFS2: Erase block at 0x00088000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0008c000, fail=
 count:4
<5>JFFS2: Erase block at 0x0008c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x90000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00090000, fail=
 count:4
<5>JFFS2: Erase block at 0x00090000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x94000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00094000, fail=
 count:4
<5>JFFS2: Erase block at 0x00094000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x98000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00098000, fail=
 count:4
<5>JFFS2: Erase block at 0x00098000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0009c000, fail=
 count:4
<5>JFFS2: Erase block at 0x0009c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000a0000, fail=
 count:5
<5>JFFS2: Erase block at 0x000a0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000a4000, fail=
 count:5
<5>JFFS2: Erase block at 0x000a4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000a8000, fail=
 count:5
<5>JFFS2: Erase block at 0x000a8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000ac000, fail=
 count:5
<5>JFFS2: Erase block at 0x000ac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000b0000, fail=
 count:5
<5>JFFS2: Erase block at 0x000b0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000b4000, fail=
 count:5
<5>JFFS2: Erase block at 0x000b4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000b8000, fail=
 count:5
<5>JFFS2: Erase block at 0x000b8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000bc000, fail=
 count:5
<5>JFFS2: Erase block at 0x000bc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000c0000, fail=
 count:6
<5>JFFS2: Erase block at 0x000c0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000c4000, fail=
 count:6
<5>JFFS2: Erase block at 0x000c4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000c8000, fail=
 count:0
<5>JFFS2: Erase block at 0x000c8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000cc000, fail=
 count:6
<5>JFFS2: Erase block at 0x000cc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000d0000, fail=
 count:6
<5>JFFS2: Erase block at 0x000d0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000d4000, fail=
 count:6
<5>JFFS2: Erase block at 0x000d4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000d8000, fail=
 count:4
<5>JFFS2: Erase block at 0x000d8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000dc000, fail=
 count:6
<5>JFFS2: Erase block at 0x000dc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000e0000, fail=
 count:7
<5>JFFS2: Erase block at 0x000e0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000e4000, fail=
 count:7
<5>JFFS2: Erase block at 0x000e4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000e8000, fail=
 count:7
<5>JFFS2: Erase block at 0x000e8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000ec000, fail=
 count:7
<5>JFFS2: Erase block at 0x000ec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000f0000, fail=
 count:7
<5>JFFS2: Erase block at 0x000f0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000f4000, fail=
 count:7
<5>JFFS2: Erase block at 0x000f4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000f8000, fail=
 count:7
<5>JFFS2: Erase block at 0x000f8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 000fc000, fail=
 count:7
<5>JFFS2: Erase block at 0x000fc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x100000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00100000, fail=
 count:8
<5>JFFS2: Erase block at 0x00100000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x104000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00104000, fail=
 count:8
<5>JFFS2: Erase block at 0x00104000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x108000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00108000, fail=
 count:8
<5>JFFS2: Erase block at 0x00108000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x10c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0010c000, fail=
 count:8
<5>JFFS2: Erase block at 0x0010c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x110000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00110000, fail=
 count:48
<5>JFFS2: Erase block at 0x00110000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x114000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00114000, fail=
 count:8
<5>JFFS2: Erase block at 0x00114000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x118000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00118000, fail=
 count:8
<5>JFFS2: Erase block at 0x00118000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x11c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0011c000, fail=
 count:8
<5>JFFS2: Erase block at 0x0011c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x120000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00120000, fail=
 count:9
<5>JFFS2: Erase block at 0x00120000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x124000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00124000, fail=
 count:9
<5>JFFS2: Erase block at 0x00124000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x128000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00128000, fail=
 count:9
<5>JFFS2: Erase block at 0x00128000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x12c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0012c000, fail=
 count:9
<5>JFFS2: Erase block at 0x0012c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x130000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00130000, fail=
 count:9
<5>JFFS2: Erase block at 0x00130000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x134000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00134000, fail=
 count:40
<5>JFFS2: Erase block at 0x00134000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x138000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00138000, fail=
 count:9
<5>JFFS2: Erase block at 0x00138000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x13c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0013c000, fail=
 count:9
<5>JFFS2: Erase block at 0x0013c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x140000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00140000, fail=
 count:10
<5>JFFS2: Erase block at 0x00140000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x144000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00144000, fail=
 count:10
<5>JFFS2: Erase block at 0x00144000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x148000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00148000, fail=
 count:10
<5>JFFS2: Erase block at 0x00148000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x14c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0014c000, fail=
 count:10
<5>JFFS2: Erase block at 0x0014c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x150000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00150000, fail=
 count:10
<5>JFFS2: Erase block at 0x00150000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x154000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00154000, fail=
 count:10
<5>JFFS2: Erase block at 0x00154000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x158000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00158000, fail=
 count:10
<5>JFFS2: Erase block at 0x00158000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x15c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0015c000, fail=
 count:10
<5>JFFS2: Erase block at 0x0015c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x160000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00160000, fail=
 count:11
<5>JFFS2: Erase block at 0x00160000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x164000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00164000, fail=
 count:11
<5>JFFS2: Erase block at 0x00164000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x168000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00168000, fail=
 count:11
<5>JFFS2: Erase block at 0x00168000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x16c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0016c000, fail=
 count:11
<5>JFFS2: Erase block at 0x0016c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x170000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00170000, fail=
 count:11
<5>JFFS2: Erase block at 0x00170000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x174000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00174000, fail=
 count:11
<5>JFFS2: Erase block at 0x00174000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x178000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00178000, fail=
 count:11
<5>JFFS2: Erase block at 0x00178000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x17c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0017c000, fail=
 count:11
<5>JFFS2: Erase block at 0x0017c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x180000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00180000, fail=
 count:12
<5>JFFS2: Erase block at 0x00180000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x184000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00184000, fail=
 count:12
<5>JFFS2: Erase block at 0x00184000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x188000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00188000, fail=
 count:12
<5>JFFS2: Erase block at 0x00188000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x18c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0018c000, fail=
 count:12
<5>JFFS2: Erase block at 0x0018c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x190000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00190000, fail=
 count:48
<5>JFFS2: Erase block at 0x00190000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x194000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00194000, fail=
 count:12
<5>JFFS2: Erase block at 0x00194000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x198000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00198000, fail=
 count:12
<5>JFFS2: Erase block at 0x00198000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x19c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0019c000, fail=
 count:12
<5>JFFS2: Erase block at 0x0019c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1a0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001a0000, fail=
 count:13
<5>JFFS2: Erase block at 0x001a0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1a4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001a4000, fail=
 count:13
<5>JFFS2: Erase block at 0x001a4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1a8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001a8000, fail=
 count:13
<5>JFFS2: Erase block at 0x001a8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1ac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001ac000, fail=
 count:13
<5>JFFS2: Erase block at 0x001ac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1b0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001b0000, fail=
 count:13
<5>JFFS2: Erase block at 0x001b0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1b4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001b4000, fail=
 count:13
<5>JFFS2: Erase block at 0x001b4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1b8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001b8000, fail=
 count:13
<5>JFFS2: Erase block at 0x001b8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1bc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001bc000, fail=
 count:13
<5>JFFS2: Erase block at 0x001bc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1c0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001c0000, fail=
 count:14
<5>JFFS2: Erase block at 0x001c0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1c4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001c4000, fail=
 count:14
<5>JFFS2: Erase block at 0x001c4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1c8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001c8000, fail=
 count:14
<5>JFFS2: Erase block at 0x001c8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1cc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001cc000, fail=
 count:14
<5>JFFS2: Erase block at 0x001cc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1d0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001d0000, fail=
 count:14
<5>JFFS2: Erase block at 0x001d0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1d4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001d4000, fail=
 count:14
<5>JFFS2: Erase block at 0x001d4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1d8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001d8000, fail=
 count:14
<5>JFFS2: Erase block at 0x001d8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1dc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001dc000, fail=
 count:14
<5>JFFS2: Erase block at 0x001dc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1e0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001e0000, fail=
 count:15
<5>JFFS2: Erase block at 0x001e0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1e4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001e4000, fail=
 count:15
<5>JFFS2: Erase block at 0x001e4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1e8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001e8000, fail=
 count:78
<5>JFFS2: Erase block at 0x001e8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1ec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001ec000, fail=
 count:110
<5>JFFS2: Erase block at 0x001ec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1f0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001f0000, fail=
 count:15
<5>JFFS2: Erase block at 0x001f0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1f4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001f4000, fail=
 count:15
<5>JFFS2: Erase block at 0x001f4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1f8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001f8000, fail=
 count:15
<5>JFFS2: Erase block at 0x001f8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x1fc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 001fc000, fail=
 count:15
<5>JFFS2: Erase block at 0x001fc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x200000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00200000, fail=
 count:16
<5>JFFS2: Erase block at 0x00200000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x204000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00204000, fail=
 count:16
<5>JFFS2: Erase block at 0x00204000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x208000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00208000, fail=
 count:16
<5>JFFS2: Erase block at 0x00208000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x20c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0020c000, fail=
 count:16
<5>JFFS2: Erase block at 0x0020c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x210000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00210000, fail=
 count:16
<5>JFFS2: Erase block at 0x00210000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x214000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00214000, fail=
 count:16
<5>JFFS2: Erase block at 0x00214000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x218000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00218000, fail=
 count:16
<5>JFFS2: Erase block at 0x00218000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x21c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0021c000, fail=
 count:16
<5>JFFS2: Erase block at 0x0021c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x220000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00220000, fail=
 count:17
<5>JFFS2: Erase block at 0x00220000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x224000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00224000, fail=
 count:17
<5>JFFS2: Erase block at 0x00224000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x228000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00228000, fail=
 count:17
<5>JFFS2: Erase block at 0x00228000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x22c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0022c000, fail=
 count:17
<5>JFFS2: Erase block at 0x0022c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x230000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00230000, fail=
 count:17
<5>JFFS2: Erase block at 0x00230000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x234000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00234000, fail=
 count:17
<5>JFFS2: Erase block at 0x00234000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x238000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00238000, fail=
 count:17
<5>JFFS2: Erase block at 0x00238000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x23c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0023c000, fail=
 count:17
<5>JFFS2: Erase block at 0x0023c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x240000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00240000, fail=
 count:18
<5>JFFS2: Erase block at 0x00240000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x244000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00244000, fail=
 count:192
<5>JFFS2: Erase block at 0x00244000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x248000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00248000, fail=
 count:18
<5>JFFS2: Erase block at 0x00248000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x24c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0024c000, fail=
 count:18
<5>JFFS2: Erase block at 0x0024c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x250000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00250000, fail=
 count:18
<5>JFFS2: Erase block at 0x00250000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x254000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00254000, fail=
 count:18
<5>JFFS2: Erase block at 0x00254000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x258000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00258000, fail=
 count:18
<5>JFFS2: Erase block at 0x00258000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x25c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0025c000, fail=
 count:18
<5>JFFS2: Erase block at 0x0025c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x260000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00260000, fail=
 count:19
<5>JFFS2: Erase block at 0x00260000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x264000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00264000, fail=
 count:19
<5>JFFS2: Erase block at 0x00264000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x268000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00268000, fail=
 count:19
<5>JFFS2: Erase block at 0x00268000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x26c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0026c000, fail=
 count:19
<5>JFFS2: Erase block at 0x0026c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x270000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00270000, fail=
 count:19
<5>JFFS2: Erase block at 0x00270000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x274000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00274000, fail=
 count:19
<5>JFFS2: Erase block at 0x00274000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x278000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00278000, fail=
 count:19
<5>JFFS2: Erase block at 0x00278000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x27c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0027c000, fail=
 count:19
<5>JFFS2: Erase block at 0x0027c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x280000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00280000, fail=
 count:20
<5>JFFS2: Erase block at 0x00280000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x284000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00284000, fail=
 count:20
<5>JFFS2: Erase block at 0x00284000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x288000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00288000, fail=
 count:20
<5>JFFS2: Erase block at 0x00288000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x28c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0028c000, fail=
 count:20
<5>JFFS2: Erase block at 0x0028c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x290000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00290000, fail=
 count:20
<5>JFFS2: Erase block at 0x00290000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x294000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00294000, fail=
 count:20
<5>JFFS2: Erase block at 0x00294000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x298000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00298000, fail=
 count:20
<5>JFFS2: Erase block at 0x00298000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x29c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0029c000, fail=
 count:238
<5>JFFS2: Erase block at 0x0029c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2a0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002a0000, fail=
 count:36
<5>JFFS2: Erase block at 0x002a0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2a4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002a4000, fail=
 count:21
<5>JFFS2: Erase block at 0x002a4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2a8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002a8000, fail=
 count:21
<5>JFFS2: Erase block at 0x002a8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2ac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002ac000, fail=
 count:21
<5>JFFS2: Erase block at 0x002ac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2b0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002b0000, fail=
 count:21
<5>JFFS2: Erase block at 0x002b0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2b4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002b4000, fail=
 count:21
<5>JFFS2: Erase block at 0x002b4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2b8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002b8000, fail=
 count:21
<5>JFFS2: Erase block at 0x002b8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2bc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002bc000, fail=
 count:21
<5>JFFS2: Erase block at 0x002bc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2c0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002c0000, fail=
 count:22
<5>JFFS2: Erase block at 0x002c0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2c4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002c4000, fail=
 count:22
<5>JFFS2: Erase block at 0x002c4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2c8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002c8000, fail=
 count:22
<5>JFFS2: Erase block at 0x002c8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2cc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002cc000, fail=
 count:22
<5>JFFS2: Erase block at 0x002cc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2d0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002d0000, fail=
 count:22
<5>JFFS2: Erase block at 0x002d0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2d4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002d4000, fail=
 count:22
<5>JFFS2: Erase block at 0x002d4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2d8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002d8000, fail=
 count:22
<5>JFFS2: Erase block at 0x002d8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2dc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002dc000, fail=
 count:22
<5>JFFS2: Erase block at 0x002dc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2e0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002e0000, fail=
 count:23
<5>JFFS2: Erase block at 0x002e0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2e4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002e4000, fail=
 count:23
<5>JFFS2: Erase block at 0x002e4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2e8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002e8000, fail=
 count:23
<5>JFFS2: Erase block at 0x002e8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2ec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002ec000, fail=
 count:23
<5>JFFS2: Erase block at 0x002ec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2f0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002f0000, fail=
 count:23
<5>JFFS2: Erase block at 0x002f0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2f4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002f4000, fail=
 count:23
<5>JFFS2: Erase block at 0x002f4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2f8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002f8000, fail=
 count:12
<5>JFFS2: Erase block at 0x002f8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x2fc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 002fc000, fail=
 count:23
<5>JFFS2: Erase block at 0x002fc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x300000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00300000, fail=
 count:24
<5>JFFS2: Erase block at 0x00300000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x304000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00304000, fail=
 count:24
<5>JFFS2: Erase block at 0x00304000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x308000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00308000, fail=
 count:24
<5>JFFS2: Erase block at 0x00308000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x30c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0030c000, fail=
 count:24
<5>JFFS2: Erase block at 0x0030c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x310000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00310000, fail=
 count:24
<5>JFFS2: Erase block at 0x00310000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x314000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00314000, fail=
 count:24
<5>JFFS2: Erase block at 0x00314000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x318000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00318000, fail=
 count:24
<5>JFFS2: Erase block at 0x00318000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x31c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0031c000, fail=
 count:24
<5>JFFS2: Erase block at 0x0031c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x320000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00320000, fail=
 count:25
<5>JFFS2: Erase block at 0x00320000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x324000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00324000, fail=
 count:25
<5>JFFS2: Erase block at 0x00324000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x328000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00328000, fail=
 count:25
<5>JFFS2: Erase block at 0x00328000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x32c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0032c000, fail=
 count:25
<5>JFFS2: Erase block at 0x0032c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x330000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00330000, fail=
 count:25
<5>JFFS2: Erase block at 0x00330000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x334000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00334000, fail=
 count:25
<5>JFFS2: Erase block at 0x00334000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x338000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00338000, fail=
 count:25
<5>JFFS2: Erase block at 0x00338000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x33c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0033c000, fail=
 count:25
<5>JFFS2: Erase block at 0x0033c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x340000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00340000, fail=
 count:26
<5>JFFS2: Erase block at 0x00340000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x344000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00344000, fail=
 count:26
<5>JFFS2: Erase block at 0x00344000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x348000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00348000, fail=
 count:26
<5>JFFS2: Erase block at 0x00348000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x34c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0034c000, fail=
 count:26
<5>JFFS2: Erase block at 0x0034c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x350000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00350000, fail=
 count:26
<5>JFFS2: Erase block at 0x00350000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x354000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00354000, fail=
 count:228
<5>JFFS2: Erase block at 0x00354000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x358000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00358000, fail=
 count:26
<5>JFFS2: Erase block at 0x00358000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x35c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0035c000, fail=
 count:26
<5>JFFS2: Erase block at 0x0035c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x360000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00360000, fail=
 count:27
<5>JFFS2: Erase block at 0x00360000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x364000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00364000, fail=
 count:27
<5>JFFS2: Erase block at 0x00364000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x368000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00368000, fail=
 count:27
<5>JFFS2: Erase block at 0x00368000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x36c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0036c000, fail=
 count:27
<5>JFFS2: Erase block at 0x0036c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x370000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00370000, fail=
 count:27
<5>JFFS2: Erase block at 0x00370000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x374000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00374000, fail=
 count:27
<5>JFFS2: Erase block at 0x00374000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x378000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00378000, fail=
 count:27
<5>JFFS2: Erase block at 0x00378000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x37c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0037c000, fail=
 count:27
<5>JFFS2: Erase block at 0x0037c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x380000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00380000, fail=
 count:28
<5>JFFS2: Erase block at 0x00380000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x384000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00384000, fail=
 count:28
<5>JFFS2: Erase block at 0x00384000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x388000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00388000, fail=
 count:28
<5>JFFS2: Erase block at 0x00388000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x38c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0038c000, fail=
 count:28
<5>JFFS2: Erase block at 0x0038c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x390000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00390000, fail=
 count:28
<5>JFFS2: Erase block at 0x00390000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x394000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00394000, fail=
 count:28
<5>JFFS2: Erase block at 0x00394000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x398000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00398000, fail=
 count:28
<5>JFFS2: Erase block at 0x00398000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x39c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0039c000, fail=
 count:28
<5>JFFS2: Erase block at 0x0039c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3a0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003a0000, fail=
 count:29
<5>JFFS2: Erase block at 0x003a0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3a4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003a4000, fail=
 count:29
<5>JFFS2: Erase block at 0x003a4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3a8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003a8000, fail=
 count:29
<5>JFFS2: Erase block at 0x003a8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3ac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003ac000, fail=
 count:29
<5>JFFS2: Erase block at 0x003ac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3b0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003b0000, fail=
 count:29
<5>JFFS2: Erase block at 0x003b0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3b4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003b4000, fail=
 count:105
<5>JFFS2: Erase block at 0x003b4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3b8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003b8000, fail=
 count:29
<5>JFFS2: Erase block at 0x003b8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3bc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003bc000, fail=
 count:29
<5>JFFS2: Erase block at 0x003bc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3c0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003c0000, fail=
 count:30
<5>JFFS2: Erase block at 0x003c0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3c4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003c4000, fail=
 count:30
<5>JFFS2: Erase block at 0x003c4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3c8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003c8000, fail=
 count:30
<5>JFFS2: Erase block at 0x003c8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3cc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003cc000, fail=
 count:30
<5>JFFS2: Erase block at 0x003cc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3d0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003d0000, fail=
 count:30
<5>JFFS2: Erase block at 0x003d0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3d4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003d4000, fail=
 count:30
<5>JFFS2: Erase block at 0x003d4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3d8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003d8000, fail=
 count:30
<5>JFFS2: Erase block at 0x003d8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3dc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003dc000, fail=
 count:30
<5>JFFS2: Erase block at 0x003dc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3e0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003e0000, fail=
 count:31
<5>JFFS2: Erase block at 0x003e0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3e4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003e4000, fail=
 count:31
<5>JFFS2: Erase block at 0x003e4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3e8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003e8000, fail=
 count:31
<5>JFFS2: Erase block at 0x003e8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3ec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003ec000, fail=
 count:31
<5>JFFS2: Erase block at 0x003ec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3f0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003f0000, fail=
 count:31
<5>JFFS2: Erase block at 0x003f0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3f4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003f4000, fail=
 count:31
<5>JFFS2: Erase block at 0x003f4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3f8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003f8000, fail=
 count:31
<5>JFFS2: Erase block at 0x003f8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x3fc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 003fc000, fail=
 count:31
<5>JFFS2: Erase block at 0x003fc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x400000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00400000, fail=
 count:32
<5>JFFS2: Erase block at 0x00400000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x404000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00404000, fail=
 count:32
<5>JFFS2: Erase block at 0x00404000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x408000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00408000, fail=
 count:32
<5>JFFS2: Erase block at 0x00408000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x40c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0040c000, fail=
 count:32
<5>JFFS2: Erase block at 0x0040c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x410000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00410000, fail=
 count:32
<5>JFFS2: Erase block at 0x00410000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x414000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00414000, fail=
 count:95
<5>JFFS2: Erase block at 0x00414000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x418000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00418000, fail=
 count:32
<5>JFFS2: Erase block at 0x00418000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x41c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0041c000, fail=
 count:32
<5>JFFS2: Erase block at 0x0041c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x420000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00420000, fail=
 count:33
<5>JFFS2: Erase block at 0x00420000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x424000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00424000, fail=
 count:33
<5>JFFS2: Erase block at 0x00424000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x428000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00428000, fail=
 count:33
<5>JFFS2: Erase block at 0x00428000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x42c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0042c000, fail=
 count:33
<5>JFFS2: Erase block at 0x0042c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x430000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00430000, fail=
 count:33
<5>JFFS2: Erase block at 0x00430000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x434000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00434000, fail=
 count:33
<5>JFFS2: Erase block at 0x00434000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x438000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00438000, fail=
 count:0
<5>JFFS2: Erase block at 0x00438000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x43c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0043c000, fail=
 count:33
<5>JFFS2: Erase block at 0x0043c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x440000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00440000, fail=
 count:34
<5>JFFS2: Erase block at 0x00440000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x444000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00444000, fail=
 count:34
<5>JFFS2: Erase block at 0x00444000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x448000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00448000, fail=
 count:34
<5>JFFS2: Erase block at 0x00448000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x44c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0044c000, fail=
 count:34
<5>JFFS2: Erase block at 0x0044c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x450000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00450000, fail=
 count:34
<5>JFFS2: Erase block at 0x00450000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x454000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00454000, fail=
 count:34
<5>JFFS2: Erase block at 0x00454000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x458000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00458000, fail=
 count:34
<5>JFFS2: Erase block at 0x00458000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x45c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0045c000, fail=
 count:34
<5>JFFS2: Erase block at 0x0045c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x460000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00460000, fail=
 count:35
<5>JFFS2: Erase block at 0x00460000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x464000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00464000, fail=
 count:35
<5>JFFS2: Erase block at 0x00464000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x468000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00468000, fail=
 count:35
<5>JFFS2: Erase block at 0x00468000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x46c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0046c000, fail=
 count:35
<5>JFFS2: Erase block at 0x0046c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x470000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00470000, fail=
 count:35
<5>JFFS2: Erase block at 0x00470000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x474000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00474000, fail=
 count:228
<5>JFFS2: Erase block at 0x00474000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x478000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00478000, fail=
 count:35
<5>JFFS2: Erase block at 0x00478000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x47c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0047c000, fail=
 count:35
<5>JFFS2: Erase block at 0x0047c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x480000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00480000, fail=
 count:36
<5>JFFS2: Erase block at 0x00480000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x484000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00484000, fail=
 count:36
<5>JFFS2: Erase block at 0x00484000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x488000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00488000, fail=
 count:36
<5>JFFS2: Erase block at 0x00488000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x48c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0048c000, fail=
 count:36
<5>JFFS2: Erase block at 0x0048c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x490000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00490000, fail=
 count:36
<5>JFFS2: Erase block at 0x00490000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x494000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00494000, fail=
 count:36
<5>JFFS2: Erase block at 0x00494000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x498000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00498000, fail=
 count:36
<5>JFFS2: Erase block at 0x00498000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x49c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0049c000, fail=
 count:36
<5>JFFS2: Erase block at 0x0049c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4a0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004a0000, fail=
 count:37
<5>JFFS2: Erase block at 0x004a0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4a4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004a4000, fail=
 count:37
<5>JFFS2: Erase block at 0x004a4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4a8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004a8000, fail=
 count:37
<5>JFFS2: Erase block at 0x004a8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4ac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004ac000, fail=
 count:37
<5>JFFS2: Erase block at 0x004ac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4b0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004b0000, fail=
 count:37
<5>JFFS2: Erase block at 0x004b0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4b4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004b4000, fail=
 count:37
<5>JFFS2: Erase block at 0x004b4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4b8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004b8000, fail=
 count:37
<5>JFFS2: Erase block at 0x004b8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4bc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004bc000, fail=
 count:37
<5>JFFS2: Erase block at 0x004bc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4c0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004c0000, fail=
 count:38
<5>JFFS2: Erase block at 0x004c0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4c4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004c4000, fail=
 count:38
<5>JFFS2: Erase block at 0x004c4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4c8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004c8000, fail=
 count:38
<5>JFFS2: Erase block at 0x004c8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4cc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004cc000, fail=
 count:38
<5>JFFS2: Erase block at 0x004cc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4d0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004d0000, fail=
 count:38
<5>JFFS2: Erase block at 0x004d0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4d4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004d4000, fail=
 count:97
<5>JFFS2: Erase block at 0x004d4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4d8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004d8000, fail=
 count:38
<5>JFFS2: Erase block at 0x004d8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4dc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004dc000, fail=
 count:38
<5>JFFS2: Erase block at 0x004dc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4e0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004e0000, fail=
 count:39
<5>JFFS2: Erase block at 0x004e0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4e4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004e4000, fail=
 count:39
<5>JFFS2: Erase block at 0x004e4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4e8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004e8000, fail=
 count:39
<5>JFFS2: Erase block at 0x004e8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4ec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004ec000, fail=
 count:39
<5>JFFS2: Erase block at 0x004ec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4f0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004f0000, fail=
 count:39
<5>JFFS2: Erase block at 0x004f0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4f4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004f4000, fail=
 count:39
<5>JFFS2: Erase block at 0x004f4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4f8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004f8000, fail=
 count:39
<5>JFFS2: Erase block at 0x004f8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x4fc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 004fc000, fail=
 count:39
<5>JFFS2: Erase block at 0x004fc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x500000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00500000, fail=
 count:40
<5>JFFS2: Erase block at 0x00500000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x504000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00504000, fail=
 count:40
<5>JFFS2: Erase block at 0x00504000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x508000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00508000, fail=
 count:40
<5>JFFS2: Erase block at 0x00508000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x50c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0050c000, fail=
 count:40
<5>JFFS2: Erase block at 0x0050c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x510000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00510000, fail=
 count:40
<5>JFFS2: Erase block at 0x00510000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x514000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00514000, fail=
 count:40
<5>JFFS2: Erase block at 0x00514000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x518000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00518000, fail=
 count:40
<5>JFFS2: Erase block at 0x00518000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x51c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0051c000, fail=
 count:40
<5>JFFS2: Erase block at 0x0051c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x520000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00520000, fail=
 count:41
<5>JFFS2: Erase block at 0x00520000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x524000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00524000, fail=
 count:41
<5>JFFS2: Erase block at 0x00524000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x528000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00528000, fail=
 count:41
<5>JFFS2: Erase block at 0x00528000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x52c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0052c000, fail=
 count:41
<5>JFFS2: Erase block at 0x0052c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x530000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00530000, fail=
 count:41
<5>JFFS2: Erase block at 0x00530000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x534000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00534000, fail=
 count:17
<5>JFFS2: Erase block at 0x00534000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x538000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00538000, fail=
 count:41
<5>JFFS2: Erase block at 0x00538000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x53c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0053c000, fail=
 count:41
<5>JFFS2: Erase block at 0x0053c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x540000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00540000, fail=
 count:42
<5>JFFS2: Erase block at 0x00540000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x544000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00544000, fail=
 count:42
<5>JFFS2: Erase block at 0x00544000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x548000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00548000, fail=
 count:42
<5>JFFS2: Erase block at 0x00548000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x54c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0054c000, fail=
 count:42
<5>JFFS2: Erase block at 0x0054c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x550000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00550000, fail=
 count:42
<5>JFFS2: Erase block at 0x00550000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x554000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00554000, fail=
 count:42
<5>JFFS2: Erase block at 0x00554000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x558000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00558000, fail=
 count:42
<5>JFFS2: Erase block at 0x00558000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x55c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0055c000, fail=
 count:42
<5>JFFS2: Erase block at 0x0055c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x560000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00560000, fail=
 count:43
<5>JFFS2: Erase block at 0x00560000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x564000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00564000, fail=
 count:43
<5>JFFS2: Erase block at 0x00564000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x568000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00568000, fail=
 count:43
<5>JFFS2: Erase block at 0x00568000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x56c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0056c000, fail=
 count:238
<5>JFFS2: Erase block at 0x0056c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x570000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00570000, fail=
 count:43
<5>JFFS2: Erase block at 0x00570000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x574000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00574000, fail=
 count:43
<5>JFFS2: Erase block at 0x00574000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x578000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00578000, fail=
 count:43
<5>JFFS2: Erase block at 0x00578000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x57c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0057c000, fail=
 count:43
<5>JFFS2: Erase block at 0x0057c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x580000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00580000, fail=
 count:44
<5>JFFS2: Erase block at 0x00580000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x584000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00584000, fail=
 count:44
<5>JFFS2: Erase block at 0x00584000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x588000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00588000, fail=
 count:44
<5>JFFS2: Erase block at 0x00588000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x58c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0058c000, fail=
 count:44
<5>JFFS2: Erase block at 0x0058c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x590000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00590000, fail=
 count:44
<5>JFFS2: Erase block at 0x00590000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x594000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00594000, fail=
 count:98
<5>JFFS2: Erase block at 0x00594000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x598000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00598000, fail=
 count:44
<5>JFFS2: Erase block at 0x00598000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x59c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0059c000, fail=
 count:44
<5>JFFS2: Erase block at 0x0059c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5a0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005a0000, fail=
 count:45
<5>JFFS2: Erase block at 0x005a0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5a4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005a4000, fail=
 count:45
<5>JFFS2: Erase block at 0x005a4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5a8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005a8000, fail=
 count:45
<5>JFFS2: Erase block at 0x005a8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5ac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005ac000, fail=
 count:45
<5>JFFS2: Erase block at 0x005ac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5b0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005b0000, fail=
 count:45
<5>JFFS2: Erase block at 0x005b0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5b4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005b4000, fail=
 count:45
<5>JFFS2: Erase block at 0x005b4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5b8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005b8000, fail=
 count:45
<5>JFFS2: Erase block at 0x005b8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5bc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005bc000, fail=
 count:45
<5>JFFS2: Erase block at 0x005bc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5c0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005c0000, fail=
 count:46
<5>JFFS2: Erase block at 0x005c0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5c4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005c4000, fail=
 count:46
<5>JFFS2: Erase block at 0x005c4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5c8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005c8000, fail=
 count:46
<5>JFFS2: Erase block at 0x005c8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5cc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005cc000, fail=
 count:46
<5>JFFS2: Erase block at 0x005cc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5d0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005d0000, fail=
 count:46
<5>JFFS2: Erase block at 0x005d0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5d4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005d4000, fail=
 count:46
<5>JFFS2: Erase block at 0x005d4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5d8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005d8000, fail=
 count:46
<5>JFFS2: Erase block at 0x005d8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5dc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005dc000, fail=
 count:46
<5>JFFS2: Erase block at 0x005dc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5e0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005e0000, fail=
 count:47
<5>JFFS2: Erase block at 0x005e0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5e4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005e4000, fail=
 count:47
<5>JFFS2: Erase block at 0x005e4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5e8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005e8000, fail=
 count:47
<5>JFFS2: Erase block at 0x005e8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5ec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005ec000, fail=
 count:47
<5>JFFS2: Erase block at 0x005ec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5f0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005f0000, fail=
 count:47
<5>JFFS2: Erase block at 0x005f0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5f4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005f4000, fail=
 count:228
<5>JFFS2: Erase block at 0x005f4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5f8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005f8000, fail=
 count:47
<5>JFFS2: Erase block at 0x005f8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x5fc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 005fc000, fail=
 count:47
<5>JFFS2: Erase block at 0x005fc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x600000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00600000, fail=
 count:48
<5>JFFS2: Erase block at 0x00600000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x604000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00604000, fail=
 count:48
<5>JFFS2: Erase block at 0x00604000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x608000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00608000, fail=
 count:48
<5>JFFS2: Erase block at 0x00608000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x60c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0060c000, fail=
 count:48
<5>JFFS2: Erase block at 0x0060c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x610000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00610000, fail=
 count:48
<5>JFFS2: Erase block at 0x00610000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x614000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00614000, fail=
 count:48
<5>JFFS2: Erase block at 0x00614000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x618000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00618000, fail=
 count:48
<5>JFFS2: Erase block at 0x00618000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x61c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0061c000, fail=
 count:48
<5>JFFS2: Erase block at 0x0061c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x620000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00620000, fail=
 count:49
<5>JFFS2: Erase block at 0x00620000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x624000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00624000, fail=
 count:49
<5>JFFS2: Erase block at 0x00624000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x628000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00628000, fail=
 count:49
<5>JFFS2: Erase block at 0x00628000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x62c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0062c000, fail=
 count:49
<5>JFFS2: Erase block at 0x0062c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x630000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00630000, fail=
 count:49
<5>JFFS2: Erase block at 0x00630000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x634000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00634000, fail=
 count:49
<5>JFFS2: Erase block at 0x00634000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x638000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00638000, fail=
 count:49
<5>JFFS2: Erase block at 0x00638000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x63c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0063c000, fail=
 count:49
<5>JFFS2: Erase block at 0x0063c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x640000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00640000, fail=
 count:50
<5>JFFS2: Erase block at 0x00640000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x644000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00644000, fail=
 count:50
<5>JFFS2: Erase block at 0x00644000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x648000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00648000, fail=
 count:50
<5>JFFS2: Erase block at 0x00648000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x64c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0064c000, fail=
 count:50
<5>JFFS2: Erase block at 0x0064c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x650000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00650000, fail=
 count:50
<5>JFFS2: Erase block at 0x00650000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x654000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00654000, fail=
 count:45
<5>JFFS2: Erase block at 0x00654000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x658000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00658000, fail=
 count:50
<5>JFFS2: Erase block at 0x00658000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x65c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0065c000, fail=
 count:50
<5>JFFS2: Erase block at 0x0065c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x660000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00660000, fail=
 count:51
<5>JFFS2: Erase block at 0x00660000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x664000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00664000, fail=
 count:51
<5>JFFS2: Erase block at 0x00664000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x668000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00668000, fail=
 count:51
<5>JFFS2: Erase block at 0x00668000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x66c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0066c000, fail=
 count:51
<5>JFFS2: Erase block at 0x0066c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x670000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00670000, fail=
 count:51
<5>JFFS2: Erase block at 0x00670000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x674000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00674000, fail=
 count:51
<5>JFFS2: Erase block at 0x00674000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x678000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00678000, fail=
 count:51
<5>JFFS2: Erase block at 0x00678000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x67c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0067c000, fail=
 count:51
<5>JFFS2: Erase block at 0x0067c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x680000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00680000, fail=
 count:52
<5>JFFS2: Erase block at 0x00680000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x684000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00684000, fail=
 count:52
<5>JFFS2: Erase block at 0x00684000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x688000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00688000, fail=
 count:52
<5>JFFS2: Erase block at 0x00688000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x68c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0068c000, fail=
 count:52
<5>JFFS2: Erase block at 0x0068c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x690000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00690000, fail=
 count:52
<5>JFFS2: Erase block at 0x00690000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x694000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00694000, fail=
 count:52
<5>JFFS2: Erase block at 0x00694000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x698000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00698000, fail=
 count:52
<5>JFFS2: Erase block at 0x00698000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x69c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0069c000, fail=
 count:52
<5>JFFS2: Erase block at 0x0069c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6a0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006a0000, fail=
 count:53
<5>JFFS2: Erase block at 0x006a0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6a4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006a4000, fail=
 count:53
<5>JFFS2: Erase block at 0x006a4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6a8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006a8000, fail=
 count:53
<5>JFFS2: Erase block at 0x006a8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6ac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006ac000, fail=
 count:53
<5>JFFS2: Erase block at 0x006ac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6b0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006b0000, fail=
 count:53
<5>JFFS2: Erase block at 0x006b0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6b4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006b4000, fail=
 count:160
<5>JFFS2: Erase block at 0x006b4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6b8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006b8000, fail=
 count:53
<5>JFFS2: Erase block at 0x006b8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6bc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006bc000, fail=
 count:53
<5>JFFS2: Erase block at 0x006bc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6c0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006c0000, fail=
 count:54
<5>JFFS2: Erase block at 0x006c0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6c4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006c4000, fail=
 count:54
<5>JFFS2: Erase block at 0x006c4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6c8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006c8000, fail=
 count:54
<5>JFFS2: Erase block at 0x006c8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6cc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006cc000, fail=
 count:54
<5>JFFS2: Erase block at 0x006cc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6d0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006d0000, fail=
 count:54
<5>JFFS2: Erase block at 0x006d0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6d4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006d4000, fail=
 count:54
<5>JFFS2: Erase block at 0x006d4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6d8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006d8000, fail=
 count:54
<5>JFFS2: Erase block at 0x006d8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6dc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006dc000, fail=
 count:54
<5>JFFS2: Erase block at 0x006dc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6e0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006e0000, fail=
 count:55
<5>JFFS2: Erase block at 0x006e0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6e4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006e4000, fail=
 count:55
<5>JFFS2: Erase block at 0x006e4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6e8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006e8000, fail=
 count:55
<5>JFFS2: Erase block at 0x006e8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6ec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006ec000, fail=
 count:55
<5>JFFS2: Erase block at 0x006ec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6f0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006f0000, fail=
 count:55
<5>JFFS2: Erase block at 0x006f0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6f4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006f4000, fail=
 count:55
<5>JFFS2: Erase block at 0x006f4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6f8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006f8000, fail=
 count:55
<5>JFFS2: Erase block at 0x006f8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x6fc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 006fc000, fail=
 count:55
<5>JFFS2: Erase block at 0x006fc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x700000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00700000, fail=
 count:56
<5>JFFS2: Erase block at 0x00700000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x704000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00704000, fail=
 count:56
<5>JFFS2: Erase block at 0x00704000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x708000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00708000, fail=
 count:56
<5>JFFS2: Erase block at 0x00708000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x70c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0070c000, fail=
 count:56
<5>JFFS2: Erase block at 0x0070c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x710000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00710000, fail=
 count:56
<5>JFFS2: Erase block at 0x00710000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x714000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00714000, fail=
 count:32
<5>JFFS2: Erase block at 0x00714000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x718000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00718000, fail=
 count:56
<5>JFFS2: Erase block at 0x00718000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x71c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0071c000, fail=
 count:56
<5>JFFS2: Erase block at 0x0071c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x720000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00720000, fail=
 count:57
<5>JFFS2: Erase block at 0x00720000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x724000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00724000, fail=
 count:57
<5>JFFS2: Erase block at 0x00724000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x728000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00728000, fail=
 count:57
<5>JFFS2: Erase block at 0x00728000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x72c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0072c000, fail=
 count:57
<5>JFFS2: Erase block at 0x0072c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x730000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00730000, fail=
 count:57
<5>JFFS2: Erase block at 0x00730000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x734000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00734000, fail=
 count:57
<5>JFFS2: Erase block at 0x00734000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x738000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00738000, fail=
 count:57
<5>JFFS2: Erase block at 0x00738000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x73c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0073c000, fail=
 count:57
<5>JFFS2: Erase block at 0x0073c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x740000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00740000, fail=
 count:58
<5>JFFS2: Erase block at 0x00740000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x744000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00744000, fail=
 count:58
<5>JFFS2: Erase block at 0x00744000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x748000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00748000, fail=
 count:58
<5>JFFS2: Erase block at 0x00748000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x74c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0074c000, fail=
 count:58
<5>JFFS2: Erase block at 0x0074c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x750000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00750000, fail=
 count:58
<5>JFFS2: Erase block at 0x00750000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x754000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00754000, fail=
 count:58
<5>JFFS2: Erase block at 0x00754000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x758000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00758000, fail=
 count:58
<5>JFFS2: Erase block at 0x00758000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x75c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0075c000, fail=
 count:58
<5>JFFS2: Erase block at 0x0075c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x760000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00760000, fail=
 count:59
<5>JFFS2: Erase block at 0x00760000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x764000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00764000, fail=
 count:59
<5>JFFS2: Erase block at 0x00764000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x768000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00768000, fail=
 count:59
<5>JFFS2: Erase block at 0x00768000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x76c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0076c000, fail=
 count:59
<5>JFFS2: Erase block at 0x0076c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x770000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00770000, fail=
 count:192
<5>JFFS2: Erase block at 0x00770000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x774000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00774000, fail=
 count:59
<5>JFFS2: Erase block at 0x00774000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x778000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00778000, fail=
 count:59
<5>JFFS2: Erase block at 0x00778000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x77c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0077c000, fail=
 count:59
<5>JFFS2: Erase block at 0x0077c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x780000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00780000, fail=
 count:60
<5>JFFS2: Erase block at 0x00780000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x784000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00784000, fail=
 count:60
<5>JFFS2: Erase block at 0x00784000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x788000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00788000, fail=
 count:60
<5>JFFS2: Erase block at 0x00788000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x78c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0078c000, fail=
 count:60
<5>JFFS2: Erase block at 0x0078c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x790000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00790000, fail=
 count:60
<5>JFFS2: Erase block at 0x00790000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x794000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00794000, fail=
 count:60
<5>JFFS2: Erase block at 0x00794000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x798000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00798000, fail=
 count:60
<5>JFFS2: Erase block at 0x00798000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x79c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0079c000, fail=
 count:60
<5>JFFS2: Erase block at 0x0079c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7a0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007a0000, fail=
 count:61
<5>JFFS2: Erase block at 0x007a0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7a4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007a4000, fail=
 count:61
<5>JFFS2: Erase block at 0x007a4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7a8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007a8000, fail=
 count:61
<5>JFFS2: Erase block at 0x007a8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7ac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007ac000, fail=
 count:61
<5>JFFS2: Erase block at 0x007ac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7b0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007b0000, fail=
 count:61
<5>JFFS2: Erase block at 0x007b0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7b4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007b4000, fail=
 count:61
<5>JFFS2: Erase block at 0x007b4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7b8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007b8000, fail=
 count:61
<5>JFFS2: Erase block at 0x007b8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7bc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007bc000, fail=
 count:61
<5>JFFS2: Erase block at 0x007bc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7c0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007c0000, fail=
 count:0
<5>JFFS2: Erase block at 0x007c0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7c4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007c4000, fail=
 count:62
<5>JFFS2: Erase block at 0x007c4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7c8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007c8000, fail=
 count:62
<5>JFFS2: Erase block at 0x007c8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7cc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007cc000, fail=
 count:62
<5>JFFS2: Erase block at 0x007cc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7d0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007d0000, fail=
 count:4
<5>JFFS2: Erase block at 0x007d0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7d4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007d4000, fail=
 count:62
<5>JFFS2: Erase block at 0x007d4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7d8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007d8000, fail=
 count:62
<5>JFFS2: Erase block at 0x007d8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7dc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007dc000, fail=
 count:62
<5>JFFS2: Erase block at 0x007dc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7e0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007e0000, fail=
 count:63
<5>JFFS2: Erase block at 0x007e0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7e4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007e4000, fail=
 count:63
<5>JFFS2: Erase block at 0x007e4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7e8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007e8000, fail=
 count:63
<5>JFFS2: Erase block at 0x007e8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7ec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007ec000, fail=
 count:63
<5>JFFS2: Erase block at 0x007ec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7f0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007f0000, fail=
 count:63
<5>JFFS2: Erase block at 0x007f0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7f4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007f4000, fail=
 count:63
<5>JFFS2: Erase block at 0x007f4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7f8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007f8000, fail=
 count:63
<5>JFFS2: Erase block at 0x007f8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x7fc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 007fc000, fail=
 count:63
<5>JFFS2: Erase block at 0x007fc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x800000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00800000, fail=
 count:64
<5>JFFS2: Erase block at 0x00800000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x804000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00804000, fail=
 count:64
<5>JFFS2: Erase block at 0x00804000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x808000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00808000, fail=
 count:64
<5>JFFS2: Erase block at 0x00808000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x80c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0080c000, fail=
 count:64
<5>JFFS2: Erase block at 0x0080c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x810000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00810000, fail=
 count:64
<5>JFFS2: Erase block at 0x00810000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x814000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00814000, fail=
 count:64
<5>JFFS2: Erase block at 0x00814000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x818000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00818000, fail=
 count:64
<5>JFFS2: Erase block at 0x00818000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x81c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0081c000, fail=
 count:64
<5>JFFS2: Erase block at 0x0081c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x820000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00820000, fail=
 count:65
<5>JFFS2: Erase block at 0x00820000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x824000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00824000, fail=
 count:65
<5>JFFS2: Erase block at 0x00824000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x828000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00828000, fail=
 count:65
<5>JFFS2: Erase block at 0x00828000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x82c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0082c000, fail=
 count:114
<5>JFFS2: Erase block at 0x0082c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x830000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00830000, fail=
 count:65
<5>JFFS2: Erase block at 0x00830000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x834000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00834000, fail=
 count:65
<5>JFFS2: Erase block at 0x00834000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x838000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00838000, fail=
 count:65
<5>JFFS2: Erase block at 0x00838000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x83c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0083c000, fail=
 count:65
<5>JFFS2: Erase block at 0x0083c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x840000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00840000, fail=
 count:66
<5>JFFS2: Erase block at 0x00840000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x844000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00844000, fail=
 count:66
<5>JFFS2: Erase block at 0x00844000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x848000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00848000, fail=
 count:66
<5>JFFS2: Erase block at 0x00848000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x84c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0084c000, fail=
 count:66
<5>JFFS2: Erase block at 0x0084c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x850000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00850000, fail=
 count:66
<5>JFFS2: Erase block at 0x00850000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x854000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00854000, fail=
 count:66
<5>JFFS2: Erase block at 0x00854000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x858000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00858000, fail=
 count:66
<5>JFFS2: Erase block at 0x00858000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x85c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0085c000, fail=
 count:66
<5>JFFS2: Erase block at 0x0085c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x860000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00860000, fail=
 count:67
<5>JFFS2: Erase block at 0x00860000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x864000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00864000, fail=
 count:67
<5>JFFS2: Erase block at 0x00864000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x868000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00868000, fail=
 count:67
<5>JFFS2: Erase block at 0x00868000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x86c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0086c000, fail=
 count:67
<5>JFFS2: Erase block at 0x0086c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x870000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00870000, fail=
 count:67
<5>JFFS2: Erase block at 0x00870000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x874000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00874000, fail=
 count:67
<5>JFFS2: Erase block at 0x00874000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x878000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00878000, fail=
 count:67
<5>JFFS2: Erase block at 0x00878000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x87c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0087c000, fail=
 count:67
<5>JFFS2: Erase block at 0x0087c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x880000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00880000, fail=
 count:68
<5>JFFS2: Erase block at 0x00880000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x884000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00884000, fail=
 count:68
<5>JFFS2: Erase block at 0x00884000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x888000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00888000, fail=
 count:114
<5>JFFS2: Erase block at 0x00888000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x88c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0088c000, fail=
 count:68
<5>JFFS2: Erase block at 0x0088c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x890000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00890000, fail=
 count:68
<5>JFFS2: Erase block at 0x00890000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x894000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00894000, fail=
 count:68
<5>JFFS2: Erase block at 0x00894000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x898000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00898000, fail=
 count:68
<5>JFFS2: Erase block at 0x00898000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x89c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0089c000, fail=
 count:68
<5>JFFS2: Erase block at 0x0089c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8a0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008a0000, fail=
 count:69
<5>JFFS2: Erase block at 0x008a0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8a4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008a4000, fail=
 count:69
<5>JFFS2: Erase block at 0x008a4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8a8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008a8000, fail=
 count:69
<5>JFFS2: Erase block at 0x008a8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8ac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008ac000, fail=
 count:69
<5>JFFS2: Erase block at 0x008ac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8b0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008b0000, fail=
 count:69
<5>JFFS2: Erase block at 0x008b0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8b4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008b4000, fail=
 count:69
<5>JFFS2: Erase block at 0x008b4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8b8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008b8000, fail=
 count:69
<5>JFFS2: Erase block at 0x008b8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8bc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008bc000, fail=
 count:69
<5>JFFS2: Erase block at 0x008bc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8c0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008c0000, fail=
 count:70
<5>JFFS2: Erase block at 0x008c0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8c4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008c4000, fail=
 count:70
<5>JFFS2: Erase block at 0x008c4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8c8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008c8000, fail=
 count:70
<5>JFFS2: Erase block at 0x008c8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8cc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008cc000, fail=
 count:70
<5>JFFS2: Erase block at 0x008cc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8d0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008d0000, fail=
 count:70
<5>JFFS2: Erase block at 0x008d0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8d4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008d4000, fail=
 count:70
<5>JFFS2: Erase block at 0x008d4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8d8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008d8000, fail=
 count:48
<5>JFFS2: Erase block at 0x008d8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8dc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008dc000, fail=
 count:70
<5>JFFS2: Erase block at 0x008dc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8e0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008e0000, fail=
 count:71
<5>JFFS2: Erase block at 0x008e0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8e4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008e4000, fail=
 count:71
<5>JFFS2: Erase block at 0x008e4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8e8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008e8000, fail=
 count:71
<5>JFFS2: Erase block at 0x008e8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8ec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008ec000, fail=
 count:71
<5>JFFS2: Erase block at 0x008ec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8f0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008f0000, fail=
 count:71
<5>JFFS2: Erase block at 0x008f0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8f4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008f4000, fail=
 count:71
<5>JFFS2: Erase block at 0x008f4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8f8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008f8000, fail=
 count:71
<5>JFFS2: Erase block at 0x008f8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x8fc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 008fc000, fail=
 count:71
<5>JFFS2: Erase block at 0x008fc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x900000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00900000, fail=
 count:72
<5>JFFS2: Erase block at 0x00900000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x904000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00904000, fail=
 count:72
<5>JFFS2: Erase block at 0x00904000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x908000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00908000, fail=
 count:72
<5>JFFS2: Erase block at 0x00908000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x90c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0090c000, fail=
 count:72
<5>JFFS2: Erase block at 0x0090c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x910000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00910000, fail=
 count:72
<5>JFFS2: Erase block at 0x00910000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x914000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00914000, fail=
 count:72
<5>JFFS2: Erase block at 0x00914000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x918000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00918000, fail=
 count:72
<5>JFFS2: Erase block at 0x00918000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x91c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0091c000, fail=
 count:72
<5>JFFS2: Erase block at 0x0091c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x920000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00920000, fail=
 count:73
<5>JFFS2: Erase block at 0x00920000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x924000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00924000, fail=
 count:73
<5>JFFS2: Erase block at 0x00924000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x928000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00928000, fail=
 count:73
<5>JFFS2: Erase block at 0x00928000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x92c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0092c000, fail=
 count:73
<5>JFFS2: Erase block at 0x0092c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x930000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00930000, fail=
 count:73
<5>JFFS2: Erase block at 0x00930000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x934000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00934000, fail=
 count:73
<5>JFFS2: Erase block at 0x00934000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x938000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00938000, fail=
 count:238
<5>JFFS2: Erase block at 0x00938000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x93c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0093c000, fail=
 count:73
<5>JFFS2: Erase block at 0x0093c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x940000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00940000, fail=
 count:74
<5>JFFS2: Erase block at 0x00940000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x944000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00944000, fail=
 count:74
<5>JFFS2: Erase block at 0x00944000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x948000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00948000, fail=
 count:74
<5>JFFS2: Erase block at 0x00948000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x94c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0094c000, fail=
 count:74
<5>JFFS2: Erase block at 0x0094c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x950000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00950000, fail=
 count:74
<5>JFFS2: Erase block at 0x00950000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x954000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00954000, fail=
 count:74
<5>JFFS2: Erase block at 0x00954000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x958000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00958000, fail=
 count:74
<5>JFFS2: Erase block at 0x00958000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x95c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0095c000, fail=
 count:74
<5>JFFS2: Erase block at 0x0095c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x960000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00960000, fail=
 count:75
<5>JFFS2: Erase block at 0x00960000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x964000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00964000, fail=
 count:75
<5>JFFS2: Erase block at 0x00964000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x968000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00968000, fail=
 count:75
<5>JFFS2: Erase block at 0x00968000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x96c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0096c000, fail=
 count:75
<5>JFFS2: Erase block at 0x0096c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x970000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00970000, fail=
 count:75
<5>JFFS2: Erase block at 0x00970000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x974000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00974000, fail=
 count:75
<5>JFFS2: Erase block at 0x00974000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x978000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00978000, fail=
 count:75
<5>JFFS2: Erase block at 0x00978000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x97c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0097c000, fail=
 count:75
<5>JFFS2: Erase block at 0x0097c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x980000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00980000, fail=
 count:76
<5>JFFS2: Erase block at 0x00980000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x984000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00984000, fail=
 count:76
<5>JFFS2: Erase block at 0x00984000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x988000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00988000, fail=
 count:76
<5>JFFS2: Erase block at 0x00988000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x98c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0098c000, fail=
 count:76
<5>JFFS2: Erase block at 0x0098c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x990000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00990000, fail=
 count:76
<5>JFFS2: Erase block at 0x00990000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x994000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00994000, fail=
 count:142
<5>JFFS2: Erase block at 0x00994000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x998000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00998000, fail=
 count:76
<5>JFFS2: Erase block at 0x00998000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x99c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 0099c000, fail=
 count:76
<5>JFFS2: Erase block at 0x0099c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9a0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009a0000, fail=
 count:77
<5>JFFS2: Erase block at 0x009a0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9a4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009a4000, fail=
 count:77
<5>JFFS2: Erase block at 0x009a4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9a8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009a8000, fail=
 count:77
<5>JFFS2: Erase block at 0x009a8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9ac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009ac000, fail=
 count:77
<5>JFFS2: Erase block at 0x009ac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9b0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009b0000, fail=
 count:77
<5>JFFS2: Erase block at 0x009b0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9b4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009b4000, fail=
 count:77
<5>JFFS2: Erase block at 0x009b4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9b8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009b8000, fail=
 count:77
<5>JFFS2: Erase block at 0x009b8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9bc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009bc000, fail=
 count:77
<5>JFFS2: Erase block at 0x009bc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9c0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009c0000, fail=
 count:78
<5>JFFS2: Erase block at 0x009c0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9c4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009c4000, fail=
 count:78
<5>JFFS2: Erase block at 0x009c4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9c8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009c8000, fail=
 count:0
<5>JFFS2: Erase block at 0x009c8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9cc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009cc000, fail=
 count:78
<5>JFFS2: Erase block at 0x009cc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9d0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009d0000, fail=
 count:78
<5>JFFS2: Erase block at 0x009d0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9d4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009d4000, fail=
 count:78
<5>JFFS2: Erase block at 0x009d4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9d8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009d8000, fail=
 count:78
<5>JFFS2: Erase block at 0x009d8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9dc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009dc000, fail=
 count:78
<5>JFFS2: Erase block at 0x009dc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9e0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009e0000, fail=
 count:79
<5>JFFS2: Erase block at 0x009e0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9e4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009e4000, fail=
 count:79
<5>JFFS2: Erase block at 0x009e4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9e8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009e8000, fail=
 count:79
<5>JFFS2: Erase block at 0x009e8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9ec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009ec000, fail=
 count:79
<5>JFFS2: Erase block at 0x009ec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9f0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009f0000, fail=
 count:79
<5>JFFS2: Erase block at 0x009f0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9f4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009f4000, fail=
 count:97
<5>JFFS2: Erase block at 0x009f4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9f8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009f8000, fail=
 count:79
<5>JFFS2: Erase block at 0x009f8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0x9fc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 009fc000, fail=
 count:79
<5>JFFS2: Erase block at 0x009fc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa00000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a00000, fail=
 count:80
<5>JFFS2: Erase block at 0x00a00000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa04000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a04000, fail=
 count:80
<5>JFFS2: Erase block at 0x00a04000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa08000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a08000, fail=
 count:80
<5>JFFS2: Erase block at 0x00a08000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa0c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a0c000, fail=
 count:80
<5>JFFS2: Erase block at 0x00a0c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa10000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a10000, fail=
 count:80
<5>JFFS2: Erase block at 0x00a10000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa14000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a14000, fail=
 count:80
<5>JFFS2: Erase block at 0x00a14000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa18000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a18000, fail=
 count:80
<5>JFFS2: Erase block at 0x00a18000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa1c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a1c000, fail=
 count:80
<5>JFFS2: Erase block at 0x00a1c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa20000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a20000, fail=
 count:81
<5>JFFS2: Erase block at 0x00a20000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa24000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a24000, fail=
 count:81
<5>JFFS2: Erase block at 0x00a24000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa28000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a28000, fail=
 count:81
<5>JFFS2: Erase block at 0x00a28000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa2c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a2c000, fail=
 count:81
<5>JFFS2: Erase block at 0x00a2c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa30000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a30000, fail=
 count:81
<5>JFFS2: Erase block at 0x00a30000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa34000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a34000, fail=
 count:81
<5>JFFS2: Erase block at 0x00a34000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa38000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a38000, fail=
 count:81
<5>JFFS2: Erase block at 0x00a38000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa3c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a3c000, fail=
 count:81
<5>JFFS2: Erase block at 0x00a3c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa40000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a40000, fail=
 count:82
<5>JFFS2: Erase block at 0x00a40000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa44000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a44000, fail=
 count:82
<5>JFFS2: Erase block at 0x00a44000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa48000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a48000, fail=
 count:45
<5>JFFS2: Erase block at 0x00a48000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa4c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a4c000, fail=
 count:82
<5>JFFS2: Erase block at 0x00a4c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa50000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a50000, fail=
 count:82
<5>JFFS2: Erase block at 0x00a50000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa54000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a54000, fail=
 count:82
<5>JFFS2: Erase block at 0x00a54000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa58000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a58000, fail=
 count:82
<5>JFFS2: Erase block at 0x00a58000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa5c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a5c000, fail=
 count:82
<5>JFFS2: Erase block at 0x00a5c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa60000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a60000, fail=
 count:83
<5>JFFS2: Erase block at 0x00a60000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa64000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a64000, fail=
 count:83
<5>JFFS2: Erase block at 0x00a64000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa68000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a68000, fail=
 count:83
<5>JFFS2: Erase block at 0x00a68000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa6c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a6c000, fail=
 count:83
<5>JFFS2: Erase block at 0x00a6c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa70000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a70000, fail=
 count:83
<5>JFFS2: Erase block at 0x00a70000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa74000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a74000, fail=
 count:83
<5>JFFS2: Erase block at 0x00a74000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa78000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a78000, fail=
 count:83
<5>JFFS2: Erase block at 0x00a78000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa7c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a7c000, fail=
 count:83
<5>JFFS2: Erase block at 0x00a7c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa80000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a80000, fail=
 count:84
<5>JFFS2: Erase block at 0x00a80000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa84000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a84000, fail=
 count:84
<5>JFFS2: Erase block at 0x00a84000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa88000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a88000, fail=
 count:84
<5>JFFS2: Erase block at 0x00a88000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa8c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a8c000, fail=
 count:84
<5>JFFS2: Erase block at 0x00a8c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa90000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a90000, fail=
 count:84
<5>JFFS2: Erase block at 0x00a90000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa94000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a94000, fail=
 count:84
<5>JFFS2: Erase block at 0x00a94000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa98000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a98000, fail=
 count:84
<5>JFFS2: Erase block at 0x00a98000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xa9c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00a9c000, fail=
 count:84
<5>JFFS2: Erase block at 0x00a9c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xaa0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00aa0000, fail=
 count:85
<5>JFFS2: Erase block at 0x00aa0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xaa4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00aa4000, fail=
 count:48
<5>JFFS2: Erase block at 0x00aa4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xaa8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00aa8000, fail=
 count:85
<5>JFFS2: Erase block at 0x00aa8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xaac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00aac000, fail=
 count:85
<5>JFFS2: Erase block at 0x00aac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xab0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ab0000, fail=
 count:85
<5>JFFS2: Erase block at 0x00ab0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xab4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ab4000, fail=
 count:85
<5>JFFS2: Erase block at 0x00ab4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xab8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ab8000, fail=
 count:85
<5>JFFS2: Erase block at 0x00ab8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xabc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00abc000, fail=
 count:85
<5>JFFS2: Erase block at 0x00abc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xac0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ac0000, fail=
 count:86
<5>JFFS2: Erase block at 0x00ac0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xac4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ac4000, fail=
 count:86
<5>JFFS2: Erase block at 0x00ac4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xac8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ac8000, fail=
 count:86
<5>JFFS2: Erase block at 0x00ac8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xacc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00acc000, fail=
 count:86
<5>JFFS2: Erase block at 0x00acc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xad0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ad0000, fail=
 count:86
<5>JFFS2: Erase block at 0x00ad0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xad4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ad4000, fail=
 count:86
<5>JFFS2: Erase block at 0x00ad4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xad8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ad8000, fail=
 count:99
<5>JFFS2: Erase block at 0x00ad8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xadc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00adc000, fail=
 count:86
<5>JFFS2: Erase block at 0x00adc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xae0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ae0000, fail=
 count:87
<5>JFFS2: Erase block at 0x00ae0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xae4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ae4000, fail=
 count:87
<5>JFFS2: Erase block at 0x00ae4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xae8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ae8000, fail=
 count:87
<5>JFFS2: Erase block at 0x00ae8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xaec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00aec000, fail=
 count:87
<5>JFFS2: Erase block at 0x00aec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xaf0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00af0000, fail=
 count:87
<5>JFFS2: Erase block at 0x00af0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xaf4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00af4000, fail=
 count:87
<5>JFFS2: Erase block at 0x00af4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xaf8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00af8000, fail=
 count:87
<5>JFFS2: Erase block at 0x00af8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xafc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00afc000, fail=
 count:55
<5>JFFS2: Erase block at 0x00afc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb00000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b00000, fail=
 count:88
<5>JFFS2: Erase block at 0x00b00000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb04000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b04000, fail=
 count:88
<5>JFFS2: Erase block at 0x00b04000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb08000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b08000, fail=
 count:88
<5>JFFS2: Erase block at 0x00b08000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb0c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b0c000, fail=
 count:88
<5>JFFS2: Erase block at 0x00b0c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb10000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b10000, fail=
 count:88
<5>JFFS2: Erase block at 0x00b10000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb14000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b14000, fail=
 count:88
<5>JFFS2: Erase block at 0x00b14000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb18000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b18000, fail=
 count:88
<5>JFFS2: Erase block at 0x00b18000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb1c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b1c000, fail=
 count:88
<5>JFFS2: Erase block at 0x00b1c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb20000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b20000, fail=
 count:89
<5>JFFS2: Erase block at 0x00b20000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb24000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b24000, fail=
 count:89
<5>JFFS2: Erase block at 0x00b24000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb28000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b28000, fail=
 count:89
<5>JFFS2: Erase block at 0x00b28000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb2c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b2c000, fail=
 count:89
<5>JFFS2: Erase block at 0x00b2c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb30000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b30000, fail=
 count:89
<5>JFFS2: Erase block at 0x00b30000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb34000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b34000, fail=
 count:89
<5>JFFS2: Erase block at 0x00b34000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb38000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b38000, fail=
 count:89
<5>JFFS2: Erase block at 0x00b38000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb3c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b3c000, fail=
 count:89
<5>JFFS2: Erase block at 0x00b3c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb40000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b40000, fail=
 count:90
<5>JFFS2: Erase block at 0x00b40000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb44000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b44000, fail=
 count:90
<5>JFFS2: Erase block at 0x00b44000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb48000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b48000, fail=
 count:90
<5>JFFS2: Erase block at 0x00b48000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb4c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b4c000, fail=
 count:90
<5>JFFS2: Erase block at 0x00b4c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb50000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b50000, fail=
 count:90
<5>JFFS2: Erase block at 0x00b50000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb54000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b54000, fail=
 count:64
<5>JFFS2: Erase block at 0x00b54000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb58000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b58000, fail=
 count:90
<5>JFFS2: Erase block at 0x00b58000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb5c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b5c000, fail=
 count:90
<5>JFFS2: Erase block at 0x00b5c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb60000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b60000, fail=
 count:91
<5>JFFS2: Erase block at 0x00b60000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb64000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b64000, fail=
 count:91
<5>JFFS2: Erase block at 0x00b64000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb68000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b68000, fail=
 count:91
<5>JFFS2: Erase block at 0x00b68000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb6c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b6c000, fail=
 count:91
<5>JFFS2: Erase block at 0x00b6c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb70000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b70000, fail=
 count:91
<5>JFFS2: Erase block at 0x00b70000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb74000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b74000, fail=
 count:32
<5>JFFS2: Erase block at 0x00b74000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb78000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b78000, fail=
 count:91
<5>JFFS2: Erase block at 0x00b78000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb7c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b7c000, fail=
 count:91
<5>JFFS2: Erase block at 0x00b7c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb80000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b80000, fail=
 count:92
<5>JFFS2: Erase block at 0x00b80000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb84000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b84000, fail=
 count:92
<5>JFFS2: Erase block at 0x00b84000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb88000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b88000, fail=
 count:92
<5>JFFS2: Erase block at 0x00b88000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb8c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b8c000, fail=
 count:92
<5>JFFS2: Erase block at 0x00b8c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb90000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b90000, fail=
 count:92
<5>JFFS2: Erase block at 0x00b90000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb94000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b94000, fail=
 count:92
<5>JFFS2: Erase block at 0x00b94000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb98000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b98000, fail=
 count:92
<5>JFFS2: Erase block at 0x00b98000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xb9c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00b9c000, fail=
 count:92
<5>JFFS2: Erase block at 0x00b9c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xba0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ba0000, fail=
 count:93
<5>JFFS2: Erase block at 0x00ba0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xba4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ba4000, fail=
 count:93
<5>JFFS2: Erase block at 0x00ba4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xba8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ba8000, fail=
 count:93
<5>JFFS2: Erase block at 0x00ba8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bac000, fail=
 count:93
<5>JFFS2: Erase block at 0x00bac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbb0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bb0000, fail=
 count:100
<5>JFFS2: Erase block at 0x00bb0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbb4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bb4000, fail=
 count:93
<5>JFFS2: Erase block at 0x00bb4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbb8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bb8000, fail=
 count:93
<5>JFFS2: Erase block at 0x00bb8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbbc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bbc000, fail=
 count:93
<5>JFFS2: Erase block at 0x00bbc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbc0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bc0000, fail=
 count:94
<5>JFFS2: Erase block at 0x00bc0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbc4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bc4000, fail=
 count:94
<5>JFFS2: Erase block at 0x00bc4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbc8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bc8000, fail=
 count:94
<5>JFFS2: Erase block at 0x00bc8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbcc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bcc000, fail=
 count:94
<5>JFFS2: Erase block at 0x00bcc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbd0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bd0000, fail=
 count:94
<5>JFFS2: Erase block at 0x00bd0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbd4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bd4000, fail=
 count:94
<5>JFFS2: Erase block at 0x00bd4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbd8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bd8000, fail=
 count:94
<5>JFFS2: Erase block at 0x00bd8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbdc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bdc000, fail=
 count:94
<5>JFFS2: Erase block at 0x00bdc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbe0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00be0000, fail=
 count:95
<5>JFFS2: Erase block at 0x00be0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbe4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00be4000, fail=
 count:172
<5>JFFS2: Erase block at 0x00be4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbe8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00be8000, fail=
 count:95
<5>JFFS2: Erase block at 0x00be8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bec000, fail=
 count:95
<5>JFFS2: Erase block at 0x00bec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbf0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bf0000, fail=
 count:95
<5>JFFS2: Erase block at 0x00bf0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbf4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bf4000, fail=
 count:95
<5>JFFS2: Erase block at 0x00bf4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbf8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bf8000, fail=
 count:95
<5>JFFS2: Erase block at 0x00bf8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xbfc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00bfc000, fail=
 count:95
<5>JFFS2: Erase block at 0x00bfc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc00000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c00000, fail=
 count:4
<5>JFFS2: Erase block at 0x00c00000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc04000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c04000, fail=
 count:96
<5>JFFS2: Erase block at 0x00c04000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc08000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c08000, fail=
 count:96
<5>JFFS2: Erase block at 0x00c08000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc0c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c0c000, fail=
 count:96
<5>JFFS2: Erase block at 0x00c0c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc10000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c10000, fail=
 count:96
<5>JFFS2: Erase block at 0x00c10000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc14000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c14000, fail=
 count:96
<5>JFFS2: Erase block at 0x00c14000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc18000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c18000, fail=
 count:96
<5>JFFS2: Erase block at 0x00c18000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc1c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c1c000, fail=
 count:96
<5>JFFS2: Erase block at 0x00c1c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc20000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c20000, fail=
 count:97
<5>JFFS2: Erase block at 0x00c20000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc24000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c24000, fail=
 count:97
<5>JFFS2: Erase block at 0x00c24000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc28000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c28000, fail=
 count:97
<5>JFFS2: Erase block at 0x00c28000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc2c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c2c000, fail=
 count:97
<5>JFFS2: Erase block at 0x00c2c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc30000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c30000, fail=
 count:97
<5>JFFS2: Erase block at 0x00c30000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc34000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c34000, fail=
 count:97
<5>JFFS2: Erase block at 0x00c34000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc38000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c38000, fail=
 count:97
<5>JFFS2: Erase block at 0x00c38000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc3c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c3c000, fail=
 count:97
<5>JFFS2: Erase block at 0x00c3c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc40000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c40000, fail=
 count:98
<5>JFFS2: Erase block at 0x00c40000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc44000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c44000, fail=
 count:97
<5>JFFS2: Erase block at 0x00c44000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc48000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c48000, fail=
 count:98
<5>JFFS2: Erase block at 0x00c48000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc4c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c4c000, fail=
 count:98
<5>JFFS2: Erase block at 0x00c4c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc50000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c50000, fail=
 count:98
<5>JFFS2: Erase block at 0x00c50000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc54000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c54000, fail=
 count:108
<5>JFFS2: Erase block at 0x00c54000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc58000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c58000, fail=
 count:98
<5>JFFS2: Erase block at 0x00c58000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc5c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c5c000, fail=
 count:98
<5>JFFS2: Erase block at 0x00c5c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc60000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c60000, fail=
 count:99
<5>JFFS2: Erase block at 0x00c60000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc64000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c64000, fail=
 count:99
<5>JFFS2: Erase block at 0x00c64000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc68000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c68000, fail=
 count:99
<5>JFFS2: Erase block at 0x00c68000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc6c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c6c000, fail=
 count:99
<5>JFFS2: Erase block at 0x00c6c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc70000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c70000, fail=
 count:99
<5>JFFS2: Erase block at 0x00c70000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc74000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c74000, fail=
 count:99
<5>JFFS2: Erase block at 0x00c74000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc78000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c78000, fail=
 count:99
<5>JFFS2: Erase block at 0x00c78000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc7c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c7c000, fail=
 count:99
<5>JFFS2: Erase block at 0x00c7c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc80000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c80000, fail=
 count:100
<5>JFFS2: Erase block at 0x00c80000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc84000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c84000, fail=
 count:100
<5>JFFS2: Erase block at 0x00c84000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc88000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c88000, fail=
 count:100
<5>JFFS2: Erase block at 0x00c88000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc8c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c8c000, fail=
 count:100
<5>JFFS2: Erase block at 0x00c8c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc90000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c90000, fail=
 count:100
<5>JFFS2: Erase block at 0x00c90000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc94000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c94000, fail=
 count:100
<5>JFFS2: Erase block at 0x00c94000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc98000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c98000, fail=
 count:100
<5>JFFS2: Erase block at 0x00c98000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xc9c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00c9c000, fail=
 count:100
<5>JFFS2: Erase block at 0x00c9c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xca0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ca0000, fail=
 count:101
<5>JFFS2: Erase block at 0x00ca0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xca4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ca4000, fail=
 count:101
<5>JFFS2: Erase block at 0x00ca4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xca8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ca8000, fail=
 count:101
<5>JFFS2: Erase block at 0x00ca8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cac000, fail=
 count:101
<5>JFFS2: Erase block at 0x00cac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcb0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cb0000, fail=
 count:101
<5>JFFS2: Erase block at 0x00cb0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcb4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cb4000, fail=
 count:101
<5>JFFS2: Erase block at 0x00cb4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcb8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cb8000, fail=
 count:101
<5>JFFS2: Erase block at 0x00cb8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcbc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cbc000, fail=
 count:101
<5>JFFS2: Erase block at 0x00cbc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcc0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cc0000, fail=
 count:102
<5>JFFS2: Erase block at 0x00cc0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcc4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cc4000, fail=
 count:102
<5>JFFS2: Erase block at 0x00cc4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcc8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cc8000, fail=
 count:102
<5>JFFS2: Erase block at 0x00cc8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xccc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ccc000, fail=
 count:102
<5>JFFS2: Erase block at 0x00ccc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcd0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cd0000, fail=
 count:102
<5>JFFS2: Erase block at 0x00cd0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcd4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cd4000, fail=
 count:102
<5>JFFS2: Erase block at 0x00cd4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcd8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cd8000, fail=
 count:102
<5>JFFS2: Erase block at 0x00cd8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcdc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cdc000, fail=
 count:102
<5>JFFS2: Erase block at 0x00cdc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xce0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ce0000, fail=
 count:103
<5>JFFS2: Erase block at 0x00ce0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xce4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ce4000, fail=
 count:103
<5>JFFS2: Erase block at 0x00ce4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xce8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ce8000, fail=
 count:103
<5>JFFS2: Erase block at 0x00ce8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cec000, fail=
 count:103
<5>JFFS2: Erase block at 0x00cec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcf0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cf0000, fail=
 count:103
<5>JFFS2: Erase block at 0x00cf0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcf4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cf4000, fail=
 count:103
<5>JFFS2: Erase block at 0x00cf4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcf8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cf8000, fail=
 count:103
<5>JFFS2: Erase block at 0x00cf8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xcfc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00cfc000, fail=
 count:103
<5>JFFS2: Erase block at 0x00cfc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd00000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d00000, fail=
 count:104
<5>JFFS2: Erase block at 0x00d00000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd04000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d04000, fail=
 count:104
<5>JFFS2: Erase block at 0x00d04000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd08000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d08000, fail=
 count:160
<5>JFFS2: Erase block at 0x00d08000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd0c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d0c000, fail=
 count:104
<5>JFFS2: Erase block at 0x00d0c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd10000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d10000, fail=
 count:104
<5>JFFS2: Erase block at 0x00d10000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd14000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d14000, fail=
 count:104
<5>JFFS2: Erase block at 0x00d14000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd18000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d18000, fail=
 count:104
<5>JFFS2: Erase block at 0x00d18000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd1c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d1c000, fail=
 count:104
<5>JFFS2: Erase block at 0x00d1c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd20000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d20000, fail=
 count:48
<5>JFFS2: Erase block at 0x00d20000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd24000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d24000, fail=
 count:105
<5>JFFS2: Erase block at 0x00d24000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd28000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d28000, fail=
 count:105
<5>JFFS2: Erase block at 0x00d28000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd2c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d2c000, fail=
 count:105
<5>JFFS2: Erase block at 0x00d2c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd30000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d30000, fail=
 count:105
<5>JFFS2: Erase block at 0x00d30000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd34000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d34000, fail=
 count:105
<5>JFFS2: Erase block at 0x00d34000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd38000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d38000, fail=
 count:105
<5>JFFS2: Erase block at 0x00d38000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd3c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d3c000, fail=
 count:105
<5>JFFS2: Erase block at 0x00d3c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd40000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d40000, fail=
 count:106
<5>JFFS2: Erase block at 0x00d40000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd44000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d44000, fail=
 count:106
<5>JFFS2: Erase block at 0x00d44000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd48000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d48000, fail=
 count:106
<5>JFFS2: Erase block at 0x00d48000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd4c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d4c000, fail=
 count:106
<5>JFFS2: Erase block at 0x00d4c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd50000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d50000, fail=
 count:106
<5>JFFS2: Erase block at 0x00d50000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd54000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d54000, fail=
 count:106
<5>JFFS2: Erase block at 0x00d54000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd58000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d58000, fail=
 count:106
<5>JFFS2: Erase block at 0x00d58000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd5c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d5c000, fail=
 count:106
<5>JFFS2: Erase block at 0x00d5c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd60000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d60000, fail=
 count:107
<5>JFFS2: Erase block at 0x00d60000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd64000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d64000, fail=
 count:6
<5>JFFS2: Erase block at 0x00d64000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd68000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d68000, fail=
 count:107
<5>JFFS2: Erase block at 0x00d68000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd6c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d6c000, fail=
 count:107
<5>JFFS2: Erase block at 0x00d6c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd70000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d70000, fail=
 count:107
<5>JFFS2: Erase block at 0x00d70000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd74000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d74000, fail=
 count:107
<5>JFFS2: Erase block at 0x00d74000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd78000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d78000, fail=
 count:107
<5>JFFS2: Erase block at 0x00d78000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd7c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d7c000, fail=
 count:107
<5>JFFS2: Erase block at 0x00d7c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd80000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d80000, fail=
 count:108
<5>JFFS2: Erase block at 0x00d80000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd84000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d84000, fail=
 count:108
<5>JFFS2: Erase block at 0x00d84000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd88000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d88000, fail=
 count:108
<5>JFFS2: Erase block at 0x00d88000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd8c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d8c000, fail=
 count:108
<5>JFFS2: Erase block at 0x00d8c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd90000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d90000, fail=
 count:108
<5>JFFS2: Erase block at 0x00d90000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd94000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d94000, fail=
 count:108
<5>JFFS2: Erase block at 0x00d94000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd98000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d98000, fail=
 count:108
<5>JFFS2: Erase block at 0x00d98000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xd9c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00d9c000, fail=
 count:108
<5>JFFS2: Erase block at 0x00d9c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xda0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00da0000, fail=
 count:109
<5>JFFS2: Erase block at 0x00da0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xda4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00da4000, fail=
 count:109
<5>JFFS2: Erase block at 0x00da4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xda8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00da8000, fail=
 count:109
<5>JFFS2: Erase block at 0x00da8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00dac000, fail=
 count:109
<5>JFFS2: Erase block at 0x00dac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdb0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00db0000, fail=
 count:109
<5>JFFS2: Erase block at 0x00db0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdb4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00db4000, fail=
 count:109
<5>JFFS2: Erase block at 0x00db4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdb8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00db8000, fail=
 count:48
<5>JFFS2: Erase block at 0x00db8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdbc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00dbc000, fail=
 count:109
<5>JFFS2: Erase block at 0x00dbc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdc0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00dc0000, fail=
 count:110
<5>JFFS2: Erase block at 0x00dc0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdc4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00dc4000, fail=
 count:110
<5>JFFS2: Erase block at 0x00dc4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdc8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00dc8000, fail=
 count:110
<5>JFFS2: Erase block at 0x00dc8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdcc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00dcc000, fail=
 count:110
<5>JFFS2: Erase block at 0x00dcc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdd0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00dd0000, fail=
 count:110
<5>JFFS2: Erase block at 0x00dd0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdd4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00dd4000, fail=
 count:110
<5>JFFS2: Erase block at 0x00dd4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdd8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00dd8000, fail=
 count:110
<5>JFFS2: Erase block at 0x00dd8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xddc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ddc000, fail=
 count:110
<5>JFFS2: Erase block at 0x00ddc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xde0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00de0000, fail=
 count:111
<5>JFFS2: Erase block at 0x00de0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xde4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00de4000, fail=
 count:99
<5>JFFS2: Erase block at 0x00de4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xde8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00de8000, fail=
 count:111
<5>JFFS2: Erase block at 0x00de8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00dec000, fail=
 count:111
<5>JFFS2: Erase block at 0x00dec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdf0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00df0000, fail=
 count:111
<5>JFFS2: Erase block at 0x00df0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdf4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00df4000, fail=
 count:111
<5>JFFS2: Erase block at 0x00df4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdf8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00df8000, fail=
 count:111
<5>JFFS2: Erase block at 0x00df8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xdfc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00dfc000, fail=
 count:111
<5>JFFS2: Erase block at 0x00dfc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe00000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e00000, fail=
 count:112
<5>JFFS2: Erase block at 0x00e00000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe04000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e04000, fail=
 count:112
<5>JFFS2: Erase block at 0x00e04000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe08000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e08000, fail=
 count:112
<5>JFFS2: Erase block at 0x00e08000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe0c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e0c000, fail=
 count:112
<5>JFFS2: Erase block at 0x00e0c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe10000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e10000, fail=
 count:112
<5>JFFS2: Erase block at 0x00e10000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe14000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e14000, fail=
 count:170
<5>JFFS2: Erase block at 0x00e14000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe18000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e18000, fail=
 count:112
<5>JFFS2: Erase block at 0x00e18000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe1c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e1c000, fail=
 count:112
<5>JFFS2: Erase block at 0x00e1c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe20000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e20000, fail=
 count:113
<5>JFFS2: Erase block at 0x00e20000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe24000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e24000, fail=
 count:113
<5>JFFS2: Erase block at 0x00e24000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe28000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e28000, fail=
 count:113
<5>JFFS2: Erase block at 0x00e28000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe2c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e2c000, fail=
 count:113
<5>JFFS2: Erase block at 0x00e2c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe30000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e30000, fail=
 count:113
<5>JFFS2: Erase block at 0x00e30000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe34000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e34000, fail=
 count:113
<5>JFFS2: Erase block at 0x00e34000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe38000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e38000, fail=
 count:113
<5>JFFS2: Erase block at 0x00e38000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe3c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e3c000, fail=
 count:113
<5>JFFS2: Erase block at 0x00e3c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe40000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e40000, fail=
 count:114
<5>JFFS2: Erase block at 0x00e40000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe44000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e44000, fail=
 count:114
<5>JFFS2: Erase block at 0x00e44000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe48000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e48000, fail=
 count:114
<5>JFFS2: Erase block at 0x00e48000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe4c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e4c000, fail=
 count:114
<5>JFFS2: Erase block at 0x00e4c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe50000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e50000, fail=
 count:138
<5>JFFS2: Erase block at 0x00e50000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe54000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e54000, fail=
 count:114
<5>JFFS2: Erase block at 0x00e54000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe58000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e58000, fail=
 count:114
<5>JFFS2: Erase block at 0x00e58000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe5c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e5c000, fail=
 count:114
<5>JFFS2: Erase block at 0x00e5c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe60000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e60000, fail=
 count:115
<5>JFFS2: Erase block at 0x00e60000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe64000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e64000, fail=
 count:115
<5>JFFS2: Erase block at 0x00e64000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe68000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e68000, fail=
 count:17
<5>JFFS2: Erase block at 0x00e68000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe6c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e6c000, fail=
 count:78
<5>JFFS2: Erase block at 0x00e6c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe70000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e70000, fail=
 count:115
<5>JFFS2: Erase block at 0x00e70000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe74000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e74000, fail=
 count:115
<5>JFFS2: Erase block at 0x00e74000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe78000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e78000, fail=
 count:115
<5>JFFS2: Erase block at 0x00e78000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe7c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e7c000, fail=
 count:115
<5>JFFS2: Erase block at 0x00e7c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe80000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e80000, fail=
 count:116
<5>JFFS2: Erase block at 0x00e80000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe84000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e84000, fail=
 count:116
<5>JFFS2: Erase block at 0x00e84000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe88000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e88000, fail=
 count:170
<5>JFFS2: Erase block at 0x00e88000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe8c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e8c000, fail=
 count:170
<5>JFFS2: Erase block at 0x00e8c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe90000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e90000, fail=
 count:116
<5>JFFS2: Erase block at 0x00e90000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe94000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e94000, fail=
 count:116
<5>JFFS2: Erase block at 0x00e94000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe98000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e98000, fail=
 count:116
<5>JFFS2: Erase block at 0x00e98000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xe9c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00e9c000, fail=
 count:116
<5>JFFS2: Erase block at 0x00e9c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xea0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ea0000, fail=
 count:117
<5>JFFS2: Erase block at 0x00ea0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xea4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ea4000, fail=
 count:117
<5>JFFS2: Erase block at 0x00ea4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xea8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ea8000, fail=
 count:117
<5>JFFS2: Erase block at 0x00ea8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xeac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00eac000, fail=
 count:117
<5>JFFS2: Erase block at 0x00eac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xeb0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00eb0000, fail=
 count:117
<5>JFFS2: Erase block at 0x00eb0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xeb4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00eb4000, fail=
 count:117
<5>JFFS2: Erase block at 0x00eb4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xeb8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00eb8000, fail=
 count:117
<5>JFFS2: Erase block at 0x00eb8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xebc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ebc000, fail=
 count:117
<5>JFFS2: Erase block at 0x00ebc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xec0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ec0000, fail=
 count:118
<5>JFFS2: Erase block at 0x00ec0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xec4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ec4000, fail=
 count:118
<5>JFFS2: Erase block at 0x00ec4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xec8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ec8000, fail=
 count:118
<5>JFFS2: Erase block at 0x00ec8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xecc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ecc000, fail=
 count:118
<5>JFFS2: Erase block at 0x00ecc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xed0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ed0000, fail=
 count:118
<5>JFFS2: Erase block at 0x00ed0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xed4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ed4000, fail=
 count:118
<5>JFFS2: Erase block at 0x00ed4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xed8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ed8000, fail=
 count:118
<5>JFFS2: Erase block at 0x00ed8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xedc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00edc000, fail=
 count:118
<5>JFFS2: Erase block at 0x00edc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xee0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ee0000, fail=
 count:119
<5>JFFS2: Erase block at 0x00ee0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xee4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ee4000, fail=
 count:119
<5>JFFS2: Erase block at 0x00ee4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xee8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ee8000, fail=
 count:119
<5>JFFS2: Erase block at 0x00ee8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xeec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00eec000, fail=
 count:119
<5>JFFS2: Erase block at 0x00eec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xef0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ef0000, fail=
 count:119
<5>JFFS2: Erase block at 0x00ef0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xef4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ef4000, fail=
 count:119
<5>JFFS2: Erase block at 0x00ef4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xef8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ef8000, fail=
 count:119
<5>JFFS2: Erase block at 0x00ef8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xefc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00efc000, fail=
 count:119
<5>JFFS2: Erase block at 0x00efc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf00000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f00000, fail=
 count:32
<5>JFFS2: Erase block at 0x00f00000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf04000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f04000, fail=
 count:120
<5>JFFS2: Erase block at 0x00f04000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf08000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f08000, fail=
 count:120
<5>JFFS2: Erase block at 0x00f08000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf0c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f0c000, fail=
 count:120
<5>JFFS2: Erase block at 0x00f0c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf10000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f10000, fail=
 count:120
<5>JFFS2: Erase block at 0x00f10000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf14000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f14000, fail=
 count:236
<5>JFFS2: Erase block at 0x00f14000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf18000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f18000, fail=
 count:120
<5>JFFS2: Erase block at 0x00f18000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf1c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f1c000, fail=
 count:120
<5>JFFS2: Erase block at 0x00f1c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf20000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f20000, fail=
 count:121
<5>JFFS2: Erase block at 0x00f20000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf24000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f24000, fail=
 count:121
<5>JFFS2: Erase block at 0x00f24000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf28000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f28000, fail=
 count:121
<5>JFFS2: Erase block at 0x00f28000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf2c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f2c000, fail=
 count:121
<5>JFFS2: Erase block at 0x00f2c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf30000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f30000, fail=
 count:121
<5>JFFS2: Erase block at 0x00f30000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf34000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f34000, fail=
 count:121
<5>JFFS2: Erase block at 0x00f34000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf38000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f38000, fail=
 count:121
<5>JFFS2: Erase block at 0x00f38000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf3c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f3c000, fail=
 count:121
<5>JFFS2: Erase block at 0x00f3c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf40000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f40000, fail=
 count:122
<5>JFFS2: Erase block at 0x00f40000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf44000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f44000, fail=
 count:122
<5>JFFS2: Erase block at 0x00f44000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf48000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f48000, fail=
 count:122
<5>JFFS2: Erase block at 0x00f48000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf4c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f4c000, fail=
 count:122
<5>JFFS2: Erase block at 0x00f4c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf50000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f50000, fail=
 count:122
<5>JFFS2: Erase block at 0x00f50000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf54000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f54000, fail=
 count:122
<5>JFFS2: Erase block at 0x00f54000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf58000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f58000, fail=
 count:122
<5>JFFS2: Erase block at 0x00f58000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf5c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f5c000, fail=
 count:32
<5>JFFS2: Erase block at 0x00f5c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf60000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f60000, fail=
 count:123
<5>JFFS2: Erase block at 0x00f60000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf64000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f64000, fail=
 count:123
<5>JFFS2: Erase block at 0x00f64000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf68000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f68000, fail=
 count:123
<5>JFFS2: Erase block at 0x00f68000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf6c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f6c000, fail=
 count:123
<5>JFFS2: Erase block at 0x00f6c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf70000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f70000, fail=
 count:123
<5>JFFS2: Erase block at 0x00f70000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf74000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f74000, fail=
 count:123
<5>JFFS2: Erase block at 0x00f74000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf78000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f78000, fail=
 count:123
<5>JFFS2: Erase block at 0x00f78000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf7c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f7c000, fail=
 count:123
<5>JFFS2: Erase block at 0x00f7c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf80000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f80000, fail=
 count:124
<5>JFFS2: Erase block at 0x00f80000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf84000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f84000, fail=
 count:124
<5>JFFS2: Erase block at 0x00f84000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf88000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f88000, fail=
 count:124
<5>JFFS2: Erase block at 0x00f88000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf8c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f8c000, fail=
 count:124
<5>JFFS2: Erase block at 0x00f8c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf90000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f90000, fail=
 count:124
<5>JFFS2: Erase block at 0x00f90000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf94000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f94000, fail=
 count:124
<5>JFFS2: Erase block at 0x00f94000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf98000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f98000, fail=
 count:124
<5>JFFS2: Erase block at 0x00f98000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xf9c000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00f9c000, fail=
 count:124
<5>JFFS2: Erase block at 0x00f9c000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfa0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fa0000, fail=
 count:125
<5>JFFS2: Erase block at 0x00fa0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfa4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fa4000, fail=
 count:125
<5>JFFS2: Erase block at 0x00fa4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfa8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fa8000, fail=
 count:125
<5>JFFS2: Erase block at 0x00fa8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfac000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fac000, fail=
 count:125
<5>JFFS2: Erase block at 0x00fac000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfb0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fb0000, fail=
 count:125
<5>JFFS2: Erase block at 0x00fb0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfb4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fb4000, fail=
 count:125
<5>JFFS2: Erase block at 0x00fb4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfb8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fb8000, fail=
 count:17
<5>JFFS2: Erase block at 0x00fb8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfbc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fbc000, fail=
 count:0
<5>JFFS2: Erase block at 0x00fbc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfc0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fc0000, fail=
 count:126
<5>JFFS2: Erase block at 0x00fc0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfc4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fc4000, fail=
 count:126
<5>JFFS2: Erase block at 0x00fc4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfc8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fc8000, fail=
 count:126
<5>JFFS2: Erase block at 0x00fc8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfcc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fcc000, fail=
 count:126
<5>JFFS2: Erase block at 0x00fcc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfd0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fd0000, fail=
 count:126
<5>JFFS2: Erase block at 0x00fd0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfd4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fd4000, fail=
 count:126
<5>JFFS2: Erase block at 0x00fd4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfd8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fd8000, fail=
 count:126
<5>JFFS2: Erase block at 0x00fd8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfdc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fdc000, fail=
 count:126
<5>JFFS2: Erase block at 0x00fdc000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfe0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fe0000, fail=
 count:127
<5>JFFS2: Erase block at 0x00fe0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfe4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fe4000, fail=
 count:127
<5>JFFS2: Erase block at 0x00fe4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfe8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fe8000, fail=
 count:127
<5>JFFS2: Erase block at 0x00fe8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xfec000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00fec000, fail=
 count:127
<5>JFFS2: Erase block at 0x00fec000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xff0000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ff0000, fail=
 count:127
<5>JFFS2: Erase block at 0x00ff0000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xff4000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ff4000, fail=
 count:127
<5>JFFS2: Erase block at 0x00ff4000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xff8000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ff8000, fail=
 count:127
<5>JFFS2: Erase block at 0x00ff8000 is not formatted. It will be erased
<7>jffs2_scan_eraseblock(): Scanning block at 0xffc000
<4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00ffc000, fail=
 count:127
<5>JFFS2: Erase block at 0x00ffc000 is not formatted. It will be erased
<5>Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
<5>empty_blocks 0, bad_blocks 0, c->nr_blocks 1024
<7>build_fs failed
lab: mount -t jffs2 /dev/mtdblock/1 /mnt failed with errno -5
>>> Debug message from user: And there you have it.. errors from mount.=20


=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <RockShox> charge up a 50v 1000uf cap and toss it to someone
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFAJdOFPn9tWOqA4LMRAqgUAKCKxjj2KR8UaY68wnjzzkxpPVhZBgCfetbX
a9di5SccWMoGHh8HAQfwpVU=3D
=3DX9PB
=2D----END PGP SIGNATURE-----
