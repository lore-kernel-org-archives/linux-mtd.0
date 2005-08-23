Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7SvN-0002ax-JK
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 03:10:26 -0400
Received: from ep_mmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ILN00A1HYIA5T@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 16:08:34 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0ILN0001AYI96E@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 16:08:34 +0900 (KST)
Date: Tue, 23 Aug 2005 16:08:35 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <0ILN0001CYIA6E@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Cc: tglx@linutronix.de
Subject: [PATCH] OneNAND: Update OMAP OneNAND mapping using device driver
	model
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Update OMAP OneNAND mapping file using device driver model
Remove board specific macro and values.

Any comments are welcome.

Regards

Kyungmin Park

--

diff --git a/drivers/mtd/onenand/omap-onenand.c
b/drivers/mtd/onenand/omap-onenand.c
--- a/drivers/mtd/onenand/omap-onenand.c
+++ b/drivers/mtd/onenand/omap-onenand.c
@@ -4,236 +4,143 @@
  *  Copyright (c) 2005 Samsung Electronics
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *
- *  Derived from linux/drivers/mtd/nand/omap-nand-flash.c
- *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  *
  *  Overview:
- *   This is a device driver for the OneNAND flash device for TI OMAP
boards.
+ *   This is a device driver for the OneNAND flash for OMAP boards.
  */
 
-#include <linux/slab.h>
-#include <linux/init.h>
+#include <linux/device.h>
 #include <linux/module.h>
+#include <linux/init.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/onenand.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/io.h>
-#include <asm/arch/hardware.h>
-#include <asm/arch/tc.h>
-#include <asm/sizes.h>
-#include <asm/mach-types.h>
-
-#define OMAP_ONENAND_FLASH_START1	OMAP_CS2A_PHYS
-#define OMAP_ONENAND_FLASH_START2	omap_cs3_phys()
-/*
- * MTD structure for OMAP board
- */
-static struct mtd_info *omap_onenand_mtd = NULL;
+#include <asm/mach/flash.h>
 
-/*
- * Define partitions for flash devices
- */
+#define DRIVER_NAME	"onenand"
 
-#ifdef CONFIG_MTD_PARTITIONS
-static struct mtd_partition static_partition[] = {
-	{
-		.name		= "X-Loader + U-Boot",
-		.offset		= 0,
-		.size		= SZ_128K,
-		.mask_flags	= MTD_WRITEABLE	/* force read-only */
- 	},
-	{
-		.name		= "U-Boot Environment",
-		.offset		= MTDPART_OFS_APPEND,
-		.size		= SZ_128K,
-		.mask_flags	= MTD_WRITEABLE	/* force read-only */
- 	},
-	{
-		.name		= "kernel",
-		.offset		= MTDPART_OFS_APPEND,
-		.size		= 2 * SZ_1M
-	},
-	{
-		.name		= "filesystem0",
-		.offset		= MTDPART_OFS_APPEND,
-		.size		= SZ_16M,
-	},
-	{
-		.name		= "filesystem1",
-		.offset		= MTDPART_OFS_APPEND,
-		.size		= MTDPART_SIZ_FULL,
-	},
-};
 
+#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] = { "cmdlinepart", NULL,  };
-
 #endif
 
-#ifdef CONFIG_MTD_ONENAND_SYNC_READ
-static unsigned int omap_emifs_cs;
-
-static void omap_find_emifs_cs(unsigned int addr)
-{
-	/* Check CS3 */
-	if (OMAP_EMIFS_CONFIG_REG & OMAP_EMIFS_CONFIG_BM && addr == 0x0) {
-		omap_emifs_cs = 3;
-	} else {
-		omap_emifs_cs = (addr >> 26);
-	}
-}
+struct omap_onenand_info {
+	struct mtd_info		mtd;
+	struct mtd_partition	*parts;
+	struct onenand_chip	onenand;
+};
 
-/**
- * omap_onenand_mmcontrol - Control OMAP EMIFS
- */
-static void omap_onenand_mmcontrol(struct mtd_info *mtd, int sync_read)
+static int __devinit omap_onenand_probe(struct device *dev)
 {
-	struct onenand_chip *this = mtd->priv;
-	static unsigned long omap_emifs_ccs, omap_emifs_acs;
-	static unsigned long onenand_sys_cfg1;
-	int config, emifs_ccs, emifs_acs;
-
-	if (sync_read) {
-		/*
-		 * Note: BRL and RDWST is equal
-		 */
-		omap_emifs_ccs = EMIFS_CCS(omap_emifs_cs);
-		omap_emifs_acs = EMIFS_ACS(omap_emifs_cs);
-		
-		emifs_ccs = 0x41141;
-		emifs_acs = 0x1;
-
-		/* OneNAND System Configuration 1 */
-		onenand_sys_cfg1 = this->read_word(this->base +
ONENAND_REG_SYS_CFG1);
-		config = (onenand_sys_cfg1
-			& ~(0x3f << ONENAND_SYS_CFG1_BL_SHIFT))
-			| ONENAND_SYS_CFG1_SYNC_READ
-			| ONENAND_SYS_CFG1_BRL_4
-			| ONENAND_SYS_CFG1_BL_8;
-	} else {
-		emifs_ccs = omap_emifs_ccs;
-		emifs_acs = omap_emifs_acs;
-		config = onenand_sys_cfg1;
+	struct omap_onenand_info *info;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct onenand_platform_data *pdata = pdev->dev.platform_data;
+	struct resource *res = pdev->resource;
+	unsigned long size = res->end - res->start + 1;
+	int err;
+
+	info = kmalloc(sizeof(struct omap_onenand_info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	memset(info, 0, sizeof(struct omap_onenand_info));
+
+	if (!request_mem_region(res->start, size, dev->driver->name)) {
+		err = -EBUSY;
+		goto out_free_info;
 	}
 
-	this->write_word(config, this->base + ONENAND_REG_SYS_CFG1);
-	EMIFS_CCS(omap_emifs_cs) = emifs_ccs;
-	EMIFS_ACS(omap_emifs_cs) = emifs_acs;
-}
-#else
-#define omap_find_emifs_cs(x)		do { } while (0)
-#define omap_onenand_mmcontrol		NULL
-#endif
-
-
-/* Scan to find existance of the device at base.
-   This also allocates oob and data internal buffers */
-static char onenand_name[] = "onenand";
-
-/*
- * Main initialization routine
- */
-static int __init omap_onenand_init (void)
-{
-	struct onenand_chip *this;
-	struct mtd_partition *dynamic_partition = 0;
-	int err = 0;
-
-	/* Allocate memory for MTD device structure and private data */
-	omap_onenand_mtd = kmalloc (sizeof(struct mtd_info) + sizeof (struct
onenand_chip),
-				GFP_KERNEL);
-	if (!omap_onenand_mtd) {
-		printk (KERN_WARNING "Unable to allocate OneNAND MTD device
structure.\n");
+	info->onenand.base = ioremap(res->start, size);
+	if (!info->onenand.base) {
 		err = -ENOMEM;
-		goto out;
+		goto out_release_mem_region;
 	}
 
-	/* Get pointer to private data */
-	this = (struct onenand_chip *) (&omap_onenand_mtd[1]);
+	info->onenand.mmcontrol = pdata->mmcontrol;
 
-	/* Initialize structures */
-	memset((char *) omap_onenand_mtd, 0, sizeof(struct mtd_info) +
sizeof(struct onenand_chip));
+	info->mtd.name = pdev->dev.bus_id;
+	info->mtd.priv = &info->onenand;
+	info->mtd.owner = THIS_MODULE;
 
-	/* Link the private data with the MTD structure */
-	omap_onenand_mtd->priv = this;
-	this->mmcontrol = omap_onenand_mmcontrol;
-
-        /* try the first address */
-	this->base = ioremap(OMAP_ONENAND_FLASH_START1, SZ_128K);
-	omap_find_emifs_cs(OMAP_ONENAND_FLASH_START1);
-
-	omap_onenand_mtd->name = onenand_name;
-	if (onenand_scan(omap_onenand_mtd, 1)){
-		/* try the second address */
-		iounmap(this->base);
-		this->base = ioremap(OMAP_ONENAND_FLASH_START2, SZ_128K);
-		omap_find_emifs_cs(OMAP_ONENAND_FLASH_START2);
-
-		if (onenand_scan(omap_onenand_mtd, 1)) {
-			iounmap(this->base);
-                        err = -ENXIO;
-                        goto out_mtd;
-		}
+	if (onenand_scan(&info->mtd, 1)) {
+		err = -ENXIO;
+		goto out_iounmap;
 	}
 
-	/* Register the partitions */
-	switch (omap_onenand_mtd->size) {
-	case SZ_128M:
-	case SZ_64M:
-	case SZ_32M:
 #ifdef CONFIG_MTD_PARTITIONS
-		err = parse_mtd_partitions(omap_onenand_mtd, part_probes,
-					&dynamic_partition, 0);
-		if (err > 0)
-			err = add_mtd_partitions(omap_onenand_mtd,
-					dynamic_partition, err);
-		else if (1)
-			err = add_mtd_partitions(omap_onenand_mtd,
-					static_partition,
-					ARRAY_SIZE(static_partition));
-		else
+	err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts,
0);
+	if (err > 0)
+		add_mtd_partitions(&info->mtd, info->parts, err);
+	else if (err < 0 && pdata->parts)
+		add_mtd_partitions(&info->mtd, pdata->parts,
pdata->nr_parts);
+	else
 #endif
-			err = add_mtd_device(omap_onenand_mtd);
-		if (err)
-			goto out_buf;
-		break;
+		err = add_mtd_device(&info->mtd);
 
-	default:
-		printk(KERN_WARNING "Unsupported OneNAND device\n");
-		err = -ENXIO;
-		goto out_buf;
-	}
+	dev_set_drvdata(&pdev->dev, info);
 
 	return 0;
 
-out_buf:
-	onenand_release(omap_onenand_mtd);
-	iounmap(this->base);
-out_mtd:
-	kfree(omap_onenand_mtd);
-out:
+out_iounmap:
+	iounmap(info->onenand.base);
+out_release_mem_region:
+	release_mem_region(res->start, size);
+out_free_info:
+	kfree(info);
+
 	return err;
 }
 
-/*
- * Clean up routine
- */
-static void __exit omap_onenand_cleanup (void)
+static int __devexit omap_onenand_remove(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct omap_onenand_info *info = dev_get_drvdata(&pdev->dev);
+	struct resource *res = pdev->resource;
+	unsigned long size = res->end - res->start + 1;
+
+	dev_set_drvdata(&pdev->dev, NULL);
+
+	if (info) {
+		if (info->parts)
+			del_mtd_partitions(&info->mtd);
+		else
+			del_mtd_device(&info->mtd);
+
+		onenand_release(&info->mtd);
+		release_mem_region(res->start, size);
+		iounmap(info->onenand.base);
+		kfree(info);
+	}
+
+	return 0;
+}
+
+static struct device_driver omap_onenand_driver = {
+	.name		= DRIVER_NAME,
+	.bus		= &platform_bus_type,
+	.probe		= omap_onenand_probe,
+	.remove		= __devexit_p(omap_onenand_remove),
+};
+
+MODULE_ALIAS(DRIVER_NAME);
+
+static int __init omap_onenand_init(void)
 {
-	struct onenand_chip *this = omap_onenand_mtd->priv;
+	return driver_register(&omap_onenand_driver);
+}
 
-	/* onenand_release frees MTD partitions, MTD structure
-	   and onenand internal buffers */
-	onenand_release(omap_onenand_mtd);
-	iounmap(this->base);
-	kfree(omap_onenand_mtd);
+static void __exit omap_onenand_exit(void)
+{
+	driver_unregister(&omap_onenand_driver);
 }
 
 module_init(omap_onenand_init);
-module_exit(omap_onenand_cleanup);
+module_exit(omap_onenand_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -116,10 +116,18 @@ struct onenand_chip {
 	void			*priv;
 };
 
+/*
+ * Helper macros
+ */
 #define ONENAND_CURRENT_BUFFERRAM(this)
(this->bufferram_index)
 #define ONENAND_NEXT_BUFFERRAM(this)		(this->bufferram_index ^ 1)
 #define ONENAND_SET_NEXT_BUFFERRAM(this)	(this->bufferram_index ^= 1)
 
+#define ONENAND_GET_SYS_CFG1(this)					\
+	(this->read_word(this->base + ONENAND_REG_SYS_CFG1))
+#define ONENAND_SET_SYS_CFG1(v, this)					\
+	(this->write_word(v, this->base + ONENAND_REG_SYS_CFG1))
+
 /*
  * Options bits
  */
diff --git a/include/asm-arm/mach/flash.h b/include/asm-arm/mach/flash.h
--- a/include/asm-arm/mach/flash.h
+++ b/include/asm-arm/mach/flash.h
@@ -11,6 +11,7 @@
 #define ASMARM_MACH_FLASH_H

 struct mtd_partition;
+struct mtd_info;

 /*
  * map_name:   the map probe function name
@@ -31,4 +32,16 @@ struct flash_platform_data {
        unsigned int    nr_parts;
 };

+/**
+ * struct onenand_platform_data - platform data describing OneNAND flash
banks
+ * @param mmcontrol    Handle memroy control for Sync. Burst Read
+ * @param parts                optional array of mtd_partitions for static
part
itioning
+ * @param nr_parts     number of mtd_partitions for static partitioning
+ */
+struct onenand_platform_data {
+       void            (*mmcontrol)(struct mtd_info *mtd, int sync_read);
+       struct mtd_partition *parts;
+       unsigned int    nr_parts;
+};
+
 #endif
