Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14POdS-00067h-00
	for mtd-list@infradead.org; Sun, 04 Feb 2001 12:51:18 +0000
Received: from pop3.galileo.co.il ([199.203.130.130] helo=galileo5.galileo.co.il)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14POdM-00067b-00
	for mtd@infradead.org; Sun, 04 Feb 2001 12:51:13 +0000
Received: from galileo.co.il (rabeeh@linux2.galileo.co.il [10.2.40.2])
	by galileo.co.il (8.8.5/8.8.5) with ESMTP id OAA16024
	for <mtd@infradead.org>; Sun, 4 Feb 2001 14:51:35 +0200 (GMT-2)
Message-ID: <3A7D4FC8.6090504@galileo.co.il>
Date: Sun, 04 Feb 2001 14:49:12 +0200
From: Rabeeh Khoury <rabeeh@galileo.co.il>
MIME-Version: 1.0
To: mtd <mtd@infradead.org>
Subject: Re: problem in reading block filesystem
References: <3A7D4937.6000008@galileo.co.il>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

fixed it.

Thank you

Rabeeh Khoury wrote:

> Hi All,
> 
> I'v downloaded the latest mtd sources from the CVS server, and 
> attached a flash driver for Galileo Technology evaluation boards.
> 
> I have 16MByte of flash memory on board -
> 
> [~]$ cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 01000000 00040000 "Galileo Flash Memory"
> 
> Then I try checking the filesystem on the flash memory, which has not 
> been initialized at all -
> 
> (/dev/mtd0 is a block file major 31 and minor 0 for activating the 
> flash memory as a normal block device)
> 
> [~]$ e2fsck /dev/mtd0
> e2fsck 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
> Couldn't find ext2 superblock, trying backup blocks...
> e2fsck: Attempt to read block from filesystem resulted in short read 
> while trying to open /dev/mtd0
> Could this be a zero-length partition?
> 
> and I get the following mtd debug info -
> 
> Jan  3 09:11:54 lion128 kernel: mtdblock_open
> Jan  3 09:11:54 lion128 kernel: ok
> Jan  3 09:11:54 lion128 kernel: mtdblock: read on "Galileo Flash 
> Memory" at 0x0, size 0x1000
> Jan  3 09:11:54 lion128 kernel: mtdblock_release
> Jan  3 09:11:54 lion128 kernel: ok
> Jan  3 09:11:54 lion128 kernel: mtdblock_open
> Jan  3 09:11:54 lion128 kernel: ok
> Jan  3 09:11:54 lion128 kernel: mtdblock: read on "Galileo Flash 
> Memory" at 0x800000, size 0x1000
> Jan  3 09:11:54 lion128 kernel: mtdblock_release
> Jan  3 09:11:54 lion128 kernel: ok
> Jan  3 09:11:54 lion128 kernel: mtdblock_open
> Jan  3 09:11:54 lion128 kernel: ok
> Jan  3 09:11:54 lion128 kernel: mtdblock_release
> Jan  3 09:11:54 lion128 kernel: ok
> Jan  3 09:11:54 lion128 kernel: mtdblock_open
> Jan  3 09:11:54 lion128 kernel: ok
> Jan  3 09:11:54 lion128 kernel: mtdblock_release
> Jan  3 09:11:54 lion128 kernel: ok
> Jan  3 09:11:54 lion128 kernel: mtdblock_open
> Jan  3 09:11:54 lion128 kernel: ok
> Jan  3 09:11:54 lion128 kernel: mtdblock_release
> Jan  3 09:11:54 lion128 kernel: ok
> 
> Then I try creating a new filesystem on the flash -
> 
> [root@lion128 ~]$ mke2fs /dev/mtd0
> mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
> Filesystem label=
> OS type: Linux
> Block size=1024 (log=0)
> Fragment size=1024 (log=0)
> 4096 inodes, 16384 blocks
> 819 blocks (5.00%) reserved for the super user
> First data block=1
> 2 block groups
> 8192 blocks per group, 8192 fragments per group
> 2048 inodes per group
> Superblock backups stored on blocks:
>   8193
> 
> Writing inode tables: 0/2Warning: could not write 8 blocks in inode 
> table starting at 5: Attempt to write block from filesystem resulted 
> in short write
> Warning: could not write 8 blocks in inode table starting at 13: 
> Attempt to write block from filesystem resulted in short write
> Warning: could not write 8 blocks in inode table starting at 21: 
> Attempt to write block from filesystem resulted in short write
> Warning: could not write 8 blocks in inode table starting at 29: 
> Attempt to write block from filesystem resulted in short write
> Warning: could not write 8 blocks in inode table starting at 37: 
> Attempt to write block from filesystem resulted in short write
> Warning: could not write 8 blocks in inode table starting at 45: 
> Attempt to write block from filesystem resulted in short write
> Warning: could not write 8 blocks in inode table starting at 53: 
> Attempt to write block from filesystem resulted in short write
> 
> ....
> ....
> Warning: could not write 8 blocks in inode table starting at 8445: 
> Attempt to write block from filesystem resulted in short write
> done
> ext2fs_mkdir: Attempt to write block from filesystem resulted in short 
> write while creating root dir
> 
> 
> and I get the following mtd debug info -
> 
> Jan  3 09:12:05 lion128 kernel: mtdblock_open
> Jan  3 09:12:05 lion128 kernel: ok
> Jan  3 09:12:05 lion128 kernel: mtdblock_release
> Jan  3 09:12:05 lion128 kernel: ok
> Jan  3 09:12:05 lion128 kernel: mtdblock_open
> Jan  3 09:12:05 lion128 kernel: ok
> Jan  3 09:12:05 lion128 kernel: mtdblock_release
> Jan  3 09:12:05 lion128 kernel: ok
> Jan  3 09:12:23 lion128 kernel: mtdblock_open
> Jan  3 09:12:23 lion128 kernel: ok
> Jan  3 09:12:23 lion128 kernel: mtdblock_release
> Jan  3 09:12:23 lion128 kernel: ok
> Jan  3 09:12:23 lion128 kernel: mtdblock_open
> Jan  3 09:12:23 lion128 kernel: ok
> Jan  3 09:12:23 lion128 kernel: mtdblock_release
> Jan  3 09:12:23 lion128 kernel: ok
> 
> p.s. debug level is 3 (noisy)
> 
> 
> The mtd doesn't even call my write function or erase function at all !!!
> 
> Can you see what could be the problem ?
> 
> I have other questions -
> Is there any new API documentation on the net ?
> Is there any documentation on how to activate the other features of 
> the MTD subsystem (FTL and others...)
> 
> Thanks a ton -
> Rabeeh
> 
> 
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
> 
> 
> 



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
