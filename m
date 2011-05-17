Received: from service87.mimecast.com ([94.185.240.25])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QMK36-0007HG-Fn
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 13:10:58 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v6 4/8] ARM: VExpress: Use physmap driver instead of
	integrator-flash
Date: Tue, 17 May 2011 14:11:13 +0100
Message-Id: <1305637877-24436-5-git-send-email-marc.zyngier@arm.com>
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

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 arch/arm/mach-vexpress/v2m.c |   22 ++++------------------
 1 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
index ba46e8e..e326815 100644
--- a/arch/arm/mach-vexpress/v2m.c
+++ b/arch/arm/mach-vexpress/v2m.c
@@ -13,11 +13,11 @@
 #include <linux/sysdev.h>
 #include <linux/usb/isp1760.h>
 #include <linux/clkdev.h>
+#include <linux/mtd/physmap.h>
=20
 #include <asm/mach-types.h>
 #include <asm/sizes.h>
 #include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
 #include <asm/mach/map.h>
 #include <asm/mach/time.h>
 #include <asm/hardware/arm_timer.h>
@@ -206,27 +206,13 @@ static struct platform_device v2m_usb_device =3D {
 =09.dev.platform_data =3D &v2m_usb_config,
 };
=20
-static int v2m_flash_init(void)
-{
-=09writel(0, MMIO_P2V(V2M_SYS_FLASH));
-=09return 0;
-}
-
-static void v2m_flash_exit(void)
-{
-=09writel(0, MMIO_P2V(V2M_SYS_FLASH));
-}
-
-static void v2m_flash_set_vpp(int on)
+static void v2m_flash_set_vpp(struct map_info *map, int on)
 {
 =09writel(on !=3D 0, MMIO_P2V(V2M_SYS_FLASH));
 }
=20
-static struct flash_platform_data v2m_flash_data =3D {
-=09.map_name=09=3D "cfi_probe",
+static struct physmap_flash_data v2m_flash_data =3D {
 =09.width=09=09=3D 4,
-=09.init=09=09=3D v2m_flash_init,
-=09.exit=09=09=3D v2m_flash_exit,
 =09.set_vpp=09=3D v2m_flash_set_vpp,
 };
=20
@@ -243,7 +229,7 @@ static struct resource v2m_flash_resources[] =3D {
 };
=20
 static struct platform_device v2m_flash_device =3D {
-=09.name=09=09=3D "armflash",
+=09.name=09=09=3D "physmap-flash",
 =09.id=09=09=3D -1,
 =09.resource=09=3D v2m_flash_resources,
 =09.num_resources=09=3D ARRAY_SIZE(v2m_flash_resources),
--=20
1.7.0.4
