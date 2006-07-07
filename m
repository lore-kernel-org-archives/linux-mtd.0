Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.elatec.si)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FylMe-0008GD-V3
	for linux-mtd@lists.infradead.org; Fri, 07 Jul 2006 04:07:20 -0400
Message-ID: <44AE1896.2020004@epico.si>
Date: Fri, 07 Jul 2006 10:17:26 +0200
From: Savin Zlobec <savin@epico.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] AT91RM9200 NAND driver
Content-Type: multipart/mixed; boundary="------------050603050602030203070001"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050603050602030203070001
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

this is the updated version of AT91 NAND driver  to work with the
recent changes in MTD NAND.  Could you please review it and (if there
are no objections) include it in mtd git tree.

=========================================================

This patch adds support for NAND Flash / SmartMedia on Atmel AT91RM9200.

Signed-off-by: Savin Zlobec <savin@epico.si>
--



--------------050603050602030203070001
Content-Type: text/x-patch;
 name="at91_nand.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="at91_nand.patch"

diff -urP mtd-2.6.orig/drivers/mtd/nand/at91_nand.c mtd-2.6/drivers/mtd/nand/at91_nand.c
--- mtd-2.6.orig/drivers/mtd/nand/at91_nand.c	1970-01-01 01:00:00.000000000 +0100
+++ mtd-2.6/drivers/mtd/nand/at91_nand.c	2006-07-07 09:58:42.000000000 +0200
@@ -0,0 +1,234 @@
+/*
+ * drivers/mtd/nand/at91_nand.c
+ *
+ *  Copyright (C) 2003 Rick Bronson
+ *
+ *  Derived from drivers/mtd/nand/autcpu12.c
+ *	 Copyright (c) 2001 Thomas Gleixner (gleixner@autronix.de)
+ *
+ *  Derived from drivers/mtd/spia.c
+ *	 Copyright (C) 2000 Steven J. Hill (sjhill@cotw.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/io.h>
+#include <asm/sizes.h>
+
+#include <asm/arch/hardware.h>
+#include <asm/arch/board.h>
+#include <asm/arch/gpio.h>
+
+struct at91_nand_host {
+	struct nand_chip	nand_chip;
+	struct mtd_info		mtd;
+	void __iomem		*io_base;
+	struct at91_nand_data	*board;
+};
+
+/*
+ * Hardware specific access to control-lines
+ */
+static void at91_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
+{
+	struct nand_chip *nand_chip = mtd->priv;
+	struct at91_nand_host *host = nand_chip->priv;
+
+	if (cmd == NAND_CMD_NONE)
+		return;
+ 
+	if (ctrl & NAND_CLE)
+		writeb(cmd, host->io_base + (1 << host->board->cle));
+	else
+		writeb(cmd, host->io_base + (1 << host->board->ale));
+}
+
+/*
+ * Read the Device Ready pin.
+ */
+static int at91_nand_device_ready(struct mtd_info *mtd)
+{
+	struct nand_chip *nand_chip = mtd->priv;
+	struct at91_nand_host *host = nand_chip->priv;
+
+	return at91_get_gpio_value(host->board->rdy_pin);
+}
+
+/*
+ * Enable NAND.
+ */
+static void at91_nand_enable(struct at91_nand_host *host)
+{
+	unsigned int csa;
+
+	/* Setup Smart Media, first enable the address range of CS3 */
+	csa = at91_sys_read(AT91_EBI_CSA);
+	at91_sys_write(AT91_EBI_CSA, csa | AT91_EBI_CS3A_SMC_SMARTMEDIA);
+
+	/* set the bus interface characteristics */
+	at91_sys_write(AT91_SMC_CSR(3), AT91_SMC_ACSS_STD | AT91_SMC_DBW_8 | AT91_SMC_WSEN
+				| AT91_SMC_NWS_(5)
+				| AT91_SMC_TDF_(1)
+				| AT91_SMC_RWSETUP_(0)	/* tDS Data Set up Time 30 - ns */
+				| AT91_SMC_RWHOLD_(1)	/* tDH Data Hold Time 20 - ns */
+	);
+
+	if (host->board->enable_pin)
+		at91_set_gpio_value(host->board->enable_pin, 0);
+}
+
+/*
+ * Disable NAND.
+ */
+static void at91_nand_disable(struct at91_nand_host *host)
+{
+	if (host->board->enable_pin)
+		at91_set_gpio_value(host->board->enable_pin, 1);
+}
+
+/*
+ * Probe for the NAND device.
+ */
+static int __init at91_nand_probe(struct platform_device *pdev)
+{
+	struct at91_nand_host *host;
+	struct mtd_info *mtd;
+	struct nand_chip *nand_chip;
+	int res;
+
+#ifdef CONFIG_MTD_PARTITIONS
+	struct mtd_partition *partitions = NULL;
+	int num_partitions = 0;
+#endif
+
+	/* Allocate memory for the device structure (and zero it) */
+	host = kzalloc(sizeof(struct at91_nand_host), GFP_KERNEL);
+	if (!host) {
+		printk(KERN_ERR "at91_nand: failed to allocate device structure.\n");
+		return -ENOMEM;
+	}
+
+	host->io_base = ioremap(pdev->resource[0].start,
+				pdev->resource[0].end - pdev->resource[0].start + 1);
+	if (host->io_base == NULL) {
+		printk(KERN_ERR "at91_nand: ioremap failed\n");
+		kfree(host);
+		return -EIO;
+	}
+
+	mtd = &host->mtd;
+	nand_chip = &host->nand_chip;
+	host->board = pdev->dev.platform_data;
+
+	nand_chip->priv = host;		/* link the private data structures */
+	mtd->priv = nand_chip;
+	mtd->owner = THIS_MODULE;
+
+	/* Set address of NAND IO lines */
+	nand_chip->IO_ADDR_R = host->io_base;
+	nand_chip->IO_ADDR_W = host->io_base;
+	nand_chip->cmd_ctrl = at91_nand_cmd_ctrl;
+	nand_chip->dev_ready = at91_nand_device_ready;
+	nand_chip->ecc.mode = NAND_ECC_SOFT;	/* enable ECC */
+	nand_chip->chip_delay = 20;		/* 20us command delay time */
+
+	platform_set_drvdata(pdev, host);
+	at91_nand_enable(host);
+
+	if (host->board->det_pin) {
+		if (at91_get_gpio_value(host->board->det_pin)) {
+			printk ("No SmartMedia card inserted.\n");
+			res = ENXIO;
+			goto out;
+		}
+	}
+
+	/* Scan to find existance of the device */
+	if (nand_scan(mtd, 1)) {
+		res = -ENXIO;
+		goto out;
+	}
+
+#ifdef CONFIG_MTD_PARTITIONS
+	if (host->board->partition_info)
+		partitions = host->board->partition_info(mtd->size, &num_partitions);
+
+	if ((!partitions) || (num_partitions == 0)) {
+		printk(KERN_ERR "at91_nand: No parititions defined, or unsupported device.\n");
+		res = ENXIO;
+		goto release;
+	}
+
+	res = add_mtd_partitions(mtd, partitions, num_partitions);
+#else
+	res = add_mtd_device(mtd);
+#endif
+
+	if (!res)
+		return res;
+ 
+release:
+	nand_release(mtd);
+out:
+	at91_nand_disable(host);
+	platform_set_drvdata(pdev, NULL);
+	iounmap(host->io_base);
+	kfree(host);
+ 	return res;
+}
+
+/*
+ * Remove a NAND device.
+ */
+static int __devexit at91_nand_remove(struct platform_device *pdev)
+{
+	struct at91_nand_host *host = platform_get_drvdata(pdev);
+	struct mtd_info *mtd = &host->mtd;
+
+	nand_release(mtd);
+
+	at91_nand_disable(host);
+
+	iounmap(host->io_base);
+	kfree(host);
+
+	return 0;
+}
+
+static struct platform_driver at91_nand_driver = {
+	.probe		= at91_nand_probe,
+	.remove		= at91_nand_remove,
+	.driver		= {
+		.name	= "at91_nand",
+		.owner	= THIS_MODULE,
+	},
+};
+
+static int __init at91_nand_init(void)
+{
+	return platform_driver_register(&at91_nand_driver);
+}
+
+
+static void __exit at91_nand_exit(void)
+{
+	platform_driver_unregister(&at91_nand_driver);
+}
+
+
+module_init(at91_nand_init);
+module_exit(at91_nand_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Rick Bronson");
+MODULE_DESCRIPTION("NAND/SmartMedia driver for AT91RM9200");
diff -urP mtd-2.6.orig/drivers/mtd/nand/Kconfig mtd-2.6/drivers/mtd/nand/Kconfig
--- mtd-2.6.orig/drivers/mtd/nand/Kconfig	2006-07-07 09:19:43.000000000 +0200
+++ mtd-2.6/drivers/mtd/nand/Kconfig	2006-07-07 09:57:13.000000000 +0200
@@ -232,6 +232,13 @@
 
 	  If you say "m", the module will be called "cs553x_nand.ko".
 
+config MTD_NAND_AT91
+	bool "Support for NAND Flash / SmartMedia on AT91"
+	depends on MTD_NAND && ARCH_AT91RM9200
+	help
+	  Enables support for NAND Flash / Smart Media Card interface
+	  on the AT91RM9200.
+
 config MTD_NAND_NANDSIM
 	tristate "Support for NAND Flash Simulator"
 	depends on MTD_NAND && MTD_PARTITIONS
diff -urP mtd-2.6.orig/drivers/mtd/nand/Makefile mtd-2.6/drivers/mtd/nand/Makefile
--- mtd-2.6.orig/drivers/mtd/nand/Makefile	2006-07-07 09:19:43.000000000 +0200
+++ mtd-2.6/drivers/mtd/nand/Makefile	2006-07-07 09:43:17.000000000 +0200
@@ -22,5 +22,6 @@
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
 obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
+obj-$(CONFIG_MTD_NAND_AT91)		+= at91_nand.o
 
 nand-objs = nand_base.o nand_bbt.o

--------------050603050602030203070001--
