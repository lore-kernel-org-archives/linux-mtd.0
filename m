Received: from mail-pa0-f42.google.com ([209.85.220.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTTl5-0000Bg-Ji
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2013 09:39:17 +0000
Received: by mail-pa0-f42.google.com with SMTP id lj1so8703787pab.29
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2013 02:38:53 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: fsl_ifc_nand: Use module_platform_driver
Date: Tue,  8 Oct 2013 15:08:20 +0530
Message-Id: <1381225100-19693-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1381225100-19693-1-git-send-email-sachin.kamat@linaro.org>
References: <1381225100-19693-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

module_platform_driver removes boiler plate code and makes it
simpler.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/fsl_ifc_nand.c |   20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 64a30ef..1c173d9 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -1079,25 +1079,7 @@ static struct platform_driver fsl_ifc_nand_driver = {
 	.remove      = fsl_ifc_nand_remove,
 };
 
-static int __init fsl_ifc_nand_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&fsl_ifc_nand_driver);
-	if (ret)
-		printk(KERN_ERR "fsl-ifc: Failed to register platform"
-				"driver\n");
-
-	return ret;
-}
-
-static void __exit fsl_ifc_nand_exit(void)
-{
-	platform_driver_unregister(&fsl_ifc_nand_driver);
-}
-
-module_init(fsl_ifc_nand_init);
-module_exit(fsl_ifc_nand_exit);
+module_platform_driver(fsl_ifc_nand_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Freescale");
-- 
1.7.9.5
