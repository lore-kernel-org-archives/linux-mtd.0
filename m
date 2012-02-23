Received: from nbd.name ([46.4.11.11])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S0bO9-0008A5-Ej
 for linux-mtd@lists.infradead.org; Thu, 23 Feb 2012 16:19:25 +0000
From: John Crispin <blogic@openwrt.org>
To: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH V2 1/3] MTD: MIPS: lantiq: use module_platform_driver inside
 lantiq map driver
Date: Thu, 23 Feb 2012 17:03:42 +0100
Message-Id: <1330013024-13622-1-git-send-email-blogic@openwrt.org>
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reduce boilerplate code by converting driver to module_platform_driver.

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/maps/lantiq-flash.c |   22 +++-------------------
 1 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 7b889de..395ebfe 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -107,7 +107,7 @@ ltq_copy_to(struct map_info *map, unsigned long to,
 	spin_unlock_irqrestore(&ebu_lock, flags);
 }
 
-static int __init
+static int __devinit
 ltq_mtd_probe(struct platform_device *pdev)
 {
 	struct physmap_flash_data *ltq_mtd_data = dev_get_platdata(&pdev->dev);
@@ -203,6 +203,7 @@ ltq_mtd_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver ltq_mtd_driver = {
+	.probe = ltq_mtd_probe,
 	.remove = __devexit_p(ltq_mtd_remove),
 	.driver = {
 		.name = "ltq_nor",
@@ -210,24 +211,7 @@ static struct platform_driver ltq_mtd_driver = {
 	},
 };
 
-static int __init
-init_ltq_mtd(void)
-{
-	int ret = platform_driver_probe(&ltq_mtd_driver, ltq_mtd_probe);
-
-	if (ret)
-		pr_err("ltq_nor: error registering platform driver");
-	return ret;
-}
-
-static void __exit
-exit_ltq_mtd(void)
-{
-	platform_driver_unregister(&ltq_mtd_driver);
-}
-
-module_init(init_ltq_mtd);
-module_exit(exit_ltq_mtd);
+module_platform_driver(ltq_mtd_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("John Crispin <blogic@openwrt.org>");
-- 
1.7.7.1
