Received: from service87.mimecast.com ([94.185.240.25])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QMK3D-0007J4-V6
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 13:11:07 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v6 7/8] MTD: Remove integrator-flash
Date: Tue, 17 May 2011 14:11:16 +0100
Message-Id: <1305637877-24436-8-git-send-email-marc.zyngier@arm.com>
In-Reply-To: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
References: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As there is now no in-tree user of integrator-flash, remove
it completely.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 drivers/mtd/Kconfig                 |    3 +-
 drivers/mtd/maps/Makefile           |    1 -
 drivers/mtd/maps/integrator-flash.c |  309 -------------------------------=
----
 3 files changed, 1 insertions(+), 312 deletions(-)
 delete mode 100644 drivers/mtd/maps/integrator-flash.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index b4567c3..bc50d5e 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -148,8 +148,7 @@ config MTD_AFS_PARTS
=20
 =09  You will still need the parsing functions to be called by the driver
 =09  for your particular device. It won't happen automatically. The
-=09  'armflash' map driver (CONFIG_MTD_ARM_INTEGRATOR) does this, for
-=09  example.
+=09  'physmap' map driver (CONFIG_MTD_PHYSMAP) does this, for example.
=20
 config MTD_OF_PARTS
 =09def_bool y
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 08533bd..5b5fa31 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -8,7 +8,6 @@ endif
=20
 # Chip mappings
 obj-$(CONFIG_MTD_CDB89712)=09+=3D cdb89712.o
-obj-$(CONFIG_MTD_ARM_INTEGRATOR)+=3D integrator-flash.o
 obj-$(CONFIG_MTD_CFI_FLAGADM)=09+=3D cfi_flagadm.o
 obj-$(CONFIG_MTD_DC21285)=09+=3D dc21285.o
 obj-$(CONFIG_MTD_DILNETPC)=09+=3D dilnetpc.o
diff --git a/drivers/mtd/maps/integrator-flash.c b/drivers/mtd/maps/integra=
tor-flash.c
deleted file mode 100644
index e22ff5a..0000000
--- a/drivers/mtd/maps/integrator-flash.c
+++ /dev/null
@@ -1,309 +0,0 @@
-/*=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-    drivers/mtd/maps/integrator-flash.c: ARM Integrator flash map driver
-
-    Copyright (C) 2000 ARM Limited
-    Copyright (C) 2003 Deep Blue Solutions Ltd.
-
-   This program is free software; you can redistribute it and/or modify
-   it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 2 of the License, or
-   (at your option) any later version.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  U=
SA
-
-   This is access code for flashes using ARM's flash partitioning
-   standards.
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D*/
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/ioport.h>
-#include <linux/platform_device.h>
-#include <linux/init.h>
-#include <linux/io.h>
-
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-#include <linux/mtd/concat.h>
-
-#include <asm/mach/flash.h>
-#include <mach/hardware.h>
-#include <asm/system.h>
-
-struct armflash_subdev_info {
-=09char=09=09=09*name;
-=09struct mtd_info=09=09*mtd;
-=09struct map_info=09=09map;
-=09struct flash_platform_data *plat;
-};
-
-struct armflash_info {
-=09struct resource=09=09*res;
-=09struct mtd_partition=09*parts;
-=09struct mtd_info=09=09*mtd;
-=09int=09=09=09nr_subdev;
-=09struct armflash_subdev_info subdev[0];
-};
-
-static void armflash_set_vpp(struct map_info *map, int on)
-{
-=09struct armflash_subdev_info *info =3D
-=09=09container_of(map, struct armflash_subdev_info, map);
-
-=09if (info->plat && info->plat->set_vpp)
-=09=09info->plat->set_vpp(on);
-}
-
-static const char *probes[] =3D { "cmdlinepart", "RedBoot", "afs", NULL };
-
-static int armflash_subdev_probe(struct armflash_subdev_info *subdev,
-=09=09=09=09 struct resource *res)
-{
-=09struct flash_platform_data *plat =3D subdev->plat;
-=09resource_size_t size =3D res->end - res->start + 1;
-=09void __iomem *base;
-=09int err =3D 0;
-
-=09if (!request_mem_region(res->start, size, subdev->name)) {
-=09=09err =3D -EBUSY;
-=09=09goto out;
-=09}
-
-=09base =3D ioremap(res->start, size);
-=09if (!base) {
-=09=09err =3D -ENOMEM;
-=09=09goto no_mem;
-=09}
-
-=09/*
-=09 * look for CFI based flash parts fitted to this board
-=09 */
-=09subdev->map.size=09=3D size;
-=09subdev->map.bankwidth=09=3D plat->width;
-=09subdev->map.phys=09=3D res->start;
-=09subdev->map.virt=09=3D base;
-=09subdev->map.name=09=3D subdev->name;
-=09subdev->map.set_vpp=09=3D armflash_set_vpp;
-
-=09simple_map_init(&subdev->map);
-
-=09/*
-=09 * Also, the CFI layer automatically works out what size
-=09 * of chips we have, and does the necessary identification
-=09 * for us automatically.
-=09 */
-=09subdev->mtd =3D do_map_probe(plat->map_name, &subdev->map);
-=09if (!subdev->mtd) {
-=09=09err =3D -ENXIO;
-=09=09goto no_device;
-=09}
-
-=09subdev->mtd->owner =3D THIS_MODULE;
-
-=09/* Successful? */
-=09if (err =3D=3D 0)
-=09=09return err;
-
-=09if (subdev->mtd)
-=09=09map_destroy(subdev->mtd);
- no_device:
-=09iounmap(base);
- no_mem:
-=09release_mem_region(res->start, size);
- out:
-=09return err;
-}
-
-static void armflash_subdev_remove(struct armflash_subdev_info *subdev)
-{
-=09if (subdev->mtd)
-=09=09map_destroy(subdev->mtd);
-=09if (subdev->map.virt)
-=09=09iounmap(subdev->map.virt);
-=09kfree(subdev->name);
-=09subdev->name =3D NULL;
-=09release_mem_region(subdev->map.phys, subdev->map.size);
-}
-
-static int armflash_probe(struct platform_device *dev)
-{
-=09struct flash_platform_data *plat =3D dev->dev.platform_data;
-=09unsigned int size;
-=09struct armflash_info *info;
-=09int i, nr, err;
-
-=09/* Count the number of devices */
-=09for (nr =3D 0; ; nr++)
-=09=09if (!platform_get_resource(dev, IORESOURCE_MEM, nr))
-=09=09=09break;
-=09if (nr =3D=3D 0) {
-=09=09err =3D -ENODEV;
-=09=09goto out;
-=09}
-
-=09size =3D sizeof(struct armflash_info) +
-=09=09sizeof(struct armflash_subdev_info) * nr;
-=09info =3D kzalloc(size, GFP_KERNEL);
-=09if (!info) {
-=09=09err =3D -ENOMEM;
-=09=09goto out;
-=09}
-
-=09if (plat && plat->init) {
-=09=09err =3D plat->init();
-=09=09if (err)
-=09=09=09goto no_resource;
-=09}
-
-=09for (i =3D 0; i < nr; i++) {
-=09=09struct armflash_subdev_info *subdev =3D &info->subdev[i];
-=09=09struct resource *res;
-
-=09=09res =3D platform_get_resource(dev, IORESOURCE_MEM, i);
-=09=09if (!res)
-=09=09=09break;
-
-=09=09if (nr =3D=3D 1)
-=09=09=09/* No MTD concatenation, just use the default name */
-=09=09=09subdev->name =3D kstrdup(dev_name(&dev->dev), GFP_KERNEL);
-=09=09else
-=09=09=09subdev->name =3D kasprintf(GFP_KERNEL, "%s-%d",
-=09=09=09=09=09=09 dev_name(&dev->dev), i);
-=09=09if (!subdev->name) {
-=09=09=09err =3D -ENOMEM;
-=09=09=09break;
-=09=09}
-=09=09subdev->plat =3D plat;
-
-=09=09err =3D armflash_subdev_probe(subdev, res);
-=09=09if (err) {
-=09=09=09kfree(subdev->name);
-=09=09=09subdev->name =3D NULL;
-=09=09=09break;
-=09=09}
-=09}
-=09info->nr_subdev =3D i;
-
-=09if (err)
-=09=09goto subdev_err;
-
-=09if (info->nr_subdev =3D=3D 1)
-=09=09info->mtd =3D info->subdev[0].mtd;
-=09else if (info->nr_subdev > 1) {
-=09=09struct mtd_info *cdev[info->nr_subdev];
-
-=09=09/*
-=09=09 * We detected multiple devices.  Concatenate them together.
-=09=09 */
-=09=09for (i =3D 0; i < info->nr_subdev; i++)
-=09=09=09cdev[i] =3D info->subdev[i].mtd;
-
-=09=09info->mtd =3D mtd_concat_create(cdev, info->nr_subdev,
-=09=09=09=09=09      dev_name(&dev->dev));
-=09=09if (info->mtd =3D=3D NULL)
-=09=09=09err =3D -ENXIO;
-=09}
-
-=09if (err < 0)
-=09=09goto cleanup;
-
-=09err =3D parse_mtd_partitions(info->mtd, probes, &info->parts, 0);
-=09if (err > 0) {
-=09=09err =3D add_mtd_partitions(info->mtd, info->parts, err);
-=09=09if (err)
-=09=09=09printk(KERN_ERR
-=09=09=09       "mtd partition registration failed: %d\n", err);
-=09}
-
-=09if (err =3D=3D 0) {
-=09=09platform_set_drvdata(dev, info);
-=09=09return err;
-=09}
-
-=09/*
-=09 * We got an error, free all resources.
-=09 */
- cleanup:
-=09if (info->mtd) {
-=09=09del_mtd_partitions(info->mtd);
-=09=09if (info->mtd !=3D info->subdev[0].mtd)
-=09=09=09mtd_concat_destroy(info->mtd);
-=09}
-=09kfree(info->parts);
- subdev_err:
-=09for (i =3D info->nr_subdev - 1; i >=3D 0; i--)
-=09=09armflash_subdev_remove(&info->subdev[i]);
- no_resource:
-=09if (plat && plat->exit)
-=09=09plat->exit();
-=09kfree(info);
- out:
-=09return err;
-}
-
-static int armflash_remove(struct platform_device *dev)
-{
-=09struct armflash_info *info =3D platform_get_drvdata(dev);
-=09struct flash_platform_data *plat =3D dev->dev.platform_data;
-=09int i;
-
-=09platform_set_drvdata(dev, NULL);
-
-=09if (info) {
-=09=09if (info->mtd) {
-=09=09=09del_mtd_partitions(info->mtd);
-=09=09=09if (info->mtd !=3D info->subdev[0].mtd)
-=09=09=09=09mtd_concat_destroy(info->mtd);
-=09=09}
-=09=09kfree(info->parts);
-
-=09=09for (i =3D info->nr_subdev - 1; i >=3D 0; i--)
-=09=09=09armflash_subdev_remove(&info->subdev[i]);
-
-=09=09if (plat && plat->exit)
-=09=09=09plat->exit();
-
-=09=09kfree(info);
-=09}
-
-=09return 0;
-}
-
-static struct platform_driver armflash_driver =3D {
-=09.probe=09=09=3D armflash_probe,
-=09.remove=09=09=3D armflash_remove,
-=09.driver=09=09=3D {
-=09=09.name=09=3D "armflash",
-=09=09.owner=09=3D THIS_MODULE,
-=09},
-};
-
-static int __init armflash_init(void)
-{
-=09return platform_driver_register(&armflash_driver);
-}
-
-static void __exit armflash_exit(void)
-{
-=09platform_driver_unregister(&armflash_driver);
-}
-
-module_init(armflash_init);
-module_exit(armflash_exit);
-
-MODULE_AUTHOR("ARM Ltd");
-MODULE_DESCRIPTION("ARM Integrator CFI map driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:armflash");
--=20
1.7.0.4
