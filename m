Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmpX3-00077e-C7
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 19:17:02 +0000
Received: by mail-ig0-f180.google.com with SMTP id c1so1174387igq.1
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 12:16:39 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: bf5xx_nand: drop no-op PM support
Date: Tue, 20 May 2014 12:16:26 -0700
Message-Id: <1400613386-8502-1-git-send-email-computersforpeace@gmail.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>,
 Brian Norris <computersforpeace@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Mike Frysinger <vapier.adi@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver's suspend/resume hooks are no-ops, so just remove them.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>
---
 drivers/mtd/nand/bf5xx_nand.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index b7a24946ca26..47121d28015d 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -835,34 +835,10 @@ out_err_kzalloc:
 	return err;
 }
 
-/* PM Support */
-#ifdef CONFIG_PM
-
-static int bf5xx_nand_suspend(struct platform_device *dev, pm_message_t pm)
-{
-	struct bf5xx_nand_info *info = platform_get_drvdata(dev);
-
-	return 0;
-}
-
-static int bf5xx_nand_resume(struct platform_device *dev)
-{
-	struct bf5xx_nand_info *info = platform_get_drvdata(dev);
-
-	return 0;
-}
-
-#else
-#define bf5xx_nand_suspend NULL
-#define bf5xx_nand_resume NULL
-#endif
-
 /* driver device registration */
 static struct platform_driver bf5xx_nand_driver = {
 	.probe		= bf5xx_nand_probe,
 	.remove		= bf5xx_nand_remove,
-	.suspend	= bf5xx_nand_suspend,
-	.resume		= bf5xx_nand_resume,
 	.driver		= {
 		.name	= DRV_NAME,
 		.owner	= THIS_MODULE,
-- 
1.8.3.2
