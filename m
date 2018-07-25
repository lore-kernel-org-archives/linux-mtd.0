Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiJu4-0000LI-Tl
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 13:32:42 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>, Stefan Agner <stefan@agner.ch>,
 Lucas Stach <dev@lynxeye.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 14/17] mtd: rawnand: txx9ndfmc: convert driver to
 nand_scan()
Date: Wed, 25 Jul 2018 15:31:49 +0200
Message-Id: <20180725133152.30898-15-miquel.raynal@bootlin.com>
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
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 9808b18b15e2..4d61a14fcb65 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -254,26 +254,25 @@ static void txx9ndfmc_initialize(struct platform_device *dev)
 #define TXX9NDFMC_NS_TO_CYC(gbusclk, ns) \
 	DIV_ROUND_UP((ns) * DIV_ROUND_UP(gbusclk, 1000), 1000000)
 
-static int txx9ndfmc_nand_scan(struct mtd_info *mtd)
+static int txx9ndfmc_attach_chip(struct nand_chip *chip)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	int ret;
+	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	ret = nand_scan_ident(mtd, 1, NULL);
-	if (!ret) {
-		if (mtd->writesize >= 512) {
-			chip->ecc.size = 512;
-			chip->ecc.bytes = 6;
-		} else {
-			chip->ecc.size = 256;
-			chip->ecc.bytes = 3;
-		}
-
-		ret = nand_scan_tail(mtd);
+	if (mtd->writesize >= 512) {
+		chip->ecc.size = 512;
+		chip->ecc.bytes = 6;
+	} else {
+		chip->ecc.size = 256;
+		chip->ecc.bytes = 3;
 	}
-	return ret;
+
+	return 0;
 }
 
+static const struct nand_controller_ops txx9ndfmc_controller_ops = {
+	.attach_chip = txx9ndfmc_attach_chip,
+};
+
 static int __init txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
@@ -307,6 +306,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
 	nand_controller_init(&drvdata->controller);
+	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
 	txx9ndfmc_initialize(dev);
@@ -359,7 +359,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		if (plat->wide_mask & (1 << i))
 			chip->options |= NAND_BUSWIDTH_16;
 
-		if (txx9ndfmc_nand_scan(mtd)) {
+		if (nand_scan(mtd, 1)) {
 			kfree(txx9_priv->mtdname);
 			kfree(txx9_priv);
 			continue;
-- 
2.14.1
