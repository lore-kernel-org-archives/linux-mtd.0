Received: from alephnull.demon.nl ([83.160.184.112] helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F8Keb-0004su-7s
	for linux-mtd@lists.infradead.org; Sun, 12 Feb 2006 12:05:00 -0500
Date: Sun, 12 Feb 2006 18:04:41 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20060212170441.GA28427@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: dwmw2@infradead.org
Subject: [PATCH,RFC] convert physmap to platform driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

After dwmw2 let me know it ought to be done, I rewrote the physmap map
driver to be a platform driver.  I know zilch about the driver model,
so I probably botched it in some way, but I've done some tests on an
ixp23xx board which uses physmap, and it all seems to work.

In order to not break existing physmap users, I've added some compat
code that will instantiate a platform device iff CONFIG_MTD_PHYSMAP_LEN
is defined and != 0.  Also, I've changed the default value for
CONFIG_MTD_PHYSMAP_LEN to zero, so that people who inadvertently
compile in physmap (or new, platform-style, users of physmap) don't get
burned.

This works pretty well -- the new physmap driver is a drop-in replacement
for the old one, and works on said ixp23xx board without any code changes
needed.  (This should hold as long as users don't touch 'physmap_map'
directly.)

Once all physmap users have been converted to instantiate their own
platform devices, the compat code can go.  (Or we decide that we can
change all the in-tree users at the same time, and never merge the
compat code.)

Comments?


cheers,
Lennert

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>

diff -ur linux-2.6.16-rc2.orig/drivers/mtd/maps/Kconfig linux-2.6.16-rc2/drivers/mtd/maps/Kconfig
--- linux-2.6.16-rc2.orig/drivers/mtd/maps/Kconfig	2006-02-09 14:50:49.000000000 +0100
+++ linux-2.6.16-rc2/drivers/mtd/maps/Kconfig	2006-02-12 17:57:28.000000000 +0100
@@ -37,7 +37,7 @@
 config MTD_PHYSMAP_LEN
 	hex "Physical length of flash mapping"
 	depends on MTD_PHYSMAP
-	default "0x4000000"
+	default "0"
 	help
 	  This is the total length of the mapping of the flash chips on
 	  your particular board. If there is space, or aliases, in the
diff -ur linux-2.6.16-rc2.orig/drivers/mtd/maps/physmap.c linux-2.6.16-rc2/drivers/mtd/maps/physmap.c
--- linux-2.6.16-rc2.orig/drivers/mtd/maps/physmap.c	2006-02-09 14:50:49.000000000 +0100
+++ linux-2.6.16-rc2/drivers/mtd/maps/physmap.c	2006-02-12 17:58:23.000000000 +0100
@@ -14,112 +12,230 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/slab.h>
-#include <asm/io.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/config.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
+#include <asm/io.h>
+#include <asm/mach/flash.h>
 
-static struct mtd_info *mymtd;
-
-struct map_info physmap_map = {
-	.name = "phys_mapped_flash",
-	.phys = CONFIG_MTD_PHYSMAP_START,
-	.size = CONFIG_MTD_PHYSMAP_LEN,
-	.bankwidth = CONFIG_MTD_PHYSMAP_BANKWIDTH,
+struct physmap_flash_info {
+	struct mtd_info		*mtd;
+	struct map_info		map;
+	struct resource		*res;
+#ifdef CONFIG_MTD_PARTITIONS
+	int			nr_parts;
+	struct mtd_partition	*parts;
+#endif
 };
 
+
+static int physmap_flash_remove(struct platform_device *dev)
+{
+	struct physmap_flash_info *info;
+	struct physmap_flash_data *physmap_data;
+
+	info = platform_get_drvdata(dev);
+	if (info == NULL)
+		return 0;
+	platform_set_drvdata(dev, NULL);
+
+	physmap_data = dev->dev.platform_data;
+
+	if (info->mtd != NULL) {
 #ifdef CONFIG_MTD_PARTITIONS
-static struct mtd_partition *mtd_parts;
-static int                   mtd_parts_nb;
+		if (info->nr_parts) {
+			del_mtd_partitions(info->mtd);
+			kfree(info->parts);
+		} else if (physmap_data->nr_parts) {
+			del_mtd_partitions(info->mtd);
+		} else {
+			del_mtd_device(info->mtd);
+		}
+#else
+		del_mtd_device(info->mtd);
+#endif
+		map_destroy(info->mtd);
+	}
 
-static int num_physmap_partitions;
-static struct mtd_partition *physmap_partitions;
+	if (info->map.virt != NULL)
+		iounmap((void *)info->map.virt);
 
-static const char *part_probes[] __initdata = {"cmdlinepart", "RedBoot", NULL};
+	if (info->res != NULL) {
+		release_resource(info->res);
+		kfree(info->res);
+	}
 
-void physmap_set_partitions(struct mtd_partition *parts, int num_parts)
-{
-	physmap_partitions=parts;
-	num_physmap_partitions=num_parts;
+	return 0;
 }
-#endif /* CONFIG_MTD_PARTITIONS */
 
-static int __init init_physmap(void)
+static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
+#ifdef CONFIG_MTD_PARTITIONS
+static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
+#endif
+
+static int physmap_flash_probe(struct platform_device *dev)
 {
-	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
-	const char **type;
+	struct physmap_flash_data *physmap_data;
+	struct physmap_flash_info *info;
+	const char **probe_type;
+	int err;
+
+	physmap_data = dev->dev.platform_data;
+	if (physmap_data == NULL)
+		return -ENODEV;
+
+       	printk(KERN_NOTICE "physmap platform flash device: %.8lx at %.8lx\n",
+		dev->resource->end - dev->resource->start + 1,
+		dev->resource->start);
+
+	info = kmalloc(sizeof(struct physmap_flash_info), GFP_KERNEL);
+	if (info == NULL) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+	memset(info, 0, sizeof(*info));
 
-       	printk(KERN_NOTICE "physmap flash device: %lx at %lx\n", physmap_map.size, physmap_map.phys);
-	physmap_map.virt = ioremap(physmap_map.phys, physmap_map.size);
+	platform_set_drvdata(dev, info);
 
-	if (!physmap_map.virt) {
-		printk("Failed to ioremap\n");
-		return -EIO;
+	info->res = request_mem_region(dev->resource->start,
+			dev->resource->end - dev->resource->start + 1,
+			dev->dev.bus_id);
+	if (info->res == NULL) {
+		dev_err(&dev->dev, "Could not reserve memory region\n");
+		err = -ENOMEM;
+		goto err_out;
 	}
 
-	simple_map_init(&physmap_map);
+	info->map.name = dev->dev.bus_id;
+	info->map.phys = dev->resource->start;
+	info->map.size = dev->resource->end - dev->resource->start + 1;
+	info->map.bankwidth = physmap_data->width;
+	info->map.set_vpp = physmap_data->set_vpp;
+
+	info->map.virt = ioremap(info->map.phys, info->map.size);
+	if (info->map.virt == NULL) {
+		dev_err(&dev->dev, "Failed to ioremap flash region\n");
+		err = EIO;
+		goto err_out;
+	}
+
+	simple_map_init(&info->map);
 
-	mymtd = NULL;
-	type = rom_probe_types;
-	for(; !mymtd && *type; type++) {
-		mymtd = do_map_probe(*type, &physmap_map);
+	probe_type = rom_probe_types;
+	for (; info->mtd == NULL && *probe_type != NULL; probe_type++)
+		info->mtd = do_map_probe(*probe_type, &info->map);
+	if (info->mtd == NULL) {
+		dev_err(&dev->dev, "map_probe failed\n");
+		err = -ENXIO;
+		goto err_out;
 	}
-	if (mymtd) {
-		mymtd->owner = THIS_MODULE;
+	info->mtd->owner = THIS_MODULE;
 
 #ifdef CONFIG_MTD_PARTITIONS
-		mtd_parts_nb = parse_mtd_partitions(mymtd, part_probes,
-						    &mtd_parts, 0);
+	err = parse_mtd_partitions(info->mtd, part_probe_types, &info->parts, 0);
+	if (err > 0) {
+		add_mtd_partitions(info->mtd, info->parts, err);
+		return 0;
+	}
 
-		if (mtd_parts_nb > 0)
-		{
-			add_mtd_partitions (mymtd, mtd_parts, mtd_parts_nb);
-			return 0;
-		}
+	if (physmap_data->nr_parts) {
+		printk(KERN_NOTICE "Using physmap partition information\n");
+		add_mtd_partitions(info->mtd, physmap_data->parts,
+						physmap_data->nr_parts);
+		return 0;
+	}
+#endif
 
-		if (num_physmap_partitions != 0)
-		{
-			printk(KERN_NOTICE
-			       "Using physmap partition definition\n");
-			add_mtd_partitions (mymtd, physmap_partitions, num_physmap_partitions);
-			return 0;
-		}
+	add_mtd_device(info->mtd);
+	return 0;
+
+err_out:
+	physmap_flash_remove(dev);
+	return err;
+}
 
+static struct platform_driver physmap_flash_driver = {
+	.probe		= physmap_flash_probe,
+	.remove		= physmap_flash_remove,
+	.driver		= {
+		.name	= "physmap-flash",
+	},
+};
+
+
+#ifdef CONFIG_MTD_PHYSMAP_LEN
+#if CONFIG_MTD_PHYSMAP_LEN != 0
+#warning using PHYSMAP compat code
+#define PHYSMAP_COMPAT
+#endif
 #endif
-		add_mtd_device(mymtd);
 
-		return 0;
-	}
+#ifdef PHYSMAP_COMPAT
+static struct physmap_flash_data physmap_flash_data = {
+	.width		= CONFIG_MTD_PHYSMAP_BANKWIDTH,
+};
 
-	iounmap(physmap_map.virt);
-	return -ENXIO;
-}
+static struct resource physmap_flash_resource = {
+	.start		= CONFIG_MTD_PHYSMAP_START,
+	.end		= CONFIG_MTD_PHYSMAP_START + CONFIG_MTD_PHYSMAP_LEN,
+	.flags		= IORESOURCE_MEM,
+};
+
+static struct platform_device physmap_flash = {
+	.name		= "physmap-flash",
+	.id		= 0,
+	.dev		= {
+		.platform_data	= &physmap_flash_data,
+	},
+	.num_resources	= 1,
+	.resource	= &physmap_flash_resource,
+};
 
-static void __exit cleanup_physmap(void)
+void physmap_configure(unsigned long addr, unsigned long size,
+		int bankwidth, void (*set_vpp)(struct map_info *, int))
 {
+	physmap_flash_resource.start = addr;
+	physmap_flash_resource.end = addr + size - 1;
+	physmap_flash_data.width = bankwidth;
+	physmap_flash_data.set_vpp = set_vpp;
+}
+
 #ifdef CONFIG_MTD_PARTITIONS
-	if (mtd_parts_nb) {
-		del_mtd_partitions(mymtd);
-		kfree(mtd_parts);
-	} else if (num_physmap_partitions) {
-		del_mtd_partitions(mymtd);
-	} else {
-		del_mtd_device(mymtd);
-	}
-#else
-	del_mtd_device(mymtd);
+void physmap_set_partitions(struct mtd_partition *parts, int num_parts)
+{
+	physmap_flash_data.nr_parts = num_parts;
+	physmap_flash_data.parts = parts;
+}
+#endif
 #endif
-	map_destroy(mymtd);
 
-	iounmap(physmap_map.virt);
-	physmap_map.virt = NULL;
+static int __init physmap_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&physmap_flash_driver);
+#ifdef PHYSMAP_COMPAT
+	if (err == 0)
+		platform_device_register(&physmap_flash);
+#endif
+
+	return err;
 }
 
-module_init(init_physmap);
-module_exit(cleanup_physmap);
+static void __exit physmap_exit(void)
+{
+#ifdef PHYSMAP_COMPAT
+	platform_device_unregister(&physmap_flash);
+#endif
+	platform_driver_unregister(&physmap_flash_driver);
+}
 
+module_init(physmap_init);
+module_exit(physmap_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
diff -urN linux-2.6.16-rc2.orig/include/linux/mtd/physmap.h linux-2.6.16-rc2/include/linux/mtd/physmap.h
--- linux-2.6.16-rc2.orig/include/linux/mtd/physmap.h	2006-02-12 14:53:43.000000000 +0100
+++ linux-2.6.16-rc2/include/linux/mtd/physmap.h	2006-02-12 16:37:23.000000000 +0100
@@ -24,22 +24,18 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
 
-/*
- * The map_info for physmap.  Board can override size, buswidth, phys,
- * (*set_vpp)(), etc in their initial setup routine.
- */
-extern struct map_info physmap_map;
+struct physmap_flash_data {
+	unsigned int		width;
+	void			(*set_vpp)(struct map_info *, int);
+	unsigned int		nr_parts;
+	struct mtd_partition	*parts;
+};
 
 /*
  * Board needs to specify the exact mapping during their setup time.
  */
-static inline void physmap_configure(unsigned long addr, unsigned long size, int bankwidth, void (*set_vpp)(struct map_info *, int) )
-{
-	physmap_map.phys = addr;
-	physmap_map.size = size;
-	physmap_map.bankwidth = bankwidth;
-	physmap_map.set_vpp = set_vpp;
-}
+void physmap_configure(unsigned long addr, unsigned long size,
+		int bankwidth, void (*set_vpp)(struct map_info *, int) );
 
 #if defined(CONFIG_MTD_PARTITIONS)
 
@@ -58,4 +54,3 @@
 #endif /* defined(CONFIG_MTD) */
 
 #endif /* __LINUX_MTD_PHYSMAP__ */
-
