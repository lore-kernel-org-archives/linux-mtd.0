Received: from [196.211.225.226] (helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gaazq-0002Iu-9p
	for linux-mtd@lists.infradead.org; Thu, 19 Oct 2006 12:44:00 -0400
Subject: [PATCH] [MTD] NAND: AT91 NAND driver
From: Andrew Victor <andrew@sanpeople.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1161275075.10090.77.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 19 Oct 2006 18:24:35 +0200
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, savin@epico.si
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

I'd like to resubmit the AT91 NAND driver for inclusion in the MTD tree.

This version only differs from version posted by Savin Zlobec (20 Jun
2006) in that the AT91RM9200-specific chip-select / bus setup code has
been moved from the at91_nand.c driver into the processor-specific file.

From: Savin Zlobec <savin@epico.si>
Signed-off-by: Andrew Victor <andrew@sanpeople.com>



diff -urN -x CVS linux-2.6.19-rc2.orig/drivers/mtd/nand/Kconfig linux-2.6.19/drivers/mtd/nand/Kconfig
--- linux-2.6.19-rc2.orig/drivers/mtd/nand/Kconfig	Thu Oct 19 16:31:48 2006
+++ linux-2.6.19/drivers/mtd/nand/Kconfig	Thu Oct 12 17:07:39 2006
@@ -232,6 +232,13 @@
 
 	  If you say "m", the module will be called "cs553x_nand.ko".
 
+config MTD_NAND_AT91
+	bool "Support for NAND Flash / SmartMedia on AT91"
+	depends on MTD_NAND && ARCH_AT91
+	help
+	  Enables support for NAND Flash / Smart Media Card interface
+	  on Atmel AT91 processors.
+
 config MTD_NAND_NANDSIM
 	tristate "Support for NAND Flash Simulator"
 	depends on MTD_NAND && MTD_PARTITIONS
diff -urN -x CVS linux-2.6.19-rc2.orig/drivers/mtd/nand/Makefile linux-2.6.19/drivers/mtd/nand/Makefile
--- linux-2.6.19-rc2.orig/drivers/mtd/nand/Makefile	Thu Oct 19 16:29:17 2006
+++ linux-2.6.19/drivers/mtd/nand/Makefile	Thu Oct 12 17:07:39 2006
@@ -22,5 +22,6 @@
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
 obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
+obj-$(CONFIG_MTD_NAND_AT91)		+= at91_nand.o
 
 nand-objs = nand_base.o nand_bbt.o
diff -urN -x CVS linux-2.6.19-rc2.orig/drivers/mtd/nand/at91_nand.c linux-2.6.19/drivers/mtd/nand/at91_nand.c
--- linux-2.6.19-rc2.orig/drivers/mtd/nand/at91_nand.c	Thu Jan  1 02:00:00 1970
+++ linux-2.6.19/drivers/mtd/nand/at91_nand.c	Thu Oct 12 17:21:53 2006
@@ -0,0 +1,220 @@
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
+#include <asm/hardware.h>
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
+	return res;
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
