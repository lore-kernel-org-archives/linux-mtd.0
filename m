Received: from mail-in-10.arcor-online.net ([151.189.21.50])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LR8N1-00066i-Uo
	for linux-mtd@lists.infradead.org; Sun, 25 Jan 2009 17:02:07 +0000
Received: from mail-in-19-z2.arcor-online.net (mail-in-19-z2.arcor-online.net
	[151.189.8.36])
	by mail-in-10.arcor-online.net (Postfix) with ESMTP id B5B991F5087
	for <linux-mtd@lists.infradead.org>;
	Sun, 25 Jan 2009 18:01:54 +0100 (CET)
Received: from mail-in-11.arcor-online.net (mail-in-11.arcor-online.net
	[151.189.21.51])
	by mail-in-19-z2.arcor-online.net (Postfix) with ESMTP id 9FC336BD8D
	for <linux-mtd@lists.infradead.org>;
	Sun, 25 Jan 2009 18:01:54 +0100 (CET)
Received: from bunny.home (dslb-088-070-072-031.pools.arcor-ip.net
	[88.70.72.31])
	by mail-in-11.arcor-online.net (Postfix) with ESMTP id B5D8B249270
	for <linux-mtd@lists.infradead.org>;
	Sun, 25 Jan 2009 18:01:53 +0100 (CET)
Received: from fox.localnet (fox.home [192.168.2.13])
	by bunny.home (Postfix) with ESMTPS id B529425104BE
	for <linux-mtd@lists.infradead.org>;
	Sun, 25 Jan 2009 18:01:49 +0100 (CET)
From: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Add open firmware GPIO NAND driver
Date: Sun, 25 Jan 2009 18:01:51 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200901251801.52179.matthias.fuchs@esd-electronics.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a GPIO based nand driver that is configured through
the open firmware flat device tree. It's based on the gpio platform
nand driver.

The driver is tested on a PPC405EP based PowerPC board with a single
8 bit NAND chip. nCE, ALE, CLE and RDY are connected to the CPUs GPIO
pins GPIO1..4.

The driver does not handle:
 - 16 bit NAND chips (no hardware for testing)
 - any other interfacing than ALE, CLE, nCE, RDY via GPIO and databus via
   8 bit mem'mapped access
 - multiple NAND chips

Just as an idea: this driver could replace ppchameleonevb.c.

Signed-off-by: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
---
 drivers/mtd/nand/Kconfig   |    6 +
 drivers/mtd/nand/Makefile  |    1 +
 drivers/mtd/nand/of_gpio.c |  366 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 373 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/nand/of_gpio.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 8b12e6e..1853c63 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -62,6 +62,12 @@ config MTD_NAND_GPIO
 	help
 	  This enables a GPIO based NAND flash driver.
 
+config MTD_NAND_OF_GPIO
+	tristate "Open Firmware GPIO NAND Flash driver"
+	depends on GENERIC_GPIO && PPC_OF
+	help
+	  This enables a GPIO based NAND flash driver.
+
 config MTD_NAND_SPIA
 	tristate "NAND Flash device on SPIA board"
 	depends on ARCH_P720T
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index b661586..d89332b 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
 obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel_nand.o
 obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
+obj-$(CONFIG_MTD_NAND_OF_GPIO)		+= of_gpio.o
 obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
 obj-$(CONFIG_MTD_NAND_BASLER_EXCITE)	+= excite_nandflash.o
 obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
diff --git a/drivers/mtd/nand/of_gpio.c b/drivers/mtd/nand/of_gpio.c
new file mode 100644
index 0000000..2c45e3b
--- /dev/null
+++ b/drivers/mtd/nand/of_gpio.c
@@ -0,0 +1,366 @@
+/*
+ * drivers/mtd/nand/of_gpio.c
+ *
+ * Open Firmware device driver for NAND connected via GPIO
+ *
+ * Copyright 2009 esd Gmbh
+ *   Matthias Fuchs <matthias.fuchs@esd-electronics.com>
+ *
+ * Based on GPIO platform NAND driver by
+ * Ben Dooks <ben@simtec.co.uk> and Russel King
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *
+ * Sample device tree bindings:
+ *
+ *	...
+ *	nand@1,0 {
+ *		compatible = "gpio-nand";
+ *		reg = <0x00000001 0x00000000 0x00002000>;
+ *		chip-delay = <50>;
+ *		options = <0x00000000>;
+ *		#address-cells = <1>;
+ *		#size-cells = <1>;
+ *
+ *		gpios =	<&GPIO 1 0
+ *			 &GPIO 2 0
+ *			 &GPIO 3 0
+ *			 &GPIO 4 0>;
+ *
+ *		nand {
+ *			#address-cells = <1>;
+ *			#size-cells = <1>;
+ *
+ *			partition@0 {
+ *				...
+ *			};
+ *			...
+ *		};
+ *	};
+ *	...
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+#include <linux/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <linux/of_platform.h>
+
+struct of_gpio_nand_controller {
+	struct of_device *ofdev;
+	void __iomem *base;
+	int gpio_nce;
+	int gpio_cle;
+	int gpio_ale;
+	int gpio_rdy;
+	struct mtd_info mtd;
+	struct nand_chip chip;
+#ifdef CONFIG_MTD_PARTITIONS
+	struct mtd_partition *parts;
+#endif
+};
+
+static struct of_gpio_nand_controller of_gpio_nand_ctrl;
+
+static void
+of_gpio_nand_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct of_gpio_nand_controller *of_gpio_nand = &of_gpio_nand_ctrl;
+
+	if (ctrl & NAND_CTRL_CHANGE) {
+		gpio_set_value(of_gpio_nand->gpio_nce, !(ctrl & NAND_NCE));
+		gpio_set_value(of_gpio_nand->gpio_cle, !!(ctrl & NAND_CLE));
+		gpio_set_value(of_gpio_nand->gpio_ale, !!(ctrl & NAND_ALE));
+	}
+	if (cmd == NAND_CMD_NONE)
+		return;
+
+	writeb(cmd, chip->IO_ADDR_W);
+}
+
+static void
+of_gpio_nand_writebuf(struct mtd_info *mtd, const u_char *buf, int len)
+{
+	struct nand_chip *chip = mtd->priv;
+
+	writesb(chip->IO_ADDR_W, buf, len);
+}
+
+static void of_gpio_nand_readbuf(struct mtd_info *mtd, u_char *buf, int len)
+{
+	struct nand_chip *chip = mtd->priv;
+
+	readsb(chip->IO_ADDR_R, buf, len);
+}
+
+static int
+of_gpio_nand_verifybuf(struct mtd_info *mtd, const u_char *buf, int len)
+{
+	struct nand_chip *chip = mtd->priv;
+	unsigned char read, *p = (unsigned char *)buf;
+	int i, err = 0;
+
+	for (i = 0; i < len; i++) {
+		read = readb(chip->IO_ADDR_R);
+		if (read != p[i]) {
+			pr_debug("%s: err at %d (read %04x vs %04x)\n",
+				 __func__, i, read, p[i]);
+			err = -EFAULT;
+		}
+	}
+	return err;
+}
+
+static int of_gpio_nand_devready(struct mtd_info *mtd)
+{
+	struct of_gpio_nand_controller *of_gpio_nand = &of_gpio_nand_ctrl;
+
+	return gpio_get_value(of_gpio_nand->gpio_rdy);
+}
+
+static int of_gpio_nand_chip_init(struct of_gpio_nand_controller *of_gpio_nand,
+				  struct device_node *node)
+{
+#ifdef CONFIG_MTD_PARTITIONS
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	static const char *part_types[] = { "cmdlinepart", NULL };
+#else
+	static const char *part_types[] = { NULL };
+#endif
+#endif
+	struct device_node *flash_np;
+	struct nand_chip *chip = &of_gpio_nand->chip;
+	int ret;
+	const u32 *reg;
+
+	chip->IO_ADDR_R = of_gpio_nand->base;
+	chip->IO_ADDR_W = of_gpio_nand->base;
+	chip->cmd_ctrl = of_gpio_nand_hwcontrol;
+	chip->dev_ready = of_gpio_nand_devready;
+	chip->read_buf = of_gpio_nand_readbuf;
+	chip->write_buf = of_gpio_nand_writebuf;
+	chip->verify_buf = of_gpio_nand_verifybuf;
+	chip->ecc.mode   = NAND_ECC_SOFT;
+
+	reg = of_get_property(node, "chip-delay", NULL);
+	if (reg)
+		chip->chip_delay = *reg;
+
+	reg = of_get_property(node, "options", NULL);
+	if (reg)
+		chip->options = *reg;
+
+	if (chip->options & NAND_BUSWIDTH_16) {
+		dev_err(&of_gpio_nand->ofdev->dev,
+			"16 bit bus width not supported\n");
+		return -ENOENT;
+	}
+
+	of_gpio_nand->mtd.priv = chip;
+	of_gpio_nand->mtd.owner = THIS_MODULE;
+
+	flash_np = of_get_next_child(node, NULL);
+	if (!flash_np)
+		return -ENODEV;
+
+	of_gpio_nand->mtd.name = kasprintf(GFP_KERNEL, "%s.%s",
+					   of_gpio_nand->ofdev->dev.bus_id,
+					   flash_np->name);
+	if (!of_gpio_nand->mtd.name) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	ret = nand_scan(&of_gpio_nand->mtd, 1);
+	if (ret)
+		goto err;
+
+#ifdef CONFIG_MTD_PARTITIONS
+	ret = parse_mtd_partitions(&of_gpio_nand->mtd, part_types,
+				   &of_gpio_nand->parts, 0);
+	if (ret < 0)
+		goto err;
+
+#ifdef CONFIG_MTD_OF_PARTS
+	if (ret == 0) {
+		ret = of_mtd_parse_partitions(&of_gpio_nand->ofdev->dev,
+					      flash_np,
+					      &of_gpio_nand->parts);
+		if (ret < 0)
+			goto err;
+	}
+#endif
+
+	if (ret > 0)
+		ret = add_mtd_partitions(&of_gpio_nand->mtd,
+					 of_gpio_nand->parts, ret);
+	else
+#endif
+		ret = add_mtd_device(&of_gpio_nand->mtd);
+
+err:
+	of_node_put(flash_np);
+	if (ret)
+		kfree(of_gpio_nand->mtd.name);
+	return ret;
+}
+
+static int __devinit of_gpio_nand_probe(struct of_device *ofdev,
+					const struct of_device_id *match)
+{
+	struct of_gpio_nand_controller *of_gpio_nand = &of_gpio_nand_ctrl;
+	struct device *dev = &ofdev->dev;
+	int ret;
+
+	of_gpio_nand->ofdev = ofdev;
+	dev_set_drvdata(&ofdev->dev, of_gpio_nand);
+
+	of_gpio_nand->base = of_iomap(ofdev->node, 0);
+	if (!of_gpio_nand->base) {
+		dev_err(&ofdev->dev, "failed to get memory\n");
+		return -EIO;
+	}
+
+	if (of_gpio_count(ofdev->node) != 4) {
+		ret = -ENOENT;
+		goto err_nce;
+	}
+
+	/* CE# */
+	ret = of_get_gpio(ofdev->node, 0);
+	if (ret < 0) {
+		dev_err(dev, "Invalid gpio spec 0\n");
+		goto err_nce;
+	} else {
+		of_gpio_nand->gpio_nce = ret;
+		ret = gpio_request(of_gpio_nand->gpio_nce, ofdev->node->name);
+		if (ret) {
+			dev_err(dev, "Requesting gpio %d failed\n",
+				of_gpio_nand->gpio_nce);
+			goto err_nce;
+		}
+		gpio_direction_output(of_gpio_nand->gpio_nce, 1);
+	}
+
+	/* CLE */
+	ret = of_get_gpio(ofdev->node, 1);
+	if (ret < 0) {
+		dev_err(dev, "Invalid gpio spec 1\n");
+		goto err_cle;
+	} else {
+		of_gpio_nand->gpio_cle = ret;
+		ret = gpio_request(of_gpio_nand->gpio_cle, ofdev->node->name);
+		if (ret) {
+			dev_err(dev, "Requesting gpio %d failed\n",
+				of_gpio_nand->gpio_cle);
+			goto err_cle;
+		}
+		gpio_direction_output(of_gpio_nand->gpio_cle, 0);
+	}
+
+	/* ALE */
+	ret = of_get_gpio(ofdev->node, 2);
+	if (ret < 0) {
+		dev_err(dev, "Invalid gpio spec 2\n");
+		goto err_ale;
+	} else {
+		of_gpio_nand->gpio_ale = ret;
+		ret = gpio_request(of_gpio_nand->gpio_ale, ofdev->node->name);
+		if (ret) {
+			dev_err(dev, "Requesting gpio %d failed\n",
+				of_gpio_nand->gpio_ale);
+			goto err_ale;
+		}
+		gpio_direction_output(of_gpio_nand->gpio_ale, 0);
+	}
+
+	/* RDY */
+	ret = of_get_gpio(ofdev->node, 3);
+	if (ret < 0) {
+		dev_err(dev, "Invalid gpio spec 3\n");
+		goto err_rdy;
+	} else {
+		of_gpio_nand->gpio_rdy = ret;
+		ret = gpio_request(of_gpio_nand->gpio_rdy, ofdev->node->name);
+		if (ret) {
+			dev_err(dev, "Requesting gpio %d failed\n",
+				of_gpio_nand->gpio_rdy);
+			goto err_rdy;
+		}
+		gpio_direction_input(of_gpio_nand->gpio_rdy);
+	}
+
+	ret = of_gpio_nand_chip_init(of_gpio_nand, ofdev->node);
+	if (ret == 0)
+		return 0;
+
+	gpio_free(of_gpio_nand->gpio_rdy);
+err_rdy:
+	gpio_free(of_gpio_nand->gpio_ale);
+err_ale:
+	gpio_free(of_gpio_nand->gpio_cle);
+err_cle:
+	gpio_free(of_gpio_nand->gpio_nce);
+err_nce:
+	iounmap(of_gpio_nand->base);
+
+	return ret;
+}
+
+static int __devexit of_gpio_nand_remove(struct of_device *ofdev)
+{
+	struct of_gpio_nand_controller *of_gpio_nand =
+		dev_get_drvdata(&ofdev->dev);
+
+	nand_release(&of_gpio_nand->mtd);
+
+	gpio_free(of_gpio_nand->gpio_rdy);
+	gpio_free(of_gpio_nand->gpio_ale);
+	gpio_free(of_gpio_nand->gpio_cle);
+	gpio_free(of_gpio_nand->gpio_nce);
+	iounmap(of_gpio_nand->base);
+
+	return 0;
+}
+
+static const struct of_device_id of_gpio_nand_match[] = {
+	{ .compatible = "gpio-nand", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_gpio_nand_match);
+
+static struct of_platform_driver of_gpio_nand_driver = {
+	.driver = {
+		.name	= "of_gpio_nand",
+	},
+	.match_table = of_gpio_nand_match,
+	.probe = of_gpio_nand_probe,
+	.remove = __devexit_p(of_gpio_nand_remove),
+};
+
+static int __init of_gpio_nand_init(void)
+{
+	return of_register_platform_driver(&of_gpio_nand_driver);
+}
+
+static void __exit of_gpio_nand_exit(void)
+{
+	of_unregister_platform_driver(&of_gpio_nand_driver);
+}
+
+module_init(of_gpio_nand_init);
+module_exit(of_gpio_nand_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Matthias Fuchs <matthias.fuchs@esd-electronics.com>");
+MODULE_DESCRIPTION("Open Firmware GPIO NAND Driver");
-- 
1.5.6.3
