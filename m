Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOukk-0005gm-JA
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 17:51:15 +0000
From: John Crispin <blogic@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/4] OF: MTD: make plat_nand loadable from DT
Date: Mon, 30 Apr 2012 19:30:46 +0200
Message-Id: <1335807048-24032-2-git-send-email-blogic@openwrt.org>
In-Reply-To: <1335807048-24032-1-git-send-email-blogic@openwrt.org>
References: <1335807048-24032-1-git-send-email-blogic@openwrt.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch sets the of_match_table field inside plat_nand's platform_driver.
We also add a struct mtd_part_parser_data pointer to make sure of_part parsing
works.

If an arch wants to support plat_nand via DT it needs to setup the
platform_nand_data and hook it into the platform_device.

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: linux-mtd@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org
---
This patch should go upstream via MTD with the other 3 patches.

 drivers/mtd/nand/plat_nand.c |   21 +++++++++++++++------
 1 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 5856399..fd2d2a1 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -31,6 +31,7 @@ static const char *part_probe_types[] = { "cmdlinepart", NULL };
 static int __devinit plat_nand_probe(struct platform_device *pdev)
 {
 	struct platform_nand_data *pdata = pdev->dev.platform_data;
+	struct mtd_part_parser_data ppdata;
 	struct plat_nand_data *data;
 	struct resource *res;
 	const char **part_types;
@@ -103,7 +104,8 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 
 	part_types = pdata->chip.part_probe_types ? : part_probe_types;
 
-	err = mtd_device_parse_register(&data->mtd, part_types, NULL,
+	ppdata.of_node = pdev->dev.of_node;
+	err = mtd_device_parse_register(&data->mtd, part_types, &ppdata,
 					pdata->chip.partitions,
 					pdata->chip.nr_partitions);
 
@@ -144,12 +146,19 @@ static int __devexit plat_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id plat_nand_match[] = {
+	{ .compatible = "gen_nand" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, plat_nand_match);
+
 static struct platform_driver plat_nand_driver = {
-	.probe		= plat_nand_probe,
-	.remove		= __devexit_p(plat_nand_remove),
-	.driver		= {
-		.name	= "gen_nand",
-		.owner	= THIS_MODULE,
+	.probe	= plat_nand_probe,
+	.remove	= __devexit_p(plat_nand_remove),
+	.driver	= {
+		.name		= "gen_nand",
+		.owner		= THIS_MODULE,
+		.of_match_table = plat_nand_match,
 	},
 };
 
-- 
1.7.9.1
