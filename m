Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14S3Cm-0001aO-00
	for mtd-list@infradead.org; Sun, 11 Feb 2001 20:34:44 +0000
Received: from mail.mobach.nl ([212.136.194.138] helo=servans.mobach.nl)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14S3Cj-0001aI-00
	for mtd@infradead.org; Sun, 11 Feb 2001 20:34:41 +0000
Received: from volens.mobach.nl (root@volens.mobach.nl [172.16.21.210])
	by servans.mobach.nl (8.9.3/8.9.3/SuSE Linux 8.9.3-0.1) with ESMTP id VAA06547
	for <mtd@infradead.org>; Sun, 11 Feb 2001 21:34:21 +0100
Received: from mobach.nl (mendel@dolens.mobach.nl [172.16.21.68])
	by volens.mobach.nl (8.9.3/BugBlue/Anti-Spam/Filtered) with ESMTP id VAA27837
	for <mtd@infradead.org>; Sun, 11 Feb 2001 21:33:46 +0100
Message-ID: <3A86F72B.A1971413@mobach.nl>
Date: Sun, 11 Feb 2001 21:33:47 +0100
From: Mendel Mobach <mendel@mobach.nl>
Reply-To: mendel@mobach.nl
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: Errors with M-Systems' DOC v MD2200 D16 and ext2
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello

I've got 2 systems with M-systems' DOC
1 with the MD2800 (linux says using the milenium driver) 
(8MD, 1 chip)
and 1 with the MD2200 (16 MB, 2 chips of 8 for mtd0)

With the 2800 I've got no problems but with the 
2200 I've got problems and get some very strange kernel messages

I'm running kernel 2.4.2-pre2 on this system and I attached a harddisk
for development

See below for the kernel and boot messages what kind of problems I've
got

so this is a HELP request from a (l?)user who don't know how to
handle it but wants some help from a expert or someone who knows this
problem
and how I can solve it.

Regards

Mendel Mobach

--------------------- the messages I got yesterday: --------------
kernel:  nftl/disc0/disc: p1 
kernel: EXT2-fs error (device nftl(93,1)): ext2_readdir: bad entry in
directory #11: directory entry across blocks - offset=0, inode=757083762
kernel: EXT2-fs warning (device nftl(93,1)): empty_dir: bad directory
(dir #2025) - no `.' or `..' 
kernel: EXT2-fs error (device nftl(93,1)): ext2_readdir: bad entry in
directory #11: directory entry across blocks - offset=0, inode=757083762
kernel: EXT2-fs error (device nftl(93,1)): ext2_readdir: bad entry in
directory #11: directory entry across blocks - offset=0, inode=757083762
kernel: No Virtual Unit Chains available for folding. Failing request 
kernel: Cannot make free space. 
kernel: NFTL_writeblock(): Cannot find block to write to 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 2 
kernel: No Virtual Unit Chains available for folding. Failing request 
-------------------------------------------------------------------

-------- today messages stuff -------------
kernel:  nftl/disc0/disc: p1 
kernel: devfs: devfs_register(part1): NULL ops, got c026b960 from major
table 
kernel:  nftl/disc0/disc: p1 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 14 
kernel: EXT2-fs error (device nftl(93,1)): ext2_write_inode: unable to
read inode block - inode=17, block=7 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 14 
kernel: EXT2-fs error (device nftl(93,1)): ext2_write_inode: unable to
read inode block - inode=18, block=7 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 14 
kernel: EXT2-fs error (device nftl(93,1)): ext2_write_inode: unable to
read inode block - inode=19, block=7 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 14 
kernel: EXT2-fs error (device nftl(93,1)): ext2_write_inode: unable to
read inode block - inode=20, block=7 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 14 
kernel: EXT2-fs error (device nftl(93,1)): ext2_write_inode: unable to
read inode block - inode=21, block=7 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 14 
kernel: EXT2-fs error (device nftl(93,1)): ext2_write_inode: unable to
read inode block - inode=22, block=7 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 14 
kernel: EXT2-fs error (device nftl(93,1)): ext2_write_inode: unable to
read inode block - inode=23, block=7 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 14 
kernel: EXT2-fs error (device nftl(93,1)): ext2_write_inode: unable to
read inode block - inode=24, block=7 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 14 
kernel: EXT2-fs error (device nftl(93,1)): ext2_write_inode: unable to
read inode block - inode=22, block=7 
kernel: EXT2-fs warning: mounting fs with errors, running e2fsck is
recommended 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 14 
kernel: EXT2-fs error (device nftl(93,1)): ext2_read_inode: unable to
read inode block - inode=21, block=7 
kernel: end_request: I/O error, dev 5d:01 (unknown), sector 14 
kernel: EXT2-fs error (device nftl(93,1)): ext2_read_inode: unable to
read inode block - inode=22, block=7 
kernel: Error programming flash 
last message repeated 6 times 
------------------------------------------------------------

-----------------------Kernelmessages-----------------------
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Possible DiskOnChip with unknown ChipID FF found at 0xc8000
Possible DiskOnChip with unknown ChipID FF found at 0xca000
Possible DiskOnChip with unknown ChipID FF found at 0xcc000
Possible DiskOnChip with unknown ChipID FF found at 0xce000
DiskOnChip 2000 found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba
TC58V64AFT/DC)
2 flash chips found. Total DiskOnChip size: 16 Mb
mtd: Giving out device 0 to DiskOnChip 2000
Ignoring DiskOnChip 2000 at 0xD2000 - already configured
Ignoring DiskOnChip 2000 at 0xD4000 - already configured
Ignoring DiskOnChip 2000 at 0xD6000 - already configured
Possible DiskOnChip with unknown ChipID FF found at 0xd8000
Possible DiskOnChip with unknown ChipID FF found at 0xda000
Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Possible DiskOnChip with unknown ChipID FF found at 0xde000
Possible DiskOnChip with unknown ChipID FF found at 0xe0000
Possible DiskOnChip with unknown ChipID FF found at 0xe2000
Possible DiskOnChip with unknown ChipID FF found at 0xe4000
Possible DiskOnChip with unknown ChipID FF found at 0xe6000
Possible DiskOnChip with unknown ChipID FF found at 0xe8000
Possible DiskOnChip with unknown ChipID FF found at 0xea000
Possible DiskOnChip with unknown ChipID FF found at 0xec000
Possible DiskOnChip with unknown ChipID FF found at 0xee000
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
 nftla: unknown partition table  <--- (#comment) not strange, i just
used nflt_format and rebooted
-----------------------------------------------------------

---
Mendel Mobach aka BugBlue - mendel@mobach.nl - bugblue@dds.nl
ICQ: 40200278 - IRC: BugBlue (ircnet:#ne2000 undernet:#groningen)
/"\                        |   [Student]           
\ /                        |   [IPv6 tester]
 X  ASCII RIBBON CAMPAIGN  |   [coder]
/ \ AGAINST HTML MAIL      |   [Possible security tester]


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
