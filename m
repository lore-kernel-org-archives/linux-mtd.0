Received: from ug-out-1314.google.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hki3m-0000iv-E5
	for linux-mtd@lists.infradead.org; Sun, 06 May 2007 10:50:21 -0400
Received: by ug-out-1314.google.com with SMTP id m2so762470uge
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 May 2007 07:50:01 -0700 (PDT)
Message-ID: <463DEB01.80309@gmail.com>
Date: Sun, 06 May 2007 18:49:37 +0400
From: Vitaly Wool <vitalywool@gmail.com>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: [patch 2/2] platform NAND driver: add driver
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support for generic platform NAND driver.

 drivers/mtd/nand/Kconfig     |    9 ++
 drivers/mtd/nand/Makefile    |    1
 drivers/mtd/nand/plat_nand.c |  149 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |   16 ++++
 4 files changed, 175 insertions(+)

Signed-off-by: Vitaly Wool <vitalywool@gmail.com>

Index: linux-2.6/drivers/mtd/nand/Kconfig
===================================================================
--- linux-2.6.orig/drivers/mtd/nand/Kconfig
+++ linux-2.6/drivers/mtd/nand/Kconfig
@@ -270,4 +270,13 @@ config MTD_NAND_NANDSIM
 	  The simulator may simulate various NAND flash chips for the
 	  MTD nand layer.
 
+config MTD_NAND_PLATFORM
+	tristate "Support for generic platform NAND driver"
+	depends on MTD_NAND
+	help
+	  This implements a generic NAND driver for on-SOC platform
+	  devices. You will need to provide platform-specific functions
+	  via platform_data.
+
+
 endif # MTD_NAND
Index: linux-2.6/drivers/mtd/nand/Makefile
===================================================================
--- linux-2.6.orig/drivers/mtd/nand/Makefile
+++ linux-2.6/drivers/mtd/nand/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
 obj-$(CONFIG_MTD_NAND_AT91)		+= at91_nand.o
 obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
 obj-$(CONFIG_MTD_NAND_BASLER_EXCITE)	+= excite_nandflash.o
+obj-$(CONFIG_MTD_NAND_PLATFORM)		+= plat_nand.o
 
 nand-objs := nand_base.o nand_bbt.o
 cafe_nand-objs := cafe.o cafe_ecc.o
Index: linux-2.6/drivers/mtd/nand/plat_nand.c
===================================================================
--- /dev/null
+++ linux-2.6/drivers/mtd/nand/plat_nand.c
@@ -0,0 +1,149 @@
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
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+
+struct plat_nand_data {
+	struct nand_chip	chip;
+	struct mtd_info		mtd;
+	void __iomem		*io_base;
+#ifdef CONFIG_MTD_PARTITIONS
+	int			nr_parts;
+	struct mtd_partition	*parts;
+#endif
+};
+
+/*
+ * Probe for the NAND device.
+ */
+static int __init plat_nand_probe(struct platform_device *pdev)
+{
+	struct platform_nand_data *pdata = pdev->dev.platform_data;
+	struct plat_nand_data *data;
+	int res = 0;
+
+	/* Allocate memory for the device structure (and zero it) */
+	data = kzalloc(sizeof(struct plat_nand_data), GFP_KERNEL);
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
+	data->chip.priv = &data;
+	data->mtd.priv = &data->chip;
+	data->mtd.owner = THIS_MODULE;
+
+	data->chip.IO_ADDR_R = data->io_base;
+	data->chip.IO_ADDR_W = data->io_base;
+	data->chip.cmd_ctrl = pdata->ctrl.cmd_ctrl;
+	data->chip.dev_ready = pdata->ctrl.dev_ready;
+	data->chip.select_chip = pdata->ctrl.select_chip;
+	data->chip.chip_delay = pdata->chip.chip_delay;
+	data->chip.options |= pdata->chip.options;
+
+	data->chip.ecc.hwctl = pdata->ctrl.hwcontrol;
+	data->chip.ecc.layout = pdata->chip.ecclayout;
+	data->chip.ecc.mode = NAND_ECC_SOFT;
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
+	if (pdata->chip.part_probe_types) {
+		res = parse_mtd_partitions(&data->mtd,
+					pdata->chip.part_probe_types,
+					&data->parts, 0);
+		if (res > 0) {
+			add_mtd_partitions(&data->mtd, data->parts, res);
+			return 0;
+		}
+	} else if (pdata->chip.partitions) {
+		data->parts = pdata->chip.partitions;
+		res = add_mtd_partitions(&data->mtd, data->parts,
+			pdata->chip.nr_partitions);
+	} else
+#endif
+	res = add_mtd_device(&data->mtd);
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
+static int __devexit plat_nand_remove(struct platform_device *pdev)
+{
+	struct plat_nand_data *data = platform_get_drvdata(pdev);
+	struct platform_nand_data *pdata = pdev->dev.platform_data;
+
+	nand_release(&data->mtd);
+#ifdef CONFIG_MTD_PARTITIONS
+	if (data->parts && data->parts != pdata->chip.partitions)
+		kfree(data->parts);
+#endif
+	iounmap(data->io_base);
+	kfree(data);
+
+	return 0;
+}
+
+static struct platform_driver plat_nand_driver = {
+	.probe		= plat_nand_probe,
+	.remove		= plat_nand_remove,
+	.driver		= {
+		.name	= "gen_nand",
+		.owner	= THIS_MODULE,
+	},
+};
+
+static int __init plat_nand_init(void)
+{
+	return platform_driver_register(&plat_nand_driver);
+}
+
+static void __exit plat_nand_exit(void)
+{
+	platform_driver_unregister(&plat_nand_driver);
+}
+
+module_init(plat_nand_init);
+module_exit(plat_nand_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vitaly Wool");
+MODULE_DESCRIPTION("Simple generic NAND driver");
