Received: from mail.nic.cz ([2001:1488:800:400::400])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dW3RO-0001vv-08
 for linux-mtd@lists.infradead.org; Fri, 14 Jul 2017 16:27:44 +0000
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To: linux-mtd@lists.infradead.org
Cc: Tomas Hlavacek <tomas.hlavacek@nic.cz>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH] mtd: fsl_elbc_nanc: Add SOFT_BCH ECC mode selection via DT
Date: Fri, 14 Jul 2017 18:26:35 +0200
Message-Id: <20170714162635.1802-1-marek.behun@nic.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add RNDOUT operation which is required for SOFT and SOFT_BCH modes.

Restructure the code so that nand_scan_tail can correctly set
parameters for SOFT_BCH ECC mode.

Do not set read/write page operations from the driver when in SOFT
or SOFT_BCH modes.

This code is based on the patch by Tomas Hlavacek, which can be
found at
http://lists.infradead.org/pipermail/linux-mtd/2015-May/059365.html

Signed-off-by: Marek Behun <marek.behun@nic.cz>
---
 drivers/mtd/nand/fsl_elbc_nand.c | 132 ++++++++++++++++++++++++---------------
 1 file changed, 82 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index b9ac16f05057..1df4a3b45642 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -355,6 +355,14 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		fsl_elbc_run_command(mtd);
 		return;
 
+	case NAND_CMD_RNDOUT:
+		dev_vdbg(priv->dev,
+			  "fsl_elbc_cmdfunc: NAND_CMD_RNDOUT, column: 0x%x.\n",
+			  column);
+
+		elbc_fcm_ctrl->index = column;
+		return;
+
 	/* READOOB reads only the OOB because no ECC is performed. */
 	case NAND_CMD_READOOB:
 		dev_vdbg(priv->dev,
@@ -637,22 +645,10 @@ static int fsl_elbc_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	return (elbc_fcm_ctrl->mdr & 0xff) | NAND_STATUS_WP;
 }
 
-static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
+static inline void fsl_elbc_chip_init_dbg(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct fsl_elbc_mtd *priv = nand_get_controller_data(chip);
-	struct fsl_lbc_ctrl *ctrl = priv->ctrl;
-	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
-	unsigned int al;
-
-	/* calculate FMR Address Length field */
-	al = 0;
-	if (chip->pagemask & 0xffff0000)
-		al++;
-	if (chip->pagemask & 0xff000000)
-		al++;
-
-	priv->fmr |= al << FMR_AL_SHIFT;
 
 	dev_dbg(priv->dev, "fsl_elbc_init: nand->numchips = %d\n",
 	        chip->numchips);
@@ -688,22 +684,6 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 	        mtd->writesize);
 	dev_dbg(priv->dev, "fsl_elbc_init: mtd->oobsize = %d\n",
 	        mtd->oobsize);
-
-	/* adjust Option Register and ECC to match Flash page size */
-	if (mtd->writesize == 512) {
-		priv->page_size = 0;
-		clrbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
-	} else if (mtd->writesize == 2048) {
-		priv->page_size = 1;
-		setbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
-	} else {
-		dev_err(priv->dev,
-		        "fsl_elbc_init: page size %d is not supported\n",
-		        mtd->writesize);
-		return -1;
-	}
-
-	return 0;
 }
 
 static int fsl_elbc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
@@ -748,6 +728,34 @@ static int fsl_elbc_write_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
+static int fsl_elbc_ecc_init(struct fsl_elbc_mtd *priv)
+{
+	struct nand_chip *chip = &priv->chip;
+
+	switch (chip->ecc.mode) {
+	case NAND_ECC_SOFT_BCH:
+		break;
+	case NAND_ECC_SOFT:
+		chip->ecc.algo = NAND_ECC_HAMMING;
+		break;
+	case NAND_ECC_HW:
+		chip->ecc.read_page = fsl_elbc_read_page;
+		chip->ecc.write_page = fsl_elbc_write_page;
+		chip->ecc.write_subpage = fsl_elbc_write_subpage;
+
+		/* put in small page settings and adjust later if needed */
+		mtd_set_ooblayout(mtd, &fsl_elbc_ooblayout_ops);
+		chip->ecc.size = 512;
+		chip->ecc.bytes = 3;
+		chip->ecc.strength = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 {
 	struct fsl_lbc_ctrl *ctrl = priv->ctrl;
@@ -755,6 +763,8 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = ctrl->nand;
 	struct nand_chip *chip = &priv->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
+	unsigned int al;
 
 	dev_dbg(priv->dev, "eLBC Set Information for bank %d\n", priv->bank);
 
@@ -787,24 +797,58 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	chip->controller = &elbc_fcm_ctrl->controller;
 	nand_set_controller_data(chip, priv);
 
-	chip->ecc.read_page = fsl_elbc_read_page;
-	chip->ecc.write_page = fsl_elbc_write_page;
-	chip->ecc.write_subpage = fsl_elbc_write_subpage;
-
 	/* If CS Base Register selects full hardware ECC then use it */
 	if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
 	    BR_DECC_CHK_GEN) {
 		chip->ecc.mode = NAND_ECC_HW;
-		mtd_set_ooblayout(mtd, &fsl_elbc_ooblayout_ops);
-		chip->ecc.size = 512;
-		chip->ecc.bytes = 3;
-		chip->ecc.strength = 1;
 	} else {
 		/* otherwise fall back to default software ECC */
 		chip->ecc.mode = NAND_ECC_SOFT;
-		chip->ecc.algo = NAND_ECC_HAMMING;
 	}
 
+	ret = nand_scan_ident(mtd, 1, NULL);
+	if (ret) {
+		dev_err(priv->dev, "nand_scan_ident failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = fsl_elbc_ecc_init(priv);
+	if (ret) {
+		dev_err(priv->dev, "ECC init failed: %d\n", ret);
+		return ret;
+	}
+
+	/* calculate FMR Address Length field */
+	al = 0;
+	if (chip->pagemask & 0xffff0000)
+		al++;
+	if (chip->pagemask & 0xff000000)
+		al++;
+
+	priv->fmr |= al << FMR_AL_SHIFT;
+
+	/* adjust Option Register and ECC to match Flash page size */
+	if (mtd->writesize == 512) {
+		priv->page_size = 0;
+		clrbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
+	} else if (mtd->writesize == 2048) {
+		priv->page_size = 1;
+		setbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
+	} else {
+		dev_err(priv->dev,
+		        "fsl_elbc_init: page size %d is not supported\n",
+		        mtd->writesize);
+		return -1;
+	}
+
+	ret = nand_scan_tail(mtd);
+	if (ret) {
+		dev_err(priv->dev, "nand_scan_tail failed: %d\n", ret);
+		return ret;
+	}
+
+	fsl_elbc_chip_init_dbg(mtd);
+
 	return 0;
 }
 
@@ -912,18 +956,6 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
-	ret = nand_scan_ident(mtd, 1, NULL);
-	if (ret)
-		goto err;
-
-	ret = fsl_elbc_chip_init_tail(mtd);
-	if (ret)
-		goto err;
-
-	ret = nand_scan_tail(mtd);
-	if (ret)
-		goto err;
-
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	mtd_device_parse_register(mtd, part_probe_types, NULL,
-- 
2.13.0
