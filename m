Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPZlk-0006wA-Vy
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 15:48:07 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 3/4] mtd: nand: pxa3xx: Use ECC strength and step size
 devicetree binding
Date: Mon, 17 Mar 2014 12:47:06 -0300
Message-Id: <1395071227-31909-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1395071227-31909-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1395071227-31909-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Simon Guinot <sguinot@lacie.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds support for the user to specify the ECC strength
and step size throught the devicetree. We keep the previous behavior,
if there's no DT parameter passed.

Also, if there is an ONFI-specified minimum ECC strength requirement,
and the devicetree specified ECC strength is weaker, print a warning
and try to select the ONFI-specified strength.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c                | 47 +++++++++++++++++++--------
 include/linux/platform_data/mtd-nand-pxa3xx.h |  3 ++
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 092a17c..a4499e6 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1344,8 +1344,30 @@ static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
 }
 
 static int pxa_ecc_init(struct pxa3xx_nand_info *info,
-			struct nand_ecc_ctrl *ecc, int strength, int page_size)
+			struct nand_chip *chip,
+			struct pxa3xx_nand_platform_data *pdata,
+			unsigned int page_size)
 {
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	unsigned int strength, onfi_strength;
+
+	/* We need to normalize the ECC strengths, in order to compare them. */
+	strength = (pdata->ecc_strength * pdata->ecc_step_size) / 512;
+	onfi_strength = (chip->ecc_strength_ds * chip->ecc_step_ds) / 512;
+
+	/*
+	 * The user requested ECC strength cannot be weaker than the ONFI
+	 * minimum specified ECC strength.
+	 */
+	if (strength && strength < onfi_strength) {
+		dev_warn(&info->pdev->dev,
+			 "requested ECC strength is too weak\n");
+		strength = onfi_strength;
+	}
+
+	if (!strength)
+		strength = onfi_strength ? onfi_strength : 1;
+
 	if (strength == 1 && page_size == 2048) {
 		info->chunk_size = 2048;
 		info->spare_size = 40;
@@ -1375,7 +1397,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->size = info->chunk_size;
 		ecc->layout = &ecc_layout_2KB_bch4bit;
 		ecc->strength = 16;
-		return 1;
 
 	} else if (strength == 4 && page_size == 4096) {
 		info->ecc_bch = 1;
@@ -1424,7 +1445,6 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	uint32_t id = -1;
 	uint64_t chipsize;
 	int i, ret, num;
-	uint16_t ecc_strength, ecc_step;
 
 	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
 		goto KEEP_CONFIG;
@@ -1519,17 +1539,8 @@ KEEP_CONFIG:
 		}
 	}
 
-	ecc_strength = chip->ecc_strength_ds;
-	ecc_step = chip->ecc_step_ds;
-
-	/* Set default ECC strength requirements on non-ONFI devices */
-	if (ecc_strength < 1 && ecc_step < 1) {
-		ecc_strength = 1;
-		ecc_step = 512;
-	}
-
-	ret = pxa_ecc_init(info, &chip->ecc, (ecc_strength * ecc_step) / 512,
-			   mtd->writesize);
+	/* Selects an ECC and fills pxa3xx_nand_info and nand_chip */
+	ret = pxa_ecc_init(info, chip, pdata, mtd->writesize);
 	if (ret)
 		return ret;
 
@@ -1729,6 +1740,14 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 	of_property_read_u32(np, "num-cs", &pdata->num_cs);
 	pdata->flash_bbt = of_get_nand_on_flash_bbt(np);
 
+	pdata->ecc_strength = of_get_nand_ecc_strength(np);
+	if (pdata->ecc_strength < 0)
+		pdata->ecc_strength = 0;
+
+	pdata->ecc_step_size = of_get_nand_ecc_step_size(np);
+	if (pdata->ecc_step_size < 0)
+		pdata->ecc_step_size = 0;
+
 	pdev->dev.platform_data = pdata;
 
 	return 0;
diff --git a/include/linux/platform_data/mtd-nand-pxa3xx.h b/include/linux/platform_data/mtd-nand-pxa3xx.h
index a941471..5c0f2e3 100644
--- a/include/linux/platform_data/mtd-nand-pxa3xx.h
+++ b/include/linux/platform_data/mtd-nand-pxa3xx.h
@@ -58,6 +58,9 @@ struct pxa3xx_nand_platform_data {
 	/* use an flash-based bad block table */
 	bool	flash_bbt;
 
+	/* requested ECC strength and ECC step size */
+	unsigned int ecc_strength, ecc_step_size;
+
 	const struct mtd_partition		*parts[NUM_CHIP_SELECT];
 	unsigned int				nr_parts[NUM_CHIP_SELECT];
 
-- 
1.9.0
