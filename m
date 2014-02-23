Received: from mail-ea0-x22b.google.com ([2a00:1450:4013:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHXKg-0008C7-Bo
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 11:34:55 +0000
Received: by mail-ea0-f171.google.com with SMTP id f15so2505759eak.30
 for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2014 03:34:32 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC 3/3] mtd: bcm47xxnflash: prepare for adding BCMA driver
Date: Sun, 23 Feb 2014 12:34:26 +0100
Message-Id: <1393155266-7610-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 drivers/mtd/nand/Kconfig              |  7 +++++
 drivers/mtd/nand/bcm47xxnflash/main.c | 56 +++++++++++++++++++++++++++++++++--
 2 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index a3e8ad2..fecde1e 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -405,6 +405,13 @@ config MTD_NAND_BCM47XXNFLASH_PLATFORM
 	  most common was BCM4706, but it rarely could be also found on
 	  BCM5357.
 
+config MTD_NAND_BCM47XXNFLASH_BCMA
+	bool "NAND attached to BCMA as standalone core"
+	depends on MTD_NAND_BCM47XXNFLASH && BROKEN
+	help
+	  New SoCs (most probably only these ARM based) have NAND
+	  flash as separated bus core.
+
 config MTD_NAND_PLATFORM
 	tristate "Support for generic platform NAND driver"
 	depends on HAS_IOMEM
diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index c9d9b3f..aebe2d5 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -80,6 +80,36 @@ static struct platform_driver bcm47xxnflash_driver = {
 #endif
 
 /**************************************************
+ * BCMA
+ **************************************************/
+
+#if IS_ENABLED(CONFIG_MTD_NAND_BCM47XXNFLASH_BCMA)
+static const struct bcma_device_id bcm47xxnflash_bcma_tbl[] = {
+	BCMA_CORE(BCMA_MANUF_BCM, BCMA_CORE_NAND, BCMA_ANY_REV, BCMA_ANY_CLASS),
+	BCMA_CORETABLE_END
+};
+MODULE_DEVICE_TABLE(bcma, bcm47xxnflash_bcma_tbl);
+
+static int bcm47xxnflash_bcma_probe(struct bcma_device *core)
+{
+	pr_info("Device ID: 0x%08X\n", bcma_read32(core, 0x194));
+
+	return -ENOTSUPP;
+}
+
+static void bcm47xxnflash_bcma_remove(struct bcma_device *core)
+{
+}
+
+static struct bcma_driver bcm47xxnflash_bcma_driver = {
+	.name		= KBUILD_MODNAME,
+	.id_table	= bcm47xxnflash_bcma_tbl,
+	.probe		= bcm47xxnflash_bcma_probe,
+	.remove		= bcm47xxnflash_bcma_remove,
+};
+#endif
+
+/**************************************************
  * Init & exit
  **************************************************/
 
@@ -89,16 +119,36 @@ static int __init bcm47xxnflash_init(void)
 
 #if IS_ENABLED(CONFIG_MTD_NAND_BCM47XXNFLASH_PLATFORM)
 	err = platform_driver_register(&bcm47xxnflash_driver);
-	if (err)
-		pr_err("Failed to register bcm47xx nand flash driver: %d\n",
-		       err);
+	if (err) {
+		pr_err("Failed to register platform driver: %d\n", err);
+		return err;
+	}
+#endif
+
+#if IS_ENABLED(CONFIG_MTD_NAND_BCM47XXNFLASH_BCMA)
+	err = bcma_driver_register(&bcm47xxnflash_bcma_driver);
+	if (err) {
+		pr_err("Failed to register bcma driver: %d\n", err);
+		goto err_plat_unregister;
+	}
 #endif
 
+	return 0;
+
+#if IS_ENABLED(CONFIG_MTD_NAND_BCM47XXNFLASH_BCMA)
+err_plat_unregister:
+#endif
+#if IS_ENABLED(CONFIG_MTD_NAND_BCM47XXNFLASH_PLATFORM)
+	platform_driver_unregister(&bcm47xxnflash_driver);
+#endif
 	return err;
 }
 
 static void __exit bcm47xxnflash_exit(void)
 {
+#if IS_ENABLED(CONFIG_MTD_NAND_BCM47XXNFLASH_BCMA)
+	bcma_driver_unregister(&bcm47xxnflash_bcma_driver);
+#endif
 #if IS_ENABLED(CONFIG_MTD_NAND_BCM47XXNFLASH_PLATFORM)
 	platform_driver_unregister(&bcm47xxnflash_driver);
 #endif
-- 
1.8.4.5
