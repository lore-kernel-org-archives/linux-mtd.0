Received: from service87.mimecast.com ([94.185.240.25])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QLzGU-00070y-IQ
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 14:59:26 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v5 8/8] MTD: physmap: let set_vpp() pass a platform_device
	instead of a map_info
Date: Mon, 16 May 2011 15:59:37 +0100
Message-Id: <1305557977-16871-9-git-send-email-marc.zyngier@arm.com>
In-Reply-To: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
References: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>, Ben Dooks <ben-linux@fluff.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	Philipp Zabel <philipp.zabel@gmail.com>,
	Russell King <linux@arm.linux.org.uk>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Andrew Victor <linux@maxim.org.za>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The set_vpp() method provided by physmap passes a map_info back to
the platform code, which has little relevance as far as the platform
is concerned (this parameter is completely unused).

Instead, pass the platform_device, which can be used in the pismo
driver to retrieve some important information in a nicer way, instead
of the hack that was in place.

The empty set_vpp function in board-at572d940hf_ek.c is removed, as
it serves no real purpose.

Cc: Andrew Victor <linux@maxim.org.za>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Philipp Zabel <philipp.zabel@gmail.com>
Cc: Eric Miao <eric.y.miao@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 arch/arm/mach-at91/board-at572d940hf_ek.c |    4 ---
 arch/arm/mach-integrator/integrator_ap.c  |    2 +-
 arch/arm/mach-integrator/integrator_cp.c  |    2 +-
 arch/arm/mach-omap1/flash.c               |    2 +-
 arch/arm/mach-pxa/hx4700.c                |    2 +-
 arch/arm/mach-pxa/magician.c              |    2 +-
 arch/arm/mach-realview/core.c             |    2 +-
 arch/arm/mach-s3c2410/nor-simtec.c        |    2 +-
 arch/arm/mach-versatile/core.c            |    2 +-
 arch/arm/mach-vexpress/v2m.c              |    2 +-
 arch/arm/plat-omap/include/plat/flash.h   |    2 +-
 drivers/mtd/maps/physmap.c                |   15 ++++++++++-
 drivers/mtd/maps/pismo.c                  |   40 ++-----------------------=
---
 include/linux/mtd/physmap.h               |    2 +-
 14 files changed, 28 insertions(+), 53 deletions(-)

diff --git a/arch/arm/mach-at91/board-at572d940hf_ek.c b/arch/arm/mach-at91=
/board-at572d940hf_ek.c
index 3929f1c..c139799 100644
--- a/arch/arm/mach-at91/board-at572d940hf_ek.c
+++ b/arch/arm/mach-at91/board-at572d940hf_ek.c
@@ -134,14 +134,10 @@ static struct mtd_partition eb_nor_partitions[] =3D {
 =09},
 };
=20
-static void nor_flash_set_vpp(struct map_info* mi, int i) {
-};
-
 static struct physmap_flash_data nor_flash_data =3D {
 =09.width=09=09=3D 4,
 =09.parts=09=09=3D eb_nor_partitions,
 =09.nr_parts=09=3D ARRAY_SIZE(eb_nor_partitions),
-=09.set_vpp=09=3D nor_flash_set_vpp,
 };
=20
 static struct resource nor_flash_resources[] =3D {
diff --git a/arch/arm/mach-integrator/integrator_ap.c b/arch/arm/mach-integ=
rator/integrator_ap.c
index 11bd49e..2aa98ee 100644
--- a/arch/arm/mach-integrator/integrator_ap.c
+++ b/arch/arm/mach-integrator/integrator_ap.c
@@ -263,7 +263,7 @@ static void ap_flash_exit(struct platform_device *dev)
 =09}
 }
=20
-static void ap_flash_set_vpp(struct map_info *map, int on)
+static void ap_flash_set_vpp(struct platform_device *pdev, int on)
 {
 =09void __iomem *reg =3D on ? SC_CTRLS : SC_CTRLC;
=20
diff --git a/arch/arm/mach-integrator/integrator_cp.c b/arch/arm/mach-integ=
rator/integrator_cp.c
index ec9628f..b676b41 100644
--- a/arch/arm/mach-integrator/integrator_cp.c
+++ b/arch/arm/mach-integrator/integrator_cp.c
@@ -259,7 +259,7 @@ static void intcp_flash_exit(struct platform_device *de=
v)
 =09writel(val, INTCP_VA_CTRL_BASE + INTCP_FLASHPROG);
 }
=20
-static void intcp_flash_set_vpp(struct map_info *map, int on)
+static void intcp_flash_set_vpp(struct platform_device *pdev, int on)
 {
 =09u32 val;
=20
diff --git a/arch/arm/mach-omap1/flash.c b/arch/arm/mach-omap1/flash.c
index acd1616..1749cb3 100644
--- a/arch/arm/mach-omap1/flash.c
+++ b/arch/arm/mach-omap1/flash.c
@@ -13,7 +13,7 @@
 #include <plat/tc.h>
 #include <plat/flash.h>
=20
-void omap1_set_vpp(struct map_info *map, int enable)
+void omap1_set_vpp(struct platform_device *pdev, int enable)
 {
 =09static int count;
 =09u32 l;
diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
index 9cdcca5..f941a49 100644
--- a/arch/arm/mach-pxa/hx4700.c
+++ b/arch/arm/mach-pxa/hx4700.c
@@ -735,7 +735,7 @@ static struct platform_device bq24022 =3D {
  * StrataFlash
  */
=20
-static void hx4700_set_vpp(struct map_info *map, int vpp)
+static void hx4700_set_vpp(struct platform_device *pdev, int vpp)
 {
 =09gpio_set_value(GPIO91_HX4700_FLASH_VPEN, vpp);
 }
diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
index 9984ef7..e192057 100644
--- a/arch/arm/mach-pxa/magician.c
+++ b/arch/arm/mach-pxa/magician.c
@@ -662,7 +662,7 @@ static struct pxaohci_platform_data magician_ohci_info =
=3D {
  * StrataFlash
  */
=20
-static void magician_set_vpp(struct map_info *map, int vpp)
+static void magician_set_vpp(struct platform_device *pdev, int vpp)
 {
 =09gpio_set_value(EGPIO_MAGICIAN_FLASH_VPP, vpp);
 }
diff --git a/arch/arm/mach-realview/core.c b/arch/arm/mach-realview/core.c
index d3f1dde..c8ec088 100644
--- a/arch/arm/mach-realview/core.c
+++ b/arch/arm/mach-realview/core.c
@@ -77,7 +77,7 @@ void __init realview_adjust_zones(unsigned long *size, un=
signed long *hole)
=20
 #define REALVIEW_FLASHCTRL    (__io_address(REALVIEW_SYS_BASE) + REALVIEW_=
SYS_FLASH_OFFSET)
=20
-static void realview_flash_set_vpp(struct map_info *map, int on)
+static void realview_flash_set_vpp(struct platform_device *pdev, int on)
 {
 =09u32 val;
=20
diff --git a/arch/arm/mach-s3c2410/nor-simtec.c b/arch/arm/mach-s3c2410/nor=
-simtec.c
index 598d130..ad9f750 100644
--- a/arch/arm/mach-s3c2410/nor-simtec.c
+++ b/arch/arm/mach-s3c2410/nor-simtec.c
@@ -32,7 +32,7 @@
=20
 #include "nor-simtec.h"
=20
-static void simtec_nor_vpp(struct map_info *map, int vpp)
+static void simtec_nor_vpp(struct platform_device *pdev, int vpp)
 {
 =09unsigned int val;
 =09unsigned long flags;
diff --git a/arch/arm/mach-versatile/core.c b/arch/arm/mach-versatile/core.=
c
index 06f406a..335d825 100644
--- a/arch/arm/mach-versatile/core.c
+++ b/arch/arm/mach-versatile/core.c
@@ -190,7 +190,7 @@ void __init versatile_map_io(void)
=20
 #define VERSATILE_FLASHCTRL    (__io_address(VERSATILE_SYS_BASE) + VERSATI=
LE_SYS_FLASH_OFFSET)
=20
-static void versatile_flash_set_vpp(struct map_info *map, int on)
+static void versatile_flash_set_vpp(struct platform_device *pdev, int on)
 {
 =09u32 val;
=20
diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
index e326815..f860314 100644
--- a/arch/arm/mach-vexpress/v2m.c
+++ b/arch/arm/mach-vexpress/v2m.c
@@ -206,7 +206,7 @@ static struct platform_device v2m_usb_device =3D {
 =09.dev.platform_data =3D &v2m_usb_config,
 };
=20
-static void v2m_flash_set_vpp(struct map_info *map, int on)
+static void v2m_flash_set_vpp(struct platform_device *pdev, int on)
 {
 =09writel(on !=3D 0, MMIO_P2V(V2M_SYS_FLASH));
 }
diff --git a/arch/arm/plat-omap/include/plat/flash.h b/arch/arm/plat-omap/i=
nclude/plat/flash.h
index 3e63270..3083195 100644
--- a/arch/arm/plat-omap/include/plat/flash.h
+++ b/arch/arm/plat-omap/include/plat/flash.h
@@ -11,6 +11,6 @@
=20
 #include <linux/mtd/map.h>
=20
-extern void omap1_set_vpp(struct map_info *map, int enable);
+extern void omap1_set_vpp(struct platform_device *pdev, int enable);
=20
 #endif
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 49676b7..89fe8be 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -74,6 +74,18 @@ static int physmap_flash_remove(struct platform_device *=
dev)
 =09return 0;
 }
=20
+static void physmap_set_vpp(struct map_info *map, int state)
+{
+=09struct platform_device *pdev;
+=09struct physmap_flash_data *physmap_data;
+
+=09pdev =3D (struct platform_device *)map->map_priv_1;
+=09physmap_data =3D pdev->dev.platform_data;
+
+=09if (physmap_data->set_vpp)
+=09=09physmap_data->set_vpp(pdev, state);
+}
+
 static const char *rom_probe_types[] =3D {
 =09=09=09=09=09"cfi_probe",
 =09=09=09=09=09"jedec_probe",
@@ -134,8 +146,9 @@ static int physmap_flash_probe(struct platform_device *=
dev)
 =09=09info->map[i].phys =3D dev->resource[i].start;
 =09=09info->map[i].size =3D resource_size(&dev->resource[i]);
 =09=09info->map[i].bankwidth =3D physmap_data->width;
-=09=09info->map[i].set_vpp =3D physmap_data->set_vpp;
+=09=09info->map[i].set_vpp =3D physmap_set_vpp;
 =09=09info->map[i].pfow_base =3D physmap_data->pfow_base;
+=09=09info->map[i].map_priv_1 =3D (unsigned long)dev;
=20
 =09=09info->map[i].virt =3D devm_ioremap(&dev->dev, info->map[i].phys,
 =09=09=09=09=09=09 info->map[i].size);
diff --git a/drivers/mtd/maps/pismo.c b/drivers/mtd/maps/pismo.c
index f4ce273..65bd1cd 100644
--- a/drivers/mtd/maps/pismo.c
+++ b/drivers/mtd/maps/pismo.c
@@ -50,39 +50,13 @@ struct pismo_data {
 =09struct platform_device=09*dev[PISMO_NUM_CS];
 };
=20
-/* FIXME: set_vpp could do with a better calling convention */
-static struct pismo_data *vpp_pismo;
-static DEFINE_MUTEX(pismo_mutex);
-
-static int pismo_setvpp_probe_fix(struct pismo_data *pismo)
+static void pismo_set_vpp(struct platform_device *pdev, int on)
 {
-=09mutex_lock(&pismo_mutex);
-=09if (vpp_pismo) {
-=09=09mutex_unlock(&pismo_mutex);
-=09=09kfree(pismo);
-=09=09return -EBUSY;
-=09}
-=09vpp_pismo =3D pismo;
-=09mutex_unlock(&pismo_mutex);
-=09return 0;
-}
-
-static void pismo_setvpp_remove_fix(struct pismo_data *pismo)
-{
-=09mutex_lock(&pismo_mutex);
-=09if (vpp_pismo =3D=3D pismo)
-=09=09vpp_pismo =3D NULL;
-=09mutex_unlock(&pismo_mutex);
-}
-
-static void pismo_set_vpp(struct map_info *map, int on)
-{
-=09struct pismo_data *pismo =3D vpp_pismo;
+=09struct i2c_client *client =3D to_i2c_client(pdev->dev.parent);
+=09struct pismo_data *pismo =3D i2c_get_clientdata(client);
=20
 =09pismo->vpp(pismo->vpp_data, on);
 }
-/* end of hack */
-
=20
 static unsigned int __devinit pismo_width_to_bytes(unsigned int width)
 {
@@ -231,9 +205,6 @@ static int __devexit pismo_remove(struct i2c_client *cl=
ient)
 =09for (i =3D 0; i < ARRAY_SIZE(pismo->dev); i++)
 =09=09platform_device_unregister(pismo->dev[i]);
=20
-=09/* FIXME: set_vpp needs saner arguments */
-=09pismo_setvpp_remove_fix(pismo);
-
 =09kfree(pismo);
=20
 =09return 0;
@@ -257,11 +228,6 @@ static int __devinit pismo_probe(struct i2c_client *cl=
ient,
 =09if (!pismo)
 =09=09return -ENOMEM;
=20
-=09/* FIXME: set_vpp needs saner arguments */
-=09ret =3D pismo_setvpp_probe_fix(pismo);
-=09if (ret)
-=09=09return ret;
-
 =09pismo->client =3D client;
 =09if (pdata) {
 =09=09pismo->vpp =3D pdata->set_vpp;
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index d37cca0..49b9590 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -24,7 +24,7 @@ struct physmap_flash_data {
 =09unsigned int=09=09width;
 =09int=09=09=09(*init)(struct platform_device *);
 =09void=09=09=09(*exit)(struct platform_device *);
-=09void=09=09=09(*set_vpp)(struct map_info *, int);
+=09void=09=09=09(*set_vpp)(struct platform_device *, int);
 =09unsigned int=09=09nr_parts;
 =09unsigned int=09=09pfow_base;
 =09char                    *probe_type;
--=20
1.7.0.4
