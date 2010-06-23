Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORYeX-0005qi-Pp
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 22:42:46 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-www doc, FAQ, general: spelling fixes
Date: Wed, 23 Jun 2010 15:42:26 -0700
Message-ID: <1277332946-14580-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Several spelling, word choice, etc. edits throughout

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 doc/general.xml |    2 +-
 doc/nand.xml    |   60 +++++++++++++++++++++++++++---------------------------
 doc/onenand.xml |   18 ++++++++--------
 doc/ubi.xml     |   14 ++++++------
 doc/ubifs.xml   |   18 ++++++++--------
 faq/general.xml |    6 ++--
 faq/jffs2.xml   |   18 ++++++++--------
 faq/nand.xml    |   14 ++++++------
 faq/ubi.xml     |   48 ++++++++++++++++++++++----------------------
 faq/ubifs.xml   |   48 ++++++++++++++++++++++----------------------
 source.xml      |    2 +-
 11 files changed, 124 insertions(+), 124 deletions(-)

diff --git a/doc/general.xml b/doc/general.xml
index e170ace..4e1bfdd 100644
--- a/doc/general.xml
+++ b/doc/general.xml
@@ -122,7 +122,7 @@ git://git.infradead.org/users/ahunter/nand-tests.git
 	and nasty DMA issues on an OMAP2 board with OneNAND flash, just by
 	running this tests for few hours.</li>
 
-	<li><b>mtd_nandecctest</b>: a simple test that checks correctess of the
+	<li><b>mtd_nandecctest</b>: a simple test that checks correctness of the
 	built-in software ECC for 256 and 512-byte buffers; this test is not
 	driver-specific but tests general NAND support code.</li>
 </ul>
diff --git a/doc/nand.xml b/doc/nand.xml
index 549827b..776f891 100644
--- a/doc/nand.xml
+++ b/doc/nand.xml
@@ -16,8 +16,8 @@ NAND and NOR Flash is the bus interface. NOR Flash is connected to a address / d
  bus direct like other memory devices as SRAM etc. NAND Flash uses a multiplexed I/O 
  Interface with some additional control pins. NAND flash is a sequential access device 
  appropriate for mass storage applications, while NOR flash is a random access device 
- appropriate for code storage application.NOR Flash can be used for code storage and 
- code execution. Code stored on NAND Flash can't be executed frome there. It must be 
+ appropriate for code storage application. NOR Flash can be used for code storage and 
+ code execution. Code stored on NAND Flash can't be executed from there. It must be 
  loaded into RAM memory and executed from there.</p>
 		
 <table border="1" cellpadding="2" cellspacing="0">
@@ -72,13 +72,13 @@ smart by software.</p>
 <p>The memory is arranged as an array of pages. A page consists of 256 / 512 Byte data 
 and 8 / 16 Byte spare (out of band) area. Newer chips have 2048 Bytes data and and 64 
 Bytes spare area sizes. The spare area is used to store ECC (error correction code), 
-bad block information and filesystem dependend data.
+bad block information and filesystem-dependent data.
 n pages build one block. The read / write access to data is on a per page basis. 
 Erase is done on a per block basis. The commands to read / write / erase the chip 
 is given by writing to the chip with the Command Latch Enable pin high. Address is 
 given by writing with the Address Latch Enable pin high.</p>
 
-<p>There are only a few lines neccecary to access NAND Flashmemory.</p>
+<p>There are only a few lines necessary to access NAND Flashmemory.</p>
 <p>16 bit buswidth chips are supported.</p>
 <table border="1" cellpadding="2" cellspacing="0">
 <tr><td><b>Pin(s) </b></td><td><b>Function </b></td></tr>
@@ -92,7 +92,7 @@ given by writing with the Address Latch Enable pin high.</p>
 <tr><td>/SE </td><td>Spare area Enable </td></tr>
 <tr><td>R/B </td><td>Ready / Busy Output </td></tr>
 </table>
-<p>As it is neccecary to use the spare area, the /SE (Spare area Enable) pin should 
+<p>As it is necessary to use the spare area, the /SE (Spare area Enable) pin should 
 be tied to GND. /CE, CLE and ALE should be GPIO pins or latched signals. It's possible 
 to use address lines for ALE and CLE, but you have to take care about the timing 
 restrictions of the chip ! </p>
@@ -103,8 +103,8 @@ of your NAND chip. Data hold time after rising edge of /WE is different to data
 time after rising edge of chipselect lines!</p>
 <p>I/O 0-7(15) are connected to the databus D0-D7(D15). The /WP pin can be used for write 
 protection or connected to VCC to enable writes unconditionally. As NAND flash uses 
-a command driven programming and erasing, an  accidential write or erase is not 
-likely to happen. The Ready / Busy output is not neccecary for operation, 
+a command driven programming and erasing, an  accidental write or erase is not 
+likely to happen. The Ready / Busy output is not necessary for operation, 
  but it can be tied to a GPIO or an interrupt line. </p>
 </div>
 	
@@ -115,7 +115,7 @@ likely to happen. The Ready / Busy output is not neccecary for operation,
 <p>One major problem for using NAND Flash is, that you cannot write as often as you 
 want to a page. The consecutive writes to a page, before erasing it again, are 
 restricted to 1-3 writes, depending on the manufacturers specifications. This applies 
-similar to the spare area. This makes it neccecary for the filesystem to handle a writebuffer,
+similar to the spare area. This makes it necessary for the filesystem to handle a writebuffer,
 which contains data, that is less than a page</p>
 <p>At the moment there are only a few filesystems, which support NAND</p>
 <ul>
@@ -133,7 +133,7 @@ NAND code, is planned. There are some other Open Source projects for NAND filesy
 support, but there's no other working solution than JFFS2 and YAFFS at the moment of this writing. 
 YAFFS is available from <a href="http://www.aleph1.co.uk/armlinux/projects/yaffs">YAFFS-Homepage</a>.
 YAFFS is faster than JFFS2 and consumes less RAM, JFFS2 provides on the fly file compression and
-decompression, which is very helpfull for small FLASHs.</p>
+decompression, which is very helpful for small FLASHs.</p>
 <p> There is currently no support for the wide spread SmartMedia DOS-FAT filesystem, 
  mainly because it's not a reliable filesystem for industrial usage. It's ok for 
  multimedia applications. The hardware support layer is designed to support an 
@@ -156,11 +156,11 @@ area is the storage of the cleanmarker</p>
 <table border="1" cellpadding="2" cellspacing="0">
 <tr><td><b>Offset</b></td><td><b>Content</b></td><td><b>Comment</b></td></tr>
 <tr><td>0x06</td><td>Clean marker byte 0</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x85. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x07</td><td>Clean marker byte 1</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased this 
+block was erased under JFFS2 control. If the page was successfully erased this 
 byte in the first page of a block is programmed to 0x19. In the remaining 
 pages this byte is reserved</td></tr>
 </table>
@@ -170,35 +170,35 @@ pages this byte is reserved</td></tr>
 <table border="1" cellpadding="2" cellspacing="0">
 <tr><td><b>Offset</b></td><td><b>Content</b></td><td><b>Comment</b></td></tr>
 <tr><td>0x08</td><td>Clean marker byte 0</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x85. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x09</td><td>Clean marker byte 1</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x19. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x0a</td><td>Clean marker byte 2</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x03. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x0b</td><td>Clean marker byte 3</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x20. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x0c</td><td>Clean marker byte 4</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x08. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x0d</td><td>Clean marker byte 5</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x00. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x0e</td><td>Clean marker byte 6</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x00. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x0f</td><td>Clean marker byte 7</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x00. In the remaining 
 pages this byte is reserved</td></tr>
 </table>
@@ -208,35 +208,35 @@ pages this byte is reserved</td></tr>
 <table border="1" cellpadding="2" cellspacing="0">
 <tr><td><b>Offset</b></td><td><b>Content</b></td><td><b>Comment</b></td></tr>
 <tr><td>0x10</td><td>Clean marker byte 0</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x85. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x11</td><td>Clean marker byte 1</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x19. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x12</td><td>Clean marker byte 2</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x03. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x13</td><td>Clean marker byte 3</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x20. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x14</td><td>Clean marker byte 4</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x08. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x15</td><td>Clean marker byte 5</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x00. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x16</td><td>Clean marker byte 6</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x00. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x17</td><td>Clean marker byte 7</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x00. In the remaining 
 pages this byte is reserved</td></tr>
 </table>
@@ -260,9 +260,9 @@ kernel code at the moment. The latest code is available from
 <li>Hardware specific driver </li>
 </ol>
 <p>the MTD driver just provides a mount point for JFFS2. The generic NAND 
-driver provides all functions, which are neccecary to identify, read, write 
-and erase NAND Flash. The hardware dependend functions are provided by 
-the hardware driver. They provide mainly the hardware access informations and
+driver provides all functions, which are necessary to identify, read, write 
+and erase NAND Flash. The hardware dependent functions are provided by 
+the hardware driver. They provide mainly the hardware access information and
 functions for the generic NAND driver. For YAFFS applies the same.</p>
 </div>
 
diff --git a/doc/onenand.xml b/doc/onenand.xml
index c8fdd6e..e3bf69b 100644
--- a/doc/onenand.xml
+++ b/doc/onenand.xml
@@ -50,35 +50,35 @@ Nand chips with 2048 byte pagesize and 64 byte OOB size</h4>
 <table border="1" cellpadding="2" cellspacing="0">
 <tr><td><b>Offset</b></td><td><b>Content</b></td><td><b>Comment</b></td></tr>
 <tr><td>0x02</td><td>Clean marker byte 0</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x85. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x03</td><td>Clean marker byte 1</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x19. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x04</td><td>Clean marker byte 2</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x03. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x0e</td><td>Clean marker byte 3</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x20. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x0f</td><td>Clean marker byte 4</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x08. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x12</td><td>Clean marker byte 5</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x00. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x13</td><td>Clean marker byte 6</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x00. In the remaining 
 pages this byte is reserved</td></tr>
 <tr><td>0x14</td><td>Clean marker byte 7</td><td>This byte indicates that a 
-block was erased under JFFS2 control. If the page was succesfully erased 
+block was erased under JFFS2 control. If the page was successfully erased 
 this byte in the first page of a block is programmed to 0x00. In the remaining 
 pages this byte is reserved</td></tr>
 </table>
@@ -211,7 +211,7 @@ JFFS2 write-buffering enabled buffer (2048) erasesize (126976)<br />
 <h2>Yaffs2</h2>
 
 <p>The yaffs2 can run on OneNAND</p>
-<p>If your yaffs2 dosen't work, please check this <a href="http://git.infradead.org/?p=users/vwool/mtd-2.6.git;a=commitdiff;h=ee5b82bdacf2a69d247eca93271da2c72acdc950">patch</a></p>
+<p>If your yaffs2 doesn't work, please check this <a href="http://git.infradead.org/?p=users/vwool/mtd-2.6.git;a=commitdiff;h=ee5b82bdacf2a69d247eca93271da2c72acdc950">patch</a></p>
 
 <hr size="2" />
 		
diff --git a/doc/ubi.xml b/doc/ubi.xml
index 06d8cbd..9290f4a 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -46,7 +46,7 @@
 		</ol>
 	</li>
 	<li><a href="ubi.html#L_ubidoc">More documentation</a></li>
-	<li><a href="ubi.html#L_how_send_bugreport">How to send a bugreport?</a></li>
+	<li><a href="ubi.html#L_how_send_bugreport">How do I send a bug report?</a></li>
 </ol>
 
 
@@ -117,7 +117,7 @@ Bit-flips are corrected by ECC checksums, but they may accumulate over
 time and cause data loss. UBI handles this by moving data from physical
 eraseblocks which have bit-flips to other physical eraseblocks. This process is
 called <b>scrubbing</b>. Scrubbing is done transparently in background and is
-hidden from upper layes.</p>
+hidden from upper layers.</p>
 
 <p>Here is a short list of the main UBI features:</p>
 <ul>
@@ -343,7 +343,7 @@ table records</b>. Each record contains the following information:</p>
 	<li><code>CRC-32</code> checksum for this record.</li>
 </ul>
 
-<p>Each record descripes one UBI volume and record index in the volume table
+<p>Each record describes one UBI volume and record index in the volume table
 array corresponds to the volume ID. I.e, UBI volume 0 is described by record 0
 in the volume table, and so on. Count of records in the volume table is limited
 by the LEB size, but cannot be greater than 128. This means that UBI devices
@@ -377,7 +377,7 @@ volumes.</p>
 </ul>
 
 <p>When attaching the MTD device, UBI makes sure that the 2 volume table copies
-are equivalent. If they are not equevalent, which may be caused by an unclean
+are equivalent. If they are not equivalent, which may be caused by an unclean
 reboot, UBI picks the one from LEB0 and copies it to LEB1 of the layout volume
 (because it is newer). If one of the volume table copies is corrupted, UBI
 restores it from the other volume table copy.</p>
@@ -817,7 +817,7 @@ order to build in-RAM EC and EBA tables.</p>
 <p>The drawbacks of this design are poor scalability and relatively high
 overhead on NAND flashes (e.g., the overhead is 1.5%-3% of flash space in case
 of a NAND flash with 2KiB NAND page and 128KiB eraseblock). The advantages are
-simple binary format and robustness, as the result of symplicity.</p>
+simple binary format and robustness, as the result of simplicity.</p>
 
 <p>Nonetheless, it is always possible to create UBI2 which would maintain the
 tables in separate flash areas. UBI2 would not be compatible with UBI because
@@ -1182,7 +1182,7 @@ function (just above the body of the function).</p>
 
 
 
-<h2><a name="L_how_send_bugreport">How to send an UBI bugreport?</a></h2>
+<h2><a name="L_how_send_bugreport">How do I send an UBI bug report?</a></h2>
 
 <p>Before sending a bug report:</p>
 <ul>
@@ -1227,7 +1227,7 @@ function (just above the body of the function).</p>
 <p>Please, attach all the bug-related messages including the UBI messages from
 the kernel ring buffer, which may be collected using the <code>dmesg</code>
 utility or using <code>minicom</code> with serial console capturing. Please,
-describe how the problem can be reproduced (if it can be). The bugreport
+describe how the problem can be reproduced (if it can be). The bug report
 should be sent to the <a href="../mail.html">MTD mailing list</a>. Please,
 <b>do not</b> send private e-mails to UBI authors, always CC the mailing
 list!</p>
diff --git a/doc/ubifs.xml b/doc/ubifs.xml
index ed1a82d..afa5987 100644
--- a/doc/ubifs.xml
+++ b/doc/ubifs.xml
@@ -31,7 +31,7 @@
 	<li><a href="ubifs.html#L_mountopts">Mount options</a></li>
 	<li><a href="ubifs.html#L_spaceacc">Flash space accounting issues</a></li>
 	<li><a href="ubifs.html#L_documentation">Documentation</a></li>
-	<li><a href="ubifs.html#L_how_send_bugreport">How to send an UBIFS bugreport?</a></li>
+	<li><a href="ubifs.html#L_how_send_bugreport">How do I send an UBIFS bug report?</a></li>
 	<li><a href="ubifs.html#L_raw_vs_ftl">Raw flash vs. FTL devices</a></li>
 </ol>
 
@@ -328,7 +328,7 @@ describes the issues in more details.</p>
 	    bytes to the flash. If there are many random small writes all
 	    over the place, the file system becomes fragmented. JFFS2 merges
 	    small fragments to 4KiB chunks, which involves re-compression and
-	    re-writing the data. But this "de-fragmentation" is happening
+	    re-writing the data. But this "defragmentation" is happening
 	    during garbage collection and at random time, because JFFS2
 	    wear-leveling algorithm is based on random eraseblock selection. So
 	    if there were a lot of small writes, JFFS2 becomes slower some time
@@ -716,8 +716,8 @@ do this :-).</p>
 
 <h2><a name="L_compression">Compression</a></h2>
 
-<p>UBIFS supports on-the-flight compression, which means it compresses data
-before writing them to the flash media, and de-compresses before reading them,
+<p>UBIFS supports on-the-fly compression, which means it compresses data
+before writing them to the flash media, and decompresses before reading them,
 and this is absolutely transparent to the users. UBIFS compresses only regular
 files data. Directories, device nodes and so on are not compressed. Meta-data
 and the indexing information are not compressed as well.</p>
@@ -856,11 +856,11 @@ it will already be in the cache.</p>
 you should be careful. It is also worth noting that bulk-read feature cannot
 help on highly fragmented file-systems. Although UBIFS does not fragment
 file-systems (e.g., the Garbage-Collector does not re-order data nodes), but
-UBIFS does not try to de-fragment them. For example, if you write a file
+UBIFS does not try to defragment them. For example, if you write a file
 sequentially, it won't be fragmented. But if you write more than one file at
 a time, they may become fragmented (well, this also depends on how write-back
-flushes the changes), and UBIFS won't automatically de-fragment them. However,
-it is possible to implement a background de-fragmentator. It is also possible
+flushes the changes), and UBIFS won't automatically defragment them. However,
+it is possible to implement a background defragmenter. It is also possible
 to have per-inode journal head and avoid mixing data nodes belonging to
 different inodes in the same LEB. So there is room for improvements.</p>
 
@@ -1208,7 +1208,7 @@ at the <a href="ubifs.html#L_ml">UBIFS mailing list.</a></p>
 
 
 
-<h2><a name="L_how_send_bugreport">How to send an UBIFS bugreport?</a></h2>
+<h2><a name="L_how_send_bugreport">How do I send an UBIFS bug report?</a></h2>
 
 <p>Before sending a bug report, please, try to do the following:</p>
 <ol>
@@ -1446,7 +1446,7 @@ requirements.</p>
 	hints about unused sectors. Nevertheless, in general, UBIFS should do
 	better job on a bare NAND, than a traditional FS on an FTL device with
 	a similar NAND chip. On the other hand, FTL devices may	include
-	multiple NAND chips, highly parallelise things and provide fast I/O.
+	multiple NAND chips, highly parallelize things and provide fast I/O.
 	Probably SSD is a good example.</li>
 
 	<li>Obviously, the advantage of FTL devices is that you use old and
diff --git a/faq/general.xml b/faq/general.xml
index be1a0d4..9cd81ff 100644
--- a/faq/general.xml
+++ b/faq/general.xml
@@ -19,7 +19,7 @@
 	<LI><A HREF="general.html#L_ext2_mtd">Can I mount ext2 over an MTD device?</A></LI>
 	<LI><A HREF="general.html#L_point">What are the point() and unpoint() functions used for?</A></LI>
 	<LI><A HREF="general.html#L_unlock">I keep getting errors whenever I try to write or erase to my MTD device</A></LI>
-	<LI><A HREF="general.html#L_compile_mtd">How to compile the mtd-utils tree?</A></LI>
+	<LI><A HREF="general.html#L_compile_mtd">How do I compile the mtd-utils tree?</A></LI>
 </OL>
 
 
@@ -113,7 +113,7 @@ also block devices.</P>
 	</TR>
 	<TR>
 		<TD>Sectors are devoid of the wear-out property (in FTL devices
-			it is the resposibility of FTL to provide this) </TD>
+			it is the responsibility of FTL to provide this) </TD>
 		<TD>
 			Eraseblocks wear-out and become bad and unusable after
 			about 10<SUP>3</SUP> (for MLC NAND) - 10<SUP>5</SUP>
@@ -250,7 +250,7 @@ unlock them.
 
 
 <A NAME="L_compile_mtd">
-<H2>How to compile the mtd-utils tree?</H2>
+<H2>How do I compile the mtd-utils tree?</H2>
 </A>
 
 <p>You have to install libraries the tools depend on. Please, find
diff --git a/faq/jffs2.xml b/faq/jffs2.xml
index 50f525f..1bc8680 100644
--- a/faq/jffs2.xml
+++ b/faq/jffs2.xml
@@ -19,11 +19,11 @@
 	<LI><A HREF="jffs2.html#L_loopback">I cannot loop mount a JFFS2 image</A></LI>
 	<LI><A HREF="jffs2.html#L_mtdblock">Do I need to use mtdblock to mount my JFFS2 filesystem?</A></LI>
 	<LI><A HREF="jffs2.html#L_rootfs">How do I get the 2.6 kernel to recognize JFFS2 as my rootfs?</A></LI>
-	<LI><A HREF="jffs2.html#L_writewell">How is ensured, that data is written to flash?</A></LI>
-	<LI><A HREF="jffs2.html#L_putimage">How to program an image to FLASH?</A></LI>
+	<LI><A HREF="jffs2.html#L_writewell">How do I ensure that data is written to flash?</A></LI>
+	<LI><A HREF="jffs2.html#L_putimage">How do I program an image to flash?</A></LI>
 	<LI><A HREF="jffs2.html#L_bbhandle">How does JFFS2 handle a block going bad in NAND flash?</A></LI>
 	<LI><A HREF="jffs2.html#L_clmarker">What is cleanmarker and what it is used for?</A></LI>
-	<LI><A HREF="jffs2.html#L_mkfs_jffs2_comp">How to compile mkfs.jffs2?</A></LI>
+	<LI><A HREF="jffs2.html#L_mkfs_jffs2_comp">How do I compile mkfs.jffs2?</A></LI>
 </OL>
 
 
@@ -135,8 +135,8 @@ conventional HDD-oriented file system. And one of its drawbacks is that mount
 time as well as memory consumption grow linearly with growing flash size. So
 beware you may end up with tremendous amount memory eaten and huge mount time if
 your block device is very large. Also, JFFS2 implements only write-through
-caching (while convectional FS-es have write-back) and does many thing which are
-not really needed in case of hard drives.
+caching (while conventional filesystems have write-back) and does many things which are
+not really needed in the case of hard drives.
 </P>
 
 <P>
@@ -295,7 +295,7 @@ the kernel command line to use it as a root filesystem
 
 
 <A NAME="L_writewell">
-<H2>How is ensured, that data is written to flash?</H2>
+<H2>How do I ensure that data is written to flash?</H2>
 </A>
 
 <P>On <B>NOR FLASH</B> each write goes directly into the FLASH.</P>
@@ -321,14 +321,14 @@ dismounted, the filesystem should be remounted read only on shutdown. In the
 case of JFFS2 this will cause the garbage collector to flush its write buffers.
 Failure to do this may cause the filesystem to generate warnings regarding bad
 CRC. These are partially collected garbage blocks which will be rescheduled
-for garbage collection some time later. This kind of behaviour may also be
+for garbage collection some time later. This kind of behavior may also be
 observed after a system crash.
 </P>
 
 
 
 <A NAME="L_putimage">
-<H2>How to program an image to FLASH?</H2>
+<H2>How do I program an image to flash?</H2>
 </A>
 
 <P>There are several possibilities to do so:</P>
@@ -408,7 +408,7 @@ time.
 
 
 <A NAME="L_mkfs_jffs2_comp">
-<H2>How to compile mkfs.jffs2?</H2>
+<H2>How do I compile mkfs.jffs2?</H2>
 </A>
 
 <p>The <code>mkfs.jffs2</code> utility requires the <code>ACL</code> and
diff --git a/faq/nand.xml b/faq/nand.xml
index d105d63..a9188c5 100644
--- a/faq/nand.xml
+++ b/faq/nand.xml
@@ -13,12 +13,12 @@
 <OL>
 	<LI><A HREF="nand.html#L_nand_boot">Can I boot from NAND flash?</A></LI>
 	<LI><A HREF="nand.html#L_nand_32bit">Is there support for 32-bit wide NAND flash ?</A></LI>
-	<LI><A HREF="nand.html#L_nand_erase">How to erase my MTD partition on NAND flash?</A></LI>
+	<LI><A HREF="nand.html#L_nand_erase">How do I erase my MTD partition on NAND flash?</A></LI>
 	<LI><A HREF="nand.html#L_nand_copyimg">Can I copy a JFFS2 image to NAND via /dev/mtdX?</A></LI>
 	<LI><A HREF="nand.html#L_nand_srw">Can I use seek/read/write on /dev/mtdX?</A></LI>
 	<LI><A HREF="nand.html#L_nand_bootloader">Must my boot-loader be aware of NAND flash?</A></LI>
 	<LI><A HREF="nand.html#L_nand_jtag">Can I program NAND via JTAG?</A></LI>
-	<LI><A HREF="nand.html#L_nand_nandsim">How to use NAND simulator?</A></LI>
+	<LI><A HREF="nand.html#L_nand_nandsim">How do I use NAND simulator?</A></LI>
 </OL>
 
 
@@ -69,7 +69,7 @@ neither.
 
 
 <A NAME="L_nand_erase">
-<H2>How to erase my MTD partition on NAND flash?</H2>
+<H2>How do I erase my MTD partition on NAND flash?</H2>
 </A>
 
 <P>
@@ -78,7 +78,7 @@ utilities may be used. If you are going to use this partition with JFFS2, then
 it is recommended to use <CODE>-j</CODE> or <CODE>--jffs2</CODE> options. This
 will write the so called "clean-marker" to the out of band area, so you can
 mount the file-system and no further formatting is needed. This is also
-necessary before you copy a FS-image to the chip.
+necessary before you copy a filesystem image to the chip.
 </P>
 
 
@@ -177,7 +177,7 @@ Yes, you can. The requirements are the same as for boot-loaders
 
 
 <A NAME="L_nand_nandsim">
-<H2>How to use NAND simulator?</H2>
+<H2>How do I use NAND simulator?</H2>
 </A>
 
 <P>
@@ -236,10 +236,10 @@ flash on top of a file. Please, use the <CODE>cache_file</CODE> nandsim module
 parameter.</P>
 
 <P><CODE>nandsim</CODE> can emulate various errors and report wear statistics,
-which is extrimely useful when testing how flash software handles errors (e.g.,
+which is extremely useful when testing how flash software handles errors (e.g.,
 what does JFFS2 do in case of bit-flips or write errors).</P>
 
-<P>Note, theoretically <CODE>nandsim</CODE> can emulate 16-bit bus witdth
+<P>Note, theoretically <CODE>nandsim</CODE> can emulate 16-bit bus width
 devices, but it this may not work.</P>
 
 <INCLUDE file="../inc/footer.tmpl" />
diff --git a/faq/ubi.xml b/faq/ubi.xml
index 1b2f2f3..908b095 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -13,35 +13,35 @@
 
 <h2>Table of contents</h2>
 <ol>
-	<li><a href="ubi.html#L_enable_ubi">How to enable UBI?</a></li>
-	<li><a href="ubi.html#L_attachmtd">How to attach an MTD device?</a></li>
-	<li><a href="ubi.html#L_mkvol">How to create/delete UBI volumes?</a></li>
-	<li><a href="ubi.html#L_run_jffs2">How to run JFFS2 on top of an UBI volume?</a></li>
+	<li><a href="ubi.html#L_enable_ubi">How do I enable UBI?</a></li>
+	<li><a href="ubi.html#L_attachmtd">How do I attach an MTD device?</a></li>
+	<li><a href="ubi.html#L_mkvol">How do I create/delete UBI volumes?</a></li>
+	<li><a href="ubi.html#L_run_jffs2">How do I run JFFS2 on top of an UBI volume?</a></li>
 	<li><a href="ubi.html#L_ext2_over_ubi">Can I run ext2 on top of UBI?</a></li>
 	<li><a href="ubi.html#L_format_mtd">Do I have to format my empty flash before running UBI on top of it?</a></li>
-	<li><a href="ubi.html#L_ubierase">How to erase flash and preserve erase counters?</a></li>
-	<li><a href="ubi.html#L_ubi_mkimg">How to create UBI images?</a></li>
-	<li><a href="ubi.html#L_find_min_io_size">How to find out min. I/O unit size, sub-page size, and LEB size?</a></li>
-	<li><a href="ubi.html#L_flash_img">How to flash UBI images and preserve erase counters?</a></li>
+	<li><a href="ubi.html#L_ubierase">How do I erase flash and preserve erase counters?</a></li>
+	<li><a href="ubi.html#L_ubi_mkimg">How do I create UBI images?</a></li>
+	<li><a href="ubi.html#L_find_min_io_size">How do I find out min. I/O unit size, sub-page size, and LEB size?</a></li>
+	<li><a href="ubi.html#L_flash_img">How do I flash UBI images and preserve erase counters?</a></li>
 	<li><a href="ubi.html#L_restrict">Can UBI logical eraseblocks be written randomly?</a></li>
 	<li><a href="ubi.html#L_why_no_oob">Why UBI does not use OOB area of NAND flashes?</a></li>
 	<li><a href="ubi.html#L_crash_safe">Is UBI tolerant of power failures?</a></li>
 	<li><a href="ubi.html#L_mlc">May UBI be used on MLC flash?</a></li>
 	<li><a href="ubi.html#L_vid_offset_mismatch">Why does ubiattach on a freshly formatted device fail with "Invalid argument"?</a></li>
-	<li><a href="ubi.html#L_subpage">What is sub-page?</a></li>
+	<li><a href="ubi.html#L_subpage">What is a sub-page?</a></li>
 	<li><a href="ubi.html#L_subpage_verify_fail">I get "ubi_io_write: error -5 while writing 512 bytes to PEB 5:512"</a></li>
 	<li><a href="ubi.html#L_no_vid_header">I get "no VID header found at PEB 7923, only 0xFF bytes"</a></li>
 	<li><a href="ubi.html#L_ecc_error">I get: "ubi_io_read: error -74 (ECC error) while reading 126976 bytes from PEB 47:4096, read 126976 bytes"</a></li>
-	<li><a href="ubi.html#L_force_no_subpage">How to force UBI to ignore sub-pages?</a></li>
-	<li><a href="ubi.html#L_flasher">How to implement UBI flasher?</a></li>
+	<li><a href="ubi.html#L_force_no_subpage">How do I force UBI to ignore sub-pages?</a></li>
+	<li><a href="ubi.html#L_flasher">How do I implement UBI flasher?</a></li>
 	<li><a href="ubi.html#L_bgt_thread">What does the "ubi_bgt0d" thread do?</a></li>
 	<li><a href="ubi.html#L_attach_faster">How do I speed up UBI initialization</a></li>
-	<li><a href="ubi.html#L_how_debug">How to debug UBI?</a></li>
+	<li><a href="ubi.html#L_how_debug">How do I debug UBI?</a></li>
 </ol>
 
 
 
-<h2><a name="L_enable_ubi">How to enable UBI?</a></h2>
+<h2><a name="L_enable_ubi">How do I enable UBI?</a></h2>
 
 <p>In the Linux configuration menu, go to "<b>Device Drivers</b>" ->
 "<b>Memory Technology Devices (MTD)</b>" -> "<b>UBI - Unsorted block images</b>",
@@ -50,7 +50,7 @@ kernel or be built as a kernel module.</p>
 
 
 
-<h2><a name="L_attachmtd">How to attach an MTD device?</a></h2>
+<h2><a name="L_attachmtd">How do I attach an MTD device?</a></h2>
 
 <p>Each MTD device has a name and a number, which you may find out by
 examining the <code>/proc/mtd</code> file. The preferable way to attach
@@ -112,7 +112,7 @@ numbers.</p>
 
 
 
-<h2><a name="L_mkvol">How to create/delete UBI volumes?</a></h2>
+<h2><a name="L_mkvol">How do I create/delete UBI volumes?</a></h2>
 
 <p>Use the <code>ubimkvol</code> and <code>ubirmvol</code>
 <a href="../doc/ubi.html#L_usptools">utilities</a>. For example, the below command
@@ -133,7 +133,7 @@ $ ubirmvol /dev/ubi0 -n 0
 
 
 
-<h2><a name="L_run_jffs2">How to run JFFS2 on top of an UBI volume?</a></h2>
+<h2><a name="L_run_jffs2">How do I run JFFS2 on top of an UBI volume?</a></h2>
 
 <p>There is an additional driver called <code>gluebi</code> which can emulate
 fake MTD devices for each UBI volume and JFFS2 can be used with these emulated
@@ -192,7 +192,7 @@ flashing programs.</p>
 
 
 <h2><a name="L_ubierase">
-	How to erase flash and preserve erase counters?
+	How do I erase flash and preserve erase counters?
 </a></h2>
 
 <p>Use the <a href="../doc/ubi.html#L_usptools"><code>ubiformat</code></a>
@@ -217,7 +217,7 @@ for those who implement a custom UBI flasher.</p>
 
 
 
-<h2><a name="L_ubi_mkimg">How to create UBI images?</a></h2>
+<h2><a name="L_ubi_mkimg">How do I create UBI images?</a></h2>
 
 <p>UBI images may be created using the
 <a href="../doc/ubi.html#L_usptools"><code>ubinize</code></a> utility. This
@@ -317,7 +317,7 @@ UBI-aware flashing programs should work in
 
 
 <h2><a name="L_find_min_io_size">
-	How to find out min. I/O unit size, sub-page size, and LEB size?
+	How do I find out min. I/O unit size, sub-page size, and LEB size?
 </a></h2>
 
 <p>If you run kernel version <code>2.6.30</code> or later, the easiest
@@ -347,7 +347,7 @@ there).</p>
 
 
 <h2><a name="L_flash_img">
-	How to flash UBI images and preserve erase counters?
+	How do I flash UBI images and preserve erase counters?
 </a></h2>
 
 <p>Use the <a href="../doc/ubi.html#L_usptools"><code>ubiformat</code></a>
@@ -515,7 +515,7 @@ ubi.mtd=0,2048
 
 
 
-<h2><a name="L_subpage">What is sub-page?</a></h2>
+<h2><a name="L_subpage">What is a sub-page?</a></h2>
 
 <p>Please, refer <a href="../doc/ubi.html#L_subpage">this</a> section.</p>
 
@@ -575,7 +575,7 @@ them properly.</p>
 
 
 
-<h2><a name="L_force_no_subpage">How to force UBI to ignore sub-pages?"</a></h2>
+<h2><a name="L_force_no_subpage">How do I force UBI to ignore sub-pages?"</a></h2>
 
 <p>If your NAND flash supports
 <a href="../doc/ubi.html#L_subpage">sub-pages</a>, UBI will use them. But
@@ -625,7 +625,7 @@ avoid using the <code>-s</code> parameter.</p>
 
 
 
-<h2><a name="L_flasher">How to implement UBI flasher?</a></h2>
+<h2><a name="L_flasher">How do I implement UBI flasher?</a></h2>
 
 <p>Please, read <a href="../doc/ubi.html#L_flasher_algo">here</a></p>
 
@@ -706,7 +706,7 @@ can do about it but without re-designing. Here are some ideas</p>
 
 
 
-<h2><a name="L_how_debug">How to debug UBI?</a></h2>
+<h2><a name="L_how_debug">How do I debug UBI?</a></h2>
 
 <h3><a name="L_how_debug_fake_mtd">Use fake MTD device</a></h3>
 
diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index d61a0c5..9dd5d3d 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -13,31 +13,31 @@
 
 <h2>Table of contents</h2>
 <ol>
-	<li><a href="ubifs.html#L_enable_ubifs">How to enable UBIFS?</a></li>
+	<li><a href="ubifs.html#L_enable_ubifs">How do I enable UBIFS?</a></li>
 	<li><a href="ubifs.html#L_ubifs_mlc">May UBIFS be used on MLC NAND flash?</a></li>
-	<li><a href="ubifs.html#L_mount_ubifs">How to mount UBIFS?</a></li>
-	<li><a href="ubifs.html#L_mkfubifs">How to create an UBIFS image?</a></li>
+	<li><a href="ubifs.html#L_mount_ubifs">How do I mount UBIFS?</a></li>
+	<li><a href="ubifs.html#L_mkfubifs">How do I create an UBIFS image?</a></li>
 	<li><a href="ubifs.html#L_emptyflash">May an empty UBI volume be mounted?</a></li>
 	<li><a href="ubifs.html#L_max_leb_cnt">What is the purpose of -c (--max-leb-cnt) mkfs.ubifs option?</a></li>
-	<li><a href="ubifs.html#L_why_ubiformat">Why I have to use ubiformat?</a></li>
-	<li><a href="ubifs.html#L_mkfs_ubifs_comp">How to compile mkfs.ubifs?</a></li>
+	<li><a href="ubifs.html#L_why_ubiformat">Why do I have to use ubiformat?</a></li>
+	<li><a href="ubifs.html#L_mkfs_ubifs_comp">How do I compile mkfs.ubifs?</a></li>
 	<li><a href="ubifs.html#L_favor_lzo">What is "favor LZO" compression?</a></li>
 	<li><a href="ubifs.html#L_loop_mount">Can UBIFS mount loop-back devices?</a></li>
-	<li><a href="ubifs.html#L_atomic_change">How to change a file atomically?</a></li>
+	<li><a href="ubifs.html#L_atomic_change">How do I change a file atomically?</a></li>
 	<li><a href="ubifs.html#L_atime">Does UBIFS support atime?</a></li>
 	<li><a href="ubifs.html#L_nfs">Does UBIFS support NFS?</a></li>
 	<li><a href="ubifs.html#L_slow_when_full">Does UBIFS become slower when it is full?</a></li>
 	<li><a href="ubifs.html#L_df_report">Why <code>df</code> reports too few free space?</a></li>
-	<li><a href="ubifs.html#L_comproff">How to disable compression?</a></li>
-	<li><a href="ubifs.html#L_ubifs_nandsim">How to use UBIFS with nandsim?</a></li>
-	<li><a href="ubifs.html#L_ubifs_extract">How to extract files from an UBI/UBIFS image?</a></li>
+	<li><a href="ubifs.html#L_comproff">How do I disable compression?</a></li>
+	<li><a href="ubifs.html#L_ubifs_nandsim">How do I use UBIFS with nandsim?</a></li>
+	<li><a href="ubifs.html#L_ubifs_extract">How do I extract files from an UBI/UBIFS image?</a></li>
 	<li><a href="ubifs.html#L_powercut">Is UBIFS tolerant to power-cuts?</a></li>
 	<li><a href="ubifs.html#L_smaller_jrn">I need more space - should I make UBIFS journal smaller?</a></li>
 	<li><a href="ubifs.html#L_empty_file">Why my file is empty after an unclean reboot?</a></li>
 	<li><a href="ubifs.html#L_end_hole">Why my file has zeroes at the end after an unclean reboot?</a></li>
 	<li><a href="ubifs.html#L_bgt_thread">What does the "ubifs_bgt0_0" thread do?</a></li>
 	<li><a href="ubifs.html#L_sudden_ro">UBIFS suddenly became read-only - what is this?</a></li>
-	<li><a href="ubifs.html#L_detect_ro">How to detect if UBIFS became read-only?</a></li>
+	<li><a href="ubifs.html#L_detect_ro">How do I detect if UBIFS became read-only?</a></li>
 	<li><a href="ubifs.html#L_lebsz_mismatch">I get: "validate_sb: LEB size mismatch: 129024 in superblock, 126976 real"</a></li>
 	<li><a href="ubifs.html#L_pdflush_blocked">I get: "INFO: task pdflush:110 blocked for more than 120 seconds"</a></li>
 	<li><a href="ubifs.html#L_few_lebs">I get: "init_constants_early: too few LEBs (12), min. is 17"</a></li>
@@ -46,7 +46,7 @@
 
 
 
-<h2><a name="L_enable_ubifs">How to enable UBIFS?</a></h2>
+<h2><a name="L_enable_ubifs">How do I enable UBIFS?</a></h2>
 
 <p>Since UBIFS works on top of UBI, you have to enable UBI first (see
 <a href="ubi.html#L_enable_ubi">here</a>).</p>
@@ -122,7 +122,7 @@ appreciated.</p>
 
 
 
-<h2><a name="L_mount_ubifs">How to mount UBIFS?</a></h2>
+<h2><a name="L_mount_ubifs">How do I mount UBIFS?</a></h2>
 
 <p>The modern way of mounting UBIFS is mounting UBI volume character device
 nodes, e.g.:</p>
@@ -196,7 +196,7 @@ UBI volumes.</p>
 
 
 
-<h2><a name="L_mkfubifs">How to create an UBIFS image?</a></h2>
+<h2><a name="L_mkfubifs">How do I create an UBIFS image?</a></h2>
 
 <p>Creating UBIFS images might be a little trickier than creating JFFS2 images.
 First of all, you have to understand that UBIFS works on top of UBI which works
@@ -549,7 +549,7 @@ in the kernel.</p>
 
 
 
-<h2><a name="L_why_ubiformat">Why I have to use ubiformat?</a></h2>
+<h2><a name="L_why_ubiformat">Why do I have to use ubiformat?</a></h2>
 
 <p>The first obvious reason is that <code>ubiformat</code> preserves erase
 counters, so you do not lose your wear-leveling information when flashing new
@@ -595,7 +595,7 @@ written once and only once after the erasure. If you use
 
 
 
-<h2><a name="L_mkfs_ubifs_comp">How to compile mkfs.ubifs?</a></h2>
+<h2><a name="L_mkfs_ubifs_comp">How do I compile mkfs.ubifs?</a></h2>
 
 <p>The <code>mkfs.ubifs</code> utility requires <i>zlib</i>, <i>lzo</i> and
 <i>uuid</i> libraries. The former two are used for compressing the data, and the
@@ -611,7 +611,7 @@ information about other dependencies in the  <code>mtd-utils</code> tree.</p>
 
 
 
-<h2><a name="L_atomic_change">How to change a file atomically?</a></h2>
+<h2><a name="L_atomic_change">How do I change a file atomically?</a></h2>
 
 <p>Changing a file atomically means changing its contents in a way that unclean
 reboots could not lead to any corruption or inconsistency in the file. The only
@@ -778,7 +778,7 @@ the <code>df</code> report is changing, you will notice that the amount of free
 space continuously grows until reaches its final value. This happens because the
 kernel starts writing the dirty data back by time-out (5 sec by default) and
 the amount of dirty data goes down, making the <code>df</code> report more
-precize.</p>
+precise.</p>
 
 <p>If you want to have as precise free space prediction as possible -
 synchronize the file-system. This not only flushes dirty data to the media,
@@ -806,7 +806,7 @@ accurate is free space reporting.</p>
 
 
 
-<h2><a name="L_comproff">How to disable compression?</a></h2>
+<h2><a name="L_comproff">How do I disable compression?</a></h2>
 
 <p>UBIFS compression may be disabled for whole file system during the image
 creation time using the "<code>-x none</code>" <a
@@ -845,7 +845,7 @@ embedded systems.</p>
 
 
 
-<h2><a name="L_ubifs_nandsim">How to use UBIFS with nandsim?</a></h2>
+<h2><a name="L_ubifs_nandsim">How do I use UBIFS with nandsim?</a></h2>
 
 <p>The same way as with any MTD device. Here is an example of how to load
 <code>nandsim</code>, create an UBI volume and mount it.</p>
@@ -876,13 +876,13 @@ mount -t ubifs /dev/ubi0_0 /mnt/ubifs
 
 
 
-<h2><a name="L_ubifs_extract">How to extract files from an UBI/UBIFS image?</a></h2>
+<h2><a name="L_ubifs_extract">How do I extract files from an UBI/UBIFS image?</a></h2>
 
 <p>Unfortunately, at the moment there are no user-space tools which can
-un-wrap UBI and UBIFS images. UBIFS cannot be loop-back mounted as well,
+unwrap UBI and UBIFS images. UBIFS cannot be loop-back mounted as well,
 because it does not work with block devices.</p>
 
-<p>However, there is a hacky way to un-wrap UBI/UBIFS images. But you have
+<p>However, there is a hacky way to unwrap UBI/UBIFS images. But you have
 to make sure you have UBIFS support in your host machine. UBIFS is a relatively
 new file system and is not supported by all Linux distributions. But at least
 Fedora 11 does include it.</p>
@@ -1105,7 +1105,7 @@ an UBIFS bug, please, send a
 
 
 
-<h2><a name="L_detect_ro">How to detect if UBIFS became read-only?</a></h2>
+<h2><a name="L_detect_ro">How do I detect if UBIFS became read-only?</a></h2>
 
 <p>If you use up-to-date UBIFS which includes commit
 <code>2fde99cb55fb9d9b88180512a5e8a5d939d27fec</code>
@@ -1178,7 +1178,7 @@ I get: "init_constants_early: too few LEBs (12), min. is 17"
 <p>This error means that you are trying to mount too small UBI volume.
 Probably because you flash is too small? Try to use JFFS2 then, becasue it
 suits small flashes better since it has much lower space overhead. Indeed,
-UBIFS sotores much more indexing information on the flash media than JFFS2, so
+UBIFS stores much more indexing information on the flash media than JFFS2, so
 it has much higher overhead. Also, UBI has some overhead (see
 <a href="../doc/ubi.html#L_overhead">here</a>). Thus, if you have a small flash
 device (e.g., about 64MiB), it makes sense to consider using JFFS2.</p>
diff --git a/source.xml b/source.xml
index c3c5e0e..3df28da 100644
--- a/source.xml
+++ b/source.xml
@@ -103,7 +103,7 @@ or not.</P>
   thing. Please don't ask us about it though.</P>
 
 <P>If you are using the ancient 2.4 kernel, that's probably
-because you're interested in stabliity -- it is old and long-tested
+because you're interested in stablity -- it is old and long-tested
 code. If that's what you want, then you should use the original JFFS2
 code which is part of the 2.4 kernel. It's old and slow and doesn't
 support NAND flash, but it <em>is</em> stable, and is maintained.</P>
-- 
1.7.1
