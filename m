Received: from [193.233.71.179] (helo=avanto.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CZts0-0001sW-W5
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2004 11:32:01 -0500
Received: from skorinkod.lan ([10.255.2.21])
	by avanto.mpei.ac.ru with esmtp (Exim 3.36 #1 (Debian))
	id 1CZtrE-0002Q1-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 Dec 2004 19:31:04 +0300
From: Dmitry Skorinko <skorinkod@mosk.ru>
To: linux-mtd@lists.infradead.org
Date: Thu, 2 Dec 2004 19:31:05 +0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200412021931.05132.skorinkod@mosk.ru>
Subject: Booting from DiskOnChip
Reply-To: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all.

As I understand there are two ways for booting from DiskOnChip (correct me, if 
I think wrong):
1) use patched lilo from M-System site
2) use patched grub from mtd cvs

I don't know, can I use lilo-mtd for it?


-----------------------------------------------------------------------

I have:
# .dformat -win:e000 -s:./DOC514.EXB -first -nodos -y
DFORMAT Version 5.1.4.37 for Linux
Copyright (C) M-Systems, 1992-2002

DiskOnChip 2000 TSOP found in 0xe0000.
256M media, 16K unit

Formatting               16384
===========================
Mounting Disk Partition 0
Unit 16374 out of 16374

Writing boot image       197728

OK
Please reboot to let DiskOnChip install itself.
# modprobe diskonchip
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 10000000 00004000 "DiskOnChip 2000 (INFTL Model)"
mtd1: 00010000 00004000 " DiskOnChip BDK partition"
mtd2: 0ffd8000 00004000 " DiskOnChip BDTL partition"
# modprobe inftl
# fdisk /dev/inftla
Device contains neither a valid DOS partition table, nor Sun, SGI or OSF 
disklabel
Building a new DOS disklabel. Changes will remain in memory only,
until you decide to write them. After that, of course, the previous
content won't be recoverable.

Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)

Command (m for help): p

Disk /dev/inftla: 262 MB, 262881280 bytes
16 heads, 32 sectors/track, 1002 cylinders
Units = cylinders of 512 * 512 = 262144 bytes

      Device Boot      Start         End      Blocks   Id  System

Command (m for help): n
Command action
   e   extended
   p   primary partition (1-4)
p
Partition number (1-4): 1
First cylinder (1-1002, default 1):
Using default value 1
Last cylinder or +size or +sizeM or +sizeK (1-1002, default 1002):
Using default value 1002

Command (m for help): a
Partition number (1-4): 1

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
# mkfs.ext3 /dev/inftla1
mke2fs 1.35 (28-Feb-2004)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
64256 inodes, 256496 blocks
12824 blocks (5.00%) reserved for the super user
First data block=1
32 block groups
8192 blocks per group, 8192 fragments per group
2008 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729, 204801, 221185

Writing inode tables: done
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 28 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
# mount /dev/inftla1 /mnt/diskonchip/

-----------------------------------------------------------------------

When I try 1st way:
#cat ./lilo.conf
#this config was found in maillist archive
lba32
boot=/dev/inftla
map=/mnt/diskonchip/boot/map
backup=/mnt/diskonchip/boot/boot.5D00
install=/mnt/diskonchip/boot/boot.b
prompt
timeout=100

disk=/dev/inftla
    bios=0x80
    sectors=32
    heads=16
    cylinders=1002
    partition=/dev/inftla1
            start=2# without this I see Fatal: Sorry, don't know how to handle 
device 0x5e01

image=/mnt/diskonchip/boot/vmlinuz-2.6.8mymtd26
    label=linux
    append="no-hlt"
    read-only
    root=/dev/hda1

# ./lilo -v -C ./lilo.conf
LILO version 22.3.2, Copyright (C) 1992-1998 Werner Almesberger
Development beyond version 21 Copyright (C) 1999-2002 John Coffman
Released 11-Jul-2002 and compiled at 20:37:04 on Aug 22 2002.

Reading boot sector from /dev/inftla
Using MENU secondary loader
Calling map_insert_data

Boot image: /mnt/diskonchip/boot/vmlinuz-2.6.8mymtd26
Added linux *

/mnt/diskonchip/boot/boot.5D00 exists - no backup copy made.
Writing boot sector.
#reboot

and BIOS say: search boot sector... not found
try "boot=inftla1" - same


-------------------------------------------------------------------------

2nd way:

I patch and build grub-0.92, then:

# ./doc_loadbios /dev/mtd0 ./grub_firmware
Performing Flash Erase of length 16384 at offset 0
ioctl(MEMERASE): Input/output error
# dmesg | tail -8
MTD_open
MTD_ioctl
MTD_ioctl
nand_erase: start = 0x00000000, len = 16384
nand_isbad_bbt(): bbt info for offs 0x00000000: (block 2) 0x00
nand_erase: attempt to erase a bad block at page 0x00000000
MTD_close
nand_sync: called

---------------------------------------------------------------------------

other questions:
1) Should I write M-systems firmware to flash? When I don't write it, I don't 
have DiskOnChip BDK partition and all results are same. But without firmware 
I can't use option -first in dformat and BIOS don't see flash at all!
2) How I can boot from DiskOnChip? :)


thanks
Dmitry
