Received: from gw-nl6.philips.com ([212.153.235.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178iKo-0005ml-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 15:03:54 +0100
Received: from smtpscan-nl3.philips.com (smtpscan-nl3.philips.com [130.139.36.23])
	by gw-nl6.philips.com (Postfix) with ESMTP id F2091A0E4A
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 16:03:53 +0200 (MET DST)
Received: from smtprelay-nl1.philips.com (localhost [127.0.0.1])
	by smtpscan-nl3.philips.com (8.9.3/8.8.5-1.2.2m-19990317) with ESMTP id QAA00474
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 16:03:53 +0200 (MET DST)
From: erik.niessen@philips.com
Received: from ehv501soh.diamond.philips.com (e3soh01.diamond.philips.com [130.139.54.213])
	by smtprelay-nl1.philips.com (8.9.3/8.8.5-1.2.2m-19990317) with ESMTP id QAA00289
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 16:03:52 +0200 (MET DST)
Subject: Problems using mke2fs on DOC-2000 (288MB)
To: linux-mtd@lists.infradead.org
Message-ID: <OFC71DD43C.AE1C268B-ONC1256BBC.004CD0AC@diamond.philips.com>
Date: Fri, 17 May 2002 16:01:02 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I am not able to format my DOC using mke2fs.
This is the output of dmesg.

Possible DiskOnChip with unknown ChipID E0 found at 0xc8000
Possible DiskOnChip with unknown ChipID CC found at 0xca000
Possible DiskOnChip with unknown ChipID FF found at 0xcc000
Possible DiskOnChip with unknown ChipID FF found at 0xce000
DiskOnChip 2000 found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba TC58256FT/DC)
9 flash chips found. Total DiskOnChip size: 288 MiB
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
NFTL driver: nftlcore.c $Revision: 1.85 $, nftlmount.c $Revision: 1.25 $
Formatting block 9086
Formatting block 9087
 nftla: nftla1

This seems ok it tells me that it founds a 288MB DOC
Also it finds a partition.

[root@pscA /root]# fdisk /dev/nftla

Command (m for help): p

Disk /dev/nftla: 16 heads, 36 sectors, 1003 cylinders
Units = cylinders of 576 * 512 bytes

     Device Boot    Start       End    Blocks   Id  System
/dev/nftla1             1      1003    288846   83  Linux


cat /proc/mtd
dev:    size   erasesize  name
mtd0: 12000000 00004000 "DiskOnChip 2000"

This all looks fine.

When I try to format the partition
[root@pscA /root]# mke2fs /dev/nftla1
mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
72288 inodes, 288846 blocks
14442 blocks (5.00%) reserved for the super user
First data block=1
36 block groups
8192 blocks per group, 8192 fragments per group
2008 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729, 204801, 221185

Writing inode tables: done
Writing superblocks and filesystem accounting information:

I receive the following messages.
I am using 2419pre8 also tried with the latest cvs code, but still the same
problem. Do I need to do a DFORMAT?

Thanks for reading sofar.

Cheers,

      Erik

May 17 15:57:58 localhost kernel: Argh! No free blocks found! LastFreeEUN = 9209, FirstEUN = 2
May 17 15:57:58 localhost kernel: Argh! No free blocks found! LastFreeEUN = 9210, FirstEUN = 2
May 17 15:57:58 localhost kernel: Argh! No free blocks found! LastFreeEUN = 9211, FirstEUN = 2
May 17 15:57:58 localhost kernel: Argh! No free blocks found! LastFreeEUN = 9212, FirstEUN = 2
May 17 15:57:58 localhost kernel: Argh! No free blocks found! LastFreeEUN = 9213, FirstEUN = 2
May 17 15:58:20 localhost kernel: n), sector 180226
May 17 15:58:20 localhost kernel: Argh! No free blocks found! LastFreeEUN = 9214, FirstEUN = 2
May 17 15:58:20 localhost kernel: No Virtual Unit Chains available for folding. Failing request
May 17 15:58:20 localhost kernel: Argh! No free blocks found! LastFreeEUN = 9214, FirstEUN = 2
May 17 15:58:20 localhost kernel: Cannot make free space.
May 17 15:58:20 localhost kernel: NFTL_writeblock(): Cannot find block to write to
May 17 15:58:20 localhost kernel: end_request: I/O error, dev 5d:01 (unknown), sector 180228
May 17 15:58:20 localhost kernel: Argh! No free blocks found! LastFreeEUN = 9214, FirstEUN = 2
May 17 15:58:20 localhost kernel: No Virtual Unit Chains available for folding. Failing request
May 17 15:58:20 localhost kernel: Argh! No free blocks found! LastFreeEUN = 9214, FirstEUN = 2
May 17 15:58:20 localhost kernel: Cannot make free space
