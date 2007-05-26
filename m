Received: from mx5.mail.ru ([194.67.23.25])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HrkCm-00043h-62
	for linux-mtd@lists.infradead.org; Fri, 25 May 2007 20:34:49 -0400
Date: Sat, 26 May 2007 04:29:25 +0400
From: Anton Vorontsov <cbou@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] physmap-concat map platform driver
Message-ID: <20070526002925.GB801@zarina>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
Cc: kernel-discuss@handhelds.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is physmap-concat driver, which is plain sa1100-flash.c
with factored out arch-specific code. This driver is essential for
boards using multiple nonindentical chips on the board.

Signed-off-by: Anton Vorontsov <cbou@mail.ru>
---
 drivers/mtd/maps/Kconfig      |   13 ++
 drivers/mtd/maps/Makefile     |    1 +
 drivers/mtd/maps/physmapcc.c  |  385 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/physmapcc.h |   39 ++++
 4 files changed, 438 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/maps/physmapcc.c
 create mode 100644 include/linux/mtd/physmapcc.h

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index b665e4a..9ed9eb5 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -101,6 +101,19 @@ config MTD_PMC_MSP_RAMROOT
 	  This provides support for the embedded root file system
           on PMC MSP devices.  This memory is mapped as a MTD block device.
 
+config MTD_PHYSMAP_CONCAT
+	tristate "Multiple flash devices in physical memory map"
+	depends on MTD
+	help
+	  This provides a 'mapping' driver which allows the NOR Flash and
+	  ROM driver code to communicate with chips which are mapped
+	  physically into the CPU's memory. You will need to configure
+	  the physical address and size of the flash chips on your
+	  particular board as well as the bus width.
+
+	  Note, this driver differs from standard PHYSMAP driver in
+	  sense that it supports multiple nonidentical flash chips.
+
 config MTD_SUN_UFLASH
 	tristate "Sun Microsystems userflash support"
 	depends on SPARC && MTD_CFI
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 3acbb5d..cba3d33 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_MTD_CEIVA)		+= ceiva.o
 obj-$(CONFIG_MTD_OCTAGON)	+= octagon-5066.o
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
 obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of.o
+obj-$(CONFIG_MTD_PHYSMAP_CONCAT)+= physmapcc.o
 obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o
 obj-$(CONFIG_MTD_PMC_MSP_RAMROOT)+= pmcmsp-ramroot.o
 obj-$(CONFIG_MTD_PNC2000)	+= pnc2000.o
diff --git a/drivers/mtd/maps/physmapcc.c b/drivers/mtd/maps/physmapcc.c
new file mode 100644
index 0000000..0009f0d
--- /dev/null
+++ b/drivers/mtd/maps/physmapcc.c
@@ -0,0 +1,385 @@
+/*
+ * Generic configurable MTD map driver with concat support
+ *
+ * Based on sa1100-flash driver.
+ *
+ * Copyright (c) 2007 Anton Vorontsov <cbou@mail.ru>
+ * Copyright (c) 2000 Nicolas Pitre <nico@cam.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/err.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/concat.h>
+#include <linux/mtd/physmapcc.h>
+
+struct physmapcc_subdev {
+	char name[16];
+	struct map_info map;
+	struct mtd_info *mtd;
+	struct platform_device *pdev;
+};
+
+struct physmapcc_drvdata {
+	struct mtd_partition *parts;
+	struct mtd_info *mtd;
+	int num_subdev;
+	unsigned int nr_parts;
+	struct physmapcc_subdev subdev[0];
+};
+
+static void physmapcc_set_vpp(struct map_info *map, int on)
+{
+	struct physmapcc_subdev *subdev = container_of(map,
+	                                         struct physmapcc_subdev, map);
+	struct physmapcc_platform_data *pdata = subdev->pdev->dev.platform_data;
+
+	pdata->set_vpp(on);
+
+	return;
+}
+
+static void physmapcc_destroy_subdev(struct physmapcc_subdev *subdev)
+{
+	if (subdev->mtd)
+		map_destroy(subdev->mtd);
+	if (subdev->map.virt)
+		iounmap(subdev->map.virt);
+	release_mem_region(subdev->map.phys, subdev->map.size);
+
+	return;
+}
+
+static int physmapcc_probe_subdev(struct physmapcc_subdev *subdev,
+                                  struct resource *res)
+{
+	struct physmapcc_platform_data *pdata = subdev->pdev->dev.platform_data;
+	unsigned long phys;
+	unsigned int size;
+	int ret;
+
+	phys = res->start;
+	size = res->end - phys + 1;
+
+	/*
+	 * Retrieve the bankwidth from the resource flags.
+	 */
+	subdev->map.bankwidth = res->flags & IORESOURCE_MEM_32BIT ? 4 : 2;
+
+	if (!request_mem_region(phys, size, subdev->name)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	if (pdata->set_vpp)
+		subdev->map.set_vpp = physmapcc_set_vpp;
+
+	subdev->map.phys = phys;
+	subdev->map.size = size;
+	subdev->map.virt = ioremap(phys, size);
+	if (!subdev->map.virt) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	simple_map_init(&subdev->map);
+
+	/*
+	 * Now let's probe for the actual flash.  Do it here since
+	 * specific machine settings might have been set above.
+	 */
+	subdev->mtd = do_map_probe(pdata->map_name, &subdev->map);
+	if (subdev->mtd == NULL) {
+		ret = -ENXIO;
+		goto err;
+	}
+	subdev->mtd->owner = THIS_MODULE;
+
+	dev_info(&subdev->pdev->dev, "CFI device at 0x%08lx, %dMiB, "
+	         "%d-bit\n", phys, subdev->mtd->size >> 20,
+	         subdev->map.bankwidth * 8);
+
+	return 0;
+
+err:
+	physmapcc_destroy_subdev(subdev);
+out:
+	return ret;
+}
+
+static void physmapcc_destroy(struct physmapcc_drvdata *drvdata,
+                              struct physmapcc_platform_data *pdata)
+{
+	int i;
+
+	if (drvdata->mtd) {
+		if (drvdata->nr_parts == 0)
+			del_mtd_device(drvdata->mtd);
+#ifdef CONFIG_MTD_PARTITIONS
+		else
+			del_mtd_partitions(drvdata->mtd);
+#endif
+#ifdef CONFIG_MTD_CONCAT
+		if (drvdata->mtd != drvdata->subdev[0].mtd)
+			mtd_concat_destroy(drvdata->mtd);
+#endif
+	}
+
+	kfree(drvdata->parts);
+
+	for (i = drvdata->num_subdev - 1; i >= 0; i--)
+		physmapcc_destroy_subdev(&drvdata->subdev[i]);
+	kfree(drvdata);
+
+	if (pdata->exit)
+		pdata->exit();
+
+	return;
+}
+
+static struct physmapcc_drvdata *__init physmapcc_setup_mtd(
+           struct platform_device *pdev, struct physmapcc_platform_data *pdata)
+{
+	struct physmapcc_drvdata *drvdata;
+	int nr, size, i, ret = 0;
+
+	/*
+	 * Count number of devices.
+	 */
+	for (nr = 0; ; nr++)
+		if (!platform_get_resource(pdev, IORESOURCE_MEM, nr))
+			break;
+
+	if (nr == 0) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	size = sizeof(*drvdata) + sizeof(struct physmapcc_subdev) * nr;
+
+	/*
+	 * Allocate the map_info structs in one go.
+	 */
+	drvdata = kzalloc(size, GFP_KERNEL);
+	if (!drvdata) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	if (pdata->init) {
+		ret = pdata->init();
+		if (ret)
+			goto err;
+	}
+
+	/*
+	 * Claim and then map the memory regions.
+	 */
+	for (i = 0; i < nr; i++) {
+		struct physmapcc_subdev *subdev = &drvdata->subdev[i];
+		struct resource *res;
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		if (!res)
+			break;
+
+		subdev->map.name = subdev->name;
+		sprintf(subdev->name, "%s-%d", pdata->name, i);
+		subdev->pdev = pdev;
+
+		ret = physmapcc_probe_subdev(subdev, res);
+		if (ret)
+			break;
+	}
+
+	drvdata->num_subdev = i;
+
+	/*
+	 * ENXIO is special.  It means we didn't find a chip when we probed.
+	 */
+	if (ret != 0 && !(ret == -ENXIO && drvdata->num_subdev > 0))
+		goto err;
+
+	/*
+	 * If we found one device, don't bother with concat support.  If
+	 * we found multiple devices, use concat if we have it available,
+	 * otherwise fail.  Either way, it'll be called "physmapcc".
+	 */
+	if (drvdata->num_subdev == 1) {
+		strcpy(drvdata->subdev[0].name, pdata->name);
+		drvdata->mtd = drvdata->subdev[0].mtd;
+		ret = 0;
+	} else if (drvdata->num_subdev > 1) {
+#ifdef CONFIG_MTD_CONCAT
+		struct mtd_info *cdev[nr];
+		/*
+		 * We detected multiple devices.  Concatenate them together.
+		 */
+		for (i = 0; i < drvdata->num_subdev; i++)
+			cdev[i] = drvdata->subdev[i].mtd;
+
+		drvdata->mtd = mtd_concat_create(cdev, drvdata->num_subdev,
+		                                 pdata->name);
+		if (drvdata->mtd == NULL)
+			ret = -ENXIO;
+#else
+		dev_err(&pdev->dev, "multiple devices found but MTD concat "
+		        "support disabled.\n");
+		ret = -ENXIO;
+#endif
+	}
+
+	if (ret == 0)
+		return drvdata;
+
+err:
+	physmapcc_destroy(drvdata, pdata);
+out:
+	return ERR_PTR(ret);
+}
+
+static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
+
+static int __init physmapcc_probe(struct platform_device *pdev)
+{
+	struct physmapcc_platform_data *pdata = pdev->dev.platform_data;
+	struct mtd_partition *parts;
+	const char *part_type = NULL;
+	struct physmapcc_drvdata *drvdata;
+	int err, nr_parts = 0;
+
+	if (!pdata)
+		return -ENODEV;
+
+	drvdata = physmapcc_setup_mtd(pdev, pdata);
+	if (IS_ERR(drvdata)) {
+		err = PTR_ERR(drvdata);
+		goto out;
+	}
+
+	/*
+	 * Partition selection stuff.
+	 */
+#ifdef CONFIG_MTD_PARTITIONS
+	nr_parts = parse_mtd_partitions(drvdata->mtd, part_probes, &parts, 0);
+	if (nr_parts > 0) {
+		drvdata->parts = parts;
+		part_type = "dynamic";
+	} else
+#endif
+	{
+		parts = pdata->parts;
+		nr_parts = pdata->nr_parts;
+		part_type = "static";
+	}
+
+	if (nr_parts == 0) {
+		dev_notice(&pdev->dev, "no partition info available, "
+		           "registering whole flash\n");
+		add_mtd_device(drvdata->mtd);
+	} else {
+		dev_notice(&pdev->dev, "using %s partition definition\n",
+		           part_type);
+		add_mtd_partitions(drvdata->mtd, parts, nr_parts);
+	}
+
+	drvdata->nr_parts = nr_parts;
+
+	platform_set_drvdata(pdev, drvdata);
+	err = 0;
+
+out:
+	return err;
+}
+
+static int __exit physmapcc_remove(struct platform_device *pdev)
+{
+	struct physmapcc_drvdata *drvdata = platform_get_drvdata(pdev);
+	struct physmapcc_platform_data *pdata = pdev->dev.platform_data;
+
+	physmapcc_destroy(drvdata, pdata);
+	platform_set_drvdata(pdev, NULL);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int physmapcc_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct physmapcc_drvdata *drvdata = platform_get_drvdata(pdev);
+	int ret = 0;
+
+	if (drvdata)
+		ret = drvdata->mtd->suspend(drvdata->mtd);
+
+	return ret;
+}
+
+static int physmapcc_resume(struct platform_device *pdev)
+{
+	struct physmapcc_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	if (drvdata)
+		drvdata->mtd->resume(drvdata->mtd);
+
+	return 0;
+}
+
+static void physmapcc_shutdown(struct platform_device *pdev)
+{
+	struct physmapcc_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	if (drvdata && drvdata->mtd->suspend(drvdata->mtd) == 0)
+		drvdata->mtd->resume(drvdata->mtd);
+
+	return;
+}
+#else
+#define physmapcc_suspend NULL
+#define physmapcc_resume NULL
+#define physmapcc_shutdown NULL
+#endif
+
+static struct platform_driver physmapcc_driver = {
+	.driver = {
+		.name = "physmap-concat",
+	},
+	.probe = physmapcc_probe,
+	.remove = __exit_p(physmapcc_remove),
+	.suspend = physmapcc_suspend,
+	.resume = physmapcc_resume,
+	.shutdown = physmapcc_shutdown,
+};
+
+static int __init physmapcc_init(void)
+{
+	return platform_driver_register(&physmapcc_driver);
+}
+
+static void __exit physmapcc_exit(void)
+{
+	platform_driver_unregister(&physmapcc_driver);
+
+	return;
+}
+
+module_init(physmapcc_init);
+module_exit(physmapcc_exit);
+
+MODULE_AUTHOR("Nicolas Pitre <nico@cam.org>, Anton Vorontsov <cbou@mail.ru>");
+MODULE_DESCRIPTION("Generic configurable MTD map driver with concat support");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/physmapcc.h b/include/linux/mtd/physmapcc.h
new file mode 100644
index 0000000..66e8f09
--- /dev/null
+++ b/include/linux/mtd/physmapcc.h
@@ -0,0 +1,39 @@
+/*
+ * Generic configurable MTD map driver with concat support
+ *
+ * Based on sa1100-flash driver
+ *
+ * Copyright (c) 2007 Anton Vorontsov <cbou@mail.ru>
+ * Copyright (c) 2003 Russell King, All Rights Reserved.
+ * Copyright (c) 2000 Nicolas Pitre <nico@cam.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef MTD_PHYSMAPCC_H
+#define MTD_PHYSMAPCC_H
+
+struct mtd_partition;
+
+/*
+ * map_name:  the map probe function name
+ * name:      flash device name (eg, as used with mtdparts=)
+ * init:      method called at driver/device initialisation
+ * exit:      method called at driver/device removal
+ * set_vpp:   method called to enable or disable VPP
+ * parts:     optional array of mtd_partitions for static partitioning
+ * nr_parts:  number of mtd_partitions for static partitoning
+ */
+struct physmapcc_platform_data {
+	const char *map_name;
+	const char *name;
+	int (*init)(void);
+	void (*exit)(void);
+	void (*set_vpp)(int on);
+	struct mtd_partition *parts;
+	unsigned int nr_parts;
+};
+
+#endif /* MTD_PHYSMAPCC_H */
-- 
1.5.1.1-dirty
