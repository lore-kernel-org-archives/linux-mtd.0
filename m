Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LHQ05-0006qk-2H
	for linux-mtd@lists.infradead.org; Mon, 29 Dec 2008 21:50:14 +0000
Date: Mon, 29 Dec 2008 21:50:06 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC 1/3] [MTD] NAND: common driver for ts78xx/ts72xx platforms
Message-ID: <20081229215006.GG3381@woodchuck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH RFC] [MTD] NAND: common driver support for NAND in TS-7800 and TS-72X0

Common driver that both platforms, the ts78xx.c and ts7200.c, can use to 
access the NAND.  All the platform specific bits (such as IO addresses 
and partitioning schemes) live in the platform code.

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
---
 drivers/mtd/nand/Kconfig   |    6 +
 drivers/mtd/nand/Makefile  |    1 +
 drivers/mtd/nand/ts7xxx.c  |  334 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/ts7xxx.h |   35 +++++
 4 files changed, 376 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/nand/ts7xxx.c
 create mode 100644 include/linux/mtd/ts7xxx.h

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f8ae040..c1f3014 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -80,6 +80,12 @@ config MTD_NAND_TS7250
 	help
 	  Support for NAND flash on Technologic Systems TS-7250 platform.
 
+config MTD_NAND_TS7XXX
+	tristate "NAND Flash device on TS-7xxx boards"
+	depends on MACH_TS72XX || MACH_TS78XX
+	help
+	  Support for NAND flash on Technologic Systems TS-7xxx platforms.
+
 config MTD_NAND_IDS
 	tristate
 
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index b661586..68694c7 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_MTD_NAND_H1900)		+= h1910.o
 obj-$(CONFIG_MTD_NAND_RTC_FROM4)	+= rtc_from4.o
 obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
 obj-$(CONFIG_MTD_NAND_TS7250)		+= ts7250.o
+obj-$(CONFIG_MTD_NAND_TS7XXX)		+= ts7xxx.o
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
 obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
diff --git a/drivers/mtd/nand/ts7xxx.c b/drivers/mtd/nand/ts7xxx.c
new file mode 100644
index 0000000..220eec9
--- /dev/null
+++ b/drivers/mtd/nand/ts7xxx.c
@@ -0,0 +1,334 @@
+/*
+ * drivers/mtd/nand/ts7xxx.c
+ *
+ * Copyright (C) 2008 Alexander Clouter (alex@digriz.org.uk)
+ *
+ * Derived from drivers/mtd/nand/ts7250.c
+ *   Copyright (C) 2004 Technologic Systems (support@embeddedARM.com)
+ *
+ * More information of course gleaned from Technologic Systems driver
+ * in their supplied kernel drivers/mtd/nand/ts7800.c and
+ * ts-7800-nand-regmap.txt; of course also the existing ts7250.c driver
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Overview:
+ *   This is a device driver for the NAND flash device found on the TS-7xxx
+ *   board ranges.  DMA and HW ECC support is only available on the TS-78xx
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/ts7xxx.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <asm/mach-types.h>
+
+/* needed for board_is_ts7200() */
+#ifdef CONFIG_MACH_TS72XX
+#include <mach/hardware.h>
+#endif
+
+/*
+ * MTD structure for TS7xxx board
+ */
+static struct mtd_info *ts7xxx_mtd;
+
+static struct ts7xxx_nand_data *ts7xxx_nand_data;
+static void __iomem **ts7xxx_iobase;
+static void __iomem *ts7xxx_ioctrl;
+static void __iomem *ts7xxx_iodata;
+static void __iomem *ts7xxx_iobusy;
+
+/*
+ * hardware specific access to control-lines
+ *
+ * ctrl:
+ * NAND_NCE: bit 0 -> bit 2
+ * NAND_CLE: bit 1 -> bit 1
+ * NAND_ALE: bit 2 -> bit 0
+ */
+static void ts7xxx_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
+{
+	struct nand_chip *this = mtd->priv;
+
+	if (ctrl & NAND_CTRL_CHANGE) {
+		unsigned char bits;
+
+		bits = (ctrl & NAND_NCE) << 2;
+		bits |= ctrl & NAND_CLE;
+		bits |= (ctrl & NAND_ALE) >> 2;
+
+		writeb((readb(ts7xxx_ioctrl) & ~0x7) | bits, ts7xxx_ioctrl);
+	}
+
+	if (cmd != NAND_CMD_NONE)
+		writeb(cmd, this->IO_ADDR_W);
+}
+
+static int ts7xxx_device_ready(struct mtd_info *mtd)
+{
+	return readb(ts7xxx_iobusy) & 0x20;
+}
+
+#ifdef CONFIG_MACH_TS78XX
+/*
+ * The HW ECC offloading functions, gives about a 9% performance increase
+ * for 'dd if=/dev/mtdblockX' and 5% for nanddump.
+ */
+static void ts7xxx_enable_hwecc(struct mtd_info *mtd, int mode)
+{
+	unsigned int ecc;
+
+	/* we loop as the FIFO might need emptying */
+	do {
+		ecc = readl(ts7xxx_ioctrl);
+		writel(ecc | 0x8, ts7xxx_ioctrl);
+	} while ((ecc & 0x18) != 0x18);
+}
+
+static int ts7xxx_calculate_ecc(struct mtd_info *mtd, const uint8_t *dat,
+				uint8_t *ecc_code)
+{
+	unsigned int i, ecc;
+
+	for (i = 0; i < 8; i++) {
+		/*
+		 * TS told me that their HW ECC implementation spits out on the
+		 * 22 LSB's and not the MSB's which is why we right shift
+		 * trimming the top and not the bottom!
+		 */
+		ecc = (readl(ts7xxx_ioctrl) >> 6) | 0x03;
+
+		*ecc_code++ = (ecc >> 16) & 0xff;
+		*ecc_code++ = (ecc >>  8) & 0xff;
+		*ecc_code++ = (ecc >>  0) & 0xff;
+	};
+
+	return 0;
+}
+
+static int ts7xx_correct_data(struct mtd_info *mtd, uint8_t *dat,
+				uint8_t *read_ecc, uint8_t *calc_ecc)
+{
+	int ret = 0;
+	unsigned int i;
+
+	for (i = 0; i < 8; i++) {
+		ret |= nand_correct_data(mtd, dat + (256 * i),
+						&read_ecc[i * 3],
+						&calc_ecc[i * 3]);
+	}
+
+	return ret;
+}
+#endif
+
+static void ts7xxx_nand_cleanup(struct platform_device *pdev)
+{
+	unsigned int i;
+
+	for (i = 0; i < pdev->num_resources; i++) {
+		if (ts7xxx_iobase[i])
+			iounmap(ts7xxx_iobase[i]);
+	}
+	kfree(ts7xxx_iobase);
+	kfree(ts7xxx_mtd);
+}
+
+/*
+ * Main initialization routine
+ */
+static int __devinit ts7xxx_nand_probe(struct platform_device *pdev)
+{
+	struct nand_chip *this;
+	unsigned int i;
+	struct ts7xxx_nand_data	*(*ts7xxx_nand_data_func)(unsigned int)
+						= pdev->dev.platform_data;
+#ifdef CONFIG_MTD_PARTITIONS
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	static const char *part_probes[] = { "cmdlinepart", NULL };
+#endif
+	struct mtd_partition *mtd_parts = NULL;
+	int mtd_parts_nb = 0;
+	const char *part_type = NULL;
+#endif
+
+#ifdef CONFIG_MACH_TS72XX
+	if (!machine_is_ts72xx() || board_is_ts7200())
+		return -ENXIO;
+#endif
+#ifdef CONFIG_MACH_TS78XX
+	if (!machine_is_ts78xx())
+		return -ENXIO;
+#endif
+
+	/* Allocate memory for MTD device structure and private data */
+	ts7xxx_mtd = kmalloc(sizeof(struct mtd_info)
+					+ sizeof(struct nand_chip),
+				GFP_KERNEL);
+	if (!ts7xxx_mtd) {
+		printk(KERN_ERR "Unable to allocate TS7xxx NAND "
+				"MTD device structure.\n");
+		return -ENOMEM;
+	}
+
+	/*
+	 * this is runtime as we do not know the size of the NAND, and thus
+	 * its partitioning scheme, until we scan it here
+	 *
+	 * N.B. we use a dummy size of zero to get the currently useful info
+	 */
+	ts7xxx_nand_data = (*ts7xxx_nand_data_func)(0);
+
+	ts7xxx_iobase = kmalloc(pdev->num_resources * sizeof(void __iomem *),
+					GFP_KERNEL);
+	if (!ts7xxx_iobase) {
+		printk(KERN_ERR "ts7xxx: Unable to allocate ioremap array.\n");
+		kfree(ts7xxx_mtd);
+		return -ENOMEM;
+	}
+	memset(ts7xxx_iobase, 0, pdev->num_resources * sizeof(void __iomem *));
+
+	for (i = 0; i < pdev->num_resources; i++) {
+		ts7xxx_iobase[i] = ioremap(pdev->resource[i].start,
+					pdev->resource[i].end
+						- pdev->resource[i].start + 1);
+		if (!ts7xxx_iobase[i]) {
+			printk(KERN_ERR "ts7xxx: ioremap failed\n");
+			ts7xxx_nand_cleanup(pdev);
+			return -EIO;
+		}
+	}
+
+	ts7xxx_ioctrl = ts7xxx_iobase[ts7xxx_nand_data->ioports.ctrl.res]
+				+ ts7xxx_nand_data->ioports.ctrl.offset;
+	ts7xxx_iodata = ts7xxx_iobase[ts7xxx_nand_data->ioports.data.res]
+				+ ts7xxx_nand_data->ioports.data.offset;
+	ts7xxx_iobusy = ts7xxx_iobase[ts7xxx_nand_data->ioports.busy.res]
+				+ ts7xxx_nand_data->ioports.busy.offset;
+
+	/* Get pointer to private data */
+	this = (struct nand_chip *)(&ts7xxx_mtd[1]);
+
+	/* Initialize structures */
+	memset(ts7xxx_mtd, 0, sizeof(struct mtd_info));
+	memset(this, 0, sizeof(struct nand_chip));
+
+	/* Link the private data with the MTD structure */
+	ts7xxx_mtd->priv = this;
+	ts7xxx_mtd->owner = THIS_MODULE;
+
+	/* insert callbacks */
+	this->IO_ADDR_R = this->IO_ADDR_W = ts7xxx_iodata;
+	this->cmd_ctrl = ts7xxx_hwcontrol;
+	this->dev_ready = ts7xxx_device_ready;
+	this->chip_delay = 15;
+
+	do {
+		this->ecc.mode = NAND_ECC_SOFT;
+
+#ifdef CONFIG_MACH_TS78XX
+		if (!machine_is_ts78xx()) {
+			this->options = NAND_USE_FLASH_BBT;
+			this->ecc.mode = NAND_ECC_HW;
+			/* the HW ECC has an eight entry FIFO */
+			this->ecc.size = 8 * 256;
+			this->ecc.bytes = 8 * 3;
+			this->ecc.hwctl  = ts7xxx_enable_hwecc;
+			this->ecc.calculate = ts7xxx_calculate_ecc;
+			this->ecc.correct  = ts7xx_correct_data;
+			break;
+		}
+#endif
+	} while (0);
+
+	printk(KERN_NOTICE "Searching for NAND flash...\n");
+	/* Scan to find existence of the device */
+	if (nand_scan(ts7xxx_mtd, 1)) {
+		ts7xxx_nand_cleanup(pdev);
+		return -ENODEV;
+	}
+
+#ifdef CONFIG_MTD_PARTITIONS
+	ts7xxx_mtd->name = "ts7xxx-nand";
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	mtd_parts_nb = parse_mtd_partitions(ts7xxx_mtd,
+						part_probes, &mtd_parts, 0);
+	if (mtd_parts_nb > 0)
+		part_type = "command line";
+	else
+		mtd_parts_nb = 0;
+#endif
+
+	if (mtd_parts_nb == 0) {
+		/*
+		 * ...and now we can use size to find the partitioning scheme
+		 */
+		ts7xxx_nand_data = (*ts7xxx_nand_data_func)(ts7xxx_mtd->size);
+
+		if (ts7xxx_nand_data->partitions == NULL) {
+			printk(KERN_ERR
+				"ts7xxx_nand: unsupported NAND size, received "
+				"no paritioning scheme from platform\n");
+			ts7xxx_nand_cleanup(pdev);
+			/* FIXME: is this the most suitable return value? */
+			return -ENXIO;
+		}
+
+		mtd_parts = ts7xxx_nand_data->partitions;
+		mtd_parts_nb = ts7xxx_nand_data->nr_partitions;
+		part_type = "static";
+	}
+
+	/* Register the partitions */
+	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
+	add_mtd_partitions(ts7xxx_mtd, mtd_parts, mtd_parts_nb);
+#endif
+
+	/* Return happy */
+	return 0;
+}
+
+static int __devexit ts7xxx_nand_remove(struct platform_device *pdev)
+{
+#ifdef CONFIG_MTD_PARTITIONS
+	del_mtd_partitions(ts7xxx_mtd);
+#endif
+	ts7xxx_nand_cleanup(pdev);
+
+	return 0;
+}
+
+/* driver device registration */
+static struct platform_driver ts7xxx_nand_driver = {
+	.driver		= {
+		.name	= "ts7xxx_nand",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= ts7xxx_nand_probe,
+	.remove		= __devexit_p(ts7xxx_nand_remove),
+};
+
+static int __init ts7xxx_nand_init(void)
+{
+	return platform_driver_register(&ts7xxx_nand_driver);
+}
+
+static void __exit ts7xxx_nand_exit(void)
+{
+	platform_driver_unregister(&ts7xxx_nand_driver);
+}
+
+MODULE_AUTHOR("Alexander Clouter <alex@digriz.org.uk>");
+MODULE_DESCRIPTION("MTD NAND driver for Technologic Systems TS-7xxx boards");
+MODULE_LICENSE("GPL");
+
+module_init(ts7xxx_nand_init);
+module_exit(ts7xxx_nand_exit);
diff --git a/include/linux/mtd/ts7xxx.h b/include/linux/mtd/ts7xxx.h
new file mode 100644
index 0000000..955209a
--- /dev/null
+++ b/include/linux/mtd/ts7xxx.h
@@ -0,0 +1,35 @@
+/*
+ * linux/include/linux/mtd/ts7xxx.h
+ *
+ * Copyright (c) 2008 Alexander Clouter <alex@digriz.org.uk>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/mtd/partitions.h>
+
+struct ts7xxx_ioport_entry {
+	unsigned int			res;
+	unsigned int			offset;
+};
+
+struct ts7xxx_ioports {
+	struct ts7xxx_ioport_entry	ctrl;
+	struct ts7xxx_ioport_entry	data;
+
+	struct ts7xxx_ioport_entry	busy;
+};
+
+/*
+ * struct ts7xxx_nand_data - chip level device structure
+ * @nr_partitions:	number of partitions pointed to by partitions (or zero)
+ * @partitions:		mtd partition list
+ */
+struct ts7xxx_nand_data {
+	int				nr_partitions;
+	struct mtd_partition		*partitions;
+
+	struct ts7xxx_ioports		ioports;
+};
-- 
1.5.6.5
