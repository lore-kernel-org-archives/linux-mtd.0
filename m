Received: from hotwww5.hotwww.com ([161.58.242.233])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6EGr-0005vb-Gy
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2005 15:47:11 -0500
From: Peter Grayson <pgrayson@realmsys.com>
To: tglx@linutronix.de
In-Reply-To: <1109704571.8540.26.camel@tglx.tec.linutronix.de>
References: <1109643247.5043.26.camel@pgrayson1.realmsys.com>
	<1109645229.3805.11.camel@tglx.tec.linutronix.de>
	<1109700711.5043.53.camel@pgrayson1.realmsys.com>
	<1109704571.8540.26.camel@tglx.tec.linutronix.de>
Content-Type: multipart/mixed; boundary="=-tfermyx+1zen0rd73nEw"
Date: Tue, 01 Mar 2005 13:47:01 -0700
Message-Id: <1109710021.5043.55.camel@pgrayson1.realmsys.com>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can you really write a jffs2 image with nandwrite?
Reply-To: pgrayson@realmsys.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-tfermyx+1zen0rd73nEw
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> Could you please correct the FAQ and add the steps you took and send a
> patch ?

Attached

--=-tfermyx+1zen0rd73nEw
Content-Disposition: attachment; filename=faq.patch
Content-Type: text/x-patch; name=faq.patch; charset=utf-8
Content-Transfer-Encoding: 7bit

--- faq.html.orig	2005-03-01 13:41:43.962402197 -0700
+++ faq.html	2005-03-01 13:39:40.574764329 -0700
@@ -5,7 +5,7 @@
 <STYLE TYPE="text/css">
 <!--
 body {
-font-family: Arial,Helvetica,Geneva,Swiss,SunSans-Regular; 
+font-family: Arial,Helvetica,Geneva,Swiss,SunSans-Regular;
 }
 -->
 </STYLE>
@@ -38,7 +38,7 @@
 after to release the chip again.</p>
 
 <h2>NAND specific</h2>
-<h4>Can I boot from NAND Flash?</h4>
+<h4>Can I boot from NAND Flash ?</h4>
 <p>Not from a bare NAND chip. You need a glue logic around, which gives you memory access to the
 chip on bootup, like the DiskOnChip devices do. This will be a quite complex CPLD. An alternative
 is to use a small e.g. 1MB NOR Flash, which contains the boot code and maybe a compressed kernel
@@ -46,7 +46,7 @@
 <p>Some newer chips make the first page available for reading after power up. This could be
 helpful for starting a small 256/512/2048 byte bootcode. At the time of this writing there is no
 tested implementation of this.</p>
-<p>Samsungs S3C2410 ARM based SOC-CPU provides a mechanism to boot from NAND flash.</p>
+<p>Samsung's S3C2410 ARM based SOC-CPU provides a mechanism to boot from NAND flash.</p>
 
 <h4>Is there support for 32bit wide NAND Flash ?</h4>
 <p>No. The generic NAND driver supports 8/16 bit wide NAND Flash only. 32 bit NAND Flash can
@@ -59,19 +59,33 @@
 driver. The JFFS2 code, which handles the writebuffer and the out of band (spare) area of NAND doesn't support
 32 bit neither.</p>
 
-<h4>Can I use mtdutils erase / eraseall</h4>
-<p>Yes, the latest nand driver code forces the protection of bad block information. It's safe to erase a 
-NAND&nbsp;flash with erase(all) /dev/mtdX.
-It's recommended to use eraseall with -j or --jffs2 option set. This will write the cleanmarker to the 
-out of band area. So you can mount the filesystem and no further formatting is needed. This formatting
-is also neccecary before you copy a fs-image to the chip.
+<h4>Can I use mtdutils flash_erase and flash_eraseall ?</h4>
+<p>Yes, the latest nand driver code protects bad block information. It's safe to erase a
+NAND flash with flash_erase or flash_eraseall.</p>
+<p>
+It's recommended to use eraseall with -j or --jffs2 option set. This will write the cleanmarker to the
+out of band area so you can mount the filesystem without needing any further formatting. This formatting
+is also necessary before you copy a filesystem image to the chip.
 </p>
 
 <h4>Can I copy a JFFS2 Image to NAND via /dev/mtdX ?</h4>
-<p>Yes, as long as your chip does not contain bad blocks. Make sure, that the erasesize you set to mkfs.jffs2 
-is the same as the erasesize of your chip. Data will only be written with ECC, if your default settings for
-oob-layout selection are set for JFFS2. For bad block aware copying, use nandwrite from mtd-utils.<br>
-nandwrite -j /dev/mtdX image
+<p>Yes, as long as your chip does not contain bad blocks. Make sure, that the erasesize you set to mkfs.jffs2
+is the same as the erasesize of your chip. Data will only be written with ECC if your default settings for
+oob-layout selection are set for JFFS2. For bad block aware copying use nandwrite from mtd-utils.</p>
+<p>The following is an example procedure for creating a jffs2 image, erasing flash, and writing flash:</p>
+<code>
+$ mkfs.jffs2 \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;--eraseblock=128KiB \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;--pad \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;--output=image.jffs2 \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;--compression-mode=priority \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;--no-cleanmarkers \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;--root=$ROOT_DIR<br>
+<br>
+$ flash_eraseall -j /dev/mtdX<br>
+<br>
+$ nandwrite /dev/mtdX image.jffs2<br>
+</code>
 </p>
 
 <h4>Can I use seek/read/write on /dev/mtdX ?</h4>
@@ -81,37 +95,37 @@
 </p>
 <p>Recent changes to the NAND layer now make it possible to read/write across a block boundary.</P>
 
-<h4>Must my bootloader be aware of NAND FLASH&nbsp;?</h4>
-<p>Yes, if you use your bootloader to erase the FLASH chip and copy a filesystem image to it. 
+<h4>Must my bootloader be aware of NAND FLASH ?</h4>
+<p>Yes, if you use your bootloader to erase the FLASH chip and copy a filesystem image to it.
 For erase make sure, that you don't erase factory-marked bad blocks. They are marked in the 6th
- byte (offset 0x5) in the out of band area of the first page of a block. The block is bad, if any bit in 
- this byte is zero. If you erase such a block, the bad block information is erased too and lost. Further 
+ byte (offset 0x5) in the out of band area of the first page of a block. The block is bad, if any bit in
+ this byte is zero. If you erase such a block, the bad block information is erased too and lost. Further
  use of this block will lead to erroneous results</p>
-<p>For JFFS2 filesystems it's recommended to programm the JFFS2 erased marker into the out of band area of the 
-first page in each erased block after erasing the block. Do not program it into the data area of the page !</p>
+<p>For JFFS2 filesystems it's recommended to programm the JFFS2 erased marker into the out of band area of the
+first page in each erased block after erasing the block. Do not program it into the data area of the page!</p>
 
 <p>For 256 byte pagesize devices program the following data into the out of band area:</p>
-		
+
 <table border="1" cellpadding="5" cellspacing="0">
 <tr><td>Offset</td><td>0x06</td><td>0x07</td></tr>
 <tr><td>Data</td><td>0x85</td><td>0x19</td></tr>
 </table>
 
 <p>For 512 byte pagesize devices program the following data into the out of band area:</p>
-		
+
 <table border="1" cellpadding="5" cellspacing="0">
 <tr><td>Offset</td><td>0x08</td><td>0x09</td><td>0x0a</td><td>0x0b</td><td>0x0c</td><td>0x0d</td>
 <td>0x0e</td><td>0x0f</td></tr>
 <tr><td>Data</td><td>0x85</td><td>0x19</td><td>0x03</td><td>0x20</td><td>0x08</td><td>0x00</td>
 <td>0x00</td><td>0x00</td></tr>
 </table>
-		
-<p>If you copy a filesystem image to the chip, it's recommended to write it with ECC. You can use 
-the ECC code in the nand driver to do this.  If you have a bad block on your chip, just skip this 
+
+<p>If you copy a filesystem image to the chip, it's recommended to write it with ECC. You can use
+the ECC code in the nand driver to do this.  If you have a bad block on your chip, just skip this
 block and copy the data to the next block. JFFS2 and other NAND flash aware filesystems handle this gap.</p>
 
-<h4>Can I program NAND via JTAG&nbsp;?</h4>
-<p>Yes, you can. The requirements are the same as for bootloaders</p>
+<h4>Can I program NAND via JTAG ?</h4>
+<p>Yes, you can. The requirements are the same as for bootloaders.</p>
 
 <h2>JFFS2 specific</h2>
 
@@ -141,12 +155,12 @@
 
 <h4>How is ensured, that data is written to flash ?</h4>
 <p>On <b>NOR FLASH</b> each write goes directly into the FLASH</p>
-<p>On <b>NAND FLASH and NOR ECC FLASH</b> we have a writebuffer for writing only full pages to the chips. 
-There could be a loss of data, when the writebuffer is not flushed before power down. There are some 
-mechanisms to ensure, that the writebuffer is flushed. You can force the flush of the writebuffer by 
-using fsync() or sync() in your application. 
-JFFS2 has a timed flush of the write buffer, which forces the flush of the buffer to flash, if there are no 
-writes to the filesystem for more than about 5 seconds. The time depends on the cycletime of kupdated, which 
+<p>On <b>NAND FLASH and NOR ECC FLASH</b> we have a writebuffer for writing only full pages to the chips.
+There could be a loss of data, when the writebuffer is not flushed before power down. There are some
+mechanisms to ensure, that the writebuffer is flushed. You can force the flush of the writebuffer by
+using fsync() or sync() in your application.
+JFFS2 has a timed flush of the write buffer, which forces the flush of the buffer to flash, if there are no
+writes to the filesystem for more than about 5 seconds. The time depends on the cycletime of kupdated, which
 can be adjusted via <b>/proc/sys/vm/dirty_expire_centisecs</b>. <br>
 When you unmount the filesystem the buffer is flushed too.</p>
 <p>If the partition is being used as a root filesystem, which obviously cannot be dismounted, the filesystem

--=-tfermyx+1zen0rd73nEw--
