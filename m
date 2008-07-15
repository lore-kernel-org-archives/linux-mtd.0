Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KIiFA-0000za-GV
	for linux-mtd@lists.infradead.org; Tue, 15 Jul 2008 10:58:53 +0000
Message-Id: <20080715105843.760364066@fluff.org.uk>
References: <20080715105829.105768029@fluff.org.uk>
Date: Tue, 15 Jul 2008 11:58:30 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [patch 1/2] MTD: Remove the bast-flash driver.
Content-Disposition: inline;
	filename=simtec/simtec-drivers-mtd-remove-bastflash.patch
Cc: Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the Simtec BAST flash driver as this has been replaced by using
the platform flash driver.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

Index: linux-2.6.26-rc3-quilt2/drivers/mtd/maps/Kconfig
===================================================================
--- linux-2.6.26-rc3-quilt2.orig/drivers/mtd/maps/Kconfig	2008-05-19 23:04:02.000000000 +0100
+++ linux-2.6.26-rc3-quilt2/drivers/mtd/maps/Kconfig	2008-05-19 23:45:18.000000000 +0100
@@ -546,24 +546,6 @@ config MTD_DMV182
         help
           Map driver for Dy-4 SVME/DMV-182 board.
 
-config MTD_BAST
-	tristate "Map driver for Simtec BAST (EB2410ITX) or Thorcom VR1000"
-	depends on ARCH_BAST || MACH_VR1000
-	select MTD_PARTITIONS
-	select MTD_MAP_BANK_WIDTH_16
-	select MTD_JEDECPROBE
-	help
-	  Map driver for NOR flash on the Simtec BAST (EB2410ITX), or the
-	  Thorcom VR1000
-
-	  Note, this driver *cannot* over-ride the WP link on the
-	  board, or currently detect the state of the link.
-
-config MTD_BAST_MAXSIZE
-	int "Maximum size for BAST flash area (MiB)"
-	depends on MTD_BAST
-	default "4"
-
 config MTD_SHARP_SL
 	tristate "ROM mapped on Sharp SL Series"
 	depends on ARCH_PXA
Index: linux-2.6.26-rc3-quilt2/drivers/mtd/maps/Makefile
===================================================================
--- linux-2.6.26-rc3-quilt2.orig/drivers/mtd/maps/Makefile	2008-05-19 23:04:02.000000000 +0100
+++ linux-2.6.26-rc3-quilt2/drivers/mtd/maps/Makefile	2008-05-19 23:45:18.000000000 +0100
@@ -10,7 +10,6 @@ endif
 # Chip mappings
 obj-$(CONFIG_MTD_CDB89712)	+= cdb89712.o
 obj-$(CONFIG_MTD_ARM_INTEGRATOR)+= integrator-flash.o
-obj-$(CONFIG_MTD_BAST)		+= bast-flash.o
 obj-$(CONFIG_MTD_CFI_FLAGADM)	+= cfi_flagadm.o
 obj-$(CONFIG_MTD_DC21285)	+= dc21285.o
 obj-$(CONFIG_MTD_DILNETPC)	+= dilnetpc.o
Index: linux-2.6.26-rc3-quilt2/drivers/mtd/maps/bast-flash.c
===================================================================
--- linux-2.6.26-rc3-quilt2.orig/drivers/mtd/maps/bast-flash.c	2008-05-19 23:04:02.000000000 +0100
+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
@@ -1,226 +0,0 @@
-/* linux/drivers/mtd/maps/bast-flash.c
- *
- * Copyright (c) 2004-2005 Simtec Electronics
- *	Ben Dooks <ben@simtec.co.uk>
- *
- * Simtec Bast (EB2410ITX) NOR MTD Mapping driver
- *
- * Changelog:
- *	20-Sep-2004  BJD  Initial version
- *	17-Jan-2005  BJD  Add whole device if no partitions found
- *
- * $Id: bast-flash.c,v 1.5 2005/11/07 11:14:26 gleixner Exp $
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-*/
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/ioport.h>
-#include <linux/device.h>
-#include <linux/slab.h>
-#include <linux/platform_device.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-
-#include <asm/io.h>
-#include <asm/mach/flash.h>
-
-#include <asm/arch/map.h>
-#include <asm/arch/bast-map.h>
-#include <asm/arch/bast-cpld.h>
-
-#ifdef CONFIG_MTD_BAST_MAXSIZE
-#define AREA_MAXSIZE (CONFIG_MTD_BAST_MAXSIZE * SZ_1M)
-#else
-#define AREA_MAXSIZE (32 * SZ_1M)
-#endif
-
-#define PFX "bast-flash: "
-
-struct bast_flash_info {
-	struct mtd_info		*mtd;
-	struct map_info		 map;
-	struct mtd_partition	*partitions;
-	struct resource		*area;
-};
-
-static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
-
-static void bast_flash_setrw(int to)
-{
-	unsigned int val;
-	unsigned long flags;
-
-	local_irq_save(flags);
-	val = __raw_readb(BAST_VA_CTRL3);
-
-	if (to)
-		val |= BAST_CPLD_CTRL3_ROMWEN;
-	else
-		val &= ~BAST_CPLD_CTRL3_ROMWEN;
-
-	pr_debug("new cpld ctrl3=%02x\n", val);
-
-	__raw_writeb(val, BAST_VA_CTRL3);
-	local_irq_restore(flags);
-}
-
-static int bast_flash_remove(struct platform_device *pdev)
-{
-	struct bast_flash_info *info = platform_get_drvdata(pdev);
-
-	platform_set_drvdata(pdev, NULL);
-
-	if (info == NULL)
-		return 0;
-
-	if (info->map.virt != NULL)
-		iounmap(info->map.virt);
-
-	if (info->mtd) {
-		del_mtd_partitions(info->mtd);
-		map_destroy(info->mtd);
-	}
-
-	kfree(info->partitions);
-
-	if (info->area) {
-		release_resource(info->area);
-		kfree(info->area);
-	}
-
-	kfree(info);
-
-	return 0;
-}
-
-static int bast_flash_probe(struct platform_device *pdev)
-{
-	struct bast_flash_info *info;
-	struct resource *res;
-	int err = 0;
-
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
-	if (info == NULL) {
-		printk(KERN_ERR PFX "no memory for flash info\n");
-		err = -ENOMEM;
-		goto exit_error;
-	}
-
-	memzero(info, sizeof(*info));
-	platform_set_drvdata(pdev, info);
-
-	res = pdev->resource;  /* assume that the flash has one resource */
-
-	info->map.phys = res->start;
-	info->map.size = res->end - res->start + 1;
-	info->map.name = pdev->dev.bus_id;
-	info->map.bankwidth = 2;
-
-	if (info->map.size > AREA_MAXSIZE)
-		info->map.size = AREA_MAXSIZE;
-
-	pr_debug("%s: area %08lx, size %ld\n", __func__,
-		 info->map.phys, info->map.size);
-
-	info->area = request_mem_region(res->start, info->map.size,
-					pdev->name);
-	if (info->area == NULL) {
-		printk(KERN_ERR PFX "cannot reserve flash memory region\n");
-		err = -ENOENT;
-		goto exit_error;
-	}
-
-	info->map.virt = ioremap(res->start, info->map.size);
-	pr_debug("%s: virt at %08x\n", __func__, (int)info->map.virt);
-
-	if (info->map.virt == 0) {
-		printk(KERN_ERR PFX "failed to ioremap() region\n");
-		err = -EIO;
-		goto exit_error;
-	}
-
-	simple_map_init(&info->map);
-
-	/* enable the write to the flash area */
-
-	bast_flash_setrw(1);
-
-	/* probe for the device(s) */
-
-	info->mtd = do_map_probe("jedec_probe", &info->map);
-	if (info->mtd == NULL)
-		info->mtd = do_map_probe("cfi_probe", &info->map);
-
-	if (info->mtd == NULL) {
-		printk(KERN_ERR PFX "map_probe() failed\n");
-		err = -ENXIO;
-		goto exit_error;
-	}
-
-	/* mark ourselves as the owner */
-	info->mtd->owner = THIS_MODULE;
-
-	err = parse_mtd_partitions(info->mtd, probes, &info->partitions, 0);
-	if (err > 0) {
-		err = add_mtd_partitions(info->mtd, info->partitions, err);
-		if (err)
-			printk(KERN_ERR PFX "cannot add/parse partitions\n");
-	} else {
-		err = add_mtd_device(info->mtd);
-	}
-
-	if (err == 0)
-		return 0;
-
-	/* fall through to exit error */
-
- exit_error:
-	bast_flash_remove(pdev);
-	return err;
-}
-
-static struct platform_driver bast_flash_driver = {
-	.probe		= bast_flash_probe,
-	.remove		= bast_flash_remove,
-	.driver		= {
-		.name	= "bast-nor",
-		.owner	= THIS_MODULE,
-	},
-};
-
-static int __init bast_flash_init(void)
-{
-	printk("BAST NOR-Flash Driver, (c) 2004 Simtec Electronics\n");
-	return platform_driver_register(&bast_flash_driver);
-}
-
-static void __exit bast_flash_exit(void)
-{
-	platform_driver_unregister(&bast_flash_driver);
-}
-
-module_init(bast_flash_init);
-module_exit(bast_flash_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
-MODULE_DESCRIPTION("BAST MTD Map driver");
-MODULE_ALIAS("platform:bast-nor");

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
