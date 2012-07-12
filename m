Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SpMPr-0007db-Cz
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2012 16:39:00 +0000
From: Pawel Moll <pawel.moll@arm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: maps: physmap_of: Add GPIO VPP control
Date: Thu, 12 Jul 2012 17:38:41 +0100
Message-Id: <1342111121-23161-3-git-send-email-pawel.moll@arm.com>
In-Reply-To: <1342111121-23161-1-git-send-email-pawel.moll@arm.com>
References: <1342111121-23161-1-git-send-email-pawel.moll@arm.com>
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

Add a GPIO control of the VPP signal and "vpp-gpios"
tree property, specifying the GPIO line in a standard
DT way, including polarity flags.

Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---
 .../devicetree/bindings/mtd/mtd-physmap.txt        |    7 +++-
 drivers/mtd/maps/physmap_of.c                      |   42 ++++++++++++++++=
++++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Docume=
ntation/devicetree/bindings/mtd/mtd-physmap.txt
index a63c2bd7..28084cf 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
@@ -13,10 +13,13 @@ file systems on embedded devices.
    device width times the number of interleaved chips.
  - device-width : (optional) Width of a single mtd chip.  If
    omitted, assumed to be equal to 'bank-width'.
+ - vpp-gpios : (optional) specifies the GPIO line to control
+   VPP signal of the flash chip, the polarity is defined as a
+   standard flag (see Documentation/devicetree/bindings/gpio/gpio.txt
+   for more details and examples below)
  - #address-cells, #size-cells : Must be present if the device has
    sub-nodes representing partitions (see below).  In this case
    both #address-cells and #size-cells must be equal to 1.
-
 For JEDEC compatible devices, the following additional properties
 are defined:
=20
@@ -33,6 +36,7 @@ Example:
 =09=09reg =3D <ff000000 01000000>;
 =09=09bank-width =3D <4>;
 =09=09device-width =3D <1>;
+=09=09vpp-gpios =3D <&pio2 1 0>; /* PIO2.1 active high */
 =09=09#address-cells =3D <1>;
 =09=09#size-cells =3D <1>;
 =09=09fs@0 {
@@ -55,6 +59,7 @@ Here an example with multiple "reg" tuples:
 =09=09reg =3D <0 0x00000000 0x02000000
 =09=09       0 0x02000000 0x02000000>;
 =09=09bank-width =3D <2>;
+=09=09vpp-gpios =3D <&pio3 2 1>; /* PIO3.2 active low */
 =09=09partition@0 {
 =09=09=09label =3D "test-part1";
 =09=09=09reg =3D <0 0x04000000>;
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 2e6fb68..81caa77 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -17,12 +17,14 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/device.h>
+#include <linux/gpio.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/concat.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_gpio.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
=20
@@ -74,6 +76,24 @@ static int of_flash_remove(struct platform_device *dev)
 =09return 0;
 }
=20
+static void of_flash_set_vpp_high(struct map_info *map, int state)
+{
+=09/* map_priv_1 =3D gpio, map_priv_2 =3D "reference counter" */
+=09if (state && !map->map_priv_2++)
+=09=09gpio_set_value(map->map_priv_1, 1);
+=09else if (!state && !--map->map_priv_2)
+=09=09gpio_set_value(map->map_priv_1, 0);
+}
+
+static void of_flash_set_vpp_low(struct map_info *map, int state)
+{
+=09/* map_priv_1 =3D gpio, map_priv_2 =3D "reference counter" */
+=09if (state && !map->map_priv_2++)
+=09=09gpio_set_value(map->map_priv_1, 0);
+=09else if (!state && !--map->map_priv_2)
+=09=09gpio_set_value(map->map_priv_1, 1);
+}
+
 /* Helper function to handle probing of the obsolete "direct-mapped"
  * compatible binding, which has an extra "probe-type" property
  * describing the type of flash probe necessary. */
@@ -169,6 +189,9 @@ static int __devinit of_flash_probe(struct platform_dev=
ice *dev)
 =09struct mtd_info **mtd_list =3D NULL;
 =09resource_size_t res_size;
 =09struct mtd_part_parser_data ppdata;
+=09void (*set_vpp)(struct map_info *, int) =3D NULL;
+=09int gpio_vpp;
+=09enum of_gpio_flags gpio_flags;
=20
 =09match =3D of_match_device(of_flash_match, &dev->dev);
 =09if (!match)
@@ -200,6 +223,23 @@ static int __devinit of_flash_probe(struct platform_de=
vice *dev)
=20
 =09dev_set_drvdata(&dev->dev, info);
=20
+=09gpio_vpp =3D of_get_named_gpio_flags(dp, "vpp-gpios", 0, &gpio_flags);
+=09if (gpio_is_valid(gpio_vpp)) {
+=09=09unsigned long dir =3D GPIOF_DIR_OUT;
+
+=09=09if (gpio_flags & OF_GPIO_ACTIVE_LOW) {
+=09=09=09set_vpp =3D of_flash_set_vpp_low;
+=09=09=09dir |=3D GPIOF_INIT_HIGH;
+=09=09} else {
+=09=09=09set_vpp =3D of_flash_set_vpp_high;
+=09=09=09dir |=3D GPIOF_INIT_LOW;
+=09=09}
+=09=09err =3D devm_gpio_request_one(&dev->dev, gpio_vpp, dir,
+=09=09=09=09dev_name(&dev->dev));
+=09=09if (err)
+=09=09=09goto err_flash_remove;
+=09}
+
 =09mtd_list =3D kzalloc(sizeof(*mtd_list) * count, GFP_KERNEL);
 =09if (!mtd_list)
 =09=09goto err_flash_remove;
@@ -235,6 +275,8 @@ static int __devinit of_flash_probe(struct platform_dev=
ice *dev)
 =09=09info->list[i].map.phys =3D res.start;
 =09=09info->list[i].map.size =3D res_size;
 =09=09info->list[i].map.bankwidth =3D be32_to_cpup(width);
+=09=09info->list[i].map.set_vpp =3D set_vpp;
+=09=09info->list[i].map.map_priv_1 =3D gpio_vpp;
=20
 =09=09err =3D -ENOMEM;
 =09=09info->list[i].map.virt =3D ioremap(info->list[i].map.phys,
--=20
1.7.9.5
