Received: from mail-pb0-f53.google.com ([209.85.160.53])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHYEP-0003QE-Aa
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 11:27:59 +0000
Received: by mail-pb0-f53.google.com with SMTP id un1so6302695pbc.26
 for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2013 04:27:54 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: omap2: Use module_platform_driver()
Date: Mon, 18 Mar 2013 16:46:50 +0530
Message-Id: <1363605410-4530-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1363605410-4530-1-git-send-email-sachin.kamat@linaro.org>
References: <1363605410-4530-1-git-send-email-sachin.kamat@linaro.org>
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

module_platform_driver macro removes some boilerplate and makes the
code simpler.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/onenand/omap2.c |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index eec2aed..d98b198 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -832,19 +832,7 @@ static struct platform_driver omap2_onenand_driver = {
 	},
 };
 
-static int __init omap2_onenand_init(void)
-{
-	printk(KERN_INFO "OneNAND driver initializing\n");
-	return platform_driver_register(&omap2_onenand_driver);
-}
-
-static void __exit omap2_onenand_exit(void)
-{
-	platform_driver_unregister(&omap2_onenand_driver);
-}
-
-module_init(omap2_onenand_init);
-module_exit(omap2_onenand_exit);
+module_platform_driver(omap2_onenand_driver);
 
 MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_LICENSE("GPL");
-- 
1.7.4.1
