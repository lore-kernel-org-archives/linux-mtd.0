Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MVo87-0004CE-0y
	for linux-mtd@lists.infradead.org; Tue, 28 Jul 2009 14:58:16 +0000
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd/nand: Add __nand_correct_data helper function
Date: Tue, 28 Jul 2009 23:53:11 +0900
Message-Id: <1248792792-20197-1-git-send-email-anemo@mba.ocn.ne.jp>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, dwmw2@infradead.org,
	vimal singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Split nand_correct_data() into two part, a pure calculation function
and a wrapper for mtd interface.

The tmio_nand driver can implement its ecc.correct function easily
using this __nand_correct_data helper.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Acked-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Acked-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/nand_ecc.c  |   31 ++++++++++++++++++++++++-------
 include/linux/mtd/nand_ecc.h |    6 ++++++
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index c0cb87d..db7ae9d 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -417,22 +417,22 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 EXPORT_SYMBOL(nand_calculate_ecc);
 
 /**
- * nand_correct_data - [NAND Interface] Detect and correct bit error(s)
- * @mtd:	MTD block structure
+ * __nand_correct_data - [NAND Interface] Detect and correct bit error(s)
  * @buf:	raw data read from the chip
  * @read_ecc:	ECC from the chip
  * @calc_ecc:	the ECC calculated from raw data
+ * @eccsize:	data bytes per ecc step (256 or 512)
  *
- * Detect and correct a 1 bit error for 256/512 byte block
+ * Detect and correct a 1 bit error for eccsize byte block
  */
-int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
-		      unsigned char *read_ecc, unsigned char *calc_ecc)
+int __nand_correct_data(unsigned char *buf,
+			unsigned char *read_ecc, unsigned char *calc_ecc,
+			unsigned int eccsize)
 {
 	unsigned char b0, b1, b2, bit_addr;
 	unsigned int byte_addr;
 	/* 256 or 512 bytes/ecc  */
-	const uint32_t eccsize_mult =
-			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
+	const uint32_t eccsize_mult = eccsize >> 8;
 
 	/*
 	 * b0 to b2 indicate which bit is faulty (if any)
@@ -495,6 +495,23 @@ int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
 	printk(KERN_ERR "uncorrectable error : ");
 	return -1;
 }
+EXPORT_SYMBOL(__nand_correct_data);
+
+/**
+ * nand_correct_data - [NAND Interface] Detect and correct bit error(s)
+ * @mtd:	MTD block structure
+ * @buf:	raw data read from the chip
+ * @read_ecc:	ECC from the chip
+ * @calc_ecc:	the ECC calculated from raw data
+ *
+ * Detect and correct a 1 bit error for 256/512 byte block
+ */
+int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
+		      unsigned char *read_ecc, unsigned char *calc_ecc)
+{
+	return __nand_correct_data(buf, read_ecc, calc_ecc,
+				   ((struct nand_chip *)mtd->priv)->ecc.size);
+}
 EXPORT_SYMBOL(nand_correct_data);
 
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/nand_ecc.h b/include/linux/mtd/nand_ecc.h
index 090da50..052ea8c 100644
--- a/include/linux/mtd/nand_ecc.h
+++ b/include/linux/mtd/nand_ecc.h
@@ -21,6 +21,12 @@ struct mtd_info;
 int nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code);
 
 /*
+ * Detect and correct a 1 bit error for eccsize byte block
+ */
+int __nand_correct_data(u_char *dat, u_char *read_ecc, u_char *calc_ecc,
+			unsigned int eccsize);
+
+/*
  * Detect and correct a 1 bit error for 256 byte block
  */
 int nand_correct_data(struct mtd_info *mtd, u_char *dat, u_char *read_ecc, u_char *calc_ecc);
-- 
1.5.6.5
