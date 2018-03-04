Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esZtl-00083L-6e
 for linux-mtd@lists.infradead.org; Sun, 04 Mar 2018 20:06:23 +0000
From: Stefan Agner <stefan@agner.ch>
To: han.xu@nxp.com,
	boris.brezillon@free-electrons.com
Cc: marek.vasut@gmail.com, richard@nod.at, dwmw2@infradead.org,
 cyrille.pitchen@wedev4u.fr, max.oss.09@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 1/2] mtd: rawnand: gpmi: add support for specific ECC
 strength
Date: Sun,  4 Mar 2018 21:06:01 +0100
Message-Id: <20180304200602.11475-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for specified ECC strength/size using device tree
properties nand-ecc-strength/nand-ecc-step-size.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 61fdd733492f..d04754289c03 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -198,17 +198,16 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
  *
  * We may have available oob space in this case.
  */
-static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
+static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
+				    unsigned int ecc_strength,
+				    unsigned int ecc_step)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
 	struct nand_chip *chip = &this->nand;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	unsigned int block_mark_bit_offset;
 
-	if (!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0))
-		return -EINVAL;
-
-	switch (chip->ecc_step_ds) {
+	switch (ecc_step) {
 	case SZ_512:
 		geo->gf_len = 13;
 		break;
@@ -221,8 +220,8 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 			chip->ecc_strength_ds, chip->ecc_step_ds);
 		return -EINVAL;
 	}
-	geo->ecc_chunk_size = chip->ecc_step_ds;
-	geo->ecc_strength = round_up(chip->ecc_strength_ds, 2);
+	geo->ecc_chunk_size = ecc_step;
+	geo->ecc_strength = round_up(ecc_strength, 2);
 	if (!gpmi_check_ecc(this))
 		return -EINVAL;
 
@@ -230,7 +229,7 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 	if (geo->ecc_chunk_size < mtd->oobsize) {
 		dev_err(this->dev,
 			"unsupported nand chip. ecc size: %d, oob size : %d\n",
-			chip->ecc_step_ds, mtd->oobsize);
+			ecc_step, mtd->oobsize);
 		return -EINVAL;
 	}
 
@@ -423,9 +422,20 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 
 int common_nfc_set_geometry(struct gpmi_nand_data *this)
 {
+	struct nand_chip *chip = &this->nand;
+
+	if (chip->ecc.strength > 0 && chip->ecc.size > 0)
+		return set_geometry_by_ecc_info(this, chip->ecc.strength,
+						chip->ecc.size);
+
 	if ((of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
-				|| legacy_set_geometry(this))
-		return set_geometry_by_ecc_info(this);
+				|| legacy_set_geometry(this)) {
+		if (!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0))
+			return -EINVAL;
+
+		return set_geometry_by_ecc_info(this, chip->ecc_strength_ds,
+						chip->ecc_step_ds);
+	}
 
 	return 0;
 }
-- 
2.16.2
