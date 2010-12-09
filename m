From: adrian.hunter@nokia.com (Adrian Hunter)
Date: Thu, 9 Dec 2010 12:56:24 +0200
Subject: [PATCH 6/7] OMAP2/3: OneNAND: add platform data callback for PM constraints
Message-ID: <mailman.59.1292242916.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Make it possible for boards to set PM constraints such as maximum wakeup
latency.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 arch/arm/plat-omap/include/plat/onenand.h |    8 ++++++++
 drivers/mtd/onenand/omap2.c               |   16 +++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-omap/include/plat/onenand.h b/arch/arm/plat-omap/include/plat/onenand.h
index affe87e..1d07119 100644
--- a/arch/arm/plat-omap/include/plat/onenand.h
+++ b/arch/arm/plat-omap/include/plat/onenand.h
@@ -15,12 +15,20 @@
 #define ONENAND_SYNC_READ	(1 << 0)
 #define ONENAND_SYNC_READWRITE	(1 << 1)
 
+enum {
+	ONENAND_PM_CONSTRAINT_OFF,
+	ONENAND_PM_CONSTRAINT_ERASING,
+	ONENAND_PM_CONSTRAINT_OTHER,
+};
+
 struct omap_onenand_platform_data {
 	int			cs;
 	int			gpio_irq;
 	struct mtd_partition	*parts;
 	int			nr_parts;
 	int                     (*onenand_setup)(void __iomem *, int freq);
+	void			(*set_pm_constraints)(struct device *dev,
+						      int on);
 	int			dma_channel;
 	u8			flags;
 	u8			regulator_can_sleep;
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index ac31f46..866b9f9 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -64,6 +64,7 @@ struct omap2_onenand {
 	int dma_channel;
 	int freq;
 	int (*setup)(void __iomem *base, int freq);
+	void (*set_pm_constraints)(struct device *dev, int on);
 	struct regulator *regulator;
 };
 
@@ -605,13 +606,21 @@ static void omap2_onenand_shutdown(struct platform_device *pdev)
 
 static int omap2_onenand_enable(struct mtd_info *mtd)
 {
-	int ret;
+	int ret, on;
 	struct omap2_onenand *c = container_of(mtd, struct omap2_onenand, mtd);
 
 	ret = regulator_enable(c->regulator);
 	if (ret != 0)
 		dev_err(&c->pdev->dev, "cant enable regulator\n");
 
+	if (c->set_pm_constraints) {
+		if (c->onenand.state == FL_ERASING)
+			on = ONENAND_PM_CONSTRAINT_ERASING;
+		else
+			on = ONENAND_PM_CONSTRAINT_OTHER;
+		c->set_pm_constraints(&c->pdev->dev, on);
+	}
+
 	return ret;
 }
 
@@ -620,6 +629,9 @@ static int omap2_onenand_disable(struct mtd_info *mtd)
 	int ret;
 	struct omap2_onenand *c = container_of(mtd, struct omap2_onenand, mtd);
 
+	if (c->set_pm_constraints)
+		c->set_pm_constraints(&c->pdev->dev, ONENAND_PM_CONSTRAINT_OFF);
+
 	ret = regulator_disable(c->regulator);
 	if (ret != 0)
 		dev_err(&c->pdev->dev, "cant disable regulator\n");
@@ -682,6 +694,8 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 		c->setup = pdata->onenand_setup;
 	}
 
+	c->set_pm_constraints = pdata->set_pm_constraints;
+
 	if (c->gpio_irq) {
 		if ((r = gpio_request(c->gpio_irq, "OneNAND irq")) < 0) {
 			dev_err(&pdev->dev,  "Failed to request GPIO%d for "
-- 
1.7.0.4
