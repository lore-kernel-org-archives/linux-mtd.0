Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHWjv-0005pG-1w
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 09:52:23 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa12so6333050pbc.36
 for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2013 02:52:19 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] mtd: denali_dt: Use module_platform_driver()
Date: Mon, 18 Mar 2013 15:11:12 +0530
Message-Id: <1363599674-26933-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1363599674-26933-1-git-send-email-sachin.kamat@linaro.org>
References: <1363599674-26933-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 dwmw2@infradead.org, dinguyen@altera.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

module_platform_driver() removes some boilerplate and makes the code
simpler.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/denali_dt.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 02988b0..eb68979 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -150,17 +150,7 @@ static struct platform_driver denali_dt_driver = {
 	},
 };
 
-static int __init denali_init_dt(void)
-{
-	return platform_driver_register(&denali_dt_driver);
-}
-module_init(denali_init_dt);
-
-static void __exit denali_exit_dt(void)
-{
-	platform_driver_unregister(&denali_dt_driver);
-}
-module_exit(denali_exit_dt);
+module_platform_driver(denali_dt_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jamie Iles");
-- 
1.7.4.1
