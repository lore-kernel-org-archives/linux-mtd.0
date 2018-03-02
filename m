From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Josh Wu <rainyfeeling@outlook.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Stefan Agner <stefan@agner.ch>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 50/52] mtd: rawnand: jz4740: convert driver to nand_scan()
Date: Fri,  2 Mar 2018 18:03:58 +0100
Message-Id: <20180302170400.6712-51-miquel.raynal@bootlin.com>
In-Reply-To: <20180302170400.6712-1-miquel.raynal@bootlin.com>
References: <20180302170400.6712-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Two helpers have been added to the core to make ECC-related
configuration between the detection phase and the final NAND scan. Use
these hooks and convert the driver to just use nand_scan() instead of
both nand_scan_ident() and nand_scan_tail().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/jz4740_nand.c | 42 +++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
index 613b00a9604b..740145fd9ff2 100644
--- a/drivers/mtd/nand/raw/jz4740_nand.c
+++ b/drivers/mtd/nand/raw/jz4740_nand.c
@@ -59,6 +59,7 @@
 
 struct jz_nand {
 	struct nand_chip chip;
+	struct platform_device *pdev;
 	void __iomem *base;
 	struct resource *mem;
 
@@ -329,8 +330,8 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
 	writel(ctrl, nand->base + JZ_REG_NAND_CTRL);
 
 	if (chipnr == 0) {
-		/* Detect first chip. */
-		ret = nand_scan_ident(mtd, 1, NULL);
+		/* Detect the first chip and register it */
+		ret = nand_scan(mtd, 1);
 		if (ret)
 			goto notfound_id;
 
@@ -367,6 +368,21 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
 	return ret;
 }
 
+static int jz_nand_attach_chip(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct jz_nand *nand = mtd_to_jz_nand(mtd);
+	struct device *dev = mtd->dev.parent;
+	struct jz_nand_platform_data *pdata = dev_get_platdata(dev);
+
+	if (pdata && pdata->ident_callback) {
+		pdata->ident_callback(nand->pdev, mtd, &pdata->partitions,
+				      &pdata->num_partitions);
+	}
+
+	return 0;
+}
+
 static int jz_nand_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -397,6 +413,7 @@ static int jz_nand_probe(struct platform_device *pdev)
 	mtd		= nand_to_mtd(chip);
 	mtd->dev.parent = &pdev->dev;
 	mtd->name	= "jz4740-nand";
+	nand->pdev	= pdev;
 
 	chip->ecc.hwctl		= jz_nand_hwctl;
 	chip->ecc.calculate	= jz_nand_calculate_ecc_rs;
@@ -406,6 +423,7 @@ static int jz_nand_probe(struct platform_device *pdev)
 	chip->ecc.bytes		= 9;
 	chip->ecc.strength	= 4;
 	chip->ecc.options	= NAND_ECC_GENERIC_ERASED_CHECK;
+	chip->ecc.attach_chip	= jz_nand_attach_chip;
 
 	chip->chip_delay = 50;
 	chip->cmd_ctrl = jz_nand_cmd_ctrl;
@@ -450,20 +468,10 @@ static int jz_nand_probe(struct platform_device *pdev)
 		else
 			nand->banks[chipnr] = 0;
 	}
+
 	if (chipnr == 0) {
 		dev_err(&pdev->dev, "No NAND chips found\n");
-		goto err_iounmap_mmio;
-	}
-
-	if (pdata && pdata->ident_callback) {
-		pdata->ident_callback(pdev, mtd, &pdata->partitions,
-					&pdata->num_partitions);
-	}
-
-	ret = nand_scan_tail(mtd);
-	if (ret) {
-		dev_err(&pdev->dev,  "Failed to scan NAND\n");
-		goto err_unclaim_banks;
+		goto err_nand_release;
 	}
 
 	ret = mtd_device_parse_register(mtd, NULL, NULL,
@@ -472,15 +480,13 @@ static int jz_nand_probe(struct platform_device *pdev)
 
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add mtd device\n");
-		goto err_nand_release;
+		goto err_unclaim_banks;
 	}
 
 	dev_info(&pdev->dev, "Successfully registered JZ4740 NAND driver\n");
 
 	return 0;
 
-err_nand_release:
-	nand_release(mtd);
 err_unclaim_banks:
 	while (chipnr--) {
 		unsigned char bank = nand->banks[chipnr];
@@ -488,6 +494,8 @@ static int jz_nand_probe(struct platform_device *pdev)
 					 nand->bank_base[bank - 1]);
 	}
 	writel(0, nand->base + JZ_REG_NAND_CTRL);
+err_nand_release:
+	nand_release(mtd);
 err_iounmap_mmio:
 	jz_nand_iounmap_resource(nand->mem, nand->base);
 err_free:
-- 
2.14.1
