Received: from mail01.powweb.com ([66.152.97.34])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2xkK-0000xC-BQ
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2004 15:59:52 -0400
Received: from divsol.com (pool-141-157-244-15.ny325.east.verizon.net
	[141.157.244.15])
	by mail01.powweb.com (Postfix) with ESMTP id C978141503
	for <linux-mtd@lists.infradead.org>;
	Thu,  2 Sep 2004 11:56:09 -0700 (PDT)
Message-ID: <41376CC2.8040207@divsol.com>
Date: Thu, 02 Sep 2004 12:56:02 -0600
From: Jim Cromie <jcromie@divsol.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: mtd/doc/jffs2 orientation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi folks,

apologies in advance for some slightly wide ranging questions.
Ive read a bunch (I hope its apparent), but will glady accept other 
pointers.
I freely make guesses, hoping it will allow for shorter/easier, more 
focussed answers,
and possibly become good FAQ fodder ( Ill try to convert this thread 
into a FAQ entry)

Ive got a Soekris 4801 sbc (SC1100 processor)
and have linux 2.4.27 running on it, and booting from /dev/hda
I dont want to burn up the CF, so Im trying to figure out jffs2
(for its wear levelling), and switch over.

 From the soekris manual: (all the relevant info)

3.4     JP2, CompactFlash socket
CompactFlash type I/II socket. This interfaces to the SC1100 processor
as an IDE controller, and can be set for either the master or slave on the
controller. Please see the Compact Flash Specification rev 1.4 for pin
layout, mechanical and electrical specifications.
3.5     JP5, User I/O

(FAQ1. is this the same as CFI ?  if not, whats the diff ?  how do they 
relate ?)


(FAQ2. how do I know which Ive got/need ?)

Try building all modules, and loading them, then look at /proc/mtd

Ive built the kernel with these:

soekris:/lib/modules/2.4.27-adeos/kernel# ls -R drivers/mtd
drivers/mtd:
chips          ftl.o       mtdblock_ro.o  mtdcore.o  nftl.o
cmdlinepart.o  maps        mtdchar.o      mtdpart.o  redboot.o
devices        mtdblock.o  mtdconcat.o    nand
 drivers/mtd/chips:
cfi_probe.o  chipreg.o  gen_probe.o  jedec_probe.o
 drivers/mtd/devices:
blkmtd.o  doc1000.o  doc2000.o  docecc.o  docprobe.o
 drivers/mtd/maps:
physmap.o  scx200_docflash.o
 drivers/mtd/nand:
nand.o  nand_ecc.o  nand_ids.o
soekris:/lib/modules/2.4.27-adeos/kernel#


Q2.  How do I know which are correct/useful ?  (guess follows)

doc2000 installs w/o errors, but nothing shows in /proc/mtd.

# /sbin/insmod doc1000
Using /lib/modules/2.4.27-adeos/kernel/drivers/mtd/devices/doc10mtd: 
Giving out device 0 to M-Systems DiskOnChip 1000
00.o

# more /proc/mtd
dev:    size   erasesize  name
mtd0: 00100000 00010000 "M-Systems DiskOnChip 1000"

FAQ3.  is this doc-# a function of the compact-flash memory, the mobo/sbc,
or something else ?  is there any relation/dependence on the IDE controller
that my mobo uses ?

FAQ4 - how does docflash relate to any of this ?

The scx_docflash driver wont load for me, I have no idea why not.

# /sbin/modprobe scx200_docflash
/lib/modules/2.4.27-adeos/kernel/drivers/mtd/maps/scx200_docflash.o: 
init_module: No such device
Hint: insmod errors can be caused by incorrect module parameters, 
including invalid IO or IRQ parameters.
      You may find more information in syslog or the output from dmesg
/lib/modules/2.4.27-adeos/kernel/drivers/mtd/maps/scx200_docflash.o: 
insmod 
/lib/modules/2.4.27-adeos/kernel/drivers/mtd/maps/scx200_docflash.o failed

(the module is built, and other scx200 modules work (ie gpio))


Q5,  what does this tell the prepared reader ?
(no DOC device ?)

# /sbin/modprobe -t drivers/mtd/devices \*
Possible DiskOnChip with unknown ChipID 75 found at 0xc8000
Possible DiskOnChip with unknown ChipID F7 found at 0xca000
Possible DiskOnChip with unknown ChipID 04 found at 0xcc000
Possible DiskOnChip with unknown ChipID 46 found at 0xce000
Possible DiskOnChip with unknown ChipID EB found at 0xd0000
Possible DiskOnChip with unknown ChipID FF found at 0xd2000
Possible DiskOnChip with unknown ChipID FF found at 0xd4000
Possible DiskOnChip with unknown ChipID FF found at 0xd6000
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
No recognised DiskOnChip devices found
soekris:/lib/modules/2.4.27-adeos/kernel# ls -R drivers/mtd/
chips          ftl.o          mtdblock_ro.o  mtdcore.o      nftl.o
cmdlinepart.o  maps           mtdchar.o      mtdpart.o      redboot.o
devices        mtdblock.o     mtdconcat.o    nand
soekris:/lib/modules/2.4.27-adeos/kernel# ls -R drivers/mtd/devices/
drivers/mtd/devices/:
blkmtd.o  doc1000.o  doc2000.o  docecc.o  docprobe.o
soekris:/lib/modules/2.4.27-adeos/kernel# /sbin/modprobe -t 
drivers/mtd/devices
 \*

Q - how do I read these ?

(no nand device)

# flash_info /dev/mtd0
MTD_open
MTD_ioctl
Device /dev/mtd0MTD_close
 has 0 erase regsync...ions
Done.

(a good nftl device, with X sectors?  file out is 0 bytes !)

# nftldump /dev/mtd0 ~/nftl-dump-out
MTD_open
MTD_ioctl
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_read
MTD_close
sync...Done.

(the size here is puzzling, this is a sandisk 512 mb)

# mtd_debug info /dev/mtd0
MTD_open
MTD_ioctl
MTD_ioctl
mtd.type = MTD_NMTD_close
ORFLASH
mtd.flasync...gs = MTD_CAP_NORDone.
FLASH
mtd.size = 1048576 (1M)
mtd.erasesize = 65536 (64K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0
 
# mtd_debug read /dev/mtd0
usage: mtd_debug info <device>
       mtd_debug read <device> <offset> <len> <dest-filename>
       mtd_debug write <device> <offset> <len> <source-filename>
       mtd_debug erase <device> <offset> <len>
soekris:/lib/modules/2.4.27-adeos/kernel# mtd_debug read /dev/mtd0 0 
1000000 ~/
mtd-read
MTD_open
MTD_read
Copied 1000000 bMTD_close
ytes from addressync...s 0x00000000 in Done.
flash to /root/mtd-read

soekris:/lib/modules/2.4.27-adeos/kernel# od -c ~/mtd-read
0000000 377 377 377 377 377 377 377 377 377 377 377 377 377 377 377 377
*
3641100

odd - the flash has a working (unless Ive fsckd it up) ext2 filesystem on it


Q X.   the mkfs.jffs material Ive read seems to imply that its necessary 
(or just better?)
to build an image, then write it separately to the flash.  This is 
reminiscent of ISO burning;
make an iso image, then burn it with cdrecord.  Is this why flash_erase, 
?ftl_format are
separate ?   Surely sector? erase is built into the jffs-fs for it to 
just work ?!

As is probably evident, I havent gone here yet - I want a little more 
confidence bfore
I trash a working ext2 fs..

tia
jimc
