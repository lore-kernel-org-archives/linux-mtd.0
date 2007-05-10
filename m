Received: from ug-out-1314.google.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HmDbx-0003xm-DF
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 14:43:35 -0400
Received: by ug-out-1314.google.com with SMTP id m2so496796uge
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 May 2007 11:43:31 -0700 (PDT)
From: borasah@gmail.com
To: linux-mtd@lists.infradead.org
Subject: NAND flash write goes wrong
Date: Thu, 10 May 2007 21:50:30 +0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705102150.31171.borasah@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a MIPS based board and want to use its NAND flash for storage. NAND 
chip is a Samsung part: K9F1208UDA. It has 16KB erase block size and 512 byte 
page size.
	cat /proc/mtd
	dev:    size   erasesize  name
	mtd0: 02000000 00020000 "mtdram test device"
	mtd1: 00800000 00004000 "NAND FS 0"
	mtd2: 03800000 00004000 "NAND FS 1"

As you see there are two partitions on it. I want to use "NAND FS 1"(56MB) for 
rootFS storage. I obtained mtd-utils from the site and compiled them for both  
the host and the target. I am using "mkfs.jffs2 command on the host" to 
generate a jffs2 image.
	./mkfs.jffs2 -p 0x3800000 -s 0x200 -e 0x4000 -r rootfs -o img -l
Then on the target I do
	flash_eraseall -j /dev/mtd
In the beginning there was no bad block. But after some experiments I see 
many(43) "bad sector" warnings and this continues to increase when I write 
new images.
	Erasing 16 Kibyte @ 24000 --  0 % complete. Cleanmarker written at 24000.
	Skipping bad block at 0x00028000
	...
Is this normal? Then I do
	./nandwrite /dev/mtd2 img
It writes by skipping bad blocks.
	...
	Writing data to block 189c000
	Bad block at 189c000, 1 block(s) from 189c000 will be skipped
	Writing data to block 18a0000
	...
Everything seems normal. As a last item, I want to see if the image creation 
and write is successfull, do 
	mount -t jffs2 /dev/mtdblock2 /mnt
Results:
jffs2: Erase block size too small (16KiB). Using virtual blocks size (32KiB) 
instead
CLEANMARKER node found at 0x00000000 has totlen 0xc != normal 0x0
Empty flash at 0x00003f5c ends at 0x00004000
CLEANMARKER node found at 0x00004000 has totlen 0xc != normal 0x0
CLEANMARKER node found at 0x00008000 has totlen 0xc != normal 0x0
mtd->read(0x7a8c bytes from 0x8574) returned ECC error
Empty flash at 0x0000bffc ends at 0x0000c000
CLEANMARKER node found at 0x0000c000 has totlen 0xc != normal 0x0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000e30c: 0x2a1f 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000e310: 0x4013 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000e314: 0xeb6a 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000e318: 0xd754 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000e31c: 0xaca8 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000e320: 0x0030 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000e324: 0x1e8e 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000e328: 0xe002 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000e330: 0x3481 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000e340: 0x03e8 
instead
Further such events for this erase block will not be printed
...

I read the FAQ at http://www.linux-mtd.infradead.org/faq/jffs2.html. "Magic 
bitmask 0x1985 not found" points four things as cause. At my case, seems
	1) you flash driver is severely buggy so it reads trash instead of valid
 data;
	2) you did not manage to flash JFFS2 image correctly so that you ended up 
with garbage on your flash, although the original image was perfectly fine;

Now I am assuming 1 is correct which is vendor provided. But I dont see where 
I did wrong when generating the image? Can someone shed some light on this?
	# mtd_debug info /dev/mtd2
	mtd.type = MTD_NANDFLASH
	mtd.flags = MTD_CLEAR_BITS | MTD_ECC
	mtd.size = 58720256 (56M)
	mtd.erasesize = 16384 (16K)
	mtd.oobblock = 512
	mtd.oobsize = 16
	mtd.ecctype = MTD_ECC_NONE
	regions = 0

Thanks...

--
Bora SAHIN
