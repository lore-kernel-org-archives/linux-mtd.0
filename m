Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Grtqf-0001Gy-PE
	for linux-mtd@lists.infradead.org; Wed, 06 Dec 2006 05:18:00 -0500
Message-ID: <457698CD.9070702@ru.mvista.com>
Date: Wed, 06 Dec 2006 13:17:49 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] of_device-based physmap driver
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello folks,

inlined below is the patch that adds physmap driver for of_device. 
It's an MTD part of the two-part support for flash/ROM devices based 
on Open Firmware descriptions. The arch part (currently only PowerPC 
which is no surprise) was introduced to powerpc folks earlier and 
recently the older version of the powerpc part has been included into 
the powerpc.git tree 
(see http://www.kernel.org/git/?p=linux/kernel/git/paulus/powerpc.git;a=commitdiff;h=28f9ec349ae47c91768b7bc5607db4442c818e11).

 drivers/mtd/maps/Kconfig      |    9 +
 drivers/mtd/maps/Makefile     |    1
 drivers/mtd/maps/physmap_of.c |  255 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 265 insertions(+)

Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>
Signed-off-by: Sergey Shtylyov <sshtylyov@ru.mvista.com>

Index: powerpc/drivers/mtd/maps/physmap_of.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ powerpc/drivers/mtd/maps/physmap_of.c	2006-12-05 16:00:57.000000000 +0300
@@ -0,0 +1,255 @@
+/*
+ * Normal mappings of chips in physical memory for OF devices
+ *
+ * Copyright (C) 2006 MontaVista Software Inc.
+ * Author: Vitaly Wool <vwool@ru.mvista.com>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/physmap.h>
+#include <asm/io.h>
+#include <asm/prom.h>
+#include <asm/of_device.h>
+#include <asm/of_platform.h>
+
+struct physmap_flash_info {
+	struct mtd_info		*mtd;
+	struct map_info		map;
+	struct resource		*res;
+#ifdef CONFIG_MTD_PARTITIONS
+	int			nr_parts;
+	struct mtd_partition	*parts;
+#endif
+};
+
+static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
+#ifdef CONFIG_MTD_PARTITIONS
+static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
+#endif
+
+#ifdef CONFIG_MTD_PARTITIONS
+static int parse_flash_partitions(struct device_node *node,
+		struct mtd_partition **parts)
+{
+	int i, plen, retval = -ENOMEM;
+	const  u32  *part;
+	const  char *name;
+
+	part = get_property(node, "partitions", &plen);
+	if (part == NULL)
+		goto err;
+
+	retval = plen / (2 * sizeof(u32));
+	*parts = kzalloc(retval * sizeof(struct mtd_partition), GFP_KERNEL);
+	if (*parts == NULL) {
+		printk(KERN_ERR "Can't allocate the flash partition data!\n");
+		goto err;
+	}
+
+	name = get_property(node, "partition-names", &plen);
+
+	for (i = 0; i < retval; i++) {
+		(*parts)[i].offset = *part++;
+		(*parts)[i].size   = *part & ~1;
+		if (*part++ & 1) /* bit 0 set signifies read only partition */
+			(*parts)[i].mask_flags = MTD_WRITEABLE;
+
+		if (name != NULL && plen > 0) {
+			int len = strlen(name) + 1;
+
+			(*parts)[i].name = (char *)name;
+			plen -= len;
+			name += len;
+		} else
+			(*parts)[i].name = "unnamed";
+	}
+err:
+	return retval;
+}
+#endif
+
+static int of_physmap_remove(struct of_device *dev)
+{
+	struct physmap_flash_info *info;
+
+	info = dev_get_drvdata(&dev->dev);
+	if (info == NULL)
+		return 0;
+	dev_set_drvdata(&dev->dev, NULL);
+
+	if (info->mtd != NULL) {
+#ifdef CONFIG_MTD_PARTITIONS
+		if (info->nr_parts) {
+			del_mtd_partitions(info->mtd);
+			kfree(info->parts);
+		} else {
+			del_mtd_device(info->mtd);
+		}
+#else
+		del_mtd_device(info->mtd);
+#endif
+		map_destroy(info->mtd);
+	}
+
+	if (info->map.virt != NULL)
+		iounmap(info->map.virt);
+
+	if (info->res != NULL) {
+		release_resource(info->res);
+		kfree(info->res);
+	}
+
+	return 0;
+}
+
+static int __devinit of_physmap_probe(struct of_device *dev, const struct of_device_id *match)
+{
+	struct device_node *dp = dev->node;
+	struct resource res;
+	struct physmap_flash_info *info;
+	const char **probe_type;
+	const char *of_probe;
+	const u32 *width;
+	int err;
+
+
+	if (of_address_to_resource(dp, 0, &res)) {
+		dev_err(&dev->dev, "Can't get the flash mapping!\n");
+		err = -EINVAL;
+		goto err_out;
+	}
+
+       	dev_dbg(&dev->dev, "physmap flash device: %.8llx at %.8llx\n",
+	    (unsigned long long)res.end - res.start + 1,
+	    (unsigned long long)res.start);
+
+	info = kzalloc(sizeof(struct physmap_flash_info), GFP_KERNEL);
+	if (info == NULL) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+	memset(info, 0, sizeof(*info));
+
+	dev_set_drvdata(&dev->dev, info);
+
+	info->res = request_mem_region(res.start, res.end - res.start + 1,
+			dev->dev.bus_id);
+	if (info->res == NULL) {
+		dev_err(&dev->dev, "Could not reserve memory region\n");
+		err = -ENOMEM;
+		goto err_out;
+	}
+
+	width = get_property(dp, "bank-width", NULL);
+	if (width == NULL) {
+		dev_err(&dev->dev, "Can't get the flash bank width!\n");
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	info->map.name = dev->dev.bus_id;
+	info->map.phys = res.start;
+	info->map.size = res.end - res.start + 1;
+	info->map.bankwidth = *width;
+
+	info->map.virt = ioremap(info->map.phys, info->map.size);
+	if (info->map.virt == NULL) {
+		dev_err(&dev->dev, "Failed to ioremap flash region\n");
+		err = EIO;
+		goto err_out;
+	}
+
+	simple_map_init(&info->map);
+
+	of_probe = get_property(dp, "probe-type", NULL);
+	if (of_probe == NULL) {
+		probe_type = rom_probe_types;
+		for (; info->mtd == NULL && *probe_type != NULL; probe_type++)
+			info->mtd = do_map_probe(*probe_type, &info->map);
+	} else if (!strcmp(of_probe, "CFI"))
+		info->mtd = do_map_probe("cfi_probe", &info->map);
+	else if (!strcmp(of_probe, "JEDEC"))
+		info->mtd = do_map_probe("jedec_probe", &info->map);
+	else {
+ 		if (strcmp(of_probe, "ROM"))
+			dev_dbg(&dev->dev, "map_probe: don't know probe type "
+			"'%s', mapping as rom\n");
+		info->mtd = do_map_probe("mtd_rom", &info->map);
+	}
+	if (info->mtd == NULL) {
+		dev_err(&dev->dev, "map_probe failed\n");
+		err = -ENXIO;
+		goto err_out;
+	}
+	info->mtd->owner = THIS_MODULE;
+
+#ifdef CONFIG_MTD_PARTITIONS
+	err = parse_mtd_partitions(info->mtd, part_probe_types, &info->parts, 0);
+	if (err > 0) {
+		add_mtd_partitions(info->mtd, info->parts, err);
+	} else if ((err = parse_flash_partitions(dp, &info->parts)) > 0) {
+		dev_info(&dev->dev, "Using OF partition information\n");
+		add_mtd_partitions(info->mtd, info->parts, err);
+		info->nr_parts = err;
+	} else
+#endif
+
+	add_mtd_device(info->mtd);
+	return 0;
+
+err_out:
+	of_physmap_remove(dev);
+	return err;
+
+	return 0;
+
+
+}
+
+static struct of_device_id of_physmap_match[] = {
+	{
+		.type		= "rom",
+		.compatible	= "direct-mapped"
+	},
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, of_physmap_match);
+
+
+static struct of_platform_driver of_physmap_flash_driver = {
+	.name		= "physmap-flash",
+	.match_table	= of_physmap_match,
+	.probe		= of_physmap_probe,
+	.remove		= of_physmap_remove,
+};
+
+static int __init of_physmap_init(void)
+{
+	return of_register_platform_driver(&of_physmap_flash_driver);
+}
+
+static void __exit of_physmap_exit(void)
+{
+	of_unregister_platform_driver(&of_physmap_flash_driver);
+}
+
+module_init(of_physmap_init);
+module_exit(of_physmap_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vitaly Wool <vwool@ru.mvista.com>");
+MODULE_DESCRIPTION("Configurable MTD map driver for OF");
Index: powerpc/drivers/mtd/maps/Kconfig
===================================================================
--- powerpc.orig/drivers/mtd/maps/Kconfig	2006-12-05 15:43:03.000000000 +0300
+++ powerpc/drivers/mtd/maps/Kconfig	2006-12-05 15:56:31.000000000 +0300
@@ -60,6 +60,15 @@
 	  Ignore this option if you use run-time physmap configuration
 	  (i.e., run-time calling physmap_configure()).
 
+config MTD_PHYSMAP_OF
+	tristate "Flash device in physical memory map based on OF descirption"
+	depends on PPC_OF && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
+	help
+	  This provides a 'mapping' driver which allows the NOR Flash and
+	  ROM driver code to communicate with chips which are mapped
+	  physically into the CPU's memory. The mapping description here is
+	  taken from OF device tree.
+
 config MTD_SUN_UFLASH
 	tristate "Sun Microsystems userflash support"
 	depends on SPARC && MTD_CFI
Index: powerpc/drivers/mtd/maps/Makefile
===================================================================
--- powerpc.orig/drivers/mtd/maps/Makefile	2006-12-05 15:43:03.000000000 +0300
+++ powerpc/drivers/mtd/maps/Makefile	2006-12-05 15:56:31.000000000 +0300
@@ -25,6 +25,7 @@
 obj-$(CONFIG_MTD_CEIVA)		+= ceiva.o
 obj-$(CONFIG_MTD_OCTAGON)	+= octagon-5066.o
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
+obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of.o
 obj-$(CONFIG_MTD_PNC2000)	+= pnc2000.o
 obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o
 obj-$(CONFIG_MTD_RPXLITE)	+= rpxlite.o
