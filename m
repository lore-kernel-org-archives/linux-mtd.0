Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiJu4-0000Ke-Tp
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 13:32:47 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>, Stefan Agner <stefan@agner.ch>,
 Lucas Stach <dev@lynxeye.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 06/17] mtd: rawnand: atmel: convert driver to nand_scan()
Date: Wed, 25 Jul 2018 15:31:41 +0200
Message-Id: <20180725133152.30898-7-miquel.raynal@bootlin.com>
In-Reply-To: <20180725133152.30898-1-miquel.raynal@bootlin.com>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Two helpers have been added to the core to do all kind of controller
side configuration/initialization between the detection phase and the
final NAND scan. Implement these hooks so that we can convert the driver
to just use nand_scan() instead of the nand_scan_ident() +
nand_scan_tail() pair.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 113 +++++++++++++--------------
 1 file changed, 54 insertions(+), 59 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 143d029710f0..a068b214ebaa 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -201,7 +201,7 @@ struct atmel_nand_controller_ops {
 	int (*remove)(struct atmel_nand_controller *nc);
 	void (*nand_init)(struct atmel_nand_controller *nc,
 			  struct atmel_nand *nand);
-	int (*ecc_init)(struct atmel_nand *nand);
+	int (*ecc_init)(struct nand_chip *chip);
 	int (*setup_data_interface)(struct atmel_nand *nand, int csline,
 				    const struct nand_data_interface *conf);
 };
@@ -1132,9 +1132,8 @@ static int atmel_nand_pmecc_init(struct nand_chip *chip)
 	return 0;
 }
 
-static int atmel_nand_ecc_init(struct atmel_nand *nand)
+static int atmel_nand_ecc_init(struct nand_chip *chip)
 {
-	struct nand_chip *chip = &nand->base;
 	struct atmel_nand_controller *nc;
 	int ret;
 
@@ -1169,12 +1168,11 @@ static int atmel_nand_ecc_init(struct atmel_nand *nand)
 	return 0;
 }
 
-static int atmel_hsmc_nand_ecc_init(struct atmel_nand *nand)
+static int atmel_hsmc_nand_ecc_init(struct nand_chip *chip)
 {
-	struct nand_chip *chip = &nand->base;
 	int ret;
 
-	ret = atmel_nand_ecc_init(nand);
+	ret = atmel_nand_ecc_init(chip);
 	if (ret)
 		return ret;
 
@@ -1557,22 +1555,6 @@ static void atmel_hsmc_nand_init(struct atmel_nand_controller *nc,
 	chip->select_chip = atmel_hsmc_nand_select_chip;
 }
 
-static int atmel_nand_detect(struct atmel_nand *nand)
-{
-	struct nand_chip *chip = &nand->base;
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct atmel_nand_controller *nc;
-	int ret;
-
-	nc = to_nand_controller(chip->controller);
-
-	ret = nand_scan_ident(mtd, nand->numcs, NULL);
-	if (ret)
-		dev_err(nc->dev, "nand_scan_ident() failed: %d\n", ret);
-
-	return ret;
-}
-
 static int atmel_nand_controller_remove_nand(struct atmel_nand *nand)
 {
 	struct nand_chip *chip = &nand->base;
@@ -1700,6 +1682,8 @@ static int
 atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 			       struct atmel_nand *nand)
 {
+	struct nand_chip *chip = &nand->base;
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int ret;
 
 	/* No card inserted, skip this NAND. */
@@ -1710,44 +1694,9 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 
 	nc->caps->ops->nand_init(nc, nand);
 
-	ret = atmel_nand_detect(nand);
-	if (ret)
-		return ret;
-
-	ret = nc->caps->ops->ecc_init(nand);
-	if (ret)
-		return ret;
-
-	if (nc->caps->legacy_of_bindings || !nc->dev->of_node) {
-		/*
-		 * We keep the MTD name unchanged to avoid breaking platforms
-		 * where the MTD cmdline parser is used and the bootloader
-		 * has not been updated to use the new naming scheme.
-		 */
-		mtd->name = "atmel_nand";
-	} else if (!mtd->name) {
-		/*
-		 * If the new bindings are used and the bootloader has not been
-		 * updated to pass a new mtdparts parameter on the cmdline, you
-		 * should define the following property in your nand node:
-		 *
-		 *	label = "atmel_nand";
-		 *
-		 * This way, mtd->name will be set by the core when
-		 * nand_set_flash_node() is called.
-		 */
-		mtd->name = devm_kasprintf(nc->dev, GFP_KERNEL,
-					   "%s:nand.%d", dev_name(nc->dev),
-					   nand->cs[0].id);
-		if (!mtd->name) {
-			dev_err(nc->dev, "Failed to allocate mtd->name\n");
-			return -ENOMEM;
-		}
-	}
-
-	ret = nand_scan_tail(mtd);
+	ret = nand_scan(mtd, nand->numcs);
 	if (ret) {
-		dev_err(nc->dev, "nand_scan_tail() failed: %d\n", ret);
+		dev_err(nc->dev, "NAND scan failed: %d\n", ret);
 		return ret;
 	}
 
@@ -1945,6 +1894,51 @@ static const struct of_device_id atmel_matrix_of_ids[] = {
 	{ /* sentinel */ },
 };
 
+static int atmel_nand_attach_chip(struct nand_chip *chip)
+{
+	struct atmel_nand_controller *nc = to_nand_controller(chip->controller);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
+
+	ret = nc->caps->ops->ecc_init(chip);
+	if (ret)
+		return ret;
+
+	if (nc->caps->legacy_of_bindings || !nc->dev->of_node) {
+		/*
+		 * We keep the MTD name unchanged to avoid breaking platforms
+		 * where the MTD cmdline parser is used and the bootloader
+		 * has not been updated to use the new naming scheme.
+		 */
+		mtd->name = "atmel_nand";
+	} else if (!mtd->name) {
+		/*
+		 * If the new bindings are used and the bootloader has not been
+		 * updated to pass a new mtdparts parameter on the cmdline, you
+		 * should define the following property in your nand node:
+		 *
+		 *	label = "atmel_nand";
+		 *
+		 * This way, mtd->name will be set by the core when
+		 * nand_set_flash_node() is called.
+		 */
+		mtd->name = devm_kasprintf(nc->dev, GFP_KERNEL,
+					   "%s:nand.%d", dev_name(nc->dev),
+					   nand->cs[0].id);
+		if (!mtd->name) {
+			dev_err(nc->dev, "Failed to allocate mtd->name\n");
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static const struct nand_controller_ops atmel_nand_controller_ops = {
+	.attach_chip = atmel_nand_attach_chip,
+};
+
 static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 				struct platform_device *pdev,
 				const struct atmel_nand_controller_caps *caps)
@@ -1954,6 +1948,7 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	int ret;
 
 	nand_controller_init(&nc->base);
+	nc->base.ops = &atmel_nand_controller_ops;
 	INIT_LIST_HEAD(&nc->chips);
 	nc->dev = dev;
 	nc->caps = caps;
-- 
2.14.1
