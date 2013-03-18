Received: from mail-pb0-f47.google.com ([209.85.160.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHYEN-0003PJ-Dm
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 11:27:57 +0000
Received: by mail-pb0-f47.google.com with SMTP id rp2so6346554pbb.34
 for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2013 04:27:51 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: bf5xx_nand: Use module_platform_driver()
Date: Mon, 18 Mar 2013 16:46:49 +0530
Message-Id: <1363605410-4530-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

module_platform_driver macro removes some boilerplate and makes
the code simpler.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/bf5xx_nand.c |   16 +---------------
 1 files changed, 1 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 4271e94..776df36 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -874,21 +874,7 @@ static struct platform_driver bf5xx_nand_driver = {
 	},
 };
 
-static int __init bf5xx_nand_init(void)
-{
-	printk(KERN_INFO "%s, Version %s (c) 2007 Analog Devices, Inc.\n",
-		DRV_DESC, DRV_VERSION);
-
-	return platform_driver_register(&bf5xx_nand_driver);
-}
-
-static void __exit bf5xx_nand_exit(void)
-{
-	platform_driver_unregister(&bf5xx_nand_driver);
-}
-
-module_init(bf5xx_nand_init);
-module_exit(bf5xx_nand_exit);
+module_platform_driver(bf5xx_nand_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR(DRV_AUTHOR);
-- 
1.7.4.1
