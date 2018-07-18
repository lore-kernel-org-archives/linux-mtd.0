Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffi2s-0000py-3B
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:42:54 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 7/7] mtd: rawnand: micron: Make ECC activation stateful
Date: Wed, 18 Jul 2018 10:42:21 +0200
Message-Id: <20180718084221.27821-7-boris.brezillon@bootlin.com>
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

We currently don't store the on-die ECC state (enabled/disabled) which
might force us to re-disable the engine even if it's already been
disabled after we've read the page in raw mode to count the actual
number of bitflips.

Add an "enabled" field to struct micron_on_die_ecc to keep track of the
ECC state.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/nand/raw/nand_micron.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 9d13b701e581..656947d91841 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -66,6 +66,7 @@ struct nand_onfi_vendor_micron {
 
 struct micron_on_die_ecc {
 	bool forced;
+	bool enabled;
 	void *rawbuf;
 };
 
@@ -174,14 +175,22 @@ static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
 {
 	struct micron_nand *micron = nand_get_manufacturer_data(chip);
 	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
+	int ret;
 
 	if (micron->ecc.forced)
 		return 0;
 
+	if (micron->ecc.enabled == enable)
+		return 0;
+
 	if (enable)
 		feature[0] |= ONFI_FEATURE_ON_DIE_ECC_EN;
 
-	return nand_set_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);
+	ret = nand_set_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);
+	if (!ret)
+		micron->ecc.enabled = enable;
+
+	return ret;
 }
 
 static int micron_nand_on_die_ecc_status_4(struct nand_chip *chip, u8 status,
@@ -457,8 +466,10 @@ static int micron_nand_init(struct nand_chip *chip)
 			goto err_free_manuf_data;
 		}
 
-		if (ondie == MICRON_ON_DIE_MANDATORY)
+		if (ondie == MICRON_ON_DIE_MANDATORY) {
 			micron->ecc.forced = true;
+			micron->ecc.enabled = true;
+		}
 
 		/*
 		 * In case of 4bit on-die ECC, we need a buffer to store a
-- 
2.14.1
