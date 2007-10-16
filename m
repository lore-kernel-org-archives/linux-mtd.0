Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IhvYk-00035C-IR
	for linux-mtd@lists.infradead.org; Tue, 16 Oct 2007 19:10:51 -0400
Date: Wed, 17 Oct 2007 01:10:40 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH,RFC] driver for Marvell Orion device bus NAND controller
Message-ID: <20071016231040.GB21441@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: tzachi@marvell.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Attached is a driver for the device bus NAND controller in
the Marvell Orion family of ARM SoCs.

Signed-off-by: Tzachi Perelstein <tzachi@marvell.com>
Signed-off-by: Lennert Buytenhek <buytenh@marvell.com>


Index: linux-2.6.22.1-orion.3.3/drivers/mtd/nand/Kconfig
===================================================================
--- linux-2.6.22.1-orion.3.3.orig/drivers/mtd/nand/Kconfig
+++ linux-2.6.22.1-orion.3.3/drivers/mtd/nand/Kconfig
@@ -280,5 +280,13 @@ config MTD_NAND_PLATFORM
 	  devices. You will need to provide platform-specific functions
 	  via platform_data.
 
+config MTD_NAND_ORION
+	tristate "NAND Flash support for Marvell Orion SoC"
+	depends on ARCH_ORION && MTD_NAND
+	help
+	  This enables the NAND flash controller on Orion machines.
+
+	  No board specific support is done by this driver, each board
+	  must advertise a platform_device for the driver to attach.
 
 endif # MTD_NAND
Index: linux-2.6.22.1-orion.3.3/drivers/mtd/nand/Makefile
===================================================================
--- linux-2.6.22.1-orion.3.3.orig/drivers/mtd/nand/Makefile
+++ linux-2.6.22.1-orion.3.3/drivers/mtd/nand/Makefile
@@ -27,5 +27,6 @@ obj-$(CONFIG_MTD_NAND_AT91)		+= at91_nan
 obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
 obj-$(CONFIG_MTD_NAND_BASLER_EXCITE)	+= excite_nandflash.o
 obj-$(CONFIG_MTD_NAND_PLATFORM)		+= plat_nand.o
+obj-$(CONFIG_MTD_NAND_ORION)		+= orion_nand.o
 
 nand-objs := nand_base.o nand_bbt.o
Index: linux-2.6.22.1-orion.3.3/drivers/mtd/nand/orion_nand.c
===================================================================
--- /dev/null
+++ linux-2.6.22.1-orion.3.3/drivers/mtd/nand/orion_nand.c
@@ -0,0 +1,171 @@
+/*
+ * drivers/mtd/nand/orion_nand.c
+ *
+ * NAND support for Marvell Orion SoC platforms
+ *
+ * Tzachi Perelstein <tzachi@marvell.com>
+ *
+ * This file is licensed under  the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <asm/io.h>
+#include <asm/sizes.h>
+#include <asm/arch/platform.h>
+#include <asm/arch/hardware.h>
+
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+static const char *part_probes[] = { "cmdlinepart", NULL };
+#endif
+
+static void orion_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
+{
+	struct nand_chip *nc = mtd->priv;
+	struct orion_nand_data *board = nc->priv;
+	u32 offs;
+
+	if (cmd == NAND_CMD_NONE)
+		return;
+
+	if (ctrl & NAND_CLE)
+		offs = (1 << board->cle);
+	else if (ctrl & NAND_ALE)
+		offs = (1 << board->ale);
+	else
+		return;
+
+	if (nc->options & NAND_BUSWIDTH_16)
+		offs <<= 1;
+
+	writeb(cmd, nc->IO_ADDR_W + offs);
+}
+
+static int __init orion_nand_probe(struct platform_device *pdev)
+{
+	struct mtd_info *mtd;
+	struct nand_chip *nc;
+	struct orion_nand_data *board;
+	void __iomem *io_base;
+	int ret = 0;
+#ifdef CONFIG_MTD_PARTITIONS
+	struct mtd_partition *partitions = NULL;
+	int num_part = 0;
+#endif
+
+	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
+	if (!nc) {
+		printk(KERN_ERR "orion_nand: failed to allocate device structure.\n");
+		ret = -ENOMEM;
+		goto no_res;
+	}
+	mtd = (struct mtd_info *)(nc + 1);
+
+	io_base = ioremap(pdev->resource[0].start,
+			pdev->resource[0].end - pdev->resource[0].start + 1);
+	if (!io_base) {
+		printk(KERN_ERR "orion_nand: ioremap failed\n");
+		ret = -EIO;
+		goto no_res;
+	}
+
+	board = pdev->dev.platform_data;
+
+	mtd->priv = nc;
+	mtd->owner = THIS_MODULE;
+
+	nc->priv = board;
+	nc->IO_ADDR_R = nc->IO_ADDR_W = io_base;
+	nc->cmd_ctrl = orion_nand_cmd_ctrl;
+	nc->ecc.mode = NAND_ECC_SOFT;
+
+	if (board->width == 16)
+		nc->options |= NAND_BUSWIDTH_16;
+
+	platform_set_drvdata(pdev, mtd);
+
+	if (nand_scan(mtd, 1)) {
+		ret = -ENXIO;
+		goto no_dev;
+	}
+
+#ifdef CONFIG_MTD_PARTITIONS
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	mtd->name = "orion_nand";
+	num_part = parse_mtd_partitions(mtd, part_probes, &partitions, 0);
+#endif
+	/* If cmdline partitions have been passed, let them be used */
+	if (num_part <= 0) {
+		num_part = board->nr_parts;
+		partitions = board->parts;
+	}
+
+	if (partitions && num_part > 0)
+		ret = add_mtd_partitions(mtd, partitions, num_part);
+	else
+		ret = add_mtd_device(mtd);
+#else
+	ret = add_mtd_device(mtd);
+#endif
+
+	if (ret) {
+		nand_release(mtd);
+		goto no_dev;
+	}
+
+	return 0;
+
+no_dev:
+	platform_set_drvdata(pdev, NULL);
+	iounmap(io_base);
+no_res:
+	kfree(nc);
+
+	return ret;
+}
+
+static int __devexit orion_nand_remove(struct platform_device *pdev)
+{
+	struct mtd_info *mtd = platform_get_drvdata(pdev);
+	struct nand_chip *nc = mtd->priv;
+
+	nand_release(mtd);
+
+	iounmap(nc->IO_ADDR_W);
+
+	kfree(nc);
+
+	return 0;
+}
+
+static struct platform_driver orion_nand_driver = {
+	.probe		= orion_nand_probe,
+	.remove		= orion_nand_remove,
+	.driver		= {
+		.name	= "orion_nand",
+		.owner	= THIS_MODULE,
+	},
+};
+
+static int __init orion_nand_init(void)
+{
+	return platform_driver_register(&orion_nand_driver);
+}
+
+static void __exit orion_nand_exit(void)
+{
+	platform_driver_unregister(&orion_nand_driver);
+}
+
+module_init(orion_nand_init);
+module_exit(orion_nand_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Tzachi Perelstein");
+MODULE_DESCRIPTION("NAND glue for Orion platforms");
