Received: from bubetka.logix.cz ([208.84.148.239] helo=maxipes.logix.cz)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LWO4i-0007UU-L1
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 04:49:08 +0000
Received: from [192.168.130.64] (203-97-206-95.dsl.telstraclear.net
	[203.97.206.95])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by maxipes.logix.cz (Postfix) with ESMTP id 3CD8E339801E
	for <linux-mtd@lists.infradead.org>;
	Sun,  8 Feb 2009 20:15:08 -0800 (PST)
Message-ID: <498FAE9A.4030208@logix.net.nz>
Date: Mon, 09 Feb 2009 17:18:34 +1300
From: Michal Ludvig <mludvig@logix.net.nz>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Writing Linux kernel to MTD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I've got some problems writing a linux kernel image to /dev/mtd1 both
using 'dd of=/dev/mtd1' or using nandwrite. In either case the kernel is
not bootable after such a write.

The board has Samsung S3C2410 ARM CPU and 64MB Samsung NAND flash, uses
u-boot as a boot loader and runs Linux 2.6.27.

The flash is divided into 3 partitions: boot (mtd0), kernel (mtd1) and
ubi (mtd2):

S3C24XX NAND Driver, (c) 2004 Simtec Electronics
s3c2410-nand s3c2410-nand: Tacls=3, 30ns Twrph0=7 70ns, Twrph1=3 30ns
NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB
3,3V 8-bit)
Scanning device for bad blocks
Creating 3 MTD partitions on "NAND 64MiB 3,3V 8-bit":
0x00000000-0x00050000 : "boot"
0x00050000-0x00220000 : "kernel"
0x00220000-0x04000000 : "ubi"
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   16384 bytes (16 KiB)
UBI: logical eraseblock size:    15360 bytes


...

When I write the kernel image directly from u-boot using 'nandw' command
it works fine and can be booted. However all attempts to write the image
from a running Linux to /dev/mtd1 failed so far. I always ended up with
an unbootable system:

U-Boot 1.1.4 (Oct  8 2008 - 14:47:48)

DRAM:  64 MB
NAND:  64 MB
Flash:  1 MB
Environment: Init
NAND Flash Reading
dst base address          = 0x30100000
Source start block number = 20
Source size  (0x4000*n)   = 0x180000
status 1
## Booting image at 30100000 ...
status 2
Bad Header Checksum
status -2


u-boot>

Interestingly even when I dump /dev/mtd1 using 'dd if=/dev/mtd1' or
'nanddump -o' I get something very close to the originally written
kernel but not exactly the same. A number of bits here and there are
slightly different:

$ diff -U 0 uimage26bep-orig.hex uimage26bep-dump.hex
--- uimage26bep-orig.hex   2009-02-09 14:24:57.000000000 +1300
+++ uimage26bep-dump.hex   2009-02-09 15:06:13.000000000 +1300
@@ -35 +35 @@
-0000220 0f10 ee07 0f10 ee11 000d e380 0000 e3a0
+0000220 0f10 ee07 0e10 ee11 000d e380 0000 e3a0
@@ -83 +83 @@
-0000520 ff60 eaff 001d ea00 0044 ea00 0000 000f
+0000520 ff68 eaff 001d ea00 0044 ea00 0000 000f
@@ -108 +108 @@
-00006b0 40d0 e59f 41a1 e014 5f14 e16f 70c8 e59f
+00006b0 40d0 e59f 41a1 e014 5d14 e16f 70c8 e59f
@@ -144 +144 @@
-00008f0 0002 e314 3000 11a0 2000 13a0 2001 14c3
+00008f0 0002 e314 3000 11a0 2002 13a0 2001 14c3
...
There's about 1400 differences like this for a dump of a good image:
http://tmp.logix.cz/mtd/uimage26bep-orig.hex
http://tmp.logix.cz/mtd/uimage26bep-dump.hex

Even worse, when I 'nandwrite -p' or 'dd of=/dev/mtd1' the kernel image,
the subsequent dump usually shows the first few kB sort of OK (~2kB) but
then it's totally different.

Even when I write all 00's from /dev/zero, after I dump it back to a
file I get some bits set here and there:
$ grep -v "0000 0000 0000 0000 0000 0000 0000 0000" zero.dump512.hex
0000220 0000 0000 0100 0000 0000 0000 0000 0000
0000520 0008 0000 0000 0000 0000 0000 0000 0000
00006b0 0000 0000 0000 0000 0200 0000 0000 0000
00008f0 0000 0000 0000 0000 0002 0000 0000 0000
0001be0 0004 0000 0000 0000 0000 0000 0000 0000
0002060 8000 0000 0000 0000 0000 0000 0000 0000
0002a00 0000 0000 0000 0000 0400 0000 0000 0000
0002d40 0000 0000 2000 0000 0000 0000 0000 0000
...
http://tmp.logix.cz/mtd/zero.dump512.hex

How am I supposed to write a kernel into NAND flash from a running
Linux? What am I doing wrong here?

Thanks

Michal
