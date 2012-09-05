Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9Ghv-0001Zf-L9
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 14:35:56 +0000
Received: by ggnm2 with SMTP id m2so91196ggn.36
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2012 07:35:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: artem.bityutskiy@linux.intel.com
Subject: [PATCH 1/2] mtd: gpmi-nand: Convert to platform driver
Date: Wed,  5 Sep 2012 11:35:24 -0300
Message-Id: <1346855725-31726-1-git-send-email-festevam@gmail.com>
Cc: marex@denx.de, b32955@freescale.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Using module_platform_driver() makes the code smaller and cleaner.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
This patch depends on: "mtd: gpmi-nand: Improve logging style"

 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 9493507..5999b15 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1651,6 +1651,8 @@ static int __devinit gpmi_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_nfc_init;
 
+	dev_info(this->dev, "driver registered.\n");
+
 	return 0;
 
 exit_nfc_init:
@@ -1658,10 +1660,12 @@ exit_nfc_init:
 exit_acquire_resources:
 	platform_set_drvdata(pdev, NULL);
 	kfree(this);
+	dev_err(this->dev, "driver registration failed: %d\n", ret);
+
 	return ret;
 }
 
-static int __exit gpmi_nand_remove(struct platform_device *pdev)
+static int __devexit gpmi_nand_remove(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this = platform_get_drvdata(pdev);
 
@@ -1678,29 +1682,10 @@ static struct platform_driver gpmi_nand_driver = {
 		.of_match_table = gpmi_nand_id_table,
 	},
 	.probe   = gpmi_nand_probe,
-	.remove  = __exit_p(gpmi_nand_remove),
+	.remove  = __devexit_p(gpmi_nand_remove),
 	.id_table = gpmi_ids,
 };
-
-static int __init gpmi_nand_init(void)
-{
-	int err;
-
-	err = platform_driver_register(&gpmi_nand_driver);
-	if (err == 0)
-		pr_info("driver registered.\n");
-	else
-		pr_err("driver registration failed.\n");
-	return err;
-}
-
-static void __exit gpmi_nand_exit(void)
-{
-	platform_driver_unregister(&gpmi_nand_driver);
-}
-
-module_init(gpmi_nand_init);
-module_exit(gpmi_nand_exit);
+module_platform_driver(gpmi_nand_driver);
 
 MODULE_AUTHOR("Freescale Semiconductor, Inc.");
 MODULE_DESCRIPTION("i.MX GPMI NAND Flash Controller Driver");
-- 
1.7.9.5
