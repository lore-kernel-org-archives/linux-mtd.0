Received: from mail-pb0-f42.google.com ([209.85.160.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCnfe-0008Fg-AW
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 08:56:27 +0000
Received: by mail-pb0-f42.google.com with SMTP id xb4so4145452pbc.15
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2013 00:56:22 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/8] mtd: txx9ndfmc: Use module_platform_driver_probe macro
Date: Tue,  5 Mar 2013 14:15:46 +0530
Message-Id: <1362473153-23515-1-git-send-email-sachin.kamat@linaro.org>
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
 drivers/mtd/nand/txx9ndfmc.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index e1e8748..7ed654c 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -427,18 +427,7 @@ static struct platform_driver txx9ndfmc_driver = {
 	},
 };
 
-static int __init txx9ndfmc_init(void)
-{
-	return platform_driver_probe(&txx9ndfmc_driver, txx9ndfmc_probe);
-}
-
-static void __exit txx9ndfmc_exit(void)
-{
-	platform_driver_unregister(&txx9ndfmc_driver);
-}
-
-module_init(txx9ndfmc_init);
-module_exit(txx9ndfmc_exit);
+module_platform_driver_probe(txx9ndfmc_driver, txx9ndfmc_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TXx9 SoC NAND flash controller driver");
-- 
1.7.4.1
