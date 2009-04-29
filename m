From: mika.j.korhonen@gmail.com (Mika Korhonen)
Date: Wed, 29 Apr 2009 14:10:34 +0300
Subject: [PATCH] OMAP OneNAND: add missing __devexit_p wrappers
Message-ID: <mailman.1.1241413424.18153.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Fixes build in configurations where devexit functions get discarded

Signed-off-by: Mika Korhonen <mika.j.korhonen@gmail.com>
---
 drivers/mtd/onenand/omap2.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index f2e9de1..4882935 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -778,8 +778,8 @@ static int __devexit omap2_onenand_remove(struct platform_device *pdev)
 
 static struct platform_driver omap2_onenand_driver = {
 	.probe		= omap2_onenand_probe,
-	.remove		= omap2_onenand_remove,
-	.shutdown	= omap2_onenand_shutdown,
+	.remove		= __devexit_p(omap2_onenand_remove),
+	.shutdown	= __devexit_p(omap2_onenand_shutdown),
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.owner  = THIS_MODULE,
-- 
1.5.6.5


--------------060606050107020605040104--
