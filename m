Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SpMPo-0007dF-7e
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2012 16:38:57 +0000
From: Pawel Moll <pawel.moll@arm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: maps: physmap: Add GPIO VPP control
Date: Thu, 12 Jul 2012 17:38:40 +0100
Message-Id: <1342111121-23161-2-git-send-email-pawel.moll@arm.com>
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

Add GPIO control of the VPP signal:
* platform data fields to specify GPIO number and polarity
* set_vpp implementation setting the GPIO value

Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---
 drivers/mtd/maps/physmap.c  |   22 ++++++++++++++++++++++
 include/linux/mtd/physmap.h |    2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 21b0b71..3ef4e1e 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -20,6 +20,7 @@
 #include <linux/mtd/physmap.h>
 #include <linux/mtd/concat.h>
 #include <linux/io.h>
+#include <linux/gpio.h>
=20
 #define MAX_RESOURCES=09=094
=20
@@ -87,6 +88,14 @@ static void physmap_set_vpp(struct map_info *map, int st=
ate)
 =09spin_unlock_irqrestore(&info->vpp_lock, flags);
 }
=20
+static void physmap_set_gpio_vpp(struct platform_device *pdev, int state)
+{
+=09struct physmap_flash_data *physmap_data =3D pdev->dev.platform_data;
+
+=09gpio_set_value(physmap_data->gpio_vpp,
+=09=09=09!!state ^ !!physmap_data->gpio_vpp_active_low);
+}
+
 static const char *rom_probe_types[] =3D {
 =09=09=09=09=09"cfi_probe",
 =09=09=09=09=09"jedec_probe",
@@ -123,6 +132,19 @@ static int physmap_flash_probe(struct platform_device =
*dev)
 =09=09=09goto err_out;
 =09}
=20
+=09if (!physmap_data->set_vpp && gpio_is_valid(physmap_data->gpio_vpp)) {
+=09=09unsigned long flags =3D GPIOF_DIR_OUT;
+=09=09if (physmap_data->gpio_vpp_active_low)
+=09=09=09flags |=3D GPIOF_INIT_HIGH;
+=09=09else
+=09=09=09flags |=3D GPIOF_INIT_LOW;
+=09=09err =3D devm_gpio_request_one(&dev->dev, physmap_data->gpio_vpp,
+=09=09=09=09flags, dev_name(&dev->dev));
+=09=09if (err)
+=09=09=09goto err_out;
+=09=09physmap_data->set_vpp =3D physmap_set_gpio_vpp;
+=09}
+
 =09platform_set_drvdata(dev, info);
=20
 =09for (i =3D 0; i < dev->num_resources; i++) {
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index d2887e7..b5c85b6 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -26,6 +26,8 @@ struct physmap_flash_data {
 =09int=09=09=09(*init)(struct platform_device *);
 =09void=09=09=09(*exit)(struct platform_device *);
 =09void=09=09=09(*set_vpp)(struct platform_device *, int);
+=09int=09=09=09gpio_vpp;
+=09bool=09=09=09gpio_vpp_active_low;
 =09unsigned int=09=09nr_parts;
 =09unsigned int=09=09pfow_base;
 =09char                    *probe_type;
--=20
1.7.9.5
