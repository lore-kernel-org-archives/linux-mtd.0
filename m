Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FBSa5-0007NR-JM
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 03:09:14 -0500
From: Andrew Victor <andrew@sanpeople.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1140465547.2480.764.camel@localhost.localdomain>
References: <1140447277.1638.63.camel@fuzzie.sanpeople.com>
	<20060220153536.GD7092@home.fluff.org>
	<1140465547.2480.764.camel@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1140509194.16321.21.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 21 Feb 2006 10:06:34 +0200
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, Ben Dooks <ben-mtd@fluff.org>
Subject: Re: NAND driver for AT91RM9200
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

Here is an updated driver which fixes Ben and Thomas' comments:
      * Don't need to re-cast 'host->io_base' to 'void __iomem'
      * Don't override the cmdfunc from nand_base.c
      * Fixed error handling in probe function

Hopefully the driver is now acceptable for addition to the MTD CVS /
mainline kernels.  Thanks.


Regards,
  Andrew Victor




diff -urN linux-2.6.16-rc4.orig/drivers/mtd/nand/Kconfig linux-2.6.16-rc4/drivers/mtd/nand/Kconfig
--- linux-2.6.16-rc4.orig/drivers/mtd/nand/Kconfig	Mon Feb 20 14:40:22 2006
+++ linux-2.6.16-rc4/drivers/mtd/nand/Kconfig	Mon Feb 20 16:41:51 2006
@@ -190,5 +190,11 @@
 	help
 	  The simulator may simulate verious NAND flash chips for the
 	  MTD nand layer.
- 
+
+config MTD_NAND_AT91
+	bool "AT91 NAND Access (Smart Media)"
+	depends on MTD_NAND && ARCH_AT91RM9200 && EXPERIMENTAL
+	help
+	  Enables access to the Smart Media Card interface on the AT91RM9200
+
 endmenu
diff -urN linux-2.6.16-rc4.orig/drivers/mtd/nand/Makefile linux-2.6.16-rc4/drivers/mtd/nand/Makefile
--- linux-2.6.16-rc4.orig/drivers/mtd/nand/Makefile	Mon Feb 20 14:35:48 2006
+++ linux-2.6.16-rc4/drivers/mtd/nand/Makefile	Mon Feb 20 14:47:11 2006
@@ -18,5 +18,6 @@
 obj-$(CONFIG_MTD_NAND_RTC_FROM4)	+= rtc_from4.o
 obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
+obj-$(CONFIG_MTD_NAND_AT91)		+= at91_nand.o
 
 nand-objs = nand_base.o nand_bbt.o
diff -urN linux-2.6.16-rc4.orig/drivers/mtd/nand/at91_nand.c linux-2.6.16-rc4/drivers/mtd/nand/at91_nand.c
--- linux-2.6.16-rc4.orig/drivers/mtd/nand/at91_nand.c	Thu Jan  1 02:00:00 1970
+++ linux-2.6.16-rc4/drivers/mtd/nand/at91_nand.c	Tue Feb 21 09:33:26 2006
@@ -0,0 +1,244 @@
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
+static void at91_nand_hwcontrol(struct mtd_info *mtd, int cmd)
+{
+	struct nand_chip *nand_chip = mtd->priv;
+	struct at91_nand_host *host = nand_chip->priv;
+
+	switch(cmd) {
+		case NAND_CTL_SETCLE:
+			nand_chip->IO_ADDR_W = host->io_base + (1 << host->board->cle);
+			break;
+		case NAND_CTL_CLRCLE:
+			nand_chip->IO_ADDR_W = host->io_base;
+			break;
+		case NAND_CTL_SETALE:
+			nand_chip->IO_ADDR_W = host->io_base + (1 << host->board->ale);
+			break;
+		case NAND_CTL_CLRALE:
+			nand_chip->IO_ADDR_W = host->io_base;
+			break;
+		case NAND_CTL_SETNCE:
+			break;
+		case NAND_CTL_CLRNCE:
+			break;
+	}
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
+ * Enable NAND and detect card.
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
+	/* Allocate memory for the device structure */
+	host = kmalloc(sizeof(struct at91_nand_host), GFP_KERNEL);
+	if (!host) {
+		printk(KERN_ERR "at91_nand: failed to allocate device structure.\n");
+		return -ENOMEM;
+	}
+	memset(host, 0, sizeof(struct at91_nand_host));
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
+
+	/* Set address of NAND IO lines */
+	nand_chip->IO_ADDR_R = host->io_base;
+	nand_chip->IO_ADDR_W = host->io_base;
+	nand_chip->hwcontrol = at91_nand_hwcontrol;
+	nand_chip->dev_ready = at91_nand_device_ready;
+	nand_chip->eccmode = NAND_ECC_SOFT;	/* enable ECC */
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
+		goto out;
+	}
+
+	res = add_mtd_partitions(mtd, partitions, num_partitions);
+#else
+	res = add_mtd_device(mtd);
+#endif
+
+out:
+	if (res) {
+		at91_nand_disable(host);
+		platform_set_drvdata(pdev, NULL);
+	
+		iounmap(host->io_base);
+		kfree(host);
+	}
+
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
+	del_mtd_partitions(mtd);
+	del_mtd_device(mtd);
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
+MODULE_DESCRIPTION("Glue layer for SmartMediaCard on ATMEL AT91RM9200");
