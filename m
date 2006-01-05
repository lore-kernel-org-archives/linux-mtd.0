Received: from cassiel.sirena.org.uk ([80.68.93.111])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EucQO-0006vF-4W
	for linux-mtd@lists.infradead.org; Thu, 05 Jan 2006 16:13:43 -0500
Date: Thu, 5 Jan 2006 21:09:54 +0000
From: Mark Brown <broonie@sirena.org.uk>
To: Deepak Saxena <dsaxena@plexity.net>
Message-ID: <20060105210954.GA8423@sirena.org.uk>
References: <20051229232138.GA32463@plexity.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20051229232138.GA32463@plexity.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Make physmap into a platform device driver...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Resent without GPG signature since the list software rejected my mail
due to a "suspicious header".]

On Thu, Dec 29, 2005 at 03:21:38PM -0800, Deepak Saxena wrote:

> MTD layer and have the physmap driver use it. The physmap driver
> could register itself as a platform driver for "phys-mtd" devices
> and boards would just fill in platform_device structure with the
> appropriate resource window and the needed fields below as the
> platform_data. We may want to trim down the structure to remove 
> ARM-specific fields and let ARM have it's own structure that contains
> the generic structure as a member. Thoughts?

An alternative approach (which Jason Gunthorpe posted a patch for
recently IIRC) is to add probe support to the plat-ram driver so it can
work with any kind of chip.  I have a patch kicking around doing pretty
much that but also renaming the driver to make it look less strange when
used.

My patch is below - it probably ought to have the re-addition of write
protection methods which I had stripped out since I've got partially
written support for paging in chips and thought the two might end up
related.

diff -uprN linux-2.6.13/drivers/mtd/maps/Kconfig linux-plat-flash/drivers/mtd/maps/Kconfig
--- linux-2.6.13/drivers/mtd/maps/Kconfig	2005-08-29 00:41:01.000000000 +0100
+++ linux-plat-flash/drivers/mtd/maps/Kconfig	2005-09-08 18:51:13.984319480 +0100
@@ -624,5 +624,12 @@ config MTD_PLATRAM
 
 	  This selection automatically selects the map_ram driver.
 
+config MTD_PLATFLASH
+	tristate "Map driver for platform device physically mapped flash"
+	depends on MTD
+	help
+	  Map driver allowing MTD devices which are physically mapped into
+	  the CPU's address space to be enumerated using the platform bus.
+
 endmenu
 
diff -uprN linux-2.6.13/drivers/mtd/maps/Makefile linux-plat-flash/drivers/mtd/maps/Makefile
--- linux-2.6.13/drivers/mtd/maps/Makefile	2005-08-29 00:41:01.000000000 +0100
+++ linux-plat-flash/drivers/mtd/maps/Makefile	2005-09-08 18:51:08.706121888 +0100
@@ -69,4 +69,5 @@ obj-$(CONFIG_MTD_WRSBC8260)	+= wr_sbc82x
 obj-$(CONFIG_MTD_DMV182)	+= dmv182.o
 obj-$(CONFIG_MTD_SHARP_SL)	+= sharpsl-flash.o
 obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
+obj-$(CONFIG_MTD_PLATFLASH)     += plat-flash.o
 obj-$(CONFIG_MTD_OMAP_NOR)	+= omap_nor.o
diff -uprN linux-2.6.13/drivers/mtd/maps/plat-flash.c linux-plat-flash/drivers/mtd/maps/plat-flash.c
--- linux-2.6.13/drivers/mtd/maps/plat-flash.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-plat-flash/drivers/mtd/maps/plat-flash.c	2005-09-08 18:48:56.711188168 +0100
@@ -0,0 +1,270 @@
+/* drivers/mtd/maps/plat-flash.c
+ *
+ * (c) 2004-2005 Simtec Electronics
+ *	http://www.simtec.co.uk/products/SWLINUX/
+ *	Ben Dooks <ben@simtec.co.uk>
+ *
+ * Generic platform device based flash mappings.
+ *
+ * $Id: $
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+*/
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/ioport.h>
+#include <linux/device.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/plat-flash.h>
+
+#include <asm/io.h>
+
+/* private structure for each mtd platform ram device created */
+
+struct platflash_info {
+	struct device		*dev;
+	struct mtd_info		*mtd;
+	struct map_info		 map;
+	struct mtd_partition	*partitions;
+	struct resource		*area;
+};
+
+/* to_platflash_info()
+ *
+ * device private data to struct platflash_info conversion
+*/
+
+static inline struct platflash_info *to_platflash_info(struct device *dev)
+{
+	return (struct platflash_info *)dev_get_drvdata(dev);
+}
+
+/* platflash_remove
+ *
+ * called to remove the device from the driver's control
+*/
+
+static int platflash_remove(struct device *dev)
+{
+	struct platflash_info *info = to_platflash_info(dev);
+
+	dev_set_drvdata(dev, NULL);
+
+	dev_dbg(dev, "removing device\n");
+
+	if (info == NULL) 
+		return 0;
+
+	if (info->mtd) {
+#ifdef CONFIG_MTD_PARTITIONS
+		if (info->partitions) {
+			del_mtd_partitions(info->mtd);
+			kfree(info->partitions);
+		}
+#endif
+		del_mtd_device(info->mtd);
+		map_destroy(info->mtd);
+	}
+
+	/* release resources */
+
+	if (info->area) {
+		release_resource(info->area);
+		kfree(info->area);
+	}
+
+	if (info->map.virt != NULL)
+		iounmap(info->map.virt);
+	
+	kfree(info);
+
+	return 0;
+}
+
+/* platflash_probe
+ *
+ * called from device drive system when a device matching our
+ * driver is found.
+*/
+
+static int platflash_probe(struct device *dev)
+{
+	struct platform_device *pd = to_platform_device(dev);
+	struct platflash_info *info;
+	struct platdata_mtd_flash *pdata;
+	struct resource *res;
+	int err = 0;
+	int i;
+
+	dev_dbg(dev, "probe entered\n");
+
+	if (dev->platform_data == NULL) {
+		dev_err(dev, "no platform data supplied\n");
+		err = -ENOENT;
+		goto exit_error;
+	}
+
+	pdata = dev->platform_data;
+
+	if (pdata->chip_probes == 0) {
+		dev_err(dev, "no chip probes specified\n");
+		err = -ENOENT;
+		goto exit_error;
+	}
+	
+	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	if (info == NULL) {
+		dev_err(dev, "no memory for flash info\n");
+		err = -ENOMEM;
+		goto exit_error;
+	}
+
+	memset(info, 0, sizeof(*info));
+	dev_set_drvdata(dev, info);
+
+	info->dev = dev;
+
+	/* get the resource for the memory mapping */
+
+	res = platform_get_resource(pd, IORESOURCE_MEM, 0);
+
+	if (res == NULL) {
+		dev_err(dev, "no memory resource specified\n");
+		err = -ENOENT;
+		goto exit_free;
+	}
+
+	dev_dbg(dev, "got platform resource %p (0x%lx)\n", res, res->start);
+
+	/* setup map parameters */
+
+	info->map.phys = res->start;
+	info->map.size = (res->end - res->start) + 1;
+	info->map.name = pdata->mapname != NULL ? pdata->mapname : pd->name;
+	info->map.bankwidth = pdata->bankwidth;
+
+	/* register our usage of the memory area */
+
+	info->area = request_mem_region(res->start, info->map.size, pd->name);
+	if (info->area == NULL) {
+		dev_err(dev, "failed to request memory region\n");
+		err = -EIO;
+		goto exit_free;
+	}
+
+	/* remap the memory area */
+
+	info->map.virt = ioremap(res->start, info->map.size);
+	dev_dbg(dev, "virt %p, %lu bytes\n", info->map.virt, info->map.size);
+
+	if (info->map.virt == NULL) {
+		dev_err(dev, "failed to ioremap() region\n");
+		err = -EIO;
+		goto exit_free;
+	}
+
+	simple_map_init(&info->map);
+
+	dev_dbg(dev, "initialised map, probing for mtd\n");
+
+	/* probe for the right mtd map driver */
+	i = 0;
+	while (pdata->chip_probes[i]) {
+		dev_dbg(dev, "probing with %s\n", pdata->chip_probes[i]);
+		info->mtd = do_map_probe(pdata->chip_probes[i], &info->map);
+		i++;
+		if (info->mtd != NULL) 
+			break;
+	}
+	if (info->mtd == NULL) {
+		dev_err(dev, "failed to identify device\n");
+		err = -ENOMEM;
+		goto exit_free;
+	}
+
+	info->mtd->owner = THIS_MODULE;
+
+	/* check to see if there are any available partitions, or wether
+	 * to add this device whole */
+
+#ifdef CONFIG_MTD_PARTITIONS
+	if (pdata->nr_partitions > 0) {
+		if (pdata->partition_probes)
+		{
+			err = parse_mtd_partitions(info->mtd,
+						   pdata->partition_probes,
+						   &info->partitions, 0);
+		}
+		else
+		{
+			err = pdata->nr_partitions;
+			info->partitions = pdata->partitions;
+		}
+
+		if (err > 0) {
+			err = add_mtd_partitions(info->mtd, info->partitions,
+						 err);
+		}
+	}
+#endif /* CONFIG_MTD_PARTITIONS */
+
+	if (add_mtd_device(info->mtd)) {
+		dev_err(dev, "add_mtd_device() failed\n");
+		err = -ENOMEM;
+	}
+	
+	dev_info(dev, "registered mtd device\n");
+	return err;
+
+ exit_free:
+	platflash_remove(dev);
+ exit_error:
+	return err;
+}
+
+/* device driver info */
+
+static struct device_driver platflash_driver = {
+	.name		= "mtd-phys",
+	.bus		= &platform_bus_type,
+	.probe		= platflash_probe,
+	.remove		= platflash_remove,
+};
+
+/* module init/exit */
+
+static int __init platflash_init(void)
+{
+	return driver_register(&platflash_driver);
+}
+
+static void __exit platflash_exit(void)
+{
+	driver_unregister(&platflash_driver);
+}
+
+module_init(platflash_init);
+module_exit(platflash_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mark Brown <broonie@sirena.org.uk>");
+MODULE_DESCRIPTION("MTD platform map driver");
diff -uprN linux-2.6.13/include/linux/mtd/plat-flash.h linux-plat-flash/include/linux/mtd/plat-flash.h
--- linux-2.6.13/include/linux/mtd/plat-flash.h	1970-01-01 01:00:00.000000000 +0100
+++ linux-plat-flash/include/linux/mtd/plat-flash.h	2005-09-08 18:49:28.000000000 +0100
@@ -0,0 +1,29 @@
+/* linux/include/mtd/plat-flash.h
+ *
+ * (c) 2004 Simtec Electronics
+ *	http://www.simtec.co.uk/products/SWLINUX/
+ *	Ben Dooks <ben@simtec.co.uk>
+ *
+ * Generic platform device based flash map
+ *
+ * $Id: $
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __LINUX_MTD_PLATFLASH_H
+#define __LINUX_MTD_PLATFLASH_H __FILE__
+
+struct platdata_mtd_flash {
+	char			*mapname;
+	char                   **chip_probes;
+	char		       **partition_probes;
+	struct mtd_partition	*partitions;
+	int			 nr_partitions;
+	int			 bankwidth;
+};
+
+#endif /* __LINUX_MTD_PLATRAM_H */

-- 
"You grabbed my hand and we fell into it, like a daydream - or a fever."
