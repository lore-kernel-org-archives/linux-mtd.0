Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9CT8-0007nm-CT
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 10:04:25 +0000
Received: by dajq27 with SMTP id q27so253915daj.36
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2012 03:04:19 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?q?=5BPATCH=5D=20mtd=3A=20nand/gpio=3A=20Use=20module=5Fplatform=5Fdriver=20macro?=
Date: Wed,  5 Sep 2012 15:31:32 +0530
Message-Id: <1346839292-31001-1-git-send-email-sachin.kamat@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 patches@linaro.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

module_platform_driver simplifies the code by eliminating
module_init and module_exit calls.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/gpio.c |   15 +--------------
 1 files changed, 1 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index ce6a284..bc73bc5 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -417,20 +417,7 @@ static struct platform_driver gpio_nand_driver = {
 	},
 };
 
-static int __init gpio_nand_init(void)
-{
-	printk(KERN_INFO "GPIO NAND driver, © 2004 Simtec Electronics\n");
-
-	return platform_driver_register(&gpio_nand_driver);
-}
-
-static void __exit gpio_nand_exit(void)
-{
-	platform_driver_unregister(&gpio_nand_driver);
-}
-
-module_init(gpio_nand_init);
-module_exit(gpio_nand_exit);
+module_platform_driver(gpio_nand_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
-- 
1.7.4.1
