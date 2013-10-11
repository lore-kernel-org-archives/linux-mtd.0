Received: from mail-pa0-f53.google.com ([209.85.220.53])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUUe3-0004Wu-K0
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 04:48:12 +0000
Received: by mail-pa0-f53.google.com with SMTP id kq14so3781980pab.26
 for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2013 21:47:47 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd: plat-ram: Use module_platform_driver
Date: Fri, 11 Oct 2013 10:11:23 +0530
Message-Id: <1381466485-7534-1-git-send-email-sachin.kamat@linaro.org>
Cc: computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com,
 zajec5@gmail.com, dwmw2@infradead.org, sachin.kamat@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

module_platform_driver simplifies the code by removing boiler
plate.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/maps/plat-ram.c |   16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 3e35b9a..10196f5 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -257,21 +257,7 @@ static struct platform_driver platram_driver = {
 	},
 };
 
-/* module init/exit */
-
-static int __init platram_init(void)
-{
-	printk("Generic platform RAM MTD, (c) 2004 Simtec Electronics\n");
-	return platform_driver_register(&platram_driver);
-}
-
-static void __exit platram_exit(void)
-{
-	platform_driver_unregister(&platram_driver);
-}
-
-module_init(platram_init);
-module_exit(platram_exit);
+module_platform_driver(platram_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
-- 
1.7.9.5
