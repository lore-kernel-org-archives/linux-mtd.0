Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GfaR8-0002Fc-KI
	for linux-mtd@lists.infradead.org; Thu, 02 Nov 2006 06:08:55 -0500
Received: from dev.rtsoft.ru. ([10.150.0.9])
	by buildserver.ru.mvista.com (8.11.6/8.11.6) with SMTP id kA2B8bi07996
	for <linux-mtd@lists.infradead.org>; Thu, 2 Nov 2006 15:08:37 +0400
Date: Thu, 2 Nov 2006 14:08:47 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH/RFC] physmap for OF devices
Message-Id: <20061102140847.8417cdc3.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

inlined below is the patch that adds support for OF physmap descriptions. It was inspired by Sergey Shtylyov's patch to powerpc tree which can be found at 
http://patchwork.ozlabs.org/linuxppc/patch?id=6526 and uses the same description but implements a bit different concept. I. e. it doesn't try to pretend a platform device and use existing physmap driver but adds corresponding configurable physmap driver instead.

 drivers/mtd/maps/Kconfig      |    9 +
 drivers/mtd/maps/Makefile     |    1
 drivers/mtd/maps/physmap_of.c |  244 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 254 insertions(+)

Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>

Index: linux-2.6.18/drivers/mtd/maps/physmap_of.c
===================================================================
--- /dev/null
+++ linux-2.6.18/drivers/mtd/maps/physmap_of.c
@@ -0,0 +1,244 @@
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
+	int i, plen, nr_parts = 0;
+	const  u32  *part;
+	const  char *name;
+
+	part = get_property(node, "partitions", &plen);
+	if (part == NULL)
+		goto err;
+
+	nr_parts = plen / (2 * sizeof(u32));
+	*parts = kzalloc(nr_parts * sizeof(struct mtd_partition), GFP_KERNEL);
+	if (*parts == NULL) {
+		printk(KERN_ERR "Can't allocate the flash partition data!\n");
+		nr_parts = 0;
+		goto err;
+	}
+
+	name = get_property(node, "partition-names", &plen);
+
+	for (i = 0; i < nr_parts; i++) {
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
+	return nr_parts;
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
+		} else if (info->parts) {
+			del_mtd_partitions(info->mtd);
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
+	dev_set_drvdata(&dev->dev, up);
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
+	probe_type = rom_probe_types;
+	for (; info->mtd == NULL && *probe_type != NULL; probe_type++)
+		info->mtd = do_map_probe(*probe_type, &info->map);
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
+		.name = "flash",
+		.compatible = "physmap"
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
+	return of_register_driver(&of_physmap_flash_driver);
+}
+
+static void __exit of_physmap_exit(void)
+{
+	of_unregister_driver(&of_physmap_flash_driver);
+}
+
+module_init(of_physmap_init);
+module_exit(of_physmap_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vitaly Wool <vwool@ru.mvista.com>");
+MODULE_DESCRIPTION("Configurable MTD map driver for OF");
Index: linux-2.6.18/drivers/mtd/maps/Kconfig
===================================================================
--- linux-2.6.18.orig/drivers/mtd/maps/Kconfig
+++ linux-2.6.18/drivers/mtd/maps/Kconfig
@@ -60,6 +60,15 @@ config MTD_PHYSMAP_BANKWIDTH
 	  Ignore this option if you use run-time physmap configuration
 	  (i.e., run-time calling physmap_configure()).
 
+config MTD_PHYSMAP_OF
+	tristate "Flash device in physical memory map based on OF descirption"
+	depends on PPC && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
+	help
+	  This provides a 'mapping' driver which allows the NOR Flash and
+	  ROM driver code to communicate with chips which are mapped
+	  physically into the CPU's memory. The mapping description here is
+	  taken from OF device tree.
+
 config MTD_SUN_UFLASH
 	tristate "Sun Microsystems userflash support"
 	depends on SPARC && MTD_CFI
Index: linux-2.6.18/drivers/mtd/maps/Makefile
===================================================================
--- linux-2.6.18.orig/drivers/mtd/maps/Makefile
+++ linux-2.6.18/drivers/mtd/maps/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_MTD_MBX860)	+= mbx860.o
 obj-$(CONFIG_MTD_CEIVA)		+= ceiva.o
 obj-$(CONFIG_MTD_OCTAGON)	+= octagon-5066.o
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
+obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of.o
 obj-$(CONFIG_MTD_PNC2000)	+= pnc2000.o
 obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o
 obj-$(CONFIG_MTD_RPXLITE)	+= rpxlite.o
