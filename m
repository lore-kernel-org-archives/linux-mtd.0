Received: from rwcrmhc13.comcast.net ([204.127.198.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AYVSd-0001hv-1H
	for linux-mtd@lists.infradead.org; Mon, 22 Dec 2003 19:11:23 +0000
Date: Mon, 22 Dec 2003 14:09:06 -0500
From: "George G. Davis" <davis_g@comcast.net>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk
Message-ID: <20031222190906.GB20778@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: integrator-flash Chip reports voltage low on erase
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

First, I'm intentionlly cross posting this because portions of the relevent
code are contained in both MTD CVS HEAD and linux-2.6.0-rmk1 patch.

I submitted a fix for this problem against linux-2.6.0-test10-rmk1 here:

http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=1728/1

However RMK has requested further discussion for this issue. So here goes...

The ARM Integrator/AP (see drivers/mtd/maps/integrator-flash.c) has a single
contiguous logical bank of flash memory comprised of 4 physical banks x 2 x
256kib x 16-bit Intel DT28F320 devices. At least this is the case for my ARM
Integrator/AP rev D. For my particular hardware rev of the ARM Integrator/AP,
I get "Chip reports voltage low on erase" errors while running linux-2.6.0-rmk1
+ MTD CVS HEAD as of 19Dec03 +/-. The same problem also exists in past revs of
linux 2.4, 2.6 and MTD CVS. So this is not a regression in recent kernels or
MTD.

Here are the flash details from kernel init messages:

armflash0: Found 2 x16 devices at 0x0 in 32-bit mode
armflash0: Found 2 x16 devices at 0x800000 in 32-bit mode
armflash0: Found 2 x16 devices at 0x1000000 in 32-bit mode
armflash0: Found 2 x16 devices at 0x1800000 in 32-bit mode
 Intel/Sharp Extended Query Table at 0x0031
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
4 cmdlinepart partitions found on MTD device armflash0
Creating 4 MTD partitions on "armflash0":
0x00000000-0x00400000 : "kernel"
0x00400000-0x01000000 : "rootfs"
0x01000000-0x01fc0000 : "userfs"
0x01fc0000-0x02000000 : "sib"

FWIW, I added MTD cmdlinepart support as follows (because I am not currently
using RedBoot firmware on this target and I abhor the ARM afs support 8 ):

Index: drivers/mtd/maps/integrator-flash.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/integrator-flash.c,v
retrieving revision 1.14
diff -u -r1.14 integrator-flash.c
--- drivers/mtd/maps/integrator-flash.c	11 Oct 2003 10:00:31 -0000	1.14
+++ drivers/mtd/maps/integrator-flash.c	22 Dec 2003 17:55:05 -0000
@@ -65,7 +65,7 @@
 		info->plat->set_vpp(on);
 }
 
-static const char *probes[] = { "RedBoot", "afs", NULL };
+static const char *probes[] = { "cmdlinepart", "RedBoot", "afs", NULL };
 
 static int armflash_probe(struct device *_dev)
 {


Here's the linux cmdline and flash partition details for this test case:

cat /proc/cmdline
console=ttyAM0,38400n8 noinitrd root=/dev/nfs ip=bootp mtdparts=armflash0:0x00400000@0x00000000(kernel),0x00c00000@0x00400000(rootfs),0x00fc0000@0x01000000(userfs),0x00040000@0x01fc0000(sib)

cat /proc/mtd
dev:	size   erasesize  name
mtd0: 00400000 00020000 "kernel"
mtd1: 00c00000 00020000 "rootfs"
mtd2: 00fc0000 00020000 "userfs"
mtd3: 00040000 00020000 "sib"


And here's the test case with results:

mkdir -p /initrd
mkdir -p /mnt/mtdblock1
eraseall /dev/mtd1
mount -oloop /boot/initrd.ext2fs /initrd/
mount -tjffs2 /dev/mtdblock1 /mnt/mtdblock1
cd /initrd/
find . -mount -depth--print0 | cpio -padmu0 /mnt/mtdblock1 lock1
Chip reports voltage low on erase: status 0xa800a8
Erase at 0x003e0000 failed immediately: errno -5
Chip reports voltage low on erase: status 0xa800a8
Erase at 0x003c0000 failed immediately: errno -5
Chip reports voltage low on erase: status 0xa800a8
Erase at 0x003a0000 failed immediately: errno -5
.
.
.
ad nauseam!


A fix for this problem can be found at the URL noted above. Note that
the fix is against the linux-2.6.0-rmk1 patch sice the affected code is
not contained in MTD CVS. Also note that this problem exists in linux-2.4
as well.


Comments/feedback appreciated.

TIA!

-- 
Regards,
George
