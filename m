Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffi2f-0000no-Sn
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:42:41 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 5/7] mtd: rawnand: micron: Get the actual number of bitflips
Date: Wed, 18 Jul 2018 10:42:19 +0200
Message-Id: <20180718084221.27821-5-boris.brezillon@bootlin.com>
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

The MT29F2Gxxx chips with 4bits/512byte on-die ECC let us know when
some bitflips were corrected by the on-die ECC, but they do not report
the actual number of bitflips that were present in the data+ECC chunk.

We initially decided to always return ecc->strength to avoid re-reading
the page in raw mode + comparing it to the corrected buffer to extract
the real number of bitflips, but this forces UBI to move data around as
soon as one bitflip is present in a page.

This not only wears the NAND out faster, but also degrades
performances, since reading a full PEB + writing it back to a different
PEB + erasing the old one is much more expensive than re-reading the
faulty page in raw mode and comparing it to the corrected buffer.
In most cases, the actual number of bitflips does not exceed the
bitflips threshold, and UBI won't have to move data around. Otherwise,
we can assume the time spent re-reading the page and doing the
comparison is negligible compared to the time UBI spends moving a full
PEB to another PEB.

Note that this logic is not applied to chips with 8bits/512byte on-die
ECC, because those chips provide fine-grained information (the maximum
error is 1 bit, and it will not force UBI to move blocks around at the
first bitflip).

Suggested-by: Bean Huo <beanhuo@micron.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_micron.c | 139 +++++++++++++++++++++++++++++++------
 1 file changed, 119 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index fd3f68e0909f..2cff25f7b48b 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/mtd/rawnand.h>
+#include <linux/slab.h>
 
 /*
  * Special Micron status bit 3 indicates that the block has been
@@ -63,6 +64,14 @@ struct nand_onfi_vendor_micron {
 	u8 param_revision;
 } __packed;
 
+struct micron_on_die_ecc {
+	void *rawbuf;
+};
+
+struct micron_nand {
+	struct micron_on_die_ecc ecc;
+};
+
 static int micron_nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
@@ -170,25 +179,71 @@ static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
 	return nand_set_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);
 }
 
-static int micron_nand_on_die_ecc_status_4(struct nand_chip *chip, u8 status)
+static int micron_nand_on_die_ecc_status_4(struct nand_chip *chip, u8 status,
+					   void *buf, int page,
+					   int oob_required)
 {
+	struct micron_nand *micron = nand_get_manufacturer_data(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	unsigned int step, max_bitflips = 0;
+	int ret;
+
+	if (!(status & NAND_ECC_STATUS_WRITE_RECOMMENDED)) {
+		if (status & NAND_STATUS_FAIL)
+			mtd->ecc_stats.failed++;
+
+		return 0;
+	}
 
 	/*
-	 * The internal ECC doesn't tell us the number of bitflips
-	 * that have been corrected, but tells us if it recommends to
-	 * rewrite the block. If it's the case, then we pretend we had
-	 * a number of bitflips equal to the ECC strength, which will
-	 * hint the NAND core to rewrite the block.
+	 * The internal ECC doesn't tell us the number of bitflips that have
+	 * been corrected, but tells us if it recommends to rewrite the block.
+	 * If it's the case, we need to read the page in raw mode and compare
+	 * its content to the corrected version to extract the actual number of
+	 * bitflips.
+	 * But before we do that, we must make sure we have all OOB bytes read
+	 * in non-raw mode, even if the user did not request those bytes.
 	 */
-	if (status & NAND_STATUS_FAIL) {
-		mtd->ecc_stats.failed++;
-	} else if (status & NAND_ECC_STATUS_WRITE_RECOMMENDED) {
-		mtd->ecc_stats.corrected += chip->ecc.strength;
-		return chip->ecc.strength;
+	if (!oob_required) {
+		ret = nand_read_data_op(chip, chip->oob_poi, mtd->oobsize,
+					false);
+		if (ret)
+			return ret;
 	}
 
-	return 0;
+	micron_nand_on_die_ecc_setup(chip, false);
+
+	ret = nand_read_page_op(chip, page, 0, micron->ecc.rawbuf,
+				mtd->writesize + mtd->oobsize);
+	if (ret)
+		return ret;
+
+	for (step = 0; step < chip->ecc.steps; step++) {
+		unsigned int offs, i, nbitflips = 0;
+		u8 *rawbuf, *corrbuf;
+
+		offs = step * chip->ecc.size;
+		rawbuf = micron->ecc.rawbuf + offs;
+		corrbuf = buf + offs;
+
+		for (i = 0; i < chip->ecc.size; i++)
+			nbitflips += hweight8(corrbuf[i] ^ rawbuf[i]);
+
+		offs = (step * 16) + 4;
+		rawbuf = micron->ecc.rawbuf + mtd->writesize + offs;
+		corrbuf = chip->oob_poi + offs;
+
+		for (i = 0; i < chip->ecc.bytes + 4; i++)
+			nbitflips += hweight8(corrbuf[i] ^ rawbuf[i]);
+
+		if (WARN_ON(nbitflips > chip->ecc.strength))
+			return -EINVAL;
+
+		max_bitflips = max(nbitflips, max_bitflips);
+		mtd->ecc_stats.corrected += nbitflips;
+	}
+
+	return max_bitflips;
 }
 
 static int micron_nand_on_die_ecc_status_8(struct nand_chip *chip, u8 status)
@@ -243,16 +298,18 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
 	if (ret)
 		goto out;
 
-	if (chip->ecc.strength == 4)
-		max_bitflips = micron_nand_on_die_ecc_status_4(chip, status);
-	else
-		max_bitflips = micron_nand_on_die_ecc_status_8(chip, status);
-
 	ret = nand_read_data_op(chip, buf, mtd->writesize, false);
 	if (!ret && oob_required)
 		ret = nand_read_data_op(chip, chip->oob_poi, mtd->oobsize,
 					false);
 
+	if (chip->ecc.strength == 4)
+		max_bitflips = micron_nand_on_die_ecc_status_4(chip, status,
+							       buf, page,
+							       oob_required);
+	else
+		max_bitflips = micron_nand_on_die_ecc_status_8(chip, status);
+
 out:
 	micron_nand_on_die_ecc_setup(chip, false);
 
@@ -362,12 +419,19 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 static int micron_nand_init(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct micron_nand *micron;
 	int ondie;
 	int ret;
 
+	micron = kzalloc(sizeof(*micron), GFP_KERNEL);
+	if (!micron)
+		return -ENOMEM;
+
+	nand_set_manufacturer_data(chip, micron);
+
 	ret = micron_nand_onfi_init(chip);
 	if (ret)
-		return ret;
+		goto err_free_manuf_data;
 
 	if (mtd->writesize == 2048)
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
@@ -377,13 +441,33 @@ static int micron_nand_init(struct nand_chip *chip)
 	if (ondie == MICRON_ON_DIE_MANDATORY &&
 	    chip->ecc.mode != NAND_ECC_ON_DIE) {
 		pr_err("On-die ECC forcefully enabled, not supported\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_free_manuf_data;
 	}
 
 	if (chip->ecc.mode == NAND_ECC_ON_DIE) {
 		if (ondie == MICRON_ON_DIE_UNSUPPORTED) {
 			pr_err("On-die ECC selected but not supported\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_manuf_data;
+		}
+
+		/*
+		 * In case of 4bit on-die ECC, we need a buffer to store a
+		 * page dumped in raw mode so that we can compare its content
+		 * to the same page after ECC correction happened and extract
+		 * the real number of bitflips from this comparison.
+		 * That's not needed for 8-bit ECC, because the status expose
+		 * a better approximation of the number of bitflips in a page.
+		 */
+		if (chip->ecc_strength_ds == 4) {
+			micron->ecc.rawbuf = kmalloc(mtd->writesize +
+						     mtd->oobsize,
+						     GFP_KERNEL);
+			if (!micron->ecc.rawbuf) {
+				ret = -ENOMEM;
+				goto err_free_manuf_data;
+			}
 		}
 
 		if (chip->ecc_strength_ds == 4)
@@ -410,6 +494,20 @@ static int micron_nand_init(struct nand_chip *chip)
 	}
 
 	return 0;
+
+err_free_manuf_data:
+	kfree(micron->ecc.rawbuf);
+	kfree(micron);
+
+	return ret;
+}
+
+static void micron_nand_cleanup(struct nand_chip *chip)
+{
+	struct micron_nand *micron = nand_get_manufacturer_data(chip);
+
+	kfree(micron->ecc.rawbuf);
+	kfree(micron);
 }
 
 static void micron_fixup_onfi_param_page(struct nand_chip *chip,
@@ -426,5 +524,6 @@ static void micron_fixup_onfi_param_page(struct nand_chip *chip,
 
 const struct nand_manufacturer_ops micron_nand_manuf_ops = {
 	.init = micron_nand_init,
+	.cleanup = micron_nand_cleanup,
 	.fixup_onfi_param_page = micron_fixup_onfi_param_page,
 };
-- 
2.14.1
