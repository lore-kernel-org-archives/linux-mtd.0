Received: from code-monsters.com ([65.67.50.169] helo=smash.codemonsters.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16grxL-0002nf-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2002 18:40:35 +0000
Received: from ba.devicemonsters.com (adsl-65-70-211-41.dsl.austtx.swbell.net [65.70.211.41])
	by smash.codemonsters.net (8.9.3/8.8.7) with ESMTP id MAA16637
	for <linux-mtd@lists.infradead.org>; Fri, 1 Mar 2002 12:51:54 -0600
Date: Fri, 1 Mar 2002 13:59:59 -0600 (CST)
From: "Brian P. Austin" <baustin@codemonsters.net>
To: linux-mtd@lists.infradead.org
Subject: Reproduction of NFTL Bug with DOC 2000 288MB FULL DEBUG
Message-ID: <Pine.LNX.4.21.0203011346350.795-100000@ba.devicemonsters.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Ok.  I was able to get to the same point as before.

here is my terminal input.
-----------------------------------------------------------------------
MODULE INSERTS

[root@ba /root]# depmod -a
[root@ba /root]# modprobe -a doc2000 nftl mtdchar mtdcore
[root@ba /root]# modprobe -a docprobe
[root@ba /root]# cat /proc/mtd       
dev:    size   erasesize  name
mtd0: 12000000 00004000 "DiskOnChip 2000"

-----------------------------------------------------------------------
FDISK

[root@ba /root]# fdisk /dev/nftla

Device contains neither a valid DOS partition table, nor Sun or SGI
disklabel
Building a new DOS disklabel. Changes will remain in memory only,
until you decide to write them. After that, of course, the previous
content won't be recoverable.


Command (m for help): p

Disk /dev/nftla: 16 heads, 15 sectors, 1023 cylinders
Units = cylinders of 240 * 512 bytes

     Device Boot    Start       End    Blocks   Id  System

Command (m for help): n
Command action
   e   extended
   p   primary partition (1-4)
p
Partition number (1-4): 1
First cylinder (1-1023, default 1): 
Using default value 1
Last cylinder or +size or +sizeM or +sizeK (1-1023, default 1023): 
Using default value 1023

Command (m for help): p

Disk /dev/nftla: 16 heads, 15 sectors, 1023 cylinders
Units = cylinders of 240 * 512 bytes

     Device Boot    Start       End    Blocks   Id  System
/dev/nftla1             1      1023    122752+  83  Linux

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.

WARNING: If you have created or modified any DOS 6.x
partitions, please see the fdisk manual page for additional
information.
Syncing disks.

-----------------------------------------------------------------------------------
MKE2FS

[root@ba /root]# mke2fs /dev/nftla1

mke2fs 1.18, 11-Nov-1999 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
30720 inodes, 122752 blocks
6137 blocks (5.00%) reserved for the super user
First data block=1
15 block groups
8192 blocks per group, 8192 fragments per group
2048 inodes per group
Superblock backups stored on blocks: 
        8193, 24577, 40961, 57345, 73729

Writing inode tables: done                            
Writing superblocks and filesystem accounting information: done
[root@ba /root]# 
-----------------------------------------------------------------------

the message logging is too long, so I attached it.  I hope it makes it
through to the list


Brian P. Austin
