Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffi2f-0000nj-So
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:42:40 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 3/7] mtd: rawnand: Expose _notsupp() helpers for raw page
 accessors
Date: Wed, 18 Jul 2018 10:42:17 +0200
Message-Id: <20180718084221.27821-3-boris.brezillon@bootlin.com>
In-Reply-To: <20180718084221.27821-1-boris.brezillon@bootlin.com>
References: <20180718084221.27821-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some implementations simply can't disable their ECC engine. Expose
helpers returning -ENOTSUPP so that the caller knows that raw accesses
are not supported instead of silently falling back to non-raw
accessors.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  4 ++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 4fa5e20d9690..323a900f3697 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2966,6 +2966,23 @@ int nand_check_erased_ecc_chunk(void *data, int datalen,
 }
 EXPORT_SYMBOL(nand_check_erased_ecc_chunk);
 
+/**
+ * nand_read_page_raw_notsupp - dummy read raw page function
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
+ * @page: page number to read
+ *
+ * Returns -ENOTSUPP unconditionally.
+ */
+int nand_read_page_raw_notsupp(struct mtd_info *mtd, struct nand_chip *chip,
+			       u8 *buf, int oob_required, int page)
+{
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL(nand_read_page_raw_notsupp);
+
 /**
  * nand_read_page_raw - [INTERN] read raw page data without ecc
  * @mtd: mtd info structure
@@ -3960,6 +3977,22 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	return ret;
 }
 
+/**
+ * nand_write_page_raw - dummy raw page write function
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @buf: data buffer
+ * @oob_required: must write chip->oob_poi to OOB
+ * @page: page number to write
+ *
+ * Returns -ENOTSUPP unconditionally.
+ */
+int nand_write_page_raw_notsupp(struct mtd_info *mtd, struct nand_chip *chip,
+				const u8 *buf, int oob_required, int page)
+{
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL(nand_write_page_raw_notsupp);
 
 /**
  * nand_write_page_raw - [INTERN] raw page write function
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 11c2426fc363..f60fad29eae6 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1681,10 +1681,14 @@ int nand_get_set_features_notsupp(struct mtd_info *mtd, struct nand_chip *chip,
 /* Default read_page_raw implementation */
 int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		       uint8_t *buf, int oob_required, int page);
+int nand_read_page_raw_notsupp(struct mtd_info *mtd, struct nand_chip *chip,
+			       u8 *buf, int oob_required, int page);
 
 /* Default write_page_raw implementation */
 int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			const uint8_t *buf, int oob_required, int page);
+int nand_write_page_raw_notsupp(struct mtd_info *mtd, struct nand_chip *chip,
+				const u8 *buf, int oob_required, int page);
 
 /* Reset and initialize a NAND device */
 int nand_reset(struct nand_chip *chip, int chipnr);
-- 
2.14.1
