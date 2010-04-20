Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4Liv-0000ld-LB
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2010 22:15:18 +0000
Received: by bwz10 with SMTP id 10so6628800bwz.4
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Apr 2010 15:15:16 -0700 (PDT)
From: Caglar Akyuz <caglarakyuz@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: UBI Errors on DaVinci OMAP L-138/DA850
Date: Wed, 21 Apr 2010 01:15:18 +0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201004210115.18664.caglarakyuz@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Today I made my first attempt to try ubifs on a DaVinci processor, OMAP 
L-138 or DA850 specifically. My board has a Micron SLC 128 MiB NAND chip with 
part number MT29F1G08ABCHC(chip id is 0xa1)

I formatted and flashed my partition with commands:

 $ubiformat /dev/mtd4
 $ubiformat /dev/mtd4 -f rootfs.ubi

Then I tried to attach it with:

 $ubiattach /dev/ubi_ctrl -m 4

However, I hit the FAQ entry at [1], namely driver returning -EBADMSG. Then I 
tried to mount an empty flash with following commands in case my image has 
something wrong:

 $ubiformat /dev/mtd4
 $ubiattach /dev/ubi_ctrl -m 4
 $ubimkvol /dev/ubi0 -N filesytem -s 100MiB
 $mount -t ubifs /dev/ubi0_0 /mnt/cf

But this resulted the same error message when I read/write something to/from the 
flash. (To be honest I do not remember if the error was due to read, write or remount)

Then I tried formating and attaching my partition with '-s 2048' and -O '2048' 
parameters respectively and -EBADMSG error went away. So I patched 
nand_ids.c to add 'NAND_NO_SUBPAGE_WRITE'  option to my NAND flash
(patch is attached) and after this operation I was able to use ubifs as expected 
on my board.(Of course re-building my ubi image with new nand parameters)

I wonder:

* if this modification has any side effects?
* Is this error due to my NAND flash or DaVinci driver is doing something wrong? 
  Unfortunately, Micron datasheet is not publically available and I cannot check if it
  is supporting 512 KiB sub-page operations or not.


Thanks in advance,
Caglar


[1] http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ecc_error

____________________________________________________________________

--- drivers/mtd/nand/nand_ids.c	2010-04-21 01:04:15.094363619 +0300
+++ drivers/mtd/nand/nand_ids.c.mine	2010-04-21 01:04:02.480551529 +0300
@@ -80,7 +80,7 @@
 	{"NAND 64MiB 3,3V 16-bit",	0xC2, 0,  64, 0, LP_OPTIONS16},
 
 	/* 1 Gigabit */
-	{"NAND 128MiB 1,8V 8-bit",	0xA1, 0, 128, 0, LP_OPTIONS},
+	{"NAND 128MiB 1,8V 8-bit",	0xA1, 0, 128, 0, LP_OPTIONS | NAND_NO_SUBPAGE_WRITE},
 	{"NAND 128MiB 3,3V 8-bit",	0xF1, 0, 128, 0, LP_OPTIONS},
 	{"NAND 128MiB 1,8V 16-bit",	0xB1, 0, 128, 0, LP_OPTIONS16},
 	{"NAND 128MiB 3,3V 16-bit",	0xC1, 0, 128, 0, LP_OPTIONS16},
