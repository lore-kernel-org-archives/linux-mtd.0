Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcdPt-00045N-1u
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 21:09:55 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 "Bean Huo (beanhuo)" <beanhuo@micron.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 2/2] mtd: rawnand: micron: Fix on-die ECC detection logic
Date: Mon,  9 Jul 2018 23:09:37 +0200
Message-Id: <20180709210937.30150-3-boris.brezillon@bootlin.com>
In-Reply-To: <20180709210937.30150-1-boris.brezillon@bootlin.com>
References: <20180709210937.30150-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Basing the "mandatory on-die" detection on ID byte 2 does not work,
because Micron has plenty of NANDs using the same device ID code, and
not all of them have forcibly enabled on-die ECC.

Since the "Array Operation" feature does not provide the "ECC
enabled/disabled" bit when the ECC can't be disabled, let's try to use
the "ECC enabled/disabled" bit in the READ_ID bytes.

It seems that this bit is dynamically updated on NANDs where on-die ECC
can freely be enabled/disabled, so let's hope it stays at one when we
have a NAND with on-die ECC forcibly enabled.

Fixes: 51f3b3970a8c ("mtd: rawnand: micron: detect forced on-die ECC")
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_micron.c | 51 +++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 00a965ad7ab2..6ae708fbbd3a 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -345,13 +345,8 @@ enum {
 	MICRON_ON_DIE_MANDATORY,
 };
 
-/*
- * These parts are known to have on-die ECC forceably enabled
- */
-static u8 micron_on_die_ecc[] = {
-	0xd1, /* MT29F1G08ABAFA */
-	0xa1, /* MT29F1G08ABBFA */
-};
+#define MICRON_ID_INTERNAL_ECC_MASK	GENMASK(1, 0)
+#define MICRON_ID_ECC_ENABLED		BIT(7)
 
 /*
  * Try to detect if the NAND support on-die ECC. To do this, we enable
@@ -366,12 +361,8 @@ static u8 micron_on_die_ecc[] = {
 static int micron_supports_on_die_ecc(struct nand_chip *chip)
 {
 	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
+	u8 id[5];
 	int ret;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(micron_on_die_ecc); i++)
-		if (chip->id.data[1] == micron_on_die_ecc[i])
-			return MICRON_ON_DIE_MANDATORY;
 
 	if (!chip->parameters.onfi.version)
 		return MICRON_ON_DIE_UNSUPPORTED;
@@ -379,34 +370,42 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	if (chip->bits_per_cell != 1)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
+	/*
+	 * We only support on-die ECC of 4/512 or 8/512
+	 */
+	if  (chip->ecc_strength_ds != 4 && chip->ecc_strength_ds != 8)
+		return MICRON_ON_DIE_UNSUPPORTED;
+
+	/*
+	 * We don't know what INTERNAL_ECC means, but it seems that 0x2 matches
+	 * all NANDs with on-die ECC.
+	 */
+	if (chip->id.len != 5 ||
+	    (chip->id.data[4] & MICRON_ID_INTERNAL_ECC_MASK) != 0x2)
+		return MICRON_ON_DIE_UNSUPPORTED;
+
 	ret = micron_nand_on_die_ecc_setup(chip, true);
 	if (ret)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
-	ret = nand_get_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);
-	if (ret < 0)
-		return ret;
+	ret = nand_readid_op(chip, 0, id, sizeof(id));
+	if (ret)
+		return MICRON_ON_DIE_UNSUPPORTED;
 
-	if ((feature[0] & ONFI_FEATURE_ON_DIE_ECC_EN) == 0)
+	if (!(id[4] & MICRON_ID_ECC_ENABLED))
 		return MICRON_ON_DIE_UNSUPPORTED;
 
 	ret = micron_nand_on_die_ecc_setup(chip, false);
 	if (ret)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
-	ret = nand_get_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);
-	if (ret < 0)
-		return ret;
+	ret = nand_readid_op(chip, 0, id, sizeof(id));
+	if (ret)
+		return MICRON_ON_DIE_UNSUPPORTED;
 
-	if (feature[0] & ONFI_FEATURE_ON_DIE_ECC_EN)
+	if (id[4] & MICRON_ID_ECC_ENABLED)
 		return MICRON_ON_DIE_MANDATORY;
 
-	/*
-	 * We only support on-die ECC of 4/512 or 8/512
-	 */
-	if  (chip->ecc_strength_ds != 4 && chip->ecc_strength_ds != 8)
-		return MICRON_ON_DIE_UNSUPPORTED;
-
 	return MICRON_ON_DIE_SUPPORTED;
 }
 
-- 
2.14.1
