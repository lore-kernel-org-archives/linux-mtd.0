Received: from [222.33.36.197] (helo=sict.ac.cn)
	by pentafluge.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cc19G-00089j-Vf
	for linux-mtd@lists.infradead.org; Wed, 08 Dec 2004 12:42:31 +0000
Received: from [10.32.4.45] ([10.32.4.45])
	by sict.ac.cn (Merak 7.2.0) with ASMTP id 42U08685
	for <linux-mtd@lists.infradead.org>; Wed, 08 Dec 2004 20:41:53 +0800
From: zhang jingxin <zhangjingxin@sict.ac.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1102509710.2462.6.camel@z21921>
Mime-Version: 1.0
Date: Wed, 08 Dec 2004 20:41:50 +0800
Content-Transfer-Encoding: 7bit
Subject: doc2000 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,
I want use JFFS2 on my DOC2000 original.I download the latest CVS
version(041128).I use diskonchip.c to drive.It works.

Dec  6 17:47:11 localhost kernel: Creating 1 MTD partitions on
"DiskOnChip 2000 (NFTL Model)":
Dec  6 17:47:11 localhost kernel: 0x00014000-0x02000000 : " DiskOnChip
BDTL partition"
Dec  6 17:47:11 localhost kernel: mtd: Giving out device 1 to 
DiskOnChip BDTL partition

But it has a little error.



Dec  8 10:23:54 localhost kernel: nand_read_ecc: from = 0x0000c000, len
= 512
Dec  8 10:23:54 localhost kernel: nand_read_ecc: Failed ECC read, page
0x00000060 on chip 0
Dec  8 10:23:54 localhost kernel: ECC error scanning DOC at 0xc000

Dec  8 10:23:54 localhost kernel: nand_read_ecc: from = 0x00010000, len
= 512
Dec  8 10:23:55 localhost kernel: nand_read_ecc: Failed ECC read, page
0x00000080 on chip 0
Dec  8 10:23:55 localhost kernel: ECC error scanning DOC at 0x10000

There are two ECC errors.
Then it nand_read_ecc 0x0000c200 .

Dec  8 10:23:55 localhost kernel: nand_read_ecc: from = 0x0000c200, len
= 2048

I don't know why,this position has already done.

I had read below

2004-10-26 15:46

Dan Brown dan_brown at ieee.org 
Fri Jun 18 19:30:56 EDT 2004 
Brief HOWTO (better HOWTO coming soon!):

- Have a DOC Millenium or DOC2000 TSOP.  Millenium+ is not supported
(other
folks are hard at work on this).  DOC2000 original does not have BBT
handling yet (coming soon!) and should not be used with JFFS2 yet.

- Load the new diskonchip module (there is now a kernel configuration
option
for this under NAND devices).  If your DOC device is not at window D000,
you'll have to edit the source or remap your chip.  Proper probing
coming
soon!

- A bunch of mtd devices should be created.  mtd0 is the whole DOC.  The
others are partitions created by M-Systems.  A "BDK" partition is
probably
the M-Sys BIOS driver.  A "BDTL" partition is where your INFTL
filesystem
used to be.  I say used to be, because you're about to trash it.

- You can review the list of devices with 'cat /proc/mtd'

- Assuming your BDTL partition is mtd3:

    flash_eraseall -j /dev/mtd3
    mkfs.jffs2 -p -e 16384 -n -q -r <rootdir> -o <outputfile>
    nandwrite /dev/mtd3 <outputfile from above>
    mount -t jffs2 /dev/mtdblock3 <mountpoint>

So I follow it.
I review the list of devices with 'cat /proc/mtd'
 
 
cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00004000 "DiskOnChip 2000 (NFTL Model)"
mtd1: 01fec000 00004000 " DiskOnChip BDTL partition"


flash_eraseall -j /dev/mtd1
It doesn't recongize the device.

what should i do??
It's this reason --DOC2000 original does not have BBT
handling yet (coming soon!).
