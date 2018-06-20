Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVVJv-0003uR-MI
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 05:06:19 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v3 4/4] mtd: rawnand: micron: support 8/512 on-die ECC
Date: Wed, 20 Jun 2018 17:05:44 +1200
Message-Id: <20180620050544.31549-5-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20180620050544.31549-1-chris.packham@alliedtelesis.co.nz>
References: <20180620050544.31549-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Micron MT29F1G08ABAFAWP-ITE:F supports an on-die ECC with 8 bits
per 512 bytes. Add support for this combination.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v2:
- New
Changes in v3:
- Handle reporting of corrected errors that don't require a rewrite, expand
  comment for the ECC status bits.

 drivers/mtd/nand/raw/nand_micron.c | 34 ++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 5cec79372181..0c2bde4411d7 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -18,10 +18,24 @@
 #include <linux/mtd/rawnand.h>
 
 /*
- * Special Micron status bit that indicates when the block has been
- * corrected by on-die ECC and should be rewritten
+ * Special Micron status bit 3 indicates that the block has been
+ * corrected by on-die ECC and should be rewritten.
+ *
+ * On chips with 8-bit ECC and additional bit can be used to distinguish
+ * cases where a errors were corrected without needing a rewrite
+ *
+ * Bit 4 Bit 3 Bit 0 Description
+ * ----- ----- ----- -----------
+ * 0     0     0     No Errors
+ * 0     0     1     Multiple uncorrected errors
+ * 0     1     0     4 - 6 errors corrected, recommend rewrite
+ * 0     0     1     Reserved
+ * 1     0     0     1 - 3 errors corrected
+ * 1     0     1     Reserved
+ * 1     1     0     7 - 8 errors corrected, recommend rewrite
  */
 #define NAND_STATUS_WRITE_RECOMMENDED	BIT(3)
+#define NAND_STATUS_ERRORS_CORRECTED	BIT(4)
 
 struct nand_onfi_vendor_micron {
 	u8 two_plane_read;
@@ -141,7 +155,7 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
 		mtd->ecc_stats.failed++;
 
 	/*
-	 * The internal ECC doesn't tell us the number of bitflips
+	 * The internal 4-bit ECC doesn't tell us the number of bitflips
 	 * that have been corrected, but tells us if it recommends to
 	 * rewrite the block. If it's the case, then we pretend we had
 	 * a number of bitflips equal to the ECC strength, which will
@@ -149,6 +163,12 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
 	 */
 	else if (status & NAND_STATUS_WRITE_RECOMMENDED)
 		max_bitflips = chip->ecc.strength;
+	/*
+	 * Chips with 8-bit internal ECC do tell us if errors 1 to 3 bit
+	 * errors have been corrected without recommending a rewrite.
+	 */
+	else if (status & NAND_STATUS_ERRORS_CORRECTED)
+		max_bitflips = 3;
 
 	ret = nand_read_data_op(chip, buf, mtd->writesize, false);
 	if (!ret && oob_required)
@@ -240,9 +260,9 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 
 	/*
 	 * Some Micron NANDs have an on-die ECC of 4/512, some other
-	 * 8/512. We only support the former.
+	 * 8/512.
 	 */
-	if (chip->ecc_strength_ds != 4)
+	if (chip->ecc_strength_ds != 4 && chip->ecc_strength_ds != 8)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
 	return MICRON_ON_DIE_SUPPORTED;
@@ -274,9 +294,9 @@ static int micron_nand_init(struct nand_chip *chip)
 			return -EINVAL;
 		}
 
-		chip->ecc.bytes = 8;
+		chip->ecc.bytes = chip->ecc_strength_ds * 2;
 		chip->ecc.size = 512;
-		chip->ecc.strength = 4;
+		chip->ecc.strength = chip->ecc_strength_ds;
 		chip->ecc.algo = NAND_ECC_BCH;
 		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
 		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
-- 
2.17.1
