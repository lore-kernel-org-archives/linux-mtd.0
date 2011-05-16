Received: from service87.mimecast.com ([94.185.240.25])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QLzGe-00073Y-TX
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 14:59:34 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v5 5/8] ARM: Integrator/AP: Use physmap driver instead of
	integrator-flash
Date: Mon, 16 May 2011 15:59:34 +0100
Message-Id: <1305557977-16871-6-git-send-email-marc.zyngier@arm.com>
In-Reply-To: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
References: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
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

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 arch/arm/mach-integrator/integrator_ap.c |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-integrator/integrator_ap.c b/arch/arm/mach-integ=
rator/integrator_ap.c
index 980803f..11bd49e 100644
--- a/arch/arm/mach-integrator/integrator_ap.c
+++ b/arch/arm/mach-integrator/integrator_ap.c
@@ -31,6 +31,7 @@
 #include <linux/clockchips.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/mtd/physmap.h>
=20
 #include <mach/hardware.h>
 #include <mach/platform.h>
@@ -43,7 +44,6 @@
 #include <mach/lm.h>
=20
 #include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
 #include <asm/mach/irq.h>
 #include <asm/mach/map.h>
 #include <asm/mach/time.h>
@@ -230,7 +230,7 @@ device_initcall(irq_init_sysfs);
 #define EBI_CSR1 (VA_EBI_BASE + INTEGRATOR_EBI_CSR1_OFFSET)
 #define EBI_LOCK (VA_EBI_BASE + INTEGRATOR_EBI_LOCK_OFFSET)
=20
-static int ap_flash_init(void)
+static int ap_flash_init(struct platform_device *dev)
 {
 =09u32 tmp;
=20
@@ -247,7 +247,7 @@ static int ap_flash_init(void)
 =09return 0;
 }
=20
-static void ap_flash_exit(void)
+static void ap_flash_exit(struct platform_device *dev)
 {
 =09u32 tmp;
=20
@@ -263,15 +263,14 @@ static void ap_flash_exit(void)
 =09}
 }
=20
-static void ap_flash_set_vpp(int on)
+static void ap_flash_set_vpp(struct map_info *map, int on)
 {
 =09void __iomem *reg =3D on ? SC_CTRLS : SC_CTRLC;
=20
 =09writel(INTEGRATOR_SC_CTRL_nFLVPPEN, reg);
 }
=20
-static struct flash_platform_data ap_flash_data =3D {
-=09.map_name=09=3D "cfi_probe",
+static struct physmap_flash_data ap_flash_data =3D {
 =09.width=09=09=3D 4,
 =09.init=09=09=3D ap_flash_init,
 =09.exit=09=09=3D ap_flash_exit,
@@ -285,7 +284,7 @@ static struct resource cfi_flash_resource =3D {
 };
=20
 static struct platform_device cfi_flash_device =3D {
-=09.name=09=09=3D "armflash",
+=09.name=09=09=3D "physmap-flash",
 =09.id=09=09=3D 0,
 =09.dev=09=09=3D {
 =09=09.platform_data=09=3D &ap_flash_data,
--=20
1.7.0.4
