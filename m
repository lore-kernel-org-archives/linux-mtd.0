Received: from cassiel.sirena.org.uk ([80.68.93.111])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FJFkE-0004Ah-9T
	for linux-mtd@lists.infradead.org; Tue, 14 Mar 2006 15:03:58 -0500
Date: Tue, 14 Mar 2006 20:03:04 +0000
From: Mark Brown <broonie@sirena.org.uk>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Message-ID: <20060314200304.GC6229@sirena.org.uk>
References: <20060212170441.GA28427@xi.wantstofly.org>
	<20060228191642.GB19811@xi.wantstofly.org>
	<20060312221248.GA7525@wohnheim.fh-wedel.de>
	<20060313184729.GB19014@sirena.org.uk>
	<20060313191448.GA3998@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20060313191448.GA3998@wohnheim.fh-wedel.de>
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [less intrusive PATCH, RFC] don't load physmap if length is zero
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 13, 2006 at 08:14:48PM +0100, J=F6rn Engel wrote:

> Sure.  So why don't you:
> 1. Turn physmap.c into a platform driver.
> 2. Rename physmap.c into something.c
> 3. Remove unnecessary generic code from something.c
> 4. Submit a patch adding something.c

That's roughly what I have done (except I just added the ability to
configure the probe type to a copy of the existing platform RAM driver).
A patch against 2.6.13 is below: it probably needs updating.  Ben Dooks
wanted me to re-add the write locking support that the original code had
but I stripped out pending adding windowing support.

I haven't been trying very hard to integrate that yet (I think I posted
it once before), mostly due to not having done what Ben asked although
there's no reason why that couldn't be added later.

> Instead, steps 2 and 3 were skipped and physmap itself was supposed to
> become a platform driver.  And at the moment I don't understand the
> advantages of skipping said steps.

That makes sense.  I guess if I were going to do anything with physmap I
would be making it register a platform device rather than just talk to
the MTD code directly.

diff -uprN linux-2.6.13/drivers/mtd/maps/Kconfig linux-plat-flash/drivers=
/mtd/maps/Kconfig
--- linux-2.6.13/drivers/mtd/maps/Kconfig	2005-08-29 00:41:01.000000000 +=
0100
+++ linux-plat-flash/drivers/mtd/maps/Kconfig	2005-09-08 18:51:13.9843194=
80 +0100
@@ -624,5 +624,12 @@ config MTD_PLATRAM
=20
 	  This selection automatically selects the map_ram driver.
=20
+config MTD_PLATFLASH
+	tristate "Map driver for platform device physically mapped flash"
+	depends on MTD
+	help
+	  Map driver allowing MTD devices which are physically mapped into
+	  the CPU's address space to be enumerated using the platform bus.
+
 endmenu
=20
diff -uprN linux-2.6.13/drivers/mtd/maps/Makefile linux-plat-flash/driver=
s/mtd/maps/Makefile
--- linux-2.6.13/drivers/mtd/maps/Makefile	2005-08-29 00:41:01.000000000 =
+0100
+++ linux-plat-flash/drivers/mtd/maps/Makefile	2005-09-08 18:51:08.706121=
888 +0100
@@ -69,4 +69,5 @@ obj-$(CONFIG_MTD_WRSBC8260)	+=3D wr_sbc82x
 obj-$(CONFIG_MTD_DMV182)	+=3D dmv182.o
 obj-$(CONFIG_MTD_SHARP_SL)	+=3D sharpsl-flash.o
 obj-$(CONFIG_MTD_PLATRAM)	+=3D plat-ram.o
+obj-$(CONFIG_MTD_PLATFLASH)     +=3D plat-flash.o
 obj-$(CONFIG_MTD_OMAP_NOR)	+=3D omap_nor.o
diff -uprN linux-2.6.13/drivers/mtd/maps/plat-flash.c linux-plat-flash/dr=
ivers/mtd/maps/plat-flash.c
--- linux-2.6.13/drivers/mtd/maps/plat-flash.c	1970-01-01 01:00:00.000000=
000 +0100
+++ linux-plat-flash/drivers/mtd/maps/plat-flash.c	2005-09-08 18:48:56.71=
1188168 +0100
@@ -0,0 +1,272 @@
+/* drivers/mtd/maps/plat-flash.c
+ *
+ * (c) 2005 Aculab plc
+ *     Mark Brown <broonie@sirena.org.uk>
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
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 =
 USA
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
+/* private structure for each mtd platform device created */
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
+static inline struct platflash_info *to_platflash_info(struct device *de=
v)
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
+	struct platflash_info *info =3D to_platflash_info(dev);
+
+	dev_set_drvdata(dev, NULL);
+
+	dev_dbg(dev, "removing device\n");
+
+	if (info =3D=3D NULL)=20
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
+	if (info->map.virt !=3D NULL)
+		iounmap(info->map.virt);
+=09
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
+	struct platform_device *pd =3D to_platform_device(dev);
+	struct platflash_info *info;
+	struct platdata_mtd_flash *pdata;
+	struct resource *res;
+	int err =3D 0;
+	int i;
+
+	dev_dbg(dev, "probe entered\n");
+
+	if (dev->platform_data =3D=3D NULL) {
+		dev_err(dev, "no platform data supplied\n");
+		err =3D -ENOENT;
+		goto exit_error;
+	}
+
+	pdata =3D dev->platform_data;
+
+	if (pdata->chip_probes =3D=3D 0) {
+		dev_err(dev, "no chip probes specified\n");
+		err =3D -ENOENT;
+		goto exit_error;
+	}
+=09
+	info =3D kmalloc(sizeof(*info), GFP_KERNEL);
+	if (info =3D=3D NULL) {
+		dev_err(dev, "no memory for flash info\n");
+		err =3D -ENOMEM;
+		goto exit_error;
+	}
+
+	memset(info, 0, sizeof(*info));
+	dev_set_drvdata(dev, info);
+
+	info->dev =3D dev;
+
+	/* get the resource for the memory mapping */
+
+	res =3D platform_get_resource(pd, IORESOURCE_MEM, 0);
+
+	if (res =3D=3D NULL) {
+		dev_err(dev, "no memory resource specified\n");
+		err =3D -ENOENT;
+		goto exit_free;
+	}
+
+	dev_dbg(dev, "got platform resource %p (0x%lx)\n", res, res->start);
+
+	/* setup map parameters */
+
+	info->map.phys =3D res->start;
+	info->map.size =3D (res->end - res->start) + 1;
+	info->map.name =3D pdata->mapname !=3D NULL ? pdata->mapname : pd->name=
;
+	info->map.bankwidth =3D pdata->bankwidth;
+
+	/* register our usage of the memory area */
+
+	info->area =3D request_mem_region(res->start, info->map.size, pd->name)=
;
+	if (info->area =3D=3D NULL) {
+		dev_err(dev, "failed to request memory region\n");
+		err =3D -EIO;
+		goto exit_free;
+	}
+
+	/* remap the memory area */
+
+	info->map.virt =3D ioremap(res->start, info->map.size);
+	dev_dbg(dev, "virt %p, %lu bytes\n", info->map.virt, info->map.size);
+
+	if (info->map.virt =3D=3D NULL) {
+		dev_err(dev, "failed to ioremap() region\n");
+		err =3D -EIO;
+		goto exit_free;
+	}
+
+	simple_map_init(&info->map);
+
+	dev_dbg(dev, "initialised map, probing for mtd\n");
+
+	/* probe for the right mtd map driver */
+	i =3D 0;
+	while (pdata->chip_probes[i]) {
+		dev_dbg(dev, "probing with %s\n", pdata->chip_probes[i]);
+		info->mtd =3D do_map_probe(pdata->chip_probes[i], &info->map);
+		i++;
+		if (info->mtd !=3D NULL)=20
+			break;
+	}
+	if (info->mtd =3D=3D NULL) {
+		dev_err(dev, "failed to identify device\n");
+		err =3D -ENOMEM;
+		goto exit_free;
+	}
+
+	info->mtd->owner =3D THIS_MODULE;
+
+	/* check to see if there are any available partitions, or wether
+	 * to add this device whole */
+
+#ifdef CONFIG_MTD_PARTITIONS
+	if (pdata->nr_partitions > 0) {
+		if (pdata->partition_probes)
+		{
+			err =3D parse_mtd_partitions(info->mtd,
+						   pdata->partition_probes,
+						   &info->partitions, 0);
+		}
+		else
+		{
+			err =3D pdata->nr_partitions;
+			info->partitions =3D pdata->partitions;
+		}
+
+		if (err > 0) {
+			err =3D add_mtd_partitions(info->mtd, info->partitions,
+						 err);
+		}
+	}
+#endif /* CONFIG_MTD_PARTITIONS */
+
+	if (add_mtd_device(info->mtd)) {
+		dev_err(dev, "add_mtd_device() failed\n");
+		err =3D -ENOMEM;
+	}
+=09
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
+static struct device_driver platflash_driver =3D {
+	.name		=3D "mtd-phys",
+	.bus		=3D &platform_bus_type,
+	.probe		=3D platflash_probe,
+	.remove		=3D platflash_remove,
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
diff -uprN linux-2.6.13/include/linux/mtd/plat-flash.h linux-plat-flash/i=
nclude/linux/mtd/plat-flash.h
--- linux-2.6.13/include/linux/mtd/plat-flash.h	1970-01-01 01:00:00.00000=
0000 +0100
+++ linux-plat-flash/include/linux/mtd/plat-flash.h	2005-09-08 18:49:28.0=
00000000 +0100
@@ -0,0 +1,31 @@
+/* linux/include/mtd/plat-flash.h
+ *
+ * (c) 2005 Aculab plc
+ *     Mark Brown <broonie@sirena.org.uk>
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

--=20
"You grabbed my hand and we fell into it, like a daydream - or a fever."
