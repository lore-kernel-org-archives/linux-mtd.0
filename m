Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CqvZT-0002f7-2Y
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 10:47:11 -0500
Received: from ben by aeryn.fluff.org.uk with local (Exim 3.36 #1 (Debian))
	id 1CqvZK-0001g9-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jan 2005 15:46:58 +0000
Date: Tue, 18 Jan 2005 15:46:58 +0000
From: Ben Dooks <ben-mtd@fluff.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20050118154658.GA6404@home.fluff.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
Sender: Ben Dooks <ben@fluff.org>
Subject: new driver - generic platform device for ram mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch adds a generic platform_device driver for
adding areas of RAM to be exported as an MTD device.

Using the platform_device method enables boards to
register areas of RAM with the MTD system without
having to update a driver in the MTD map code. As
an example, an patch to add the 1024KiB area of
static RAM on the VR1000 has also been attached

If people do not object, I will commit this to the
CVS in a couple of days.

files changed:
 drivers/mtd/maps/Kconfig     |   10 +
 drivers/mtd/maps/Makefile    |    1 
 drivers/mtd/maps/plat-ram.c  |  286 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/plat-ram.h |   33 ++++
 4 files changed, 330 insertions(+)


-- 
Ben

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mtd-platram.diff"

diff -urN -X ../dontdiff linux-2.6.11-rc1-bk1/drivers/mtd/maps/Kconfig linux-2.6.11-rc1-bk1-bjd2-th3/drivers/mtd/maps/Kconfig
--- linux-2.6.11-rc1-bk1/drivers/mtd/maps/Kconfig	2005-01-12 23:13:47.000000000 +0000
+++ linux-2.6.11-rc1-bk1-bjd2-th3/drivers/mtd/maps/Kconfig	2005-01-18 14:11:56.000000000 +0000
@@ -667,5 +667,15 @@
 	help
 	  This enables access to the flash chip on the Sharp SL Series of PDAs.
 
+config MTD_PLATRAM
+	tristate "Map driver for platfrom device RAM (mtd-ram)"
+	depends on MTD
+	select MTD_RAM
+	help
+	  Map driver for RAM areas described via the platform device
+	  system.
+
+	  This selection automatically selects the map_ram driver.
+
 endmenu
 
diff -urN -X ../dontdiff linux-2.6.11-rc1-bk1/drivers/mtd/maps/Makefile linux-2.6.11-rc1-bk1-bjd2-th3/drivers/mtd/maps/Makefile
--- linux-2.6.11-rc1-bk1/drivers/mtd/maps/Makefile	2005-01-12 23:13:47.000000000 +0000
+++ linux-2.6.11-rc1-bk1-bjd2-th3/drivers/mtd/maps/Makefile	2005-01-14 17:15:38.000000000 +0000
@@ -72,3 +72,4 @@
 obj-$(CONFIG_MTD_WRSBC8260)	+= wr_sbc82xx_flash.o
 obj-$(CONFIG_MTD_DMV182)	+= dmv182.o
 obj-$(CONFIG_MTD_SHARP_SL)	+= sharpsl-flash.o
+obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
\ No newline at end of file
diff -urN -X ../dontdiff linux-2.6.11-rc1-bk1/drivers/mtd/maps/plat-ram.c linux-2.6.11-rc1-bk1-bjd2-th3/drivers/mtd/maps/plat-ram.c
--- linux-2.6.11-rc1-bk1/drivers/mtd/maps/plat-ram.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.11-rc1-bk1-bjd2-th3/drivers/mtd/maps/plat-ram.c	2005-01-18 11:05:44.000000000 +0000
@@ -0,0 +1,286 @@
+/* drivers/mtd/maps/plat-ram.c
+ *
+ * (c) 2004-2005 Simtec Electronics
+ *	http://www.simtec.co.uk/products/SWLINUX/
+ *	Ben Dooks <ben@simtec.co.uk>
+ *
+ * Generic platfrom device based RAM map
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
+#define DEBUG
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
+#include <linux/mtd/plat-ram.h>
+
+#include <asm/io.h>
+
+/* private structure for each mtd platform ram device created */
+
+struct platram_info {
+	struct device		*dev;
+	struct mtd_info		*mtd;
+	struct map_info		 map;
+	struct mtd_partition	*partitions;
+	struct resource		*area;
+	struct platdata_mtd_ram	*pdata;
+};
+
+/* to_platram_info()
+ *
+ * device private data to struct platram_info conversion
+*/
+
+static inline struct platram_info *to_platram_info(struct device *dev)
+{
+	return (struct platram_info *)dev_get_drvdata(dev);
+}
+
+/* platram_setrw
+ *
+ * call the platform device's set rw/ro control
+ *
+ * to = 0 => read-only
+ *    = 1 => read-write
+*/
+
+static inline void platram_setrw(struct platram_info *info, int to)
+{
+	if (info->pdata == NULL)
+		return;
+
+	if (info->pdata->set_rw != NULL)
+		(info->pdata->set_rw)(info->dev, to);
+}
+
+/* platram_remove
+ *
+ * called to remove the device from the driver's control
+*/
+
+static int platram_remove(struct device *dev)
+{
+	struct platram_info *info = to_platram_info(dev);
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
+	/* ensure ram is left read-only */
+
+	platram_setrw(info, PLATRAM_RO);
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
+/* platram_probe
+ *
+ * called from device drive system when a device matching our
+ * driver is found.
+*/
+
+static int platram_probe(struct device *dev)
+{
+	struct platform_device *pd = to_platform_device(dev);
+	struct platdata_mtd_ram	*pdata;
+	struct platram_info *info;
+	struct resource *res;
+	int err = 0;
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
+	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	if (info == NULL) {
+		dev_err(dev, "no memory for flash info\n");
+		err = -ENOMEM;
+		goto exit_error;
+	}
+
+	memzero(info, sizeof(*info));
+	dev_set_drvdata(dev, info);
+
+	info->dev = dev;
+	info->pdata = pdata;
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
+	dev_dbg(dev, "virt %p, %d bytes\n", info->map.virt, info->map.size);
+
+	if (info->map.virt == NULL) {
+		dev_err(dev, "failed to ioremap() region\n");
+		err = -EIO;
+		goto exit_free;
+	}
+
+	{
+		unsigned int *p = (unsigned int *)info->map.virt;
+		printk("%08x %08x %08x %08x\n",
+		       readl(p), readl(p+1), readl(p+2), readl(p+3));
+	}
+
+	simple_map_init(&info->map);
+
+	dev_dbg(dev, "initialised map, probing for mtd\n");
+
+	/* probe for the right mtd map driver */
+
+	info->mtd = do_map_probe("map_ram" , &info->map);
+	if (info->mtd == NULL) {
+		dev_err(dev, "failed to probe for map_ram\n");
+		err = -ENOMEM;
+		goto exit_free;
+	}
+
+	info->mtd->owner = THIS_MODULE;
+
+	platram_setrw(info, PLATRAM_RW);
+
+	/* check to see if there are any available partitions, or wether
+	 * to add this device whole */
+
+#ifdef CONFIG_MTD_PARTITIONS
+	if (pdata->nr_partitions > 0) {
+		const char **probes = { NULL };
+
+		if (pdata->probes)
+			probes = (const char **)pdata->probes;
+
+		err = parse_mtd_partitions(info->mtd, probes,
+					   &info->partitions, 0);
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
+	platram_remove(dev);
+ exit_error:
+	return err;
+}
+
+/* device driver info */
+
+static struct device_driver platram_driver = {
+	.name		= "mtd-ram",
+	.bus		= &platform_bus_type,
+	.probe		= platram_probe,
+	.remove		= platram_remove,
+};
+
+/* module init/exit */
+
+static int __init platram_init(void)
+{
+	printk("Generic platform RAM MTD, (c) 2004 Simtec Electronics\n");
+	return driver_register(&platram_driver);
+}
+
+static void __exit platram_exit(void)
+{
+	driver_unregister(&platram_driver);
+}
+
+module_init(platram_init);
+module_exit(platram_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
+MODULE_DESCRIPTION("MTD platform RAM map driver");
diff -urN -X ../dontdiff linux-2.6.11-rc1-bk1/include/linux/mtd/plat-ram.h linux-2.6.11-rc1-bk1-bjd2-th3/include/linux/mtd/plat-ram.h
--- linux-2.6.11-rc1-bk1/include/linux/mtd/plat-ram.h	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.11-rc1-bk1-bjd2-th3/include/linux/mtd/plat-ram.h	2005-01-14 17:14:21.000000000 +0000
@@ -0,0 +1,33 @@
+/* linux/include/mtd/plat-ram.h
+ *
+ * (c) 2004 Simtec Electronics
+ *	http://www.simtec.co.uk/products/SWLINUX/
+ *	Ben Dooks <ben@simtec.co.uk>
+ *
+ * Generic platform device based RAM map
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __LINUX_MTD_PLATRAM_H
+#define __LINUX_MTD_PLATRAM_H __FILE__
+
+#define PLATRAM_RO (0)
+#define PLATRAM_RW (1)
+
+struct platdata_mtd_ram {
+	char			*mapname;
+	char		       **probes;
+	struct mtd_partition	*partitions;
+	int			 nr_partitions;
+	int			 bankwidth;
+
+	/* control callbacks */
+
+	void	(*set_rw)(struct device *dev, int to);
+};
+
+#endif /* __LINUX_MTD_PLATRAM_H */

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="vr1000-platram.patch"

--- linux-2.6.11-rc1-bk1-bjd2-th2/arch/arm/mach-s3c2410/mach-vr1000.c	2005-01-18 10:45:30.000000000 +0000
+++ linux-2.6.11-rc1-bk1-bjd2-th3/arch/arm/mach-s3c2410/mach-vr1000.c	2005-01-18 14:21:43.000000000 +0000
@@ -46,6 +46,9 @@
 #include <asm/arch/vr1000-irq.h>
 #include <asm/arch/vr1000-cpld.h>
 
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/plat-ram.h>
+
 #include <asm/hardware.h>
 #include <asm/io.h>
 #include <asm/irq.h>
@@ -252,6 +255,52 @@
 };
 
 
+/* MTD RAM registration */
+
+static void vr1000_ram_setrw(struct device *dev, int to)
+{
+	unsigned int val;
+	unsigned long flags;
+
+	printk(KERN_INFO "%s: dev %p, to=%d\n", __FUNCTION__, dev, to);
+
+	local_irq_save(flags);
+
+	val = __raw_readb(BAST_VA_CTRL2);
+	val &= ~VR1000_CPLD_CTRL2_RAMWEN;
+
+	if (to)
+		val |= VR1000_CPLD_CTRL2_RAMWEN;
+
+	__raw_writeb(val, BAST_VA_CTRL2);
+
+	local_irq_restore(flags);
+}
+
+struct platdata_mtd_ram vr1000_ram_pdata = {
+	.mapname	= "VR1000 RAM",
+	.bankwidth	= 2,
+	.set_rw		= vr1000_ram_setrw,
+};
+
+static struct resource vr1000_ram_resource[] = {
+	[0] = {
+		.start = VR1000_PA_SRAM,
+		.end   = VR1000_PA_SRAM + (SZ_1M - 1),
+		.flags = IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device vr1000_ram = {
+	.name		= "mtd-ram",
+	.id		= 0,
+	.resource	= vr1000_ram_resource,
+	.num_resources	= ARRAY_SIZE(vr1000_ram_resource),
+	.dev	= {
+		.platform_data = &vr1000_ram_pdata,
+	},
+};
+
 static struct platform_device *vr1000_devices[] __initdata = {
 	&s3c_device_usb,
 	&s3c_device_lcd,
@@ -260,6 +309,7 @@
 	&s3c_device_iis,
 	&serial_device,
 	&vr1000_nor,
+	&vr1000_ram
 };
 
 static struct clk *vr1000_clocks[] = {

--VS++wcV0S1rZb1Fb--
