Received: from lion-s12.seas.upenn.edu ([158.130.12.194] helo=lion.seas.upenn.edu)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187Miv-0003uZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2002 21:19:29 +0000
Message-ID: <005401c28127$6021ca10$c3c8320a@langostino>
From: "Adam Lee" <leeyt@seas.upenn.edu>
To: "linux-mtd list" <linux-mtd@lists.infradead.org>
Cc: <alee@ttcdas.com>, <egernavage@ttcdas.com>
Subject: Problems with DOC 2000
Date: Thu, 31 Oct 2002 16:49:14 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi,

I am having some trouble working with 96MB DOC 2000 under kernel 2.4.18-3,
but let me first take a minute to explain the somewhat unique design of our
embedded PC so you will have a better idea about what I am doing.

For our embedded PC, we have a 2MB NOR flash memory on board,
which contains embedded DOS and linux kernel bzImage.  The way to boot
into linux is:

1) Boot into NOR flash with embedded DOS
2) in autoexec.bat, we use loadlin bzImage root=<device> to point to the
root filesystem.

The reason for us to do this is that it is suggested by the manufacturer of
the embeddedPC, also partly because we don't want to use extra space on the
DOC for the kernel itself.

Currently I have compiled the DOC driver into kernel. and if I boot into
another root fs on a harddisk, I can mount the DOC as /dev/nftla1 and
able to put a copy of the filesystem into it.  However, I do encouter some
problem with it even if just using it as an extra drive.  It hangs my shell
from time to time, for example, if I run fsck -c /dev/nftla1 it hangs, and
it
sometimes hangs during booting while mounting for filesystems. (note that
/dev/nftla1 is NOT in /etc/fstab, but still)  When I untar the root
filesystem
into a formatted ext2 filesystem in the DOC, it hangs at the very end,
(Ctrl-C doesn't break) but after I restart, all the files are in the DOC.

I do get an error message in booting, this is the message I got in dmesg:

Using configured DiskOnChip probe address 0xd0000
DiskOnChip 2000 found at address 0xD0000
Flash chip found: Manufacturer ID: EC, Chip ID: 75 (Samsung KM29U256T)
3 flash chips found. Total DiskOnChip size: 96 MiB
mtd: Giving out device 0 to DiskOnChip 2000
NFTL driver: nftlcore.c $Revision: 1.87 $, nftlmount.c $Revision: 1.30 $
NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think we
know what it means...
Cannot calculate an NFTL geometry to match size of 0x2efc0.
Using C:1002 H:16 S:12 (== 0x2ef80 sects)
nftla: nftla1

Now, if I try to use the FS on DOC as root, with the command:

loadlin bzImage root=/dev/nftla1

Kernel loads fine, and VFS is able to mount the root on DOC, shown in dmesg:

VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 56k freed

Normally the next thing to run is INIT.

***However, if I recompile the kernel with debug level = 3,
it will actually pass this point and boot up fine.  Any level less than 3
(or no debug at all) doesn't work.

The DOC utility I use is version 5.1.2, and I am compiling the kernel with
the latest driver codes from cvs. The compiling option for the kernel is
Direct char device access to MTD devices, NTFL support, write
support for NTFL, debug level = 0~3 and I point the device to the
physical address 0x0000.

Also, if I run cat /proc/mtd this is the message I got:

dev:        size            erasesize    name
mtd0:    06000000    00004000    "DiskOnChip 2000"

If the hanging problem sounds abnormal, please let me know too.

Thank you,
Adam
