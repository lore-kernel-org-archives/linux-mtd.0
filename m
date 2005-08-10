Received: from mta071a.interbusiness.it ([85.37.17.71])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E2vfN-00011q-W3
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 14:51:08 -0400
From: Gianluca <gianlucarenzi@eptar.com>
To: Marc Singer <elf@buici.com>
Date: Wed, 10 Aug 2005 20:30:20 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200508102030.20288.gianlucarenzi@eptar.com>
Cc: linux-arm-kernel@lists.arm.linux.org.uk
Subject: JFFS2 and LPD7A404
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Marc!

I was wondering if (and naturally how) to use an unused partition on the 
internal flash of LogicPD LH7A404 board. As you surely know this board has a 
couple of IntelStrataflash 28F640 (2 chips x 16bit each) for a total of 
16MBytes arranged in a 32bit format.

Assuming I am using the standard physical mapped partition scheme (from 
command line as:

mtdparts=phys_mapped_flash:512k@0(boot)ro,1536k@512k(kernel)ro,-(user)

and the kernel is looking at them as:

physmap flash device: 1000000 at 0
phys_mapped_flash: Found 1 x32 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
3 cmdlinepart partitions found on MTD device phys_mapped_flash
Creating 3 MTD partitions on "phys_mapped_flash":
0x00000000-0x00080000 : "boot"
mtd: Giving out device 0 to boot
0x00080000-0x00200000 : "kernel"
mtd: Giving out device 1 to kernel
0x00200000-0x00800000 : "user"
mtd: Giving out device 2 to user

and looking at /proc I can see:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00080000 00020000 "boot"
mtd1: 00180000 00020000 "kernel"
mtd2: 00600000 00020000 "user"


# cat /proc/partitions
major minor  #blocks  name

   3     0     125440 hda
   3     1     125333 hda1
  31     0        512 mtdblock0
  31     1       1536 mtdblock1
  31     2       6144 mtdblock2

Why is it:
phys_mapped_flash: Found 1 x32 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x0031
and not:
phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x0031
??? Any clue?

So, supposing everything is working fine, I just downloaded (compiled and 
cross-compiled latest mtd tools) and created a filesystem for my "user" 
partition. (BTW has you checked out that the size is only 6MiB?)

On HOST machine:
mkfs.jffs2 -e 262144 -r /myhome/personaldata -o mhpersonaldata.jffs2.img 
(about 1MiB)

Then on target (ARM):

flash_eraseall -j /dev/mtd2

After a while (it takes about 10 seconds to finish at 100% (BTW I saw the 
flash erasesize block is only 128KiB!!!)) I tried to write it into a fresh 
erased flash:

cp mhpersonaldata.jffs2.img /dev/mtdblock2

Finally I tried to mount as local filesystem:

mount -t jffs2 /dev/mtdblock2 /mhpersonaldata-folder/

...and I received a lot of errors like below:

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a0024: 0xffff 
instead
Further such events for this erase block will not be printed
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0000: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0004: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0008: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c000c: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0010: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0014: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0018: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c001c: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0020: 0xffff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0024: 0xffff 
instead
Further such events for this erase block will not be printed
jffs2_scan_eraseblock(): Node at 0x005e0000 {0x1985, 0x00b0, 0x00b0000c) has 
invalid CRC 0x00b0b0b1 (calculated 0x9c857fd2)                                


What is happened? Do I need a patch for using flash in this architecture? Or 
what am I wrong?

Best regards,
-- 
Gianluca Renzi
Eptar s.r.l.
Via Celletta 8/B
40026 Imola (BO) ITALY
Tel.:	+39-0542-609060
Fax.:	+39-0542-609054
