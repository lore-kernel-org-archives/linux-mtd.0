Received: from ug-out-1314.google.com ([66.249.92.175])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HirP0-0003SL-4q
	for linux-mtd@lists.infradead.org; Tue, 01 May 2007 08:24:21 -0400
Received: by ug-out-1314.google.com with SMTP id m2so31606uge
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 May 2007 05:24:15 -0700 (PDT)
Message-ID: <46373163.7060603@gmail.com>
Date: Tue, 01 May 2007 16:24:03 +0400
From: Vitaly Wool <vitalywool@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [patch] generic nand driver for SoCs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a very first shot on the "generic NAND driver" subject as was 
discussed by Lennert and Thomas.

 drivers/mtd/nand/Makefile   |    2
 drivers/mtd/nand/Kconfig    |   12 +++
 drivers/mtd/nand/gen_nand.c |  160 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)

Signed-off-by: Vitaly Wool <vitalywool@gmail.com>

Index: linux-2.6/drivers/mtd/nand/gen_nand.c
===================================================================
--- /dev/null
+++ linux-2.6/drivers/mtd/nand/gen_nand.c
@@ -0,0 +1,160 @@
+/*
+ * Generic NAND driver
+ *
+ * Author: Vitaly Wool <vitalywool@gmail.com>
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
+#include <linux/io.h>
+
+struct gen_nand_data {
+	struct nand_chip	chip;
+	struct mtd_info		mtd;
+	void __iomem		*io_base;
+#ifdef CONFIG_MTD_PARTITIONS
+	int			nr_parts;
+	struct mtd_partition	*parts;
+#endif
+};
+
+#ifdef CONFIG_MTD_PARTITIONS
+static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
+#endif
+
+/*
+ * Probe for the NAND device.
+ */
+static int __init gen_nand_probe(struct platform_device *pdev)
+{
+	struct platform_nand_data *pdata = pdev->dev.platform_data;
+	struct gen_nand_data *data;
+	int res;
+
+	/* Allocate memory for the device structure (and zero it) */
+	data = kzalloc(sizeof(struct gen_nand_data), GFP_KERNEL);
+	if (!data) {
+		dev_err(&pdev->dev, "failed to allocate device structure.\n");
+		return -ENOMEM;
+	}
+
+	data->io_base = ioremap(pdev->resource[0].start,
+				pdev->resource[0].end - pdev->resource[0].start + 1);
+	if (data->io_base == NULL) {
+		dev_err(&pdev->dev, "ioremap failed\n");
+		kfree(data);
+		return -EIO;
+	}
+
+	data->chip.priv = &data;	/* link the private data structures */
+	data->mtd.priv = &data->chip;
+	data->mtd.owner = THIS_MODULE;
+
+	data->chip.IO_ADDR_R = data->io_base;
+	data->chip.IO_ADDR_W = data->io_base;
+	if (pdata->ctrl.cmd_ctrl)
+		data->chip.cmd_ctrl = pdata->ctrl.cmd_ctrl;
+	if (pdata->ctrl.dev_ready)
+		data->chip.dev_ready = pdata->ctrl.dev_ready;
+	if (pdata->ctrl.select_chip)
+		data->chip.select_chip = pdata->ctrl.select_chip;
+	if (pdata->ctrl.hwcontrol)
+		data->chip.ecc.hwctl = pdata->ctrl.hwcontrol;
+	if (pdata->chip.ecclayout)
+		data->chip.ecc.layout = pdata->chip.ecclayout;
+	data->chip.ecc.mode = NAND_ECC_SOFT;
+	data->chip.chip_delay = pdata->chip.chip_delay;
+	data->chip.options |= pdata->chip.options;
+
+	platform_set_drvdata(pdev, data);
+
+	/* Scan to find existance of the device */
+	if (nand_scan(&data->mtd, 1)) {
+		res = -ENXIO;
+		goto out;
+	}
+
+#ifdef CONFIG_MTD_PARTITIONS
+	res = parse_mtd_partitions(&data->mtd, part_probe_types, &data->parts, 0);
+	if (res > 0) {
+		add_mtd_partitions(&data->mtd, data->parts, res);
+		return 0;
+	} else if (pdata->chip.partitions) {
+		data->parts = pdata->chip.partitions;
+		res = add_mtd_partitions(&data->mtd, data->parts, pdata->chip.nr_partitions);
+	}
+#else
+	res = add_mtd_device(data->mtd);
+#endif
+
+	if (!res)
+		return res;
+
+	nand_release(&data->mtd);
+out:
+	platform_set_drvdata(pdev, NULL);
+	iounmap(data->io_base);
+	kfree(data);
+	return res;
+}
+
+/*
+ * Remove a NAND device.
+ */
+static int __devexit gen_nand_remove(struct platform_device *pdev)
+{
+	struct gen_nand_data *data = platform_get_drvdata(pdev);
+	struct platform_nand_data *pdata = pdev->dev.platform_data;
+
+#ifdef CONFIG_MTD_PARTITIONS
+	if (data->parts) {
+		del_mtd_partitions(&data->mtd);
+		if (data->parts != pdata->chip.partitions)
+			kfree(data->parts);
+	} else
+		del_mtd_device(&data->mtd);
+#else
+	del_mtd_device(&data->mtd);
+#endif
+
+	nand_release(&data->mtd);
+	iounmap(data->io_base);
+	kfree(data);
+
+	return 0;
+}
+
+static struct platform_driver gen_nand_driver = {
+	.probe		= gen_nand_probe,
+	.remove		= gen_nand_remove,
+	.driver		= {
+		.name	= "gen_nand",
+		.owner	= THIS_MODULE,
+	},
+};
+
+static int __init gen_nand_init(void)
+{
+	return platform_driver_register(&gen_nand_driver);
+}
+
+static void __exit gen_nand_exit(void)
+{
+	platform_driver_unregister(&gen_nand_driver);
+}
+
+module_init(gen_nand_init);
+module_exit(gen_nand_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vitaly Wool");
+MODULE_DESCRIPTION("Simple generic NAND driver");
Index: linux-2.6/drivers/mtd/nand/Kconfig
===================================================================
--- linux-2.6.orig/drivers/mtd/nand/Kconfig
+++ linux-2.6/drivers/mtd/nand/Kconfig
@@ -277,4 +277,16 @@ config MTD_NAND_PLATFORM
 	help
 	  This driver enables support for common on-SoC NAND devices.
 
+config MTD_NAND_PLATFORM
+	tristate "Support for generic NAND driver"
+	depends on MTD_NAND
+	help
+	  This driver enables support for common on-SoC NAND devices.
+
+config MTD_NAND_PLATFORM
+	tristate "Support for generic NAND driver"
+	depends on MTD_NAND
+	help
+	  This driver enables support for common on-SoC NAND devices.
+
 endmenu
Index: linux-2.6/drivers/mtd/nand/gen_nand.c
===================================================================
--- linux-2.6.orig/drivers/mtd/nand/Makefile
+++ linux-2.6/drivers/mtd/nand/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
 obj-$(CONFIG_MTD_NAND_AT91)		+= at91_nand.o
 obj-$(CONFIG_MTD_NAND_BASLER_EXCITE)	+= excite_nandflash.o
+obj-$(CONFIG_MTD_NAND_PLATFORM)		+= gen_nand.o
 
 nand-objs := nand_base.o nand_bbt.o
 cafe_nand-objs := cafe.o cafe_ecc.o
