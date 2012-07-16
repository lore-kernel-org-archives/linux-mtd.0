Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sqibq-0000vM-Sg
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 10:33:00 +0000
Received: by pbbrq13 with SMTP id rq13so11152222pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 03:32:54 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/6] mtd: s3c2410: Use module_platform_driver()
Date: Mon, 16 Jul 2012 16:02:22 +0530
Message-Id: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, dwmw2@infradead.org, David.Woodhouse@intel.com,
 ben-linux@fluff.org, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This makes the code simpler by eliminating module_init() and
module_exit().

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/s3c2410.c |   15 +--------------
 1 files changed, 1 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 91121f3..8f9267f 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -1134,20 +1134,7 @@ static struct platform_driver s3c24xx_nand_driver = {
 	},
 };
 
-static int __init s3c2410_nand_init(void)
-{
-	printk("S3C24XX NAND Driver, (c) 2004 Simtec Electronics\n");
-
-	return platform_driver_register(&s3c24xx_nand_driver);
-}
-
-static void __exit s3c2410_nand_exit(void)
-{
-	platform_driver_unregister(&s3c24xx_nand_driver);
-}
-
-module_init(s3c2410_nand_init);
-module_exit(s3c2410_nand_exit);
+module_platform_driver(s3c24xx_nand_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
-- 
1.7.4.1
