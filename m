Received: from service87.mimecast.com ([94.185.240.25])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QLzGh-000749-8K
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 14:59:36 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v5 6/8] ARM: Integrator/CP: Use physmap driver instead of
	integrator-flash
Date: Mon, 16 May 2011 15:59:35 +0100
Message-Id: <1305557977-16871-7-git-send-email-marc.zyngier@arm.com>
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

Tested with an ARM-1136 core tile.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 arch/arm/mach-integrator/integrator_cp.c |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-integrator/integrator_cp.c b/arch/arm/mach-integ=
rator/integrator_cp.c
index 9e3ce26..ec9628f 100644
--- a/arch/arm/mach-integrator/integrator_cp.c
+++ b/arch/arm/mach-integrator/integrator_cp.c
@@ -22,6 +22,7 @@
 #include <linux/io.h>
 #include <linux/gfp.h>
 #include <linux/clkdev.h>
+#include <linux/mtd/physmap.h>
=20
 #include <mach/hardware.h>
 #include <mach/platform.h>
@@ -35,7 +36,6 @@
 #include <mach/lm.h>
=20
 #include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
 #include <asm/mach/irq.h>
 #include <asm/mach/map.h>
 #include <asm/mach/time.h>
@@ -239,7 +239,7 @@ static struct clk_lookup cp_lookups[] =3D {
 /*
  * Flash handling.
  */
-static int intcp_flash_init(void)
+static int intcp_flash_init(struct platform_device *dev)
 {
 =09u32 val;
=20
@@ -250,7 +250,7 @@ static int intcp_flash_init(void)
 =09return 0;
 }
=20
-static void intcp_flash_exit(void)
+static void intcp_flash_exit(struct platform_device *dev)
 {
 =09u32 val;
=20
@@ -259,7 +259,7 @@ static void intcp_flash_exit(void)
 =09writel(val, INTCP_VA_CTRL_BASE + INTCP_FLASHPROG);
 }
=20
-static void intcp_flash_set_vpp(int on)
+static void intcp_flash_set_vpp(struct map_info *map, int on)
 {
 =09u32 val;
=20
@@ -271,8 +271,7 @@ static void intcp_flash_set_vpp(int on)
 =09writel(val, INTCP_VA_CTRL_BASE + INTCP_FLASHPROG);
 }
=20
-static struct flash_platform_data intcp_flash_data =3D {
-=09.map_name=09=3D "cfi_probe",
+static struct physmap_flash_data intcp_flash_data =3D {
 =09.width=09=09=3D 4,
 =09.init=09=09=3D intcp_flash_init,
 =09.exit=09=09=3D intcp_flash_exit,
@@ -286,7 +285,7 @@ static struct resource intcp_flash_resource =3D {
 };
=20
 static struct platform_device intcp_flash_device =3D {
-=09.name=09=09=3D "armflash",
+=09.name=09=09=3D "physmap-flash",
 =09.id=09=09=3D 0,
 =09.dev=09=09=3D {
 =09=09.platform_data=09=3D &intcp_flash_data,
--=20
1.7.0.4
