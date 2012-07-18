Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SrUCs-0006pR-W4
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 13:22:25 +0000
From: Pawel Moll <pawel.moll@arm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] mtd: maps: physmap: Add VPP regulator control
Date: Wed, 18 Jul 2012 14:22:00 +0100
Message-Id: <1342617721-14715-2-git-send-email-pawel.moll@arm.com>
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

Add an optional regulator control of the VPP line.
"vpp" supply must be provided by the board description.

Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---
 drivers/mtd/maps/physmap.c |   24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 21b0b71..57d79ea 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -20,6 +20,8 @@
 #include <linux/mtd/physmap.h>
 #include <linux/mtd/concat.h>
 #include <linux/io.h>
+#include <linux/err.h>
+#include <linux/regulator/consumer.h>
=20
 #define MAX_RESOURCES=09=094
=20
@@ -29,6 +31,7 @@ struct physmap_flash_info {
 =09struct map_info=09=09map[MAX_RESOURCES];
 =09spinlock_t=09=09vpp_lock;
 =09int=09=09=09vpp_refcnt;
+=09struct regulator=09*vpp_regulator;
 };
=20
 static int physmap_flash_remove(struct platform_device *dev)
@@ -70,19 +73,22 @@ static void physmap_set_vpp(struct map_info *map, int s=
tate)
=20
 =09pdev =3D (struct platform_device *)map->map_priv_1;
 =09physmap_data =3D pdev->dev.platform_data;
+=09info =3D platform_get_drvdata(pdev);
=20
-=09if (!physmap_data->set_vpp)
+=09if (!physmap_data->set_vpp && !info->vpp_regulator)
 =09=09return;
=20
-=09info =3D platform_get_drvdata(pdev);
-
 =09spin_lock_irqsave(&info->vpp_lock, flags);
-=09if (state) {
-=09=09if (++info->vpp_refcnt =3D=3D 1)    /* first nested 'on' */
+=09if (state && ++info->vpp_refcnt =3D=3D 1) { /* first nested 'on' */
+=09=09if (physmap_data->set_vpp)
 =09=09=09physmap_data->set_vpp(pdev, 1);
-=09} else {
-=09=09if (--info->vpp_refcnt =3D=3D 0)    /* last nested 'off' */
+=09=09else
+=09=09=09regulator_enable(info->vpp_regulator);
+=09} else if (!state && --info->vpp_refcnt =3D=3D 0) { /* last nested 'off=
' */
+=09=09if (physmap_data->set_vpp)
 =09=09=09physmap_data->set_vpp(pdev, 0);
+=09=09else
+=09=09=09regulator_disable(info->vpp_regulator);
 =09}
 =09spin_unlock_irqrestore(&info->vpp_lock, flags);
 }
@@ -123,6 +129,10 @@ static int physmap_flash_probe(struct platform_device =
*dev)
 =09=09=09goto err_out;
 =09}
=20
+=09info->vpp_regulator =3D devm_regulator_get(&dev->dev, "vpp");
+=09if (IS_ERR(info->vpp_regulator))
+=09=09info->vpp_regulator =3D NULL;
+
 =09platform_set_drvdata(dev, info);
=20
 =09for (i =3D 0; i < dev->num_resources; i++) {
--=20
1.7.9.5
