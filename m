Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RTztY-0005Aa-Iq
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2011 17:49:07 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: [PATCH] mtd/docg3: fixes and cleanups
Date: Fri, 25 Nov 2011 18:48:46 +0100
Message-Id: <1322243326-28626-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch takes into account checkpatch, sparse and ECC
comments :
 - static initialization to 0
 - ECC hwecc term used instead of syndrom
 - BCH default values removed (should be put into board
   KConfig instead)

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/Kconfig |    8 --------
 drivers/mtd/devices/docg3.c |   24 ++++++++++++------------
 drivers/mtd/devices/docg3.h |    2 +-
 3 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 952e956..c5f8e13 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -252,7 +252,6 @@ config MTD_DOC2001PLUS
 config MTD_DOCG3
 	tristate "M-Systems Disk-On-Chip G3"
 	select BCH
-	select BCH_CONST_PARAMS
 	---help---
 	  This provides an MTD device driver for the M-Systems DiskOnChip
 	  G3 devices.
@@ -261,13 +260,6 @@ config MTD_DOCG3
 	  M-Systems and now Sandisk. The support is very experimental,
 	  and doesn't give access to any write operations.
 
-if MTD_DOCG3
-config BCH_CONST_M
-	default 14
-config BCH_CONST_T
-	default 4
-endif
-
 config MTD_DOCPROBE
 	tristate
 	select MTD_DOCECC
diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index d7df311..6493229 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -61,7 +61,7 @@
  *
  */
 
-static unsigned int reliable_mode = 0;
+static unsigned int reliable_mode;
 module_param(reliable_mode, uint, 0);
 MODULE_PARM_DESC(reliable_mode, "Set the docg3 mode (0=normal MLC, 1=fast, "
 		 "2=reliable) : MLC normal operations are in normal mode");
@@ -546,7 +546,7 @@ out:
  * @len: the number of bytes covered by the ECC (BCH covered)
  *
  * The function does initialize the hardware ECC engine to compute the Hamming
- * ECC (on 1 byte) and the BCH Syndroms (on 7 bytes).
+ * ECC (on 1 byte) and the BCH hardware ECC (on 7 bytes).
  *
  * Return 0 if succeeded, -EIO on error
  */
@@ -567,7 +567,7 @@ static int doc_read_page_ecc_init(struct docg3 *docg3, int len)
  * @len: the number of bytes covered by the ECC (BCH covered)
  *
  * The function does initialize the hardware ECC engine to compute the Hamming
- * ECC (on 1 byte) and the BCH Syndroms (on 7 bytes).
+ * ECC (on 1 byte) and the BCH hardware ECC (on 7 bytes).
  *
  * Return 0 if succeeded, -EIO on error
  */
@@ -614,7 +614,7 @@ static void doc_hamming_ecc_init(struct docg3 *docg3, int nb_bytes)
 }
 
 /**
- * doc_correct_data - Fix if need be read data from flash
+ * doc_ecc_bch_fix_data - Fix if need be read data from flash
  * @docg3: the device
  * @buf: the buffer of read data (512 + 7 + 1 bytes)
  * @hwecc: the hardware calculated ECC.
@@ -761,16 +761,16 @@ static void doc_write_page_putbytes(struct docg3 *docg3, int len,
 }
 
 /**
- * doc_get_hw_bch_syndroms - Get hardware calculated BCH syndroms
+ * doc_get_bch_hw_ecc - Get hardware calculated BCH ECC
  * @docg3: the device
- * @syns:  the array of 7 integers where the syndroms will be stored
+ * @hwecc:  the array of 7 integers where the hardware ecc will be stored
  */
-static void doc_get_hw_bch_syndroms(struct docg3 *docg3, u8 *syns)
+static void doc_get_bch_hw_ecc(struct docg3 *docg3, u8 *hwecc)
 {
 	int i;
 
 	for (i = 0; i < DOC_ECC_BCH_SIZE; i++)
-		syns[i] = doc_register_readb(docg3, DOC_BCH_SYNDROM(i));
+		hwecc[i] = doc_register_readb(docg3, DOC_BCH_HW_ECC(i));
 }
 
 /**
@@ -904,7 +904,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 		doc_read_page_getbytes(docg3, DOC_LAYOUT_OOB_SIZE - nboob,
 				       NULL, 0);
 
-		doc_get_hw_bch_syndroms(docg3, hwecc);
+		doc_get_bch_hw_ecc(docg3, hwecc);
 		eccconf1 = doc_register_readb(docg3, DOC_ECCCONF1);
 
 		if (nboob >= DOC_LAYOUT_OOB_SIZE) {
@@ -1248,7 +1248,7 @@ static int doc_write_page(struct docg3 *docg3, loff_t to, const u_char *buf,
 			  const u_char *oob, int autoecc)
 {
 	int block0, block1, page, ret, ofs = 0;
-	u8 syn[DOC_ECC_BCH_SIZE], hamming;
+	u8 hwecc[DOC_ECC_BCH_SIZE], hamming;
 
 	doc_dbg("doc_write_page(to=%lld)\n", to);
 	calc_block_sector(to, &block0, &block1, &page, &ofs, docg3->reliable);
@@ -1278,8 +1278,8 @@ static int doc_write_page(struct docg3 *docg3, loff_t to, const u_char *buf,
 					&hamming);
 		doc_delay(docg3, 2);
 
-		doc_get_hw_bch_syndroms(docg3, syn);
-		doc_write_page_putbytes(docg3, DOC_LAYOUT_OOB_BCH_SZ, syn);
+		doc_get_bch_hw_ecc(docg3, hwecc);
+		doc_write_page_putbytes(docg3, DOC_LAYOUT_OOB_BCH_SZ, hwecc);
 		doc_delay(docg3, 2);
 
 		doc_write_page_putbytes(docg3, DOC_LAYOUT_OOB_UNUSED_SZ, oob);
diff --git a/drivers/mtd/devices/docg3.h b/drivers/mtd/devices/docg3.h
index a349915..b1ae919 100644
--- a/drivers/mtd/devices/docg3.h
+++ b/drivers/mtd/devices/docg3.h
@@ -115,7 +115,7 @@
 #define DOC_ECCCONF1			0x1042
 #define DOC_ECCPRESET			0x1044
 #define DOC_HAMMINGPARITY		0x1046
-#define DOC_BCH_SYNDROM(idx)		(0x1048 + (idx << 0))
+#define DOC_BCH_HW_ECC(idx)		(0x1048 + idx)
 
 #define DOC_PROTECTION			0x1056
 #define DOC_DPS0_KEY			0x105c
-- 
1.7.5.4
