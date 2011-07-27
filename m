Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qlvnv-00078N-JZ
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2011 04:33:09 +0000
Received: by vws8 with SMTP id 8so1012462vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2011 21:33:02 -0700 (PDT)
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] nand: update out-of-date docs/FAQ, mention UBIFS
Date: Wed, 27 Jul 2011 00:32:54 -0400
Message-Id: <1311741176-8850-1-git-send-email-mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 doc/nand.xml |   34 +++++++++++++++++++---------------
 faq/nand.xml |   11 +++++++----
 2 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/doc/nand.xml b/doc/nand.xml
index 7254af5..1d55685 100644
--- a/doc/nand.xml
+++ b/doc/nand.xml
@@ -124,30 +124,33 @@ want to a page. The consecutive writes to a page, before erasing it again, are
 restricted to 1-3 writes, depending on the manufacturers specifications. This applies 
 similar to the spare area. This makes it necessary for the filesystem to handle a writebuffer,
 which contains data, that is less than a page</p>
-<p>At the moment there are only a few filesystems, which support NAND</p>
+<p>At the moment there are only a few filesystems which support NAND:</p>
 <ul>
 <li>JFFS2 and YAFFS for bare NAND Flash and SmartMediaCards </li>
 <li>NTFL for DiskOnChip devices </li>
 <li>TRUEFFS from M-Systems for DiskOnChip devices</li>
 <li>SmartMedia DOS-FAT as defined by the SSFDC Forum</li>
+<li>UBIFS for bare NAND flash</li>
 </ul>
-<p>JFFS2 and NTFL are Open Source, while TRUEFFS is a proprietary solution. 
+<p>JFFS2, NTFL, and UBIFS are Open Source, while TRUEFFS is a proprietary solution. 
 SmartMedia DOS-Fat is a specification from SSFDC forum. It is somewhat open under a 
 non disclosure agreement with Toshiba, who owns all rights on this specifications. NTFL is 
 designed for the usage of DiskOnChip devices. JFFS2 supports raw NAND chips and 
 SmartMediaCards at the moment. A JFFS2 support for DiskOnChip devices, based on the 
 NAND code, is planned. There are some other Open Source projects for NAND filesystem 
-support, but there's no other working solution than JFFS2 and YAFFS at the moment of this writing. 
+support, but there's no other working solution than JFFS, YAFFS, and UBIFS at the moment of this writing.
 YAFFS is available from <a href="http://www.aleph1.co.uk/armlinux/projects/yaffs">YAFFS-Homepage</a>.
 YAFFS is faster than JFFS2 and consumes less RAM, JFFS2 provides on the fly file compression and
-decompression, which is very helpful for small FLASHs.</p>
+decompression, which is very helpful for small FLASHs.  UBIFS provides compression similar to JFFS2, but
+is usually a better choice for large NAND flash chips (see <a href="ubifs.html">here</a> for more 
+information on UBIFS, including some notes about how it compares to JFFS2).</p>
 <p> There is currently no support for the wide spread SmartMedia DOS-FAT filesystem, 
  mainly because it's not a reliable filesystem for industrial usage. It's ok for 
  multimedia applications. The hardware support layer is designed to support an 
  implementation of SmartMedia DOS-FAT. There are some efforts to implement it, but it's
  in an early stage. There are a couple of SmartMedia Card adaptors for USB, PCMCIA, FireWire 
  ... with Linux drivers available, which support the SmartMedia DOS-FAT. </p>
-<p>JFFS2 and YAFFS include bad block management, wear leveling, error correction and provide
+<p>JFFS2, YAFFS, and UBIFS include bad block management, wear leveling, error correction and provide
 reliable filesystems for industrial use on top of NAND Flash.</p>
 </div>
 
@@ -255,22 +258,22 @@ pages this byte is reserved</td></tr>
 
 <h3>Where can you get the code ?</h3>
 <div>
-<p>The latest changes to JFFS2 and the underlying NAND code are not in the 
-kernel code at the moment. The latest code is available from 
-<a href="../source.html">CVS and daily snapshots</a></p>
+<p>NAND support is now present in the upstream kernel code, including JFFS2
+and UBIFS. The latest code is also available from
+<a href="../source.html">GIT and daily snapshots</a>.</p>
 
-<p>There are four layers of software</p>
+<p>If using JFFS2, there are four layers of software:</p>
 <ol>
 <li>JFFS2: filesystem driver</li>
 <li>MTD: Memory Technology Devices driver</li>
 <li>NAND: generic NAND driver </li>
 <li>Hardware specific driver </li>
 </ol>
-<p>the MTD driver just provides a mount point for JFFS2. The generic NAND 
+<p>The MTD driver just provides a mount point for JFFS2. The generic NAND 
 driver provides all functions, which are necessary to identify, read, write 
 and erase NAND Flash. The hardware dependent functions are provided by 
 the hardware driver. They provide mainly the hardware access information and
-functions for the generic NAND driver. For YAFFS applies the same.</p>
+functions for the generic NAND driver.  The same applies for YAFFS.</p>
 </div>
 
 <h3>API Documentation</h3>
@@ -324,13 +327,13 @@ CONFIG_JFFS2_FS_NAND=y</p>
 <hr size="2" />
 		
 <h2>FAQ</h2>
-<p>Please see the NAND section in <a href="../faq/nand.html">MTD FAQ's</a></p>
+<p>Please see the NAND section in <a href="../faq/nand.html">MTD FAQs</a></p>
 
 <hr size="2" />
 		
 <h2>References:</h2>
 <h3>Open Source</h3>
-<p>JFFS2 and NTFL are located on this <a href="../index.html">website</a>.<br />
+<p>JFFS2, NTFL, and UBIFS are located on this <a href="../index.html">website</a>.<br />
 YAFFS is located at <a href="http://www.aleph1.co.uk/armlinux/projects/yaffs">YAFFS-Homepage</a>.</p>
 <h3>Hardware</h3>
 <p><a href="http://www.toshiba.com/taec">Toshiba</a></p>
@@ -343,8 +346,9 @@ YAFFS is located at <a href="http://www.aleph1.co.uk/armlinux/projects/yaffs">YA
 <h2>Maintainers</h2>
 <p>JFFS2 is maintained by David Woodhouse</p>
 <p>The generic NAND driver is maintained by Thomas Gleixner</p>
-<p>Please don't contact them direct. Ask your questions on the 
-<a href="../mail.html">mtd-mailing-list</a>.</p>
+<p>UBIFS is maintained by Artem Bityutskiy</p>
+<p>Please don't contact them directly. Ask your questions on the
+<a href="../mail.html">linux-mtd mailinglist</a>.</p>
 <p>Any suggestions, improvements, bug-reports and bug-fixes are welcome</p>
 		
 	<INCLUDE file="../inc/footer.tmpl" />
diff --git a/faq/nand.xml b/faq/nand.xml
index 75acc72..9d9cd06 100644
--- a/faq/nand.xml
+++ b/faq/nand.xml
@@ -32,13 +32,16 @@ Not from a bare NAND chip. You need a glue logic around, which gives you memory
 access to the chip on boot-up, like the DiskOnChip devices do. This will be a
 quite complex CPLD. An alternative is to use a small e.g. 1MB NOR flash, which
 contains the boot code and maybe a compressed kernel image. Then you can use
-JFFS2 on NAND as your root file-system.
+JFFS2 or UBIFS on NAND as your root file-system.
 </P>
 
 <P>
-Some newer chips make the first page available for reading after power up. This
-could be helpful for starting a small 256/512/2048 byte boot-code. At the time
-of this writing there is no tested implementation of this.
+Some chips have internal circuitry which is capable of reading and booting from
+the first page of NAND after power up. This allows you to boot a small
+(e.g. 256/512/2048 byte) boot code, which can initialize SDRAM, then read and
+execute a more complete bootloader from subsequent NAND blocks.  An example is
+U-Boot, which can be built as a 2-stage "initial" and "secondary" bootloader
+for use with NAND.
 </P>
 
 <P>
-- 
1.7.4.1
