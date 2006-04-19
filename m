Received: from pproxy.gmail.com ([64.233.166.183])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FWHyU-0001gA-MD
	for linux-mtd@lists.infradead.org; Wed, 19 Apr 2006 15:04:35 -0400
Received: by pproxy.gmail.com with SMTP id i49so1137437pyi
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Apr 2006 12:04:25 -0700 (PDT)
Message-ID: <f19298770604191204he066f6ctd090a21c6aaeca83@mail.gmail.com>
Date: Wed, 19 Apr 2006 23:04:25 +0400
From: "Alexey Zaytsev" <alexey.zaytsev@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [PATCH] Random fixes for the ixp4xx mapping driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all.

I've made a few fixes to the driver, including:

- Fix build with partitioning disabled.
- Change the error handling path in a cleaner way.
- Some coding style.


Hope gmail won't mess with it.

--- linux-2.6.16.1.orig/drivers/mtd/maps/ixp4xx.c       2006-04-19
21:03:06.000000000 +0400
+++ linux-2.6.16.1/drivers/mtd/maps/ixp4xx.c    2006-04-19
22:13:37.000000000 +0400
@@ -151,7 +151,9 @@
       struct resource *res;
 };

-static const char *probes[] =3D { "RedBoot", "cmdlinepart", NULL };
+#ifdef CONFIG_MTD_PARTITIONS
+static const char *probes[] __initdata =3D { "RedBoot", "cmdlinepart", NUL=
L };
+#endif

  static int ixp4xx_flash_remove(struct platform_device *dev)
 {
@@ -164,7 +166,9 @@
               return 0;

       if (info->mtd) {
+#ifdef CONFIG_MTD_PARTITIONS
               del_mtd_partitions(info->mtd);
+#endif
               map_destroy(info->mtd);
       }
       if (info->map.virt)
@@ -187,7 +191,7 @@
 {
       struct flash_platform_data *plat =3D dev->dev.platform_data;
       struct ixp4xx_flash_info *info;
-       int err =3D -1;
+       int err =3D 0;

       if (!plat)
               return -ENODEV;
@@ -201,7 +205,7 @@
       info =3D kmalloc(sizeof(struct ixp4xx_flash_info), GFP_KERNEL);
       if(!info) {
               err =3D -ENOMEM;
-               goto Error;
+               goto out;
       }
       memzero(info, sizeof(struct ixp4xx_flash_info));

@@ -221,9 +225,9 @@
        */
       info->map.bankwidth =3D 2;
       info->map.name =3D dev->dev.bus_id;
-       info->map.read =3D ixp4xx_read16,
-       info->map.write =3D ixp4xx_probe_write16,
-       info->map.copy_from =3D ixp4xx_copy_from,
+       info->map.read =3D ixp4xx_read16;
+       info->map.write =3D ixp4xx_probe_write16;
+       info->map.copy_from =3D ixp4xx_copy_from;

       info->res =3D request_mem_region(dev->resource->start,
                       dev->resource->end - dev->resource->start + 1,
@@ -231,7 +235,7 @@
       if (!info->res) {
               printk(KERN_ERR "IXP4XXFlash: Could not reserve memory
region\n");
               err =3D -ENOMEM;
-               goto Error;
+               goto out;
       }

       info->map.virt =3D ioremap(dev->resource->start,
@@ -239,35 +243,36 @@
       if (!info->map.virt) {
               printk(KERN_ERR "IXP4XXFlash: Failed to ioremap region\n");
               err =3D -EIO;
-               goto Error;
+               goto out;
       }

       info->mtd =3D do_map_probe(plat->map_name, &info->map);
       if (!info->mtd) {
               printk(KERN_ERR "IXP4XXFlash: map_probe failed\n");
               err =3D -ENXIO;
-               goto Error;
+               goto out;
       }
       info->mtd->owner =3D THIS_MODULE;

       /* Use the fast version */
-       info->map.write =3D ixp4xx_write16,
+       info->map.write =3D ixp4xx_write16;

+#ifdef CONFIG_MTD_PARTITIONS
       err =3D parse_mtd_partitions(info->mtd, probes, &info->partitions, 0=
);
       if (err > 0) {
               err =3D add_mtd_partitions(info->mtd, info->partitions, err)=
;
-               if(err)
-                       printk(KERN_ERR "Could not parse partitions\n");
+
       }
+       if (err < 0)
+               printk(KERN_ERR "Could not parse partitions\n");
+#endif

+out:
       if (err)
-               goto Error;
-
+               ixp4xx_flash_remove(dev);
+
       return 0;

-Error:
-       ixp4xx_flash_remove(dev);
-       return err;
 }

  static struct platform_driver ixp4xx_flash_driver =3D {
