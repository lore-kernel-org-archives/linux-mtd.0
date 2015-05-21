Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvOwF-0003S8-5s
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 11:47:00 +0000
Received: by wicmc15 with SMTP id mc15so10272678wic.1
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 04:46:36 -0700 (PDT)
From: Tomas Hlavacek <tmshlvck@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH v2] mtd: fsl_elbc_nand Add ECC mode selection in DT
Date: Thu, 21 May 2015 13:46:31 +0200
Message-Id: <1432208791-20734-1-git-send-email-tmshlvck@gmail.com>
In-Reply-To: <20150507231530.GT32500@ld-irv-0074>
References: <20150507231530.GT32500@ld-irv-0074>
Cc: scottwood@freescale.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add device tree pointer to chip structure in order to allow turn off the
HW ECC and force own ECC mode and ECC parameters. Newly supported entries
are as per documentation: nand-ecc-mode, nand-ecc-step-size
and nand-ecc-strength.

Add RNDOUT operation which is required for SOFT and SOFT_BCH modes.

Do not set write_subpage function pointer from the driver when it
initializes in SOFT and SOFT_BCH modes.

Signed-off-by: Tomas Hlavacek <tmshlvck@gmail.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 04b22fd..b6cdda6 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -335,6 +335,14 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		fsl_elbc_run_command(mtd);
 		return;
 
+	case NAND_CMD_RNDOUT:
+		dev_vdbg(priv->dev,
+			"fsl_elbc_cmdfunc: NAND_CMD_RNDOUT, column: 0x%x.\n",
+			column);
+
+		elbc_fcm_ctrl->index = column;
+		return;
+
 	/* READOOB reads only the OOB because no ECC is performed. */
 	case NAND_CMD_READOOB:
 		dev_vdbg(priv->dev,
@@ -656,6 +664,10 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 	        chip->ecc.steps);
 	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.bytes = %d\n",
 	        chip->ecc.bytes);
+	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.size = %d\n",
+		chip->ecc.size);
+	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.strength = %d\n",
+		chip->ecc.strength);
 	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.total = %d\n",
 	        chip->ecc.total);
 	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.layout = %p\n",
@@ -677,8 +689,8 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 		priv->page_size = 1;
 		setbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
 		/* adjust ecc setup if needed */
-		if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
-		    BR_DECC_CHK_GEN) {
+		if (((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
+		    BR_DECC_CHK_GEN) && (chip->ecc.mode == NAND_ECC_HW)) {
 			chip->ecc.size = 512;
 			chip->ecc.layout = (priv->fmr & FMR_ECCM) ?
 			                   &fsl_elbc_oob_lp_eccm1 :
@@ -742,6 +754,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = ctrl->nand;
 	struct nand_chip *chip = &priv->chip;
+	struct device_node *node = priv->dev->of_node;
 
 	dev_dbg(priv->dev, "eLBC Set Information for bank %d\n", priv->bank);
 
@@ -749,6 +762,9 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	priv->mtd.priv = chip;
 	priv->mtd.owner = THIS_MODULE;
 
+	/* Fill in OF node */
+	chip->dn = node;
+
 	/* set timeout to maximum */
 	priv->fmr = 15 << FMR_CWTO_SHIFT;
 	if (in_be32(&lbc->bank[priv->bank].or) & OR_FCM_PGS)
@@ -774,7 +790,6 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 
 	chip->ecc.read_page = fsl_elbc_read_page;
 	chip->ecc.write_page = fsl_elbc_write_page;
-	chip->ecc.write_subpage = fsl_elbc_write_subpage;
 
 	/* If CS Base Register selects full hardware ECC then use it */
 	if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
@@ -786,6 +801,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 		chip->ecc.size = 512;
 		chip->ecc.bytes = 3;
 		chip->ecc.strength = 1;
+		chip->ecc.write_subpage = fsl_elbc_write_subpage;
 	} else {
 		/* otherwise fall back to default software ECC */
 		chip->ecc.mode = NAND_ECC_SOFT;
-- 
2.1.4
