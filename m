Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SrUCr-0006pX-Kz
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 13:22:25 +0000
From: Pawel Moll <pawel.moll@arm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: maps: physmap_of: Add VPP regulator control
Date: Wed, 18 Jul 2012 14:22:01 +0100
Message-Id: <1342617721-14715-3-git-send-email-pawel.moll@arm.com>
In-Reply-To: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
References: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Pawel Moll <pawel.moll@arm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add an optional regulator control of the VPP line and a
standard "vpp-supply" tree property.

Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---
 .../devicetree/bindings/mtd/mtd-physmap.txt        |    4 ++-
 drivers/mtd/maps/physmap_of.c                      |   28 ++++++++++++++++=
++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Docume=
ntation/devicetree/bindings/mtd/mtd-physmap.txt
index a63c2bd7..40cb554 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
@@ -13,10 +13,11 @@ file systems on embedded devices.
    device width times the number of interleaved chips.
  - device-width : (optional) Width of a single mtd chip.  If
    omitted, assumed to be equal to 'bank-width'.
+ - vpp-supply : (optional) phandle to a regulator controlling VPP
+   line of the chips.
  - #address-cells, #size-cells : Must be present if the device has
    sub-nodes representing partitions (see below).  In this case
    both #address-cells and #size-cells must be equal to 1.
-
 For JEDEC compatible devices, the following additional properties
 are defined:
=20
@@ -33,6 +34,7 @@ Example:
 =09=09reg =3D <ff000000 01000000>;
 =09=09bank-width =3D <4>;
 =09=09device-width =3D <1>;
+=09=09vpp-supply =3D <&flash_vpp_reg>
 =09=09#address-cells =3D <1>;
 =09=09#size-cells =3D <1>;
 =09=09fs@0 {
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 2e6fb68..9f34320 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -17,6 +17,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
@@ -24,6 +25,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
=20
 struct of_flash_list {
@@ -74,6 +76,18 @@ static int of_flash_remove(struct platform_device *dev)
 =09return 0;
 }
=20
+static void of_flash_set_vpp_regulator(struct map_info *map, int state)
+{
+=09/* map_priv_1 =3D VPP regulator pointer */
+=09struct regulator *vpp_regulator =3D (struct regulator *)map->map_priv_1=
;
+
+=09/* map_priv_2 =3D "reference counter" */
+=09if (state && !map->map_priv_2++)
+=09=09WARN_ON(regulator_enable(vpp_regulator));
+=09else if (!state && !--map->map_priv_2)
+=09=09WARN_ON(regulator_disable(vpp_regulator));
+}
+
 /* Helper function to handle probing of the obsolete "direct-mapped"
  * compatible binding, which has an extra "probe-type" property
  * describing the type of flash probe necessary. */
@@ -169,6 +183,7 @@ static int __devinit of_flash_probe(struct platform_dev=
ice *dev)
 =09struct mtd_info **mtd_list =3D NULL;
 =09resource_size_t res_size;
 =09struct mtd_part_parser_data ppdata;
+=09struct regulator *vpp_regulator =3D NULL;
=20
 =09match =3D of_match_device(of_flash_match, &dev->dev);
 =09if (!match)
@@ -200,6 +215,14 @@ static int __devinit of_flash_probe(struct platform_de=
vice *dev)
=20
 =09dev_set_drvdata(&dev->dev, info);
=20
+=09if (of_get_property(dp, "vpp-supply", NULL)) {
+=09=09vpp_regulator =3D devm_regulator_get(&dev->dev, "vpp");
+=09=09if (IS_ERR(vpp_regulator)) {
+=09=09=09err =3D PTR_ERR(vpp_regulator);
+=09=09=09goto err_flash_remove;
+=09=09}
+=09}
+
 =09mtd_list =3D kzalloc(sizeof(*mtd_list) * count, GFP_KERNEL);
 =09if (!mtd_list)
 =09=09goto err_flash_remove;
@@ -235,6 +258,11 @@ static int __devinit of_flash_probe(struct platform_de=
vice *dev)
 =09=09info->list[i].map.phys =3D res.start;
 =09=09info->list[i].map.size =3D res_size;
 =09=09info->list[i].map.bankwidth =3D be32_to_cpup(width);
+=09=09if (vpp_regulator) {
+=09=09=09info->list[i].map.map_priv_1 =3D
+=09=09=09=09=09(unsigned long)vpp_regulator;
+=09=09=09info->list[i].map.set_vpp =3D of_flash_set_vpp_regulator;
+=09=09}
=20
 =09=09err =3D -ENOMEM;
 =09=09info->list[i].map.virt =3D ioremap(info->list[i].map.phys,
--=20
1.7.9.5
