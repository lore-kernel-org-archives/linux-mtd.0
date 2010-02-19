From: adrian.hunter@nokia.com (Adrian Hunter)
Date: Fri, 19 Feb 2010 15:39:53 +0100
Subject: [PATCH 3/7] mtd: OneNAND: OMAP2/3: prevent regulator sleeping while OneNAND is in use
Message-ID: <mailman.55.1292242890.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Prevent OneNAND's voltage regulator from going to sleep while
OneNAND is in use, by explicitly enabling and disabling the
regulator as appropriate.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 arch/arm/plat-omap/include/plat/onenand.h |    1 +
 drivers/mtd/onenand/omap2.c               |   41 ++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-omap/include/plat/onenand.h b/arch/arm/plat-omap/include/plat/onenand.h
index 72f433d..affe87e 100644
--- a/arch/arm/plat-omap/include/plat/onenand.h
+++ b/arch/arm/plat-omap/include/plat/onenand.h
@@ -23,6 +23,7 @@ struct omap_onenand_platform_data {
 	int                     (*onenand_setup)(void __iomem *, int freq);
 	int			dma_channel;
 	u8			flags;
+	u8			regulator_can_sleep;
 };
 
 #define ONENAND_MAX_PARTITIONS 8
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 324402f..1a07bfc 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -35,6 +35,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/regulator/consumer.h>
 
 #include <asm/mach/flash.h>
 #include <plat/gpmc.h>
@@ -63,6 +64,7 @@ struct omap2_onenand {
 	int dma_channel;
 	int freq;
 	int (*setup)(void __iomem *base, int freq);
+	struct regulator *regulator;
 };
 
 #ifdef CONFIG_MTD_PARTITIONS
@@ -601,6 +603,30 @@ static void omap2_onenand_shutdown(struct platform_device *pdev)
 	memset((__force void *)c->onenand.base, 0, ONENAND_BUFRAM_SIZE);
 }
 
+static int omap2_onenand_enable(struct mtd_info *mtd)
+{
+	int ret;
+	struct omap2_onenand *c = container_of(mtd, struct omap2_onenand, mtd);
+
+	ret = regulator_enable(c->regulator);
+	if (ret != 0)
+		dev_err(&c->pdev->dev, "cant enable regulator\n");
+
+	return ret;
+}
+
+static int omap2_onenand_disable(struct mtd_info *mtd)
+{
+	int ret;
+	struct omap2_onenand *c = container_of(mtd, struct omap2_onenand, mtd);
+
+	ret = regulator_disable(c->regulator);
+	if (ret != 0)
+		dev_err(&c->pdev->dev, "cant disable regulator\n");
+
+	return ret;
+}
+
 static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 {
 	struct omap_onenand_platform_data *pdata;
@@ -715,8 +741,18 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (pdata->regulator_can_sleep) {
+		c->regulator = regulator_get(&pdev->dev, "vonenand");
+		if (IS_ERR(c->regulator)) {
+			dev_err(&pdev->dev,  "Failed to get regulator\n");
+			goto err_release_dma;
+		}
+		c->onenand.enable = omap2_onenand_enable;
+		c->onenand.disable = omap2_onenand_disable;
+	}
+
 	if ((r = onenand_scan(&c->mtd, 1)) < 0)
-		goto err_release_dma;
+		goto err_release_regulator;
 
 	switch ((c->onenand.version_id >> 4) & 0xf) {
 	case 0:
@@ -751,6 +787,8 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 
 err_release_onenand:
 	onenand_release(&c->mtd);
+err_release_regulator:
+	regulator_put(c->regulator);
 err_release_dma:
 	if (c->dma_channel != -1)
 		omap_free_dma(c->dma_channel);
@@ -777,6 +815,7 @@ static int __devexit omap2_onenand_remove(struct platform_device *pdev)
 	struct omap2_onenand *c = dev_get_drvdata(&pdev->dev);
 
 	onenand_release(&c->mtd);
+	regulator_put(c->regulator);
 	if (c->dma_channel != -1)
 		omap_free_dma(c->dma_channel);
 	omap2_onenand_shutdown(pdev);
-- 
1.7.0.4
