Received: from mail-pb0-f42.google.com ([209.85.160.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCnfl-0008Hk-1Q
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 08:56:35 +0000
Received: by mail-pb0-f42.google.com with SMTP id xb4so4145460pbc.29
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2013 00:56:31 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/8] mtd: fsmc_nand: Use module_platform_driver_probe macro
Date: Tue,  5 Mar 2013 14:15:49 +0530
Message-Id: <1362473153-23515-4-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1362473153-23515-1-git-send-email-sachin.kamat@linaro.org>
References: <1362473153-23515-1-git-send-email-sachin.kamat@linaro.org>
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

module_platform_driver_probe() eliminates the boilerplate and simplifies
the code.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/fsmc_nand.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 05ba3f0..911e243 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1235,18 +1235,7 @@ static struct platform_driver fsmc_nand_driver = {
 	},
 };
 
-static int __init fsmc_nand_init(void)
-{
-	return platform_driver_probe(&fsmc_nand_driver,
-				     fsmc_nand_probe);
-}
-module_init(fsmc_nand_init);
-
-static void __exit fsmc_nand_exit(void)
-{
-	platform_driver_unregister(&fsmc_nand_driver);
-}
-module_exit(fsmc_nand_exit);
+module_platform_driver_probe(fsmc_nand_driver, fsmc_nand_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vipin Kumar <vipin.kumar@st.com>, Ashish Priyadarshi");
-- 
1.7.4.1
