Received: from mail-ea0-x229.google.com ([2a00:1450:4013:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHXDa-00083m-6s
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 11:27:35 +0000
Received: by mail-ea0-f169.google.com with SMTP id d10so1286874eaj.14
 for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2014 03:27:12 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC 2/3] mtd: bcm47xxnflash: add separated config for platform driver
Date: Sun, 23 Feb 2014 12:26:58 +0100
Message-Id: <1393154819-7369-3-git-send-email-zajec5@gmail.com>
In-Reply-To: <1393154819-7369-1-git-send-email-zajec5@gmail.com>
References: <1393154819-7369-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Adding support for new NANDs requires registering as BCMA driver, so we
will need separated configs.
---
 drivers/mtd/nand/Kconfig                | 18 +++++++++++++-----
 drivers/mtd/nand/bcm47xxnflash/Makefile |  2 +-
 drivers/mtd/nand/bcm47xxnflash/main.c   | 12 +++++++++++-
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index a5bb738..a3e8ad2 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -390,12 +390,20 @@ config MTD_NAND_GPMI_NAND
 	 the GPMI.
 
 config MTD_NAND_BCM47XXNFLASH
-	tristate "Support for NAND flash on BCM4706 BCMA bus"
-	depends on BCMA_NFLASH
+	tristate "Support for NAND flash memories on BCMA bus"
+	depends on BCMA
 	help
-	  BCMA bus can have various flash memories attached, they are
-	  registered by bcma as platform devices. This enables driver for
-	  NAND flash memories. For now only BCM4706 is supported.
+	  BCMA bus can have various flash memories attached including
+	  NAND type. Depending on SoC version they can be attached to
+	  the ChipCommon core or available as separated device.
+
+config MTD_NAND_BCM47XXNFLASH_PLATFORM
+	bool "NAND attached to the ChipCommon core"
+	depends on MTD_NAND_BCM47XXNFLASH && BCMA_NFLASH
+	help
+	  Such flashes were probably used on MIPS based SoCs only. The
+	  most common was BCM4706, but it rarely could be also found on
+	  BCM5357.
 
 config MTD_NAND_PLATFORM
 	tristate "Support for generic platform NAND driver"
diff --git a/drivers/mtd/nand/bcm47xxnflash/Makefile b/drivers/mtd/nand/bcm47xxnflash/Makefile
index f05b119..4e755f0 100644
--- a/drivers/mtd/nand/bcm47xxnflash/Makefile
+++ b/drivers/mtd/nand/bcm47xxnflash/Makefile
@@ -1,4 +1,4 @@
 bcm47xxnflash-y				+= main.o
-bcm47xxnflash-y				+= ops_bcm4706.o
+bcm47xxnflash-$(CONFIG_MTD_NAND_BCM47XXNFLASH_PLATFORM)	+= ops_bcm4706.o
 
 obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash.o
diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index 52611ef..c9d9b3f 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -21,6 +21,7 @@ MODULE_DESCRIPTION("NAND flash driver for BCMA bus");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Rafał Miłecki");
 
+#if IS_ENABLED(CONFIG_MTD_NAND_BCM47XXNFLASH_PLATFORM)
 static const char *probes[] = { "bcm47xxpart", NULL };
 
 static int bcm47xxnflash_probe(struct platform_device *pdev)
@@ -76,22 +77,31 @@ static struct platform_driver bcm47xxnflash_driver = {
 		.owner = THIS_MODULE,
 	},
 };
+#endif
+
+/**************************************************
+ * Init & exit
+ **************************************************/
 
 static int __init bcm47xxnflash_init(void)
 {
-	int err;
+	int err = 0;
 
+#if IS_ENABLED(CONFIG_MTD_NAND_BCM47XXNFLASH_PLATFORM)
 	err = platform_driver_register(&bcm47xxnflash_driver);
 	if (err)
 		pr_err("Failed to register bcm47xx nand flash driver: %d\n",
 		       err);
+#endif
 
 	return err;
 }
 
 static void __exit bcm47xxnflash_exit(void)
 {
+#if IS_ENABLED(CONFIG_MTD_NAND_BCM47XXNFLASH_PLATFORM)
 	platform_driver_unregister(&bcm47xxnflash_driver);
+#endif
 }
 
 module_init(bcm47xxnflash_init);
-- 
1.8.4.5
