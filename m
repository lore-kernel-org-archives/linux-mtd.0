Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C9Xt0-0001er-Ch
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2004 19:48:00 -0400
Date: Tue, 21 Sep 2004 00:47:57 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20040920234757.GA17214@home.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Ben Dooks <ben@fluff.org>
Cc: ben@fluff.org
Subject: Simtec BAST (EB2410ITX) NOR Map driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Map for NOR flash on Simtec Electronics Bast EB2410ITX

http://www.simtec.co.uk/products/EB2410ITX/

Patch is against 2.6.9-rc2 with September 19th CVS

Signed-off-by: Ben Dooks <ben-mtd@fluff.org>
Signed-off-by: Ben Dooks <ben@simtec.co.uk>

--- linux-2.6.9-rc2-bk6-mtd20040919/drivers/mtd/maps/Kconfig	2004-09-20 13:02:46.000000000 +0100
+++ linux-2.6.9-rc2-bk6-mtd20040919-work/drivers/mtd/maps/Kconfig	2004-09-20 21:01:08.000000000 +0100
@@ -609,5 +609,22 @@
         help
           Map driver for Dy-4 SVME/DMV-182 board.
 
+config MTD_BAST
+	tristate "Map driver for Simtec BAST (EB2410ITX)"
+	depends on ARCH_BAST
+	select MTD_PARTITIONS
+	select MTD_MAP_BANK_WIDTH_16
+	select MTD_JEDECPROBE
+	help
+	  Map driver for NOR flash on the Simtec BAST (EB2410ITX).
+
+	  Note, this driver *cannot* over-ride the WP link on the
+	  board, or currently detect the state of the link.
+
+config MTD_BAST_MAXSIZE
+	int "Maximum size for BAST flash area (Mbyte)"
+	depends on MTD_BAST
+	default "4"
+
 endmenu
 
--- linux-2.6.9-rc2-bk6-mtd20040919/drivers/mtd/maps/Makefile	2004-09-20 13:02:46.000000000 +0100
+++ linux-2.6.9-rc2-bk6-mtd20040919-work/drivers/mtd/maps/Makefile	2004-09-21 00:18:24.000000000 +0100
@@ -10,6 +10,7 @@
 # Chip mappings
 obj-$(CONFIG_MTD_CDB89712)	+= cdb89712.o
 obj-$(CONFIG_MTD_ARM_INTEGRATOR)+= integrator-flash.o
+obj-$(CONFIG_MTD_BAST)		+= bast-flash.o
 obj-$(CONFIG_MTD_CFI_FLAGADM)	+= cfi_flagadm.o
 obj-$(CONFIG_MTD_CSTM_MIPS_IXX)	+= cstm_mips_ixx.o
 obj-$(CONFIG_MTD_DC21285)	+= dc21285.o
--- linux-2.6.9-rc2-bk6-mtd20040919/drivers/mtd/maps/bast-flash.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.9-rc2-bk6-mtd20040919-work/drivers/mtd/maps/bast-flash.c	2004-09-20 22:25:05.000000000 +0100
@@ -0,0 +1,225 @@
+/* linux/drivers/mtd/maps/bast_flash.c
+ *
+ * Copyright (c) 2004 Simtec Electronics
+ * Ben Dooks <ben@simtec.co.uk>
+ *
+ * Simtec Bast (EB2410ITX) NOR MTD Mapping driver
+ *
+ * Changelog:
+ *	20-Sep-2004  BJD  Initial version
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
+
+#include <asm/io.h>
+#include <asm/mach-types.h>
+#include <asm/mach/flash.h>
+
+#include <asm/arch/map.h>
+#include <asm/arch/bast-map.h>
+#include <asm/arch/bast-cpld.h>
+
+#ifdef CONFIG_MTD_BAST_MAXSIZE
+#define AREA_MAXSIZE (CONFIG_MTD_BAST_MAXSIZE * (1024*1024))
+#else
+#define AREA_MAXSIZE (32*1024*1024)
+#endif
+
+#define PFX "bast-flash: "
+
+struct bast_flash_info {
+	struct mtd_info		*mtd;
+	struct map_info		 map;
+	struct mtd_partition	*partitions;
+	struct resource		*area;
+};
+
+static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
+
+static struct bast_flash_info *to_bast_info(struct device *dev)
+{
+	return (struct bast_flash_info *)dev_get_drvdata(dev);
+}
+
+static void bast_flash_setrw(int to)
+{
+	unsigned int val;
+	unsigned long flags;
+
+	local_irq_save(flags);
+	val = __raw_readb(BAST_VA_CTRL3);
+	
+	if (to)
+		val |= BAST_CPLD_CTRL3_ROMWEN;
+	else
+		val &= ~BAST_CPLD_CTRL3_ROMWEN;
+
+	pr_debug("new cpld ctrl3=%02x\n", val);
+
+	__raw_writeb(val, BAST_VA_CTRL3);
+	local_irq_restore(flags);
+}
+
+static int bast_flash_remove(struct device *dev)
+{
+	struct bast_flash_info *info = to_bast_info(dev);
+
+	dev_set_drvdata(dev, NULL);
+
+	if (info == NULL) 
+		return 0;
+
+	if (info->map.virt != NULL)
+		iounmap(info->map.virt);
+
+	if (info->mtd) {
+		del_mtd_partitions(info->mtd);
+		map_destroy(info->mtd);
+	}
+
+	if (info->partitions)
+		kfree(info->partitions);
+
+	if (info->area) {
+		release_resource(info->area);
+		kfree(info->area);
+	}
+	
+	kfree(info);
+
+	return 0;
+}
+
+static int bast_flash_probe(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct bast_flash_info *info;
+	struct resource *res;
+	int err = 0;
+
+	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	if (info == NULL) {
+		printk(KERN_ERR PFX "no memory for flash info\n");
+		err = -ENOMEM;
+		goto exit_error;
+	}
+
+	memzero(info, sizeof(*info));
+	dev_set_drvdata(dev, info);
+
+	res = pdev->resource;  /* assume that the flash has one resource */
+
+	info->map.phys = res->start;
+	info->map.size = res->end - res->start + 1;
+	info->map.name = dev->bus_id;	
+	info->map.bankwidth = 2;
+	
+	if (info->map.size > AREA_MAXSIZE)
+		info->map.size = AREA_MAXSIZE;
+
+	pr_debug("%s: area %08lx, size %ld\n", __FUNCTION__,
+		 info->map.phys, info->map.size);
+	
+	info->area = request_mem_region(res->start, info->map.size,
+					pdev->name);
+	if (info->area == NULL) {
+		printk(KERN_ERR PFX "cannot reserve flash memory region\n");
+		err = -ENOENT;
+		goto exit_error;
+	}
+
+	info->map.virt = ioremap(res->start, info->map.size);
+	pr_debug("%s: virt at %08x\n", __FUNCTION__, (int)info->map.virt);
+
+	if (info->map.virt == 0) {
+		printk(KERN_ERR PFX "failed to ioremap() region\n");
+		err = -EIO;
+		goto exit_error;
+	}
+ 
+	simple_map_init(&info->map);
+
+	/* enable the write to the flash area */
+
+	bast_flash_setrw(1);
+
+	/* probe for the device(s) */
+
+	info->mtd = do_map_probe("jedec_probe", &info->map);
+	if (info->mtd == NULL)
+		info->mtd = do_map_probe("cfi_probe", &info->map);
+
+	if (info->mtd == NULL) {
+		printk(KERN_ERR PFX "map_probe() failed\n");
+		err = -ENXIO;
+		goto exit_error;
+	}
+
+	/* mark ourselves as the owner */
+	info->mtd->owner = THIS_MODULE;
+
+	err = parse_mtd_partitions(info->mtd, probes, &info->partitions, 0);
+	if (err > 0) {
+		err = add_mtd_partitions(info->mtd, info->partitions, err);
+		if (err) 
+			printk(KERN_ERR PFX "cannot add/parse partitions\n");
+	}
+
+	if (err == 0)
+		return 0;
+
+	/* fall through to exit error */
+
+ exit_error:
+	bast_flash_remove(dev);
+	return err;
+}
+
+static struct device_driver bast_flash_driver = {
+	.name		= "bast-nor",
+	.bus		= &platform_bus_type,
+	.probe		= bast_flash_probe,
+	.remove		= bast_flash_remove,
+};
+
+static int __init bast_flash_init(void)
+{
+	printk("BAST NOR-Flash Driver, (c) 2004 Simtec Electronics\n");
+	return driver_register(&bast_flash_driver);
+}
+
+static void __exit bast_flash_exit(void)
+{
+	driver_unregister(&bast_flash_driver);
+}
+
+module_init(bast_flash_init);
+module_exit(bast_flash_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
+MODULE_DESCRIPTION("BAST MTD Map driver");
