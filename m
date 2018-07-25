Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiJu4-0000Kz-Tk
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 13:32:36 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>, Stefan Agner <stefan@agner.ch>,
 Lucas Stach <dev@lynxeye.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 11/17] mtd: rawnand: jz4740: convert driver to nand_scan()
Date: Wed, 25 Jul 2018 15:31:46 +0200
Message-Id: <20180725133152.30898-12-miquel.raynal@bootlin.com>
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
 drivers/mtd/nand/raw/jz4740_nand.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
index 09541608a45f..3816d56b0d01 100644
--- a/drivers/mtd/nand/raw/jz4740_nand.c
+++ b/drivers/mtd/nand/raw/jz4740_nand.c
@@ -309,7 +309,6 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
 			       size_t chipnr, uint8_t *nand_maf_id,
 			       uint8_t *nand_dev_id)
 {
-	struct jz_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	int ret;
 	char res_name[6];
 	uint32_t ctrl;
@@ -332,20 +331,10 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
 
 	if (chipnr == 0) {
 		/* Detect first chip. */
-		ret = nand_scan_ident(mtd, 1, NULL);
+		ret = nand_scan(mtd, 1);
 		if (ret)
 			goto notfound_id;
 
-		if (pdata && pdata->ident_callback)
-			pdata->ident_callback(pdev, mtd, &pdata->partitions,
-					      &pdata->num_partitions);
-
-		ret = nand_scan_tail(mtd);
-		if (ret) {
-			dev_err(&pdev->dev,  "Failed to scan NAND\n");
-			goto notfound_id;
-		}
-
 		/* Retrieve the IDs from the first chip. */
 		chip->select_chip(mtd, 0);
 
@@ -380,6 +369,24 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
 	return ret;
 }
 
+static int jz_nand_attach_chip(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct device *dev = mtd->dev.parent;
+	struct jz_nand_platform_data *pdata = dev_get_platdata(dev);
+	struct platform_device *pdev = to_platform_device(dev);
+
+	if (pdata && pdata->ident_callback)
+		pdata->ident_callback(pdev, mtd, &pdata->partitions,
+				      &pdata->num_partitions);
+
+	return 0;
+}
+
+static const struct nand_controller_ops jz_nand_controller_ops = {
+	.attach_chip = jz_nand_attach_chip,
+};
+
 static int jz_nand_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -423,6 +430,7 @@ static int jz_nand_probe(struct platform_device *pdev)
 	chip->chip_delay = 50;
 	chip->cmd_ctrl = jz_nand_cmd_ctrl;
 	chip->select_chip = jz_nand_select_chip;
+	chip->dummy_controller.ops = &jz_nand_controller_ops;
 
 	if (nand->busy_gpio)
 		chip->dev_ready = jz_nand_dev_ready;
-- 
2.14.1
