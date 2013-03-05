Received: from mail-pb0-f46.google.com ([209.85.160.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCnfq-0008K4-Ov
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 08:56:39 +0000
Received: by mail-pb0-f46.google.com with SMTP id uo15so4137548pbc.33
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2013 00:56:37 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/8] mtd: davinci_nand: Use module_platform_driver_probe macro
Date: Tue,  5 Mar 2013 14:15:51 +0530
Message-Id: <1362473153-23515-6-git-send-email-sachin.kamat@linaro.org>
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
 drivers/mtd/nand/davinci_nand.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 94e17af..864717b 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -883,17 +883,7 @@ static struct platform_driver nand_davinci_driver = {
 };
 MODULE_ALIAS("platform:davinci_nand");
 
-static int __init nand_davinci_init(void)
-{
-	return platform_driver_probe(&nand_davinci_driver, nand_davinci_probe);
-}
-module_init(nand_davinci_init);
-
-static void __exit nand_davinci_exit(void)
-{
-	platform_driver_unregister(&nand_davinci_driver);
-}
-module_exit(nand_davinci_exit);
+module_platform_driver_probe(nand_davinci_driver, nand_davinci_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Texas Instruments");
-- 
1.7.4.1
