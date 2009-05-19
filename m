Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M6O6S-00007V-5f
	for linux-mtd@lists.infradead.org; Tue, 19 May 2009 12:07:34 +0000
From: Daniel Mack <daniel@caiaq.de>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: [PATCH] ARM: MTD: add NOR lash driver for Freescale MXC
Date: Tue, 19 May 2009 14:07:10 +0200
Message-Id: <1242734830-21407-1-git-send-email-daniel@caiaq.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd <linux-mtd@lists.infradead.org>, Daniel Mack <daniel@caiaq.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds a driver for Freescale MXC's NOR flash.
The driver is taken from Freescale's BSP - I just made it compile for
current kernel versions and cleaned up the CodingStyle here and there.

Successfully tested on a MX31 board.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
---
 drivers/mtd/maps/Kconfig   |   10 +++
 drivers/mtd/maps/Makefile  |    1 +
 drivers/mtd/maps/mxc_nor.c |  184 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 195 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/maps/mxc_nor.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 82923bd..af9ebf8 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -562,4 +562,14 @@ config MTD_VMU
 	  To build this as a module select M here, the module will be called
 	  vmu-flash.
 
+config MTD_MXC
+	tristate "Map driver for Freescale MXC boards"
+	depends on MTD && ARCH_MXC
+	default y
+	select MTD_CFI
+	select MTD_PARTITIONS
+	help
+	  This enables access to the flash chips on Freescale MXC based
+	  platforms. If you have such a board, say 'Y'.
+
 endmenu
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 2dbc1be..c131717 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -62,3 +62,4 @@ obj-$(CONFIG_MTD_INTEL_VR_NOR)	+= intel_vr_nor.o
 obj-$(CONFIG_MTD_BFIN_ASYNC)	+= bfin-async-flash.o
 obj-$(CONFIG_MTD_RBTX4939)	+= rbtx4939-flash.o
 obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
+obj-$(CONFIG_MTD_MXC)		+= mxc_nor.o
diff --git a/drivers/mtd/maps/mxc_nor.c b/drivers/mtd/maps/mxc_nor.c
new file mode 100644
index 0000000..0b808b4
--- /dev/null
+++ b/drivers/mtd/maps/mxc_nor.c
@@ -0,0 +1,184 @@
+/*
+ * Copyright 2004-2008 Freescale Semiconductor, Inc. All Rights Reserved.
+ * (c) 2005 MontaVista Software, Inc.
+ *
+ * This file contains the MTD Mapping information on the MXC.
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+#include <linux/clocksource.h>
+#include <asm/mach-types.h>
+#include <asm/mach/flash.h>
+
+#define DVR_VER "2.0"
+
+#ifdef CONFIG_MTD_PARTITIONS
+static const char *part_probes[] = { "RedBoot", "cmdlinepart", NULL };
+#endif
+
+#ifdef CONFIG_MTD_XIP
+struct clocksource *mtd_xip_clksrc;
+#endif
+
+struct mxcflash_info {
+	struct mtd_partition *parts;
+	struct mtd_info *mtd;
+	struct map_info map;
+};
+
+static int __devinit mxcflash_probe(struct platform_device *pdev)
+{
+	int err, nr_parts = 0;
+	struct mxcflash_info *info;
+	struct flash_platform_data *flash = pdev->dev.platform_data;
+	struct resource *res = pdev->resource;
+	unsigned long size = res->end - res->start + 1;
+
+	info = kzalloc(sizeof(struct mxcflash_info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	if (!request_mem_region(res->start, size, "flash")) {
+		err = -EBUSY;
+		goto out_free_info;
+	}
+
+	info->map.virt = ioremap(res->start, size);
+	if (!info->map.virt) {
+		err = -ENOMEM;
+		goto out_release_mem_region;
+	}
+
+	info->map.name = pdev->name;
+	info->map.phys = res->start;
+	info->map.size = size;
+	info->map.bankwidth = flash->width;
+
+#ifdef CONFIG_MTD_XIP
+	mtd_xip_clksrc = clocksource_get_next();
+#endif
+
+	simple_map_init(&info->map);
+	info->mtd = do_map_probe(flash->map_name, &info->map);
+
+	if (!info->mtd) {
+		err = -EIO;
+		goto out_iounmap;
+	}
+
+	info->mtd->owner = THIS_MODULE;
+
+#ifdef CONFIG_MTD_PARTITIONS
+	nr_parts =
+	    parse_mtd_partitions(info->mtd, part_probes, &info->parts, 0);
+	if (nr_parts > 0) {
+		add_mtd_partitions(info->mtd, info->parts, nr_parts);
+	} else if (nr_parts < 0 && flash->parts) {
+		add_mtd_partitions(info->mtd, flash->parts, flash->nr_parts);
+	} else
+#endif
+	{
+		dev_info(&pdev->dev, "no partition info available, "
+				"registering whole flash\n");
+		add_mtd_device(info->mtd);
+	}
+
+	platform_set_drvdata(pdev, info);
+	return 0;
+
+out_iounmap:
+	iounmap(info->map.virt);
+out_release_mem_region:
+	release_mem_region(res->start, size);
+out_free_info:
+	kfree(info);
+
+	return err;
+}
+
+static int __devexit mxcflash_remove(struct platform_device *pdev)
+{
+
+	struct mxcflash_info *info = platform_get_drvdata(pdev);
+	struct flash_platform_data *flash = pdev->dev.platform_data;
+
+	platform_set_drvdata(pdev, NULL);
+
+	if (!info)
+		return 0;
+
+	if (info->parts) {
+		del_mtd_partitions(info->mtd);
+		kfree(info->parts);
+	} else if (flash->parts)
+		del_mtd_partitions(info->mtd);
+	else
+		del_mtd_device(info->mtd);
+
+	map_destroy(info->mtd);
+	release_mem_region(info->map.phys, info->map.size);
+	iounmap((void __iomem *)info->map.virt);
+	kfree(info);
+
+	return 0;
+}
+
+static struct platform_driver mxcflash_driver = {
+	.driver = {
+		   .name = "mxc_nor_flash",
+	},
+	.probe = mxcflash_probe,
+	.remove = __devexit_p(mxcflash_remove),
+};
+
+/*
+ * This is the module's entry function. It passes board specific
+ * config details into the MTD physmap driver which then does the
+ * real work for us. After this function runs, our job is done.
+ */
+static int __init mxc_mtd_init(void)
+{
+	pr_info("MXC MTD nor Driver %s\n", DVR_VER);
+	if (platform_driver_register(&mxcflash_driver) != 0) {
+		printk(KERN_ERR "Driver register failed for mxcflash_driver\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+/*
+ * This function is the module's exit function. It's empty because the
+ * MTD physmap driver is doing the real work and our job was done after
+ * mxc_mtd_init() runs.
+ */
+static void __exit mxc_mtd_exit(void)
+{
+	platform_driver_unregister(&mxcflash_driver);
+}
+
+module_init(mxc_mtd_init);
+module_exit(mxc_mtd_exit);
+
+MODULE_AUTHOR("Freescale Semiconductor, Inc.");
+MODULE_DESCRIPTION("MTD map and partitions for Freescale MXC boards");
+MODULE_LICENSE("GPL");
+
-- 
1.6.2.1
