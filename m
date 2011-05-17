Received: from service87.mimecast.com ([94.185.240.25])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QMK34-0007Gr-5M
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 13:10:56 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v6 3/8] ARM: Versatile: Use physmap driver instead of
	integrator-flash
Date: Tue, 17 May 2011 14:11:12 +0100
Message-Id: <1305637877-24436-4-git-send-email-marc.zyngier@arm.com>
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
 arch/arm/configs/versatile_defconfig |    2 +-
 arch/arm/mach-versatile/core.c       |   31 ++++--------------------------=
-
 2 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versat=
ile_defconfig
index 0ce710f..cdd4d2b 100644
--- a/arch/arm/configs/versatile_defconfig
+++ b/arch/arm/configs/versatile_defconfig
@@ -32,7 +32,7 @@ CONFIG_MTD_BLOCK=3Dy
 CONFIG_MTD_CFI=3Dy
 CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
 CONFIG_MTD_CFI_INTELEXT=3Dy
-CONFIG_MTD_ARM_INTEGRATOR=3Dy
+CONFIG_MTD_PHYSMAP=3Dy
 CONFIG_BLK_DEV_RAM=3Dy
 CONFIG_EEPROM_LEGACY=3Dm
 CONFIG_NETDEVICES=3Dy
diff --git a/arch/arm/mach-versatile/core.c b/arch/arm/mach-versatile/core.=
c
index eb7ffa0..06f406a 100644
--- a/arch/arm/mach-versatile/core.c
+++ b/arch/arm/mach-versatile/core.c
@@ -32,6 +32,7 @@
 #include <linux/io.h>
 #include <linux/gfp.h>
 #include <linux/clkdev.h>
+#include <linux/mtd/physmap.h>
=20
 #include <asm/system.h>
 #include <asm/irq.h>
@@ -42,7 +43,6 @@
 #include <asm/mach-types.h>
=20
 #include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
 #include <asm/mach/irq.h>
 #include <asm/mach/time.h>
 #include <asm/mach/map.h>
@@ -190,27 +190,7 @@ void __init versatile_map_io(void)
=20
 #define VERSATILE_FLASHCTRL    (__io_address(VERSATILE_SYS_BASE) + VERSATI=
LE_SYS_FLASH_OFFSET)
=20
-static int versatile_flash_init(void)
-{
-=09u32 val;
-
-=09val =3D __raw_readl(VERSATILE_FLASHCTRL);
-=09val &=3D ~VERSATILE_FLASHPROG_FLVPPEN;
-=09__raw_writel(val, VERSATILE_FLASHCTRL);
-
-=09return 0;
-}
-
-static void versatile_flash_exit(void)
-{
-=09u32 val;
-
-=09val =3D __raw_readl(VERSATILE_FLASHCTRL);
-=09val &=3D ~VERSATILE_FLASHPROG_FLVPPEN;
-=09__raw_writel(val, VERSATILE_FLASHCTRL);
-}
-
-static void versatile_flash_set_vpp(int on)
+static void versatile_flash_set_vpp(struct map_info *map, int on)
 {
 =09u32 val;
=20
@@ -222,11 +202,8 @@ static void versatile_flash_set_vpp(int on)
 =09__raw_writel(val, VERSATILE_FLASHCTRL);
 }
=20
-static struct flash_platform_data versatile_flash_data =3D {
-=09.map_name=09=09=3D "cfi_probe",
+static struct physmap_flash_data versatile_flash_data =3D {
 =09.width=09=09=09=3D 4,
-=09.init=09=09=09=3D versatile_flash_init,
-=09.exit=09=09=09=3D versatile_flash_exit,
 =09.set_vpp=09=09=3D versatile_flash_set_vpp,
 };
=20
@@ -237,7 +214,7 @@ static struct resource versatile_flash_resource =3D {
 };
=20
 static struct platform_device versatile_flash_device =3D {
-=09.name=09=09=09=3D "armflash",
+=09.name=09=09=09=3D "physmap-flash",
 =09.id=09=09=09=3D 0,
 =09.dev=09=09=09=3D {
 =09=09.platform_data=09=3D &versatile_flash_data,
--=20
1.7.0.4
