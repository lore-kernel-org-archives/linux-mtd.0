From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH 8/8] mtd: rawnand: mtk: Use generic helpers to calculate ecc
 size and strength
Date: Wed, 11 Apr 2018 11:41:58 +0800
Message-ID: <1523418118-57686-9-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1523418118-57686-1-git-send-email-xiaolei.li@mediatek.com>
References: <1523418118-57686-1-git-send-email-xiaolei.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An optional DT properity named nand-ecc-maximize is used to choose whether
maximize ecc strength or just match ecc strength required.

But MTK nand driver always maximize ecc strength now.

This patch uses generic helpers to calculate ecc size and strength
automatically according to nand-ecc-maximize setting.

Please remember to enable nand-ecc-maximize DT setting if want to be
compatible with older Bootloader base on this patch.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/raw/mtk_ecc.c  |  25 -------
 drivers/mtd/nand/raw/mtk_ecc.h  |   2 -
 drivers/mtd/nand/raw/mtk_nand.c | 152 ++++++++++++++++++++++++----------------
 3 files changed, 93 insertions(+), 86 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
index 71390e7..cd68157 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.c
+++ b/drivers/mtd/nand/raw/mtk_ecc.c
@@ -426,31 +426,6 @@ int mtk_ecc_encode(struct mtk_ecc *ecc, struct mtk_ecc_config *config,
 }
 EXPORT_SYMBOL(mtk_ecc_encode);
 
-void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p)
-{
-	const int *ecc_strength = ecc->caps->ecc_strength;
-	int i;
-
-	for (i = 0; i < ecc->caps->num_ecc_strength; i++) {
-		if (*p <= ecc_strength[i]) {
-			if (!i)
-				*p = ecc_strength[i];
-			else if (*p != ecc_strength[i])
-				*p = ecc_strength[i - 1];
-			return;
-		}
-	}
-
-	*p = ecc_strength[ecc->caps->num_ecc_strength - 1];
-}
-EXPORT_SYMBOL(mtk_ecc_adjust_strength);
-
-unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc)
-{
-	return ecc->caps->parity_bits;
-}
-EXPORT_SYMBOL(mtk_ecc_get_parity_bits);
-
 int mtk_ecc_get_strength_num(struct mtk_ecc *ecc)
 {
 	return ecc->caps->num_ecc_strength;
diff --git a/drivers/mtd/nand/raw/mtk_ecc.h b/drivers/mtd/nand/raw/mtk_ecc.h
index 5687864..e7f20f0 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.h
+++ b/drivers/mtd/nand/raw/mtk_ecc.h
@@ -40,8 +40,6 @@ struct mtk_ecc_config {
 int mtk_ecc_wait_done(struct mtk_ecc *, enum mtk_ecc_operation);
 int mtk_ecc_enable(struct mtk_ecc *, struct mtk_ecc_config *);
 void mtk_ecc_disable(struct mtk_ecc *);
-void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p);
-unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc);
 int mtk_ecc_get_strength_num(struct mtk_ecc *ecc);
 const int *mtk_ecc_get_strength(struct mtk_ecc *ecc);
 int mtk_ecc_calc_parity_bytes(struct mtk_ecc *ecc, int ecc_strength);
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 249b3fb..b535eee 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -157,6 +157,8 @@ struct mtk_nfc {
 	struct completion done;
 	struct list_head chips;
 
+	const struct nand_ecc_caps *ecccaps;
+
 	u8 *buffer;
 };
 
@@ -266,16 +268,6 @@ static inline u8 nfi_readb(struct mtk_nfc *nfc, u32 reg)
 	return readb_relaxed(nfc->regs + reg);
 }
 
-static int mtk_nfc_max_sector_size(struct mtk_nfc *nfc)
-{
-	int i, sector_size = 0;
-
-	for (i = 0; i < nfc->caps->num_sector_size; i++)
-		sector_size = max(sector_size, nfc->caps->sector_size[i]);
-
-	return sector_size;
-}
-
 static void mtk_nfc_hw_reset(struct mtk_nfc *nfc)
 {
 	struct device *dev = nfc->dev;
@@ -1171,14 +1163,15 @@ static void mtk_nfc_set_bad_mark_ctl(struct mtk_nfc_bad_mark_ctl *bm_ctl,
 	}
 }
 
-static int mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
+static int mtk_nfc_set_spare_per_sector(int ecc_size, u32 *sps,
+					struct mtd_info *mtd)
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct mtk_nfc *nfc = nand_get_controller_data(nand);
 	const u8 *spare = nfc->caps->spare_size;
 	u32 eccsteps, i, closest_spare = 0;
 
-	eccsteps = mtd->writesize / nand->ecc.size;
+	eccsteps = mtd->writesize / ecc_size;
 	*sps = mtd->oobsize / eccsteps;
 
 	if (nand->ecc.size == 1024)
@@ -1205,68 +1198,102 @@ static int mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
 
 static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
-	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(nand);
-	struct mtk_nfc *nfc = nand_get_controller_data(nand);
-	u32 spare;
-	int free, ret;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	const struct nand_ecc_caps *caps = nfc->ecccaps;
+	int tmp, oobavail, nsteps, ret;
 
 	/* support only ecc hw mode */
-	if (nand->ecc.mode != NAND_ECC_HW) {
+	if (ecc->mode != NAND_ECC_HW) {
 		dev_err(dev, "ecc.mode not supported\n");
 		return -EINVAL;
 	}
 
-	/* if optional dt settings not present */
-	if (!nand->ecc.size || !nand->ecc.strength) {
-		/* use datasheet requirements */
-		nand->ecc.strength = nand->ecc_strength_ds;
-		nand->ecc.size = nand->ecc_step_ds;
+	if (ecc->size && ecc->strength)
+		tmp = ecc->size;
+	else
+		tmp = chip->ecc_step_ds;
+	if (!tmp)
+		return -ENOTSUPP;
 
-		/*
-		 * align eccstrength and eccsize
-		 * this controller only supports 512 and 1024 sizes
-		 */
-		if (nand->ecc.size < 1024) {
-			if (mtd->writesize > 512 &&
-			    mtk_nfc_max_sector_size(nfc) > 512) {
-				nand->ecc.size = 1024;
-				nand->ecc.strength <<= 1;
-			} else {
-				nand->ecc.size = 512;
-			}
-		} else {
-			nand->ecc.size = 1024;
-		}
+	nsteps = mtd->writesize / tmp;
+	/* Adjust spare size per sector through required ecc size */
+	ret = mtk_nfc_set_spare_per_sector(tmp, &oobavail, mtd);
+	if (ret)
+		return ret;
+	oobavail -= mtk_nand->fdm.ecc_size;
+	oobavail *= nsteps;
+	if (ecc->size && ecc->strength)
+		ret = nand_check_ecc_caps(chip, caps, oobavail);
+	else
+		ret = nand_match_ecc_req(chip, caps, oobavail);
+	if (ret)
+		return ret;
 
-		ret = mtk_nfc_set_spare_per_sector(&spare, mtd);
+	if (ecc->options & NAND_ECC_MAXIMIZE) {
+		/* Maximize ecc strength */
+		ret = mtk_nfc_set_spare_per_sector(ecc->size, &oobavail,
+						   mtd);
 		if (ret)
 			return ret;
-
-		/* calculate oob bytes except ecc parity data */
-		free = mtk_ecc_calc_parity_bytes(nfc->ecc, nand->ecc.strength);
-		free = spare - free;
-
+		tmp = oobavail - caps->calc_ecc_bytes(ecc, ecc->size,
+						      ecc->strength);
 		/*
-		 * enhance ecc strength if oob left is bigger than max FDM size
-		 * or reduce ecc strength if oob size is not enough for ecc
-		 * parity data.
+		 * Only maximize ecc strength if free OOB size is more than
+		 * NFI_FDM_MAX_SIZE.
 		 */
-		if (free > NFI_FDM_MAX_SIZE) {
-			spare -= NFI_FDM_MAX_SIZE;
-			nand->ecc.strength = (spare << 3) /
-					     mtk_ecc_get_parity_bits(nfc->ecc);
-		} else if (free < 0) {
-			spare -= mtk_nand->fdm.ecc_size;
-			nand->ecc.strength = (spare << 3) /
-					     mtk_ecc_get_parity_bits(nfc->ecc);
+		if (tmp > NFI_FDM_MAX_SIZE) {
+			oobavail -= NFI_FDM_MAX_SIZE;
+			nsteps = mtd->writesize / ecc->size;
+			oobavail *= nsteps;
+			ret = nand_maximize_ecc(chip, caps, oobavail);
+			if (ret)
+				return ret;
 		}
 	}
 
-	mtk_ecc_adjust_strength(nfc->ecc, &nand->ecc.strength);
-
 	dev_info(dev, "eccsize %d eccstrength %d\n",
-		 nand->ecc.size, nand->ecc.strength);
+		 ecc->size, ecc->strength);
+
+	return 0;
+}
+
+static int mtk_nfc_calc_ecc_bytes(struct nand_ecc_ctrl *ecc, int step_size,
+				  int strength)
+{
+	struct mtk_ecc *mtkecc = (struct mtk_ecc *)ecc->priv;
+
+	return mtk_ecc_calc_parity_bytes(mtkecc, strength);
+}
+
+static int mtk_nfc_ecc_caps_init(struct device *dev, struct mtk_nfc *nfc)
+{
+	struct nand_ecc_caps *ecccaps;
+	struct nand_ecc_step_info *stepinfos;
+	int i, nsector = nfc->caps->num_sector_size;
+
+	ecccaps = devm_kzalloc(dev, sizeof(*ecccaps), GFP_KERNEL);
+	if (!ecccaps)
+		return -ENOMEM;
+
+	stepinfos = devm_kzalloc(dev, sizeof(*stepinfos) * nsector, GFP_KERNEL);
+	if (!stepinfos)
+		return -ENOMEM;
+
+	nfc->ecccaps = ecccaps;
+
+	ecccaps->stepinfos = stepinfos;
+	ecccaps->nstepinfos = nsector;
+	ecccaps->calc_ecc_bytes = mtk_nfc_calc_ecc_bytes;
+
+	for (i = 0; i < nsector; i++) {
+		stepinfos->stepsize = nfc->caps->sector_size[i];
+		stepinfos->strengths = mtk_ecc_get_strength(nfc->ecc);
+		stepinfos->nstrengths = mtk_ecc_get_strength_num(nfc->ecc);
+		stepinfos++;
+	}
 
 	return 0;
 }
@@ -1329,6 +1356,8 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	/* set default mode in case dt entry is missing */
 	nand->ecc.mode = NAND_ECC_HW;
 
+	nand->ecc.priv = (void *)nfc->ecc;
+
 	nand->ecc.write_subpage = mtk_nfc_write_subpage_hwecc;
 	nand->ecc.write_page_raw = mtk_nfc_write_page_raw;
 	nand->ecc.write_page = mtk_nfc_write_page_hwecc;
@@ -1366,7 +1395,8 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	ret = mtk_nfc_set_spare_per_sector(&chip->spare_per_sector, mtd);
+	ret = mtk_nfc_set_spare_per_sector(nand->ecc.size,
+					   &chip->spare_per_sector, mtd);
 	if (ret)
 		return ret;
 
@@ -1539,6 +1569,10 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, nfc);
 
+	ret = mtk_nfc_ecc_caps_init(dev, nfc);
+	if (ret)
+		goto clk_disable;
+
 	ret = mtk_nfc_nand_chips_init(dev, nfc);
 	if (ret) {
 		dev_err(dev, "failed to init nand chips\n");
-- 
1.9.1
