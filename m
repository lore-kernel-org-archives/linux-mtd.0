Received: from service87.mimecast.com ([94.185.240.25])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QMK31-0007G1-CE
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 13:10:54 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v6 2/8] ARM: Realview: Use physmap driver instead of
	integrator-flash
Date: Tue, 17 May 2011 14:11:11 +0100
Message-Id: <1305637877-24436-3-git-send-email-marc.zyngier@arm.com>
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

Tested on a PB11-MPCore.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 arch/arm/configs/realview-smp_defconfig |    2 +-
 arch/arm/configs/realview_defconfig     |    2 +-
 arch/arm/mach-realview/core.c           |   31 ++++-----------------------=
----
 3 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/arch/arm/configs/realview-smp_defconfig b/arch/arm/configs/rea=
lview-smp_defconfig
index 5ca7a61..abe61bf 100644
--- a/arch/arm/configs/realview-smp_defconfig
+++ b/arch/arm/configs/realview-smp_defconfig
@@ -38,7 +38,7 @@ CONFIG_MTD_BLOCK=3Dy
 CONFIG_MTD_CFI=3Dy
 CONFIG_MTD_CFI_INTELEXT=3Dy
 CONFIG_MTD_CFI_AMDSTD=3Dy
-CONFIG_MTD_ARM_INTEGRATOR=3Dy
+CONFIG_MTD_PHYSMAP=3Dy
 CONFIG_ARM_CHARLCD=3Dy
 CONFIG_NETDEVICES=3Dy
 CONFIG_SMSC_PHY=3Dy
diff --git a/arch/arm/configs/realview_defconfig b/arch/arm/configs/realvie=
w_defconfig
index fcaa603..7079cbe 100644
--- a/arch/arm/configs/realview_defconfig
+++ b/arch/arm/configs/realview_defconfig
@@ -37,7 +37,7 @@ CONFIG_MTD_BLOCK=3Dy
 CONFIG_MTD_CFI=3Dy
 CONFIG_MTD_CFI_INTELEXT=3Dy
 CONFIG_MTD_CFI_AMDSTD=3Dy
-CONFIG_MTD_ARM_INTEGRATOR=3Dy
+CONFIG_MTD_PHYSMAP=3Dy
 CONFIG_ARM_CHARLCD=3Dy
 CONFIG_NETDEVICES=3Dy
 CONFIG_SMSC_PHY=3Dy
diff --git a/arch/arm/mach-realview/core.c b/arch/arm/mach-realview/core.c
index 75dbc87..d3f1dde 100644
--- a/arch/arm/mach-realview/core.c
+++ b/arch/arm/mach-realview/core.c
@@ -31,6 +31,7 @@
 #include <linux/amba/mmci.h>
 #include <linux/gfp.h>
 #include <linux/clkdev.h>
+#include <linux/mtd/physmap.h>
=20
 #include <asm/system.h>
 #include <mach/hardware.h>
@@ -41,7 +42,6 @@
 #include <asm/hardware/icst.h>
=20
 #include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
 #include <asm/mach/irq.h>
 #include <asm/mach/map.h>
=20
@@ -77,27 +77,7 @@ void __init realview_adjust_zones(unsigned long *size, u=
nsigned long *hole)
=20
 #define REALVIEW_FLASHCTRL    (__io_address(REALVIEW_SYS_BASE) + REALVIEW_=
SYS_FLASH_OFFSET)
=20
-static int realview_flash_init(void)
-{
-=09u32 val;
-
-=09val =3D __raw_readl(REALVIEW_FLASHCTRL);
-=09val &=3D ~REALVIEW_FLASHPROG_FLVPPEN;
-=09__raw_writel(val, REALVIEW_FLASHCTRL);
-
-=09return 0;
-}
-
-static void realview_flash_exit(void)
-{
-=09u32 val;
-
-=09val =3D __raw_readl(REALVIEW_FLASHCTRL);
-=09val &=3D ~REALVIEW_FLASHPROG_FLVPPEN;
-=09__raw_writel(val, REALVIEW_FLASHCTRL);
-}
-
-static void realview_flash_set_vpp(int on)
+static void realview_flash_set_vpp(struct map_info *map, int on)
 {
 =09u32 val;
=20
@@ -109,16 +89,13 @@ static void realview_flash_set_vpp(int on)
 =09__raw_writel(val, REALVIEW_FLASHCTRL);
 }
=20
-static struct flash_platform_data realview_flash_data =3D {
-=09.map_name=09=09=3D "cfi_probe",
+static struct physmap_flash_data realview_flash_data =3D {
 =09.width=09=09=09=3D 4,
-=09.init=09=09=09=3D realview_flash_init,
-=09.exit=09=09=09=3D realview_flash_exit,
 =09.set_vpp=09=09=3D realview_flash_set_vpp,
 };
=20
 struct platform_device realview_flash_device =3D {
-=09.name=09=09=09=3D "armflash",
+=09.name=09=09=09=3D "physmap-flash",
 =09.id=09=09=09=3D 0,
 =09.dev=09=09=09=3D {
 =09=09.platform_data=09=3D &realview_flash_data,
--=20
1.7.0.4
