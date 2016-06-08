Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAd78-0004qH-CZ
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 13:01:43 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH v2 05/15] mtd: nand: add manufacturer specific
 initialization/detection steps
Date: Wed,  8 Jun 2016 15:00:39 +0200
Message-Id: <1465390849-13199-6-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A lot of NANDs are implementing generic features in a non-generic way,
or are providing advanced auto-detection logic where the NAND ID bytes
meaning changes with the NAND generation.

Providing this vendor specific initialization step will allow us to get
rid of the full ids in the nand_ids table or all the vendor specific
cases added over the time in the generic NAND ID decoding logic.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 42 ++++++++++++++++++++++++++++++++----------
 include/linux/mtd/nand.h     | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 95e9a8e..0a7d1c6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3580,7 +3580,7 @@ static int nand_get_bits_per_cell(u8 cellinfo)
  * chip. The rest of the parameters must be decoded according to generic or
  * manufacturer-specific "extended ID" decoding patterns.
  */
-static void nand_decode_ext_id(struct nand_chip *chip)
+void nand_decode_ext_id(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int extid, id_len = chip->id.len;
@@ -3705,6 +3705,7 @@ static void nand_decode_ext_id(struct nand_chip *chip)
 
 	}
 }
+EXPORT_SYMBOL_GPL(nand_decode_ext_id);
 
 /*
  * Old devices have chip data hardcoded in the device ID table. nand_decode_id
@@ -3815,7 +3816,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int busw;
-	int i, maf_idx;
+	int i, maf_idx, ret;
 	u8 *id_data = chip->id.data;
 	u8 maf_id, dev_id;
 
@@ -3856,6 +3857,14 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 
 	chip->id.len = nand_id_len(id_data, 8);
 
+	/* Try to identify manufacturer */
+	for (maf_idx = 0; nand_manuf_ids[maf_idx].id != 0x0; maf_idx++) {
+		if (nand_manuf_ids[maf_idx].id == maf_id)
+			break;
+	}
+
+	chip->manufacturer.ops = nand_manuf_ids[maf_idx].ops;
+
 	if (!type)
 		type = nand_flash_ids;
 
@@ -3903,8 +3912,14 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	chip->chipsize = (uint64_t)type->chipsize << 20;
 
 	if (!type->pagesize) {
-		/* Decode parameters from extended ID */
-		nand_decode_ext_id(chip);
+		/*
+		 * Try manufacturer detection if available and use
+		 * nand_decode_ext_id() otherwise.
+		 */
+		if (chip->manufacturer.ops->detect)
+			chip->manufacturer.ops->detect(chip);
+		else
+			nand_decode_ext_id(chip);
 	} else {
 		nand_decode_id(chip, type);
 	}
@@ -3919,12 +3934,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 		chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
 ident_done:
 
-	/* Try to identify manufacturer */
-	for (maf_idx = 0; nand_manuf_ids[maf_idx].id != 0x0; maf_idx++) {
-		if (nand_manuf_ids[maf_idx].id == maf_id)
-			break;
-	}
-
 	if (chip->options & NAND_BUSWIDTH_AUTO) {
 		WARN_ON(busw & NAND_BUSWIDTH_16);
 		nand_set_defaults(chip);
@@ -3964,6 +3973,15 @@ ident_done:
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
+	/*
+	 * Manufacturer specific initialization.
+	 */
+	if (chip->manufacturer.ops && chip->manufacturer.ops->init) {
+		ret = chip->manufacturer.ops->init(chip);
+		if (ret)
+			return ret;
+	}
+
 	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
 		maf_id, dev_id);
 
@@ -4623,6 +4641,10 @@ void nand_release(struct mtd_info *mtd)
 	if (chip->badblock_pattern && chip->badblock_pattern->options
 			& NAND_BBT_DYNAMICSTRUCT)
 		kfree(chip->badblock_pattern);
+
+	/* Release manufacturer private data */
+	if (chip->manufacturer.ops && chip->manufacturer.ops->cleanup)
+		chip->manufacturer.ops->cleanup(chip);
 }
 EXPORT_SYMBOL_GPL(nand_release);
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3072f5e..c0a1e36 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -577,6 +577,20 @@ struct nand_buffers {
 };
 
 /**
+ * struct nand_manufacturer_ops - NAND Manufacturer operations
+ * @detect: detect the NAND memory organization and capabilities
+ * @init: initialize all vendor specific fields (like the ->read_retry()
+ *	  implementation) if any.
+ * @cleanup: the ->init() function may have allocated resources, ->cleanup()
+ *	     is here to let vendor specific code release those resources.
+ */
+struct nand_manufacturer_ops {
+	void (*detect)(struct nand_chip *chip);
+	int (*init)(struct nand_chip *chip);
+	void (*cleanup)(struct nand_chip *chip);
+};
+
+/**
  * struct nand_chip - NAND Private Flash Chip Data
  * @mtd:		MTD device registered to the MTD framework
  * @IO_ADDR_R:		[BOARDSPECIFIC] address to read the 8 I/O lines of the
@@ -676,6 +690,7 @@ struct nand_buffers {
  *			additional error status checks (determine if errors are
  *			correctable).
  * @write_page:		[REPLACEABLE] High-level page write function
+ * @manufacturer:	[INTERN] Contains manufacturer data
  */
 
 struct nand_chip {
@@ -756,6 +771,11 @@ struct nand_chip {
 	struct nand_bbt_descr *badblock_pattern;
 
 	void *priv;
+
+	struct {
+		const struct nand_manufacturer_ops *ops;
+		void *priv;
+	} manufacturer;
 };
 
 extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
@@ -792,6 +812,17 @@ static inline void nand_set_controller_data(struct nand_chip *chip, void *priv)
 	chip->priv = priv;
 }
 
+static inline void nand_set_manufacturer_data(struct nand_chip *chip,
+					      void *priv)
+{
+	chip->manufacturer.priv = priv;
+}
+
+static inline void *nand_get_manufacturer_data(struct nand_chip *chip)
+{
+	return chip->manufacturer.priv;
+}
+
 /*
  * NAND Flash Manufacturer ID Codes
  */
@@ -896,10 +927,12 @@ struct nand_flash_dev {
  * struct nand_manufacturers - NAND Flash Manufacturer ID Structure
  * @name:	Manufacturer name
  * @id:		manufacturer ID code of device.
+ * @ops:	manufacturer operations
 */
 struct nand_manufacturers {
 	int id;
 	char *name;
+	const struct nand_manufacturer_ops *ops;
 };
 
 extern struct nand_flash_dev nand_flash_ids[];
@@ -1105,4 +1138,7 @@ int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
 /* Default read_oob syndrome implementation */
 int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 			   int page);
+
+/* Default extended ID decoding function */
+void nand_decode_ext_id(struct nand_chip *chip);
 #endif /* __LINUX_MTD_NAND_H */
-- 
2.7.4
