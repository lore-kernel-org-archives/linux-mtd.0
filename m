Received: from [64.90.21.200] (helo=atlaspdc.atlas-tech.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AQvZe-0004DW-GB
	for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2003 21:27:18 +0000
Message-ID: <08F9C91BD42DD411A48900C04F109FD4C733AC@atlaspdc.atlas-tech.com>
From: "mark a. mixson" <mmixson@atlas-tech.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 1 Dec 2003 16:25:39 -0500 
MIME-Version: 1.0
Content-Type: text/plain
Subject: DOC + GRUB + MTD + compressed ext2 root ramdisk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Before I begin, I'll address some previous issues mentioned by Steven and
Denis:

> first of all I managed to install grub using 'doc_loadbios' so it replaces
> the DOC's SPL , then I managed to use 'nftl_format' and formatted from
> memory address '98304' which isn't the size of the grub boot loader but I
> assume represents '16384 + 81920' , '81920' being the last erase offset,
> from here I managed to 'fdisk nftla' and created a new partition
> '/dev/nftla1', I can format this partition and safely read and write data.
>Icompiled all the DOC files as modules, I didn't patch the kernel I decided
> to use a clean '2.4.19' kernel' , I also couldn't compile the latest CVS
> tools ;/ so I went back to a previous snapshot
> 'Mtd-snapshot-20020708.tar.bz2' , this compiled fine (mainly I couldnt
> compile nftl_format and something to do with empty LIST_HEAD structures,>
>blktrans.h with the latest CVS).

I suggest using the absolute latest stable kernel (2.4.22) with the absolute
latest cvs code (for mtd and grub -- if you use the grub) (~11/10/03 patch
is the latest I believe).  You may have some specific issue that will keep
you from using the latest code that I don't know about, but if you don't,
the latest code works the best.

>I cannot get ctrlbypass working with grub at the moment. Code looks correct
>but always boots to the grub prompt even if I hold down the control key.
>Very strange.

I'm using the latest code and have had no problems with control-bypass.

* * * * *

Ok, now for my troubles.  Apparently this procedure (as semi-defined in the
JFFS+MTD HOWTO) is not straight-forward.  I have a 2.4.22 kernel boot image
(bzImage) on an i386 platform with MTD/initrd support compiled in (my mtd
code was downloaded from cvs on 11/24/03).  I also have a root filesystem
using ext2 that is a compressed loopback device image -- that is, I put a
root filesystem into a loopback device file and gziped the file.  I want to
uncompress the file into an initial ramdisk (using initrd I assume) and use
that ramdisk as root for the remainder of my session.  My bootloader is
grub, and I'm using the mtd + grub interface (replacing the M-Systems
firmware).  I'm using the latest grub + mtd patches (11-10-03).  My menu.lst
file looks something like this:

rootnoverify (dc0,0)
kernel /boot/bzImage root=/dev/ram ramdisk_size=26000 init=/bin/sh rw
initrd /ramdisk.gz

BTW, I get a big wait at the booting screen.  I suppose the ramdisk.gz is
being loaded into memory?  No messages explain what's going on.

I'm not totally sure where the problem is here (if it's in grub, mtd, the
interlinked patches, the compressed filesystem) but I can't get the
filesystem to boot.  All the mtd code appears to load properly and
recognizes the DoC correctly.  But here's the last lines of the boot code:

NFTL driver: nftlcore.c $Revision: 1.94 $, nfltmount.c $Revision: 1.34 $
DiskOnChip 2000 found at address 0xD6000
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba:NAND 16MiB 3,3V)
1 flash chips found. Total DiskOnChip size: 16 MiB
NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think we
know what it means... (*)
Partition check:
 nftla: nftla1

%%%%TCP/IP info yaddayadda%%%%

RAMDISK: Compressed image found at block 0
Freeing initrd memory: 9367k (**)
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 236k freed
Kernel panic: No init found. Try passing init= option to kernel.

%%%%END%%%%

(*) What does this message mean?

(**) 9367k is approximately the size of my compressed ramdisk

About the kernel panic:  I have researched that it might come from
improperly linked C libraries.  I have made sure that they were linked
properly and that has not resolved my problem.

I know that several of my questions extend beyond mtd (and probably the
purpose of this list), but the primary reason why I'm using mtd is the
interface it provides with GRUB (so I can bypass the M-SYS firmware).  If
anyone has any input, I'd greatly appreciate it.

Mark Mixson
m%mi%xso%n%@a%tl%as-%te%c%%h.%%c%om
(please remove %'s)
