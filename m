Received: from mail-pb0-f47.google.com ([209.85.160.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUUYe-0004RN-AI
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 04:42:37 +0000
Received: by mail-pb0-f47.google.com with SMTP id rr4so3625935pbb.34
 for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2013 21:42:12 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: bcm47xxnflash: Use module_platform_driver
Date: Fri, 11 Oct 2013 10:11:24 +0530
Message-Id: <1381466485-7534-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1381466485-7534-1-git-send-email-sachin.kamat@linaro.org>
References: <1381466485-7534-1-git-send-email-sachin.kamat@linaro.org>
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

module_platform_driver simplifies the code by removing boiler plate.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/bcm47xxnflash/main.c |   20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index 7bae569..2dc3aa6 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -85,22 +85,4 @@ static struct platform_driver bcm47xxnflash_driver = {
 	},
 };
 
-static int __init bcm47xxnflash_init(void)
-{
-	int err;
-
-	err = platform_driver_register(&bcm47xxnflash_driver);
-	if (err)
-		pr_err("Failed to register bcm47xx nand flash driver: %d\n",
-		       err);
-
-	return err;
-}
-
-static void __exit bcm47xxnflash_exit(void)
-{
-	platform_driver_unregister(&bcm47xxnflash_driver);
-}
-
-module_init(bcm47xxnflash_init);
-module_exit(bcm47xxnflash_exit);
+module_platform_driver(bcm47xxnflash_driver);
-- 
1.7.9.5
