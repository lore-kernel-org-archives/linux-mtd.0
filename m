Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HeTtI-0006rR-6e
	for linux-mtd@lists.infradead.org; Thu, 19 Apr 2007 06:29:35 -0400
Received: from mephisto.spb.rtsoft.ru (unknown [10.149.0.1])
	by buildserver.ru.mvista.com (Postfix) with ESMTP id AF6928810
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Apr 2007 15:29:26 +0500 (SAMST)
Message-ID: <46274486.9030609@ru.mvista.com>
Date: Thu, 19 Apr 2007 14:29:26 +0400
From: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] NAND Flash support for Intel IXP4xx platform
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch adds glue logic to support MTD for NAND flash devices on Intel 
IXP4xx based platform

Signed-off-by: rsushko@ru.mvista.com

-----

Index: linux-2.6/drivers/mtd/nand/Kconfig
===================================================================
--- linux-2.6.orig/drivers/mtd/nand/Kconfig
+++ linux-2.6/drivers/mtd/nand/Kconfig
@@ -143,6 +143,13 @@ config MTD_NAND_S3C2410_CLKSTOP
 	  when the is NAND chip selected or released, but will save
 	  approximately 5mA of power when there is nothing happening.
 
+config MTD_NAND_IXP4XX
+	tristate "Support for NAND Flash on Intel IXP4XX based systems"
+	depends on MTD_NAND && ARCH_IXP4XX
+	help
+	  This enable the use of NAND flash on Intel IXP400 based platforms.
+	  Currently this is only supported on KIXRP435 platform.
+
 config MTD_NAND_DISKONCHIP
 	tristate "DiskOnChip 2000, Millennium and Millennium Plus (NAND reimplementation) (EXPERIMENTAL)"
 	depends on MTD_NAND && EXPERIMENTAL
Index: linux-2.6/drivers/mtd/nand/Makefile
===================================================================
--- linux-2.6.orig/drivers/mtd/nand/Makefile
+++ linux-2.6/drivers/mtd/nand/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
 obj-$(CONFIG_MTD_NAND_AT91)		+= at91_nand.o
 obj-$(CONFIG_MTD_NAND_BASLER_EXCITE)	+= excite_nandflash.o
+obj-$(CONFIG_MTD_NAND_IXP4XX)		+= ixp4xx_nand.o
 
 nand-objs := nand_base.o nand_bbt.o
 cafe_nand-objs := cafe.o cafe_ecc.o
Index: linux-2.6/drivers/mtd/nand/ixp4xx_nand.c
===================================================================
--- /dev/null
+++ linux-2.6/drivers/mtd/nand/ixp4xx_nand.c
@@ -0,0 +1,221 @@
+/*
+ *  drivers/mtd/nand/ixp4xx_nand.c
+ *
+ *  Copyright (C) 2006 Intel Corporation.
+ *  Copyright (C) 2007 MontaVista Software, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/io.h>
+#include <asm/arch/nand.h>
+#include <asm/hardware.h>
+#include <asm/delay.h>
+
+/*
+ * MTD structure for NAND controller
+ */
+static struct mtd_info *ixp4xx_mtd = NULL;
+static struct mtd_partition *ixp4xx_nand_parts = NULL;
+const char *part_probes[] = { "cmdlinepart", NULL };
+
+static struct ixp4xx_faddr_t {
+	int offset;
+	void (*chip_select)(unsigned int ctrl);
+} ixp4xx_faddr_info = {0, NULL};
+
+/**
+ * ixp_write_buf -  write buffer to chip
+ * @mtd:	MTD device structure
+ * @buf:	data buffer
+ * @len:	number of bytes to write
+ *
+ *  write function for 8bit buswith
+ */
+static void ixp_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
+{
+    int i;
+    struct nand_chip *this = mtd->priv;
+    struct ixp4xx_faddr_t *addr_info = this->priv;
+
+    for ( i = 0 ; i < len ; i++ )
+        writeb(buf[i], this->IO_ADDR_W + addr_info->offset);
+}
+
+static void
+ixp4xx_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
+{
+	struct nand_chip *this = mtd->priv;
+	struct ixp4xx_faddr_t *addr_info = this->priv;
+	if (ctrl & NAND_CTRL_CHANGE) {
+		addr_info->offset  = (ctrl & NAND_CLE) ? 1 : 0;
+		addr_info->offset |= (ctrl & NAND_ALE) ? 2 : 0;
+		if (addr_info->chip_select)
+			addr_info->chip_select(ctrl);
+	}
+
+	if (cmd != NAND_CMD_NONE)
+		writeb(cmd, this->IO_ADDR_W + addr_info->offset);
+}
+
+static int
+ixp4xx_nand_flash_probe(struct platform_device *dev)
+{
+	int err;
+	int nb_of_parts;
+	struct nand_chip *this;
+	void __iomem *nand_io_base;
+	struct ixp4xx_nand_platform_data *plat = dev->dev.platform_data;
+
+	if (!plat)
+		return -ENODEV;
+
+	if (plat->width != 1) {
+		printk(KERN_ERR "%s: %d bits bus width is not support for "
+				"ixp4xx driver\n", __FUNCTION__, plat->width * 8);
+		return -EINVAL;
+	}
+
+	if (plat->init) {
+		err = plat->init();
+		if (err)
+			return err;
+	}
+
+	/* Allocate memory for MTD device structure and private data */
+	ixp4xx_mtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip),
+    			 GFP_KERNEL);
+
+	if (ixp4xx_mtd == NULL)  {
+		printk (KERN_ERR "Fail on mem alloc for NAND MTD dev\n");
+		return -ENOMEM;
+	}
+
+	/* Initialize structures and build the linkage to private data */
+	memset(ixp4xx_mtd, 0, sizeof(struct mtd_info)+sizeof(struct nand_chip));
+	this = (struct nand_chip *)(&ixp4xx_mtd[1]);
+
+	ixp4xx_mtd->priv  = this;
+
+	ixp4xx_mtd->owner = THIS_MODULE;
+	ixp4xx_mtd->name  = "ixp4xx-nand";
+
+	/* ioremap the io of NAND Flash */
+	nand_io_base = ioremap(dev->resource->start,
+				 dev->resource->end - dev->resource->start + 1);
+	if (!nand_io_base) {
+		printk (KERN_ERR "Unable to map nand flash IO space\n");
+		err = -EIO;
+		goto error;
+	}
+
+	ixp4xx_faddr_info.offset = 0;
+	ixp4xx_faddr_info.chip_select = plat->chip_select;
+
+	/* Set address of hardware control function */
+	this->cmd_ctrl	 = ixp4xx_hwcontrol;
+	this->dev_ready  = NULL;/* KIXRP435 has no GPIO pins route to R/B */
+	this->chip_delay = 30;	/* 30 us command delay time */
+	this->ecc.mode   = NAND_ECC_SOFT;
+	this->options    = NAND_NO_AUTOINCR;
+	this->IO_ADDR_R  = nand_io_base;
+	this->IO_ADDR_W  = nand_io_base;
+	this->priv	 = &ixp4xx_faddr_info;
+	this->write_buf  = ixp_write_buf;
+
+	/* Scan to find existence of the device */
+	if (nand_scan(ixp4xx_mtd, 1)) {
+		err = -ENXIO;
+		goto error;
+	}
+
+	nb_of_parts = parse_mtd_partitions(ixp4xx_mtd, part_probes,
+						&ixp4xx_nand_parts, 0);
+
+	if ( nb_of_parts <= 0 )  { /* No partition from parsing, use default */
+		printk(KERN_INFO "Loading default partition table\n");
+		ixp4xx_nand_parts = plat->parts;
+		nb_of_parts = plat->nr_parts;
+	}
+
+	/* Register the partitions */
+	err = add_mtd_partitions(ixp4xx_mtd, ixp4xx_nand_parts, nb_of_parts);
+	if (err)  {
+		printk(KERN_ERR "Failed to add MTD partitions\n");
+		if ( ixp4xx_nand_parts != plat->parts )
+		kfree(ixp4xx_nand_parts);
+		goto error;
+	}
+	return 0;
+
+error:
+	if (nand_io_base)
+		iounmap ((void *)nand_io_base);
+
+	if(ixp4xx_mtd)
+		kfree (ixp4xx_mtd);
+	return err;
+}
+
+static int
+ixp4xx_nand_flash_remove(struct platform_device *dev)
+{
+	struct ixp4xx_nand_platform_data *plat = dev->dev.platform_data;
+	struct nand_chip *this = (struct nand_chip *)&ixp4xx_mtd[1];
+
+	if (plat->exit)
+		plat->exit();
+
+	/* Unmap IO */
+	iounmap((void *)this->IO_ADDR_W);
+
+	/* Release resources, unregister device */
+	nand_release(ixp4xx_mtd);
+
+	/* Free the MTD device structure */
+	kfree(ixp4xx_mtd);
+
+	/* Free the parsed partition table */
+	if (ixp4xx_nand_parts != plat->parts)
+		kfree(ixp4xx_nand_parts);
+	return 0;
+}
+
+static struct platform_driver ixp4xx_nand_flash_driver = {
+	.probe		= ixp4xx_nand_flash_probe,
+	.remove		= ixp4xx_nand_flash_remove,
+	.driver		= {
+		.name	= "IXP4XX-NAND-Flash",
+	},
+};
+
+static int __init ixp4xx_nand_flash_init(void)
+{
+	return platform_driver_register(&ixp4xx_nand_flash_driver);
+}
+
+static void __exit ixp4xx_nand_flash_exit(void)
+{
+	platform_driver_unregister(&ixp4xx_nand_flash_driver);
+}
+
+module_init(ixp4xx_nand_flash_init);
+module_exit(ixp4xx_nand_flash_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION("Board-specific glue layer for NAND flash on "
+		   "IXP4xx-based platform");
+
