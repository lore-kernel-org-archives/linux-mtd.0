Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RVVsa-0004B3-6I
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 22:10:21 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: [PATCH v2] mtd/docg3: fixes and cleanups
Date: Tue, 29 Nov 2011 23:09:37 +0100
Message-Id: <1322604577-12309-1-git-send-email-robert.jarzmik@free.fr>
Cc: sfr@canb.auug.org.au, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch takes into account checkpatch, sparse and ECC
comments.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

---
Since V1: Stephen Rothwell comment
---
 drivers/mtd/devices/docg3.c |   16 ++++++++--------
 drivers/mtd/devices/docg3.h |    1 +
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index d6c9599..867226e 100644
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
@@ -573,7 +573,7 @@ static int doc_read_page_ecc_init(struct docg3 *docg3, int len)
  */
 static int doc_write_page_ecc_init(struct docg3 *docg3, int len)
 {
-	doc_writew(docg3, !DOC_ECCCONF0_READ_MODE
+	doc_writew(docg3, DOC_ECCCONF0_WRITE_MODE
 		   | DOC_ECCCONF0_BCH_ENABLE | DOC_ECCCONF0_HAMMING_ENABLE
 		   | (len & DOC_ECCCONF0_DATA_BYTES_MASK),
 		   DOC_ECCCONF0);
@@ -763,14 +763,14 @@ static void doc_write_page_putbytes(struct docg3 *docg3, int len,
 /**
  * doc_get_bch_hw_ecc - Get hardware calculated BCH ECC
  * @docg3: the device
- * @syns:  the array of 7 integers where the hardware ecc will be stored
+ * @hwecc:  the array of 7 integers where the hardware ecc will be stored
  */
-static void doc_get_bch_hw_ecc(struct docg3 *docg3, u8 *syns)
+static void doc_get_bch_hw_ecc(struct docg3 *docg3, u8 *hwecc)
 {
 	int i;
 
 	for (i = 0; i < DOC_ECC_BCH_SIZE; i++)
-		syns[i] = doc_register_readb(docg3, DOC_BCH_HW_ECC(i));
+		hwecc[i] = doc_register_readb(docg3, DOC_BCH_HW_ECC(i));
 }
 
 /**
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
 
-		doc_get_bch_hw_ecc(docg3, syn);
-		doc_write_page_putbytes(docg3, DOC_LAYOUT_OOB_BCH_SZ, syn);
+		doc_get_bch_hw_ecc(docg3, hwecc);
+		doc_write_page_putbytes(docg3, DOC_LAYOUT_OOB_BCH_SZ, hwecc);
 		doc_delay(docg3, 2);
 
 		doc_write_page_putbytes(docg3, DOC_LAYOUT_OOB_UNUSED_SZ, oob);
diff --git a/drivers/mtd/devices/docg3.h b/drivers/mtd/devices/docg3.h
index b1ae919..db0da43 100644
--- a/drivers/mtd/devices/docg3.h
+++ b/drivers/mtd/devices/docg3.h
@@ -193,6 +193,7 @@
 /*
  * Flash register : DOC_ECCCONF0
  */
+#define DOC_ECCCONF0_WRITE_MODE		0x0000
 #define DOC_ECCCONF0_READ_MODE		0x8000
 #define DOC_ECCCONF0_AUTO_ECC_ENABLE	0x4000
 #define DOC_ECCCONF0_HAMMING_ENABLE	0x1000
-- 
1.7.5.4
