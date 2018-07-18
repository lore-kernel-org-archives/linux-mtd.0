Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffi2f-0000ni-Sl
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:42:41 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/7] mtd: rawnand: micron: support 8/512 on-die ECC
Date: Wed, 18 Jul 2018 10:42:16 +0200
Message-Id: <20180718084221.27821-2-boris.brezillon@bootlin.com>
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

From: Chris Packham <chris.packham@alliedtelesis.co.nz>

Micron MT29F1G08ABAFAWP-ITE:F supports an on-die ECC with 8 bits
per 512 bytes. Add support for this combination.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_micron.c | 161 ++++++++++++++++++++++++++++++-------
 1 file changed, 131 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index d85bb4d42686..f8839c7f7464 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -18,10 +18,30 @@
 #include <linux/mtd/rawnand.h>
 
 /*
- * Special Micron status bit that indicates when the block has been
- * corrected by on-die ECC and should be rewritten
+ * Special Micron status bit 3 indicates that the block has been
+ * corrected by on-die ECC and should be rewritten.
  */
-#define NAND_STATUS_WRITE_RECOMMENDED	BIT(3)
+#define NAND_ECC_STATUS_WRITE_RECOMMENDED	BIT(3)
+
+/*
+ * On chips with 8-bit ECC and additional bit can be used to distinguish
+ * cases where a errors were corrected without needing a rewrite
+ *
+ * Bit 4 Bit 3 Bit 0 Description
+ * ----- ----- ----- -----------
+ * 0     0     0     No Errors
+ * 0     0     1     Multiple uncorrected errors
+ * 0     1     0     4 - 6 errors corrected, recommend rewrite
+ * 0     1     1     Reserved
+ * 1     0     0     1 - 3 errors corrected
+ * 1     0     1     Reserved
+ * 1     1     0     7 - 8 errors corrected, recommend rewrite
+ */
+#define NAND_ECC_STATUS_MASK		(BIT(4) | BIT(3) | BIT(0))
+#define NAND_ECC_STATUS_UNCORRECTABLE	BIT(0)
+#define NAND_ECC_STATUS_4_6_CORRECTED	BIT(3)
+#define NAND_ECC_STATUS_1_3_CORRECTED	BIT(4)
+#define NAND_ECC_STATUS_7_8_CORRECTED	(BIT(4) | BIT(3))
 
 struct nand_onfi_vendor_micron {
 	u8 two_plane_read;
@@ -74,8 +94,9 @@ static int micron_nand_onfi_init(struct nand_chip *chip)
 	return 0;
 }
 
-static int micron_nand_on_die_ooblayout_ecc(struct mtd_info *mtd, int section,
-					    struct mtd_oob_region *oobregion)
+static int micron_nand_on_die_4_ooblayout_ecc(struct mtd_info *mtd,
+					      int section,
+					      struct mtd_oob_region *oobregion)
 {
 	if (section >= 4)
 		return -ERANGE;
@@ -86,8 +107,9 @@ static int micron_nand_on_die_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int micron_nand_on_die_ooblayout_free(struct mtd_info *mtd, int section,
-					     struct mtd_oob_region *oobregion)
+static int micron_nand_on_die_4_ooblayout_free(struct mtd_info *mtd,
+					       int section,
+					       struct mtd_oob_region *oobregion)
 {
 	if (section >= 4)
 		return -ERANGE;
@@ -98,9 +120,44 @@ static int micron_nand_on_die_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops micron_nand_on_die_ooblayout_ops = {
-	.ecc = micron_nand_on_die_ooblayout_ecc,
-	.free = micron_nand_on_die_ooblayout_free,
+static const struct mtd_ooblayout_ops micron_nand_on_die_4_ooblayout_ops = {
+	.ecc = micron_nand_on_die_4_ooblayout_ecc,
+	.free = micron_nand_on_die_4_ooblayout_free,
+};
+
+static int micron_nand_on_die_8_ooblayout_ecc(struct mtd_info *mtd,
+					      int section,
+					      struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = mtd->oobsize - chip->ecc.total;
+	oobregion->length = chip->ecc.total;
+
+	return 0;
+}
+
+static int micron_nand_on_die_8_ooblayout_free(struct mtd_info *mtd,
+					       int section,
+					       struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = 2;
+	oobregion->length = mtd->oobsize - chip->ecc.total - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops micron_nand_on_die_8_ooblayout_ops = {
+	.ecc = micron_nand_on_die_8_ooblayout_ecc,
+	.free = micron_nand_on_die_8_ooblayout_free,
 };
 
 static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
@@ -113,6 +170,55 @@ static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
 	return nand_set_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);
 }
 
+static int micron_nand_on_die_ecc_status_4(struct nand_chip *chip, u8 status)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	/*
+	 * The internal ECC doesn't tell us the number of bitflips
+	 * that have been corrected, but tells us if it recommends to
+	 * rewrite the block. If it's the case, then we pretend we had
+	 * a number of bitflips equal to the ECC strength, which will
+	 * hint the NAND core to rewrite the block.
+	 */
+	if (status & NAND_STATUS_FAIL) {
+		mtd->ecc_stats.failed++;
+	} else if (status & NAND_ECC_STATUS_WRITE_RECOMMENDED) {
+		mtd->ecc_stats.corrected += chip->ecc.strength;
+		return chip->ecc.strength;
+	}
+
+	return 0;
+}
+
+static int micron_nand_on_die_ecc_status_8(struct nand_chip *chip, u8 status)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	/*
+	 * With 8/512 we have more information but still don't know precisely
+	 * how many bit-flips were seen.
+	 */
+	switch (status & NAND_ECC_STATUS_MASK) {
+	case NAND_ECC_STATUS_UNCORRECTABLE:
+		mtd->ecc_stats.failed++;
+		return 0;
+	case NAND_ECC_STATUS_1_3_CORRECTED:
+		mtd->ecc_stats.corrected += 3;
+		return 3;
+	case NAND_ECC_STATUS_4_6_CORRECTED:
+		mtd->ecc_stats.corrected += 6;
+		/* rewrite recommended */
+		return 6;
+	case NAND_ECC_STATUS_7_8_CORRECTED:
+		mtd->ecc_stats.corrected += 8;
+		/* rewrite recommended */
+		return 8;
+	default:
+		return 0;
+	}
+}
+
 static int
 micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
 				 uint8_t *buf, int oob_required,
@@ -137,19 +243,10 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
 	if (ret)
 		goto out;
 
-	if (status & NAND_STATUS_FAIL) {
-		mtd->ecc_stats.failed++;
-	} else if (status & NAND_STATUS_WRITE_RECOMMENDED) {
-		/*
-		 * The internal ECC doesn't tell us the number of bitflips
-		 * that have been corrected, but tells us if it recommends to
-		 * rewrite the block. If it's the case, then we pretend we had
-		 * a number of bitflips equal to the ECC strength, which will
-		 * hint the NAND core to rewrite the block.
-		 */
-		mtd->ecc_stats.corrected += chip->ecc.strength;
-		max_bitflips = chip->ecc.strength;
-	}
+	if (chip->ecc.strength == 4)
+		max_bitflips = micron_nand_on_die_ecc_status_4(chip, status);
+	else
+		max_bitflips = micron_nand_on_die_ecc_status_8(chip, status);
 
 	ret = nand_read_data_op(chip, buf, mtd->writesize, false);
 	if (!ret && oob_required)
@@ -254,10 +351,9 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 		return MICRON_ON_DIE_MANDATORY;
 
 	/*
-	 * Some Micron NANDs have an on-die ECC of 4/512, some other
-	 * 8/512. We only support the former.
+	 * We only support on-die ECC of 4/512 or 8/512
 	 */
-	if (chip->ecc_strength_ds != 4)
+	if  (chip->ecc_strength_ds != 4 && chip->ecc_strength_ds != 8)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
 	return MICRON_ON_DIE_SUPPORTED;
@@ -289,16 +385,21 @@ static int micron_nand_init(struct nand_chip *chip)
 			return -EINVAL;
 		}
 
-		chip->ecc.bytes = 8;
+		if (chip->ecc_strength_ds == 4)
+			mtd_set_ooblayout(mtd,
+					  &micron_nand_on_die_4_ooblayout_ops);
+		else
+			mtd_set_ooblayout(mtd,
+					  &micron_nand_on_die_8_ooblayout_ops);
+
+		chip->ecc.bytes = chip->ecc_strength_ds * 2;
 		chip->ecc.size = 512;
-		chip->ecc.strength = 4;
+		chip->ecc.strength = chip->ecc_strength_ds;
 		chip->ecc.algo = NAND_ECC_BCH;
 		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
 		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
 		chip->ecc.read_page_raw = nand_read_page_raw;
 		chip->ecc.write_page_raw = nand_write_page_raw;
-
-		mtd_set_ooblayout(mtd, &micron_nand_on_die_ooblayout_ops);
 	}
 
 	return 0;
-- 
2.14.1
