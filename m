Received: from mail-ee0-f53.google.com ([74.125.83.53])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TxxEq-0002CW-2U
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2013 10:07:24 +0000
Received: by mail-ee0-f53.google.com with SMTP id e53so3845031eek.12
 for <linux-mtd@lists.infradead.org>; Wed, 23 Jan 2013 02:07:14 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH] mtd: bcm47xxpflash: add driver for parallel flash on BCM47xx
Date: Wed, 23 Jan 2013 11:07:06 +0100
Message-Id: <1358935626-10974-1-git-send-email-zajec5@gmail.com>
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

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/maps/Kconfig         |   18 ++++
 drivers/mtd/maps/Makefile        |    1 +
 drivers/mtd/maps/bcm47xxpflash.c |  163 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 182 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/maps/bcm47xxpflash.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 62ba82c..515c3db 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -501,4 +501,22 @@ config MTD_LATCH_ADDR
 
           If compiled as a module, it will be called latch-addr-flash.
 
+config MTD_BCM47XXPFLASH
+	tristate "Broadcom buses (SSB and BCMA) parallel flash support"
+	depends on MTD_COMPLEX_MAPPINGS && (SSB_DRIVER_MIPS || BCMA_DRIVER_MIPS)
+	help
+	  Broadcom SSB and BCMA buses can have various flash memories attached,
+	  especially on SoCs. They are registered by as platform devices by ssb
+	  and bcma modules. This enables driver for parallel flash memories.
+
+config MTD_BCM47XXPFLASH_SSB
+	bool
+	depends on MTD_BCM47XXPFLASH && SSB_DRIVER_MIPS
+	default y
+
+config MTD_BCM47XXPFLASH_BCMA
+	bool
+	depends on MTD_BCM47XXPFLASH && BCMA_DRIVER_MIPS
+	default y
+
 endmenu
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 4ded287..3871c0c 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -54,3 +54,4 @@ obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
 obj-$(CONFIG_MTD_GPIO_ADDR)	+= gpio-addr-flash.o
 obj-$(CONFIG_MTD_LATCH_ADDR)	+= latch-addr-flash.o
 obj-$(CONFIG_MTD_LANTIQ)	+= lantiq-flash.o
+obj-$(CONFIG_MTD_BCM47XXPFLASH)	+= bcm47xxpflash.o
diff --git a/drivers/mtd/maps/bcm47xxpflash.c b/drivers/mtd/maps/bcm47xxpflash.c
new file mode 100644
index 0000000..e394ab9
--- /dev/null
+++ b/drivers/mtd/maps/bcm47xxpflash.c
@@ -0,0 +1,163 @@
+/*
+ * Parallel flash driver for SSB and BCMA buses
+ *
+ * Copyright © 2013 Rafał Miłecki <zajec5@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/platform_device.h>
+#include <linux/ssb/ssb_driver_mips.h>
+#include <linux/bcma/bcma_driver_chipcommon.h>
+
+static struct mtd_info *bcm47xxpflash_mtd;
+
+static struct map_info bcm47xxpflash_map = {
+	.name =		"Parallel flash",
+};
+
+static const char *probes[] = { "bcm47xxpart", NULL };
+
+static int bcm47xxpflash_map_init(void)
+{
+	int err = 0;
+
+	bcm47xxpflash_map.virt = ioremap(bcm47xxpflash_map.phys,
+					 bcm47xxpflash_map.size);
+	if (!bcm47xxpflash_map.virt) {
+		pr_err("ioremap failed\n");
+		err = -EIO;
+		goto out;
+	}
+
+	simple_map_init(&bcm47xxpflash_map);
+
+	bcm47xxpflash_mtd = do_map_probe("cfi_probe", &bcm47xxpflash_map);
+	if (!bcm47xxpflash_mtd) {
+		pr_err("Error probing as cfi_probe\n");
+		err = -ENXIO;
+		goto err_map_probe;
+	}
+
+
+	err = mtd_device_parse_register(bcm47xxpflash_mtd, probes, NULL, NULL,
+					0);
+	if (err) {
+		pr_err("Failed to register MTD device: %d\n", err);
+		goto err_parse_reg;
+	}
+
+	bcm47xxpflash_mtd->owner = THIS_MODULE;
+	return 0;
+
+err_parse_reg:
+	map_destroy(bcm47xxpflash_mtd);
+err_map_probe:
+	iounmap(bcm47xxpflash_map.virt);
+out:
+	return err;
+}
+
+/* Shared between SSB and BCMA as we don't need platform data */
+static int bcm47xxpflash_remove(struct platform_device *pdev)
+{
+	mtd_device_unregister(bcm47xxpflash_mtd);
+	map_destroy(bcm47xxpflash_mtd);
+	iounmap(bcm47xxpflash_map.virt);
+	return 0;
+}
+
+#ifdef CONFIG_MTD_BCM47XXPFLASH_SSB
+static int bcm47xxpflash_ssb_probe(struct platform_device *pdev)
+{
+	struct ssb_pflash *pflash = dev_get_platdata(&pdev->dev);
+
+	bcm47xxpflash_map.phys = pflash->window;
+	bcm47xxpflash_map.size = pflash->window_size;
+	bcm47xxpflash_map.bankwidth = pflash->buswidth;
+
+	return bcm47xxpflash_map_init();
+}
+
+static struct platform_driver ssb_pflash_driver = {
+	.remove = bcm47xxpflash_remove,
+	.driver = {
+		.name = "ssb_pflash",
+		.owner = THIS_MODULE,
+	},
+};
+#endif /* CONFIG_MTD_BCM47XXPFLASH_SSB */
+
+#ifdef CONFIG_MTD_BCM47XXPFLASH_BCMA
+static int bcm47xxpflash_bcma_probe(struct platform_device *pdev)
+{
+	struct bcma_pflash *pflash = dev_get_platdata(&pdev->dev);
+
+	bcm47xxpflash_map.phys = pflash->window;
+	bcm47xxpflash_map.size = pflash->window_size;
+	bcm47xxpflash_map.bankwidth = pflash->buswidth;
+
+	return bcm47xxpflash_map_init();
+}
+
+static struct platform_driver bcma_pflash_driver = {
+	.remove = bcm47xxpflash_remove,
+	.driver = {
+		.name = "bcma_pflash",
+		.owner = THIS_MODULE,
+	},
+};
+#endif /* CONFIG_MTD_BCM47XXPFLASH_BCMA */
+
+static int __init bcm47xxpflash_init(void)
+{
+	int err = 0;
+
+#ifdef CONFIG_MTD_BCM47XXPFLASH_SSB
+	err = platform_driver_probe(&ssb_pflash_driver,
+				    bcm47xxpflash_ssb_probe);
+	if (err) {
+		pr_err("Failed to register SSB pflash driver: %d\n", err);
+		return err;
+	}
+#endif
+
+#ifdef CONFIG_MTD_BCM47XXPFLASH_BCMA
+	err = platform_driver_probe(&bcma_pflash_driver,
+				    bcm47xxpflash_bcma_probe);
+	if (err) {
+		pr_err("Failed to register BCMA pflash driver: %d\n", err);
+#ifdef CONFIG_MTD_BCM47XXPFLASH_SSB
+		platform_driver_unregister(&ssb_pflash_driver);
+#endif
+		return err;
+	}
+#endif
+
+	return err;
+}
+
+static void __exit bcm47xxpflash_exit(void)
+{
+#ifdef CONFIG_MTD_BCM47XXPFLASH_SSB
+	platform_driver_unregister(&ssb_pflash_driver);
+#endif
+#ifdef CONFIG_MTD_BCM47XXPFLASH_BCMA
+	platform_driver_unregister(&bcma_pflash_driver);
+#endif
+}
+
+module_init(bcm47xxpflash_init);
+module_exit(bcm47xxpflash_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Rafał Miłecki <zajec5@gmail.com>");
+MODULE_DESCRIPTION("Parallel flash driver for Broadcom buses");
-- 
1.7.7
