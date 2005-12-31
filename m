Received: from cassiel.sirena.org.uk ([80.68.93.111])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EsgUK-0004mR-KT
	for linux-mtd@lists.infradead.org; Sat, 31 Dec 2005 08:09:45 -0500
Date: Sat, 31 Dec 2005 12:33:41 +0000
From: Mark Brown <broonie@sirena.org.uk>
To: Deepak Saxena <dsaxena@plexity.net>
Message-ID: <20051231123341.GB4584@sirena.org.uk>
References: <20051229232138.GA32463@plexity.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
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


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2005 at 03:21:38PM -0800, Deepak Saxena wrote:

> MTD layer and have the physmap driver use it. The physmap driver
> could register itself as a platform driver for "phys-mtd" devices
> and boards would just fill in platform_device structure with the
> appropriate resource window and the needed fields below as the
> platform_data. We may want to trim down the structure to remove=20
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

diff -uprN linux-2.6.13/drivers/mtd/maps/Kconfig linux-plat-flash/drivers/m=
td/maps/Kconfig
--- linux-2.6.13/drivers/mtd/maps/Kconfig	2005-08-29 00:41:01.000000000 +01=
00
+++ linux-plat-flash/drivers/mtd/maps/Kconfig	2005-09-08 18:51:13.984319480=
 +0100
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
diff -uprN linux-2.6.13/drivers/mtd/maps/Makefile linux-plat-flash/drivers/=
mtd/maps/Makefile
--- linux-2.6.13/drivers/mtd/maps/Makefile	2005-08-29 00:41:01.000000000 +0=
100
+++ linux-plat-flash/drivers/mtd/maps/Makefile	2005-09-08 18:51:08.70612188=
8 +0100
@@ -69,4 +69,5 @@ obj-$(CONFIG_MTD_WRSBC8260)	+=3D wr_sbc82x
 obj-$(CONFIG_MTD_DMV182)	+=3D dmv182.o
 obj-$(CONFIG_MTD_SHARP_SL)	+=3D sharpsl-flash.o
 obj-$(CONFIG_MTD_PLATRAM)	+=3D plat-ram.o
+obj-$(CONFIG_MTD_PLATFLASH)     +=3D plat-flash.o
 obj-$(CONFIG_MTD_OMAP_NOR)	+=3D omap_nor.o
diff -uprN linux-2.6.13/drivers/mtd/maps/plat-flash.c linux-plat-flash/driv=
ers/mtd/maps/plat-flash.c
--- linux-2.6.13/drivers/mtd/maps/plat-flash.c	1970-01-01 01:00:00.00000000=
0 +0100
+++ linux-plat-flash/drivers/mtd/maps/plat-flash.c	2005-09-08 18:48:56.7111=
88168 +0100
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
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  U=
SA
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
+	info->map.name =3D pdata->mapname !=3D NULL ? pdata->mapname : pd->name;
+	info->map.bankwidth =3D pdata->bankwidth;
+
+	/* register our usage of the memory area */
+
+	info->area =3D request_mem_region(res->start, info->map.size, pd->name);
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
diff -uprN linux-2.6.13/include/linux/mtd/plat-flash.h linux-plat-flash/inc=
lude/linux/mtd/plat-flash.h
--- linux-2.6.13/include/linux/mtd/plat-flash.h	1970-01-01 01:00:00.0000000=
00 +0100
+++ linux-plat-flash/include/linux/mtd/plat-flash.h	2005-09-08 18:49:28.000=
000000 +0100
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

--=20
"You grabbed my hand and we fell into it, like a daydream - or a fever."

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iQCVAwUBQ7Z6mg2erOLNe+68AQKdBAQAjLzpni8b5T/bPxEBeH81NI30zfLJzE4F
CdXIws6m9inZpvl1UNXgthkIzKv65xV+N1xcthNwiMXKw3veGb9l36V/ABmeOL4D
AICh0u8szcrPtVtAMXlgpKDkmTK99tmASDB08I/cnZ2WNmybFK+3ZMvt9yZLkj1E
DGP+JDRXwUc=
=sip2
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
