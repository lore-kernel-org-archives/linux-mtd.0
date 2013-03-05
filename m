Received: from mail-pb0-f44.google.com ([209.85.160.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCnfu-0008LB-0O
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 08:56:43 +0000
Received: by mail-pb0-f44.google.com with SMTP id wz12so4152101pbc.17
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2013 00:56:40 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 7/8] mtd: atmel_nand: Use module_platform_driver_probe macro
Date: Tue,  5 Mar 2013 14:15:52 +0530
Message-Id: <1362473153-23515-7-git-send-email-sachin.kamat@linaro.org>
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
 drivers/mtd/nand/atmel_nand.c |   15 +--------------
 1 files changed, 1 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index ffcbcca..2d23d29 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1737,20 +1737,7 @@ static struct platform_driver atmel_nand_driver = {
 	},
 };
 
-static int __init atmel_nand_init(void)
-{
-	return platform_driver_probe(&atmel_nand_driver, atmel_nand_probe);
-}
-
-
-static void __exit atmel_nand_exit(void)
-{
-	platform_driver_unregister(&atmel_nand_driver);
-}
-
-
-module_init(atmel_nand_init);
-module_exit(atmel_nand_exit);
+module_platform_driver_probe(atmel_nand_driver, atmel_nand_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Rick Bronson");
-- 
1.7.4.1
