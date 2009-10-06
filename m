Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH 1/2] Update ts72xx to use generic platform nand driver
Date: Tue, 6 Oct 2009 18:19:36 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901DB7967@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>
Cc: Matthieu Crapet <mcrapet@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update the ts72xx platform's nand driver support.

This changes the ts72xx platform from using a custom nand driver
(ts7250.c) to the generic platform nand driver (plat_nand.c).

Tested on TS-7250 with 32MB NAND.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Tested-by: Matthieu Crapet <mcrapet@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-mtd@lists.infradead.org>

---

diff --git a/arch/arm/mach-ep93xx/ts72xx.c =
b/arch/arm/mach-ep93xx/ts72xx.c
index 259f782..bbb757b 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -16,6 +16,8 @@
 #include <linux/io.h>
 #include <linux/m48t86.h>
 #include <linux/mtd/physmap.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
=20
 #include <mach/hardware.h>
 #include <mach/ts72xx.h>
@@ -54,92 +56,185 @@ static struct map_desc ts72xx_io_desc[] __initdata =
=3D {
 	}
 };
=20
-static struct map_desc ts72xx_nand_io_desc[] __initdata =3D {
+static void __init ts72xx_map_io(void)
+{
+	ep93xx_map_io();
+	iotable_init(ts72xx_io_desc, ARRAY_SIZE(ts72xx_io_desc));
+}
+
+
+/***********************************************************************=
**
+ * NAND flash
+ =
*************************************************************************=
/
+#define TS72XX_NAND_CONTROL_ADDR_LINE	22	/* 0xN0400000 */
+#define TS72XX_NAND_BUSY_ADDR_LINE	23	/* 0xN0800000 */
+
+static void ts72xx_nand_hwcontrol(struct mtd_info *mtd,
+				  int cmd, unsigned int ctrl)
+{
+	struct nand_chip *chip =3D mtd->priv;
+
+	if (ctrl & NAND_CTRL_CHANGE) {
+		void __iomem *addr =3D chip->IO_ADDR_R;
+		unsigned char bits;
+
+		addr +=3D (1 << TS72XX_NAND_CONTROL_ADDR_LINE);
+
+		bits =3D (ctrl & NAND_NCE) << 2;	/* bit 0 -> bit 2 */
+		bits |=3D ctrl & NAND_CLE;	/* bit 1 -> bit 1 */
+		bits |=3D (ctrl & NAND_ALE) >> 2;	/* bit 2 -> bit 0 */
+
+		__raw_writeb((__raw_readb(addr) & ~0x7) | bits, addr);
+	}
+
+	if (cmd !=3D NAND_CMD_NONE)
+		__raw_writeb(cmd, chip->IO_ADDR_W);
+}
+
+static int ts72xx_nand_device_ready(struct mtd_info *mtd)
+{
+	struct nand_chip *chip =3D mtd->priv;
+	void __iomem *addr =3D chip->IO_ADDR_R;
+
+	addr +=3D (1 << TS72XX_NAND_BUSY_ADDR_LINE);
+
+	return __raw_readb(addr) & 0x20;
+}
+
+static const char *ts72xx_nand_part_probes[] =3D { "cmdlinepart", NULL =
};
+
+#define TS72XX_BOOTROM_PART_SIZE	(SZ_16K)
+#define TS72XX_REDBOOT_PART_SIZE	(SZ_2M + SZ_1M)
+
+static struct mtd_partition ts72xx_part_info32[] =3D {
 	{
-		.virtual	=3D TS72XX_NAND_DATA_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND1_DATA_PHYS_BASE),
-		.length		=3D TS72XX_NAND_DATA_SIZE,
-		.type		=3D MT_DEVICE,
+		.name		=3D "TS-BOOTROM",
+		.offset		=3D 0,
+		.size		=3D TS72XX_BOOTROM_PART_SIZE,
 	}, {
-		.virtual	=3D TS72XX_NAND_CONTROL_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND1_CONTROL_PHYS_BASE),
-		.length		=3D TS72XX_NAND_CONTROL_SIZE,
-		.type		=3D MT_DEVICE,
+		.name		=3D "Linux",
+		.offset		=3D MTDPART_OFS_APPEND,
+		.size		=3D SZ_32M - TS72XX_REDBOOT_PART_SIZE,
 	}, {
-		.virtual	=3D TS72XX_NAND_BUSY_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND1_BUSY_PHYS_BASE),
-		.length		=3D TS72XX_NAND_BUSY_SIZE,
-		.type		=3D MT_DEVICE,
-	}
+		.name		=3D "RedBoot",
+		.offset		=3D MTDPART_OFS_APPEND,
+		.size		=3D MTDPART_SIZ_FULL,
+	},
 };
=20
-static struct map_desc ts72xx_alternate_nand_io_desc[] __initdata =3D {
+static struct mtd_partition ts72xx_part_info128[] =3D {
 	{
-		.virtual	=3D TS72XX_NAND_DATA_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND2_DATA_PHYS_BASE),
-		.length		=3D TS72XX_NAND_DATA_SIZE,
-		.type		=3D MT_DEVICE,
+		.name		=3D "TS-BOOTROM",
+		.offset		=3D 0,
+		.size		=3D TS72XX_BOOTROM_PART_SIZE,
 	}, {
-		.virtual	=3D TS72XX_NAND_CONTROL_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND2_CONTROL_PHYS_BASE),
-		.length		=3D TS72XX_NAND_CONTROL_SIZE,
-		.type		=3D MT_DEVICE,
+		.name		=3D "Linux",
+		.offset		=3D MTDPART_OFS_APPEND,
+		.size		=3D SZ_128M - TS72XX_REDBOOT_PART_SIZE,
 	}, {
-		.virtual	=3D TS72XX_NAND_BUSY_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND2_BUSY_PHYS_BASE),
-		.length		=3D TS72XX_NAND_BUSY_SIZE,
-		.type		=3D MT_DEVICE,
-	}
+		.name		=3D "RedBoot",
+		.offset		=3D MTDPART_OFS_APPEND,
+		.size		=3D MTDPART_SIZ_FULL,
+	},
 };
=20
-static void __init ts72xx_map_io(void)
+static void ts72xx_nand_set_parts(uint64_t size,
+				  struct platform_nand_chip *chip)
 {
-	ep93xx_map_io();
-	iotable_init(ts72xx_io_desc, ARRAY_SIZE(ts72xx_io_desc));
-
-	/*
-	 * The TS-7200 has NOR flash, the other models have NAND flash.
-	 */
-	if (!board_is_ts7200()) {
-		if (is_ts9420_installed()) {
-			iotable_init(ts72xx_alternate_nand_io_desc,
-				ARRAY_SIZE(ts72xx_alternate_nand_io_desc));
-		} else {
-			iotable_init(ts72xx_nand_io_desc,
-				ARRAY_SIZE(ts72xx_nand_io_desc));
-		}
+	switch (size) {
+	case SZ_32M:
+		chip->partitions =3D ts72xx_part_info32;
+		chip->nr_partitions =3D ARRAY_SIZE(ts72xx_part_info32);
+		break;
+	case SZ_128M:
+		chip->partitions =3D ts72xx_part_info128;
+		chip->nr_partitions =3D ARRAY_SIZE(ts72xx_part_info128);
+		break;
+	default:
+		pr_warning("ts72xx: Unknown nand disk size:%lluMB\n", size >> 20);
+		break;
 	}
 }
=20
+static struct platform_nand_data ts72xx_nand_data =3D {
+	.chip =3D {
+		.nr_chips	=3D 1,
+		.chip_offset	=3D 0,
+		.chip_delay	=3D 15,
+		.part_probe_types =3D ts72xx_nand_part_probes,
+		.set_parts	=3D ts72xx_nand_set_parts,
+	},
+	.ctrl =3D {
+		.cmd_ctrl	=3D ts72xx_nand_hwcontrol,
+		.dev_ready	=3D ts72xx_nand_device_ready,
+	},
+};
+
+static struct resource ts7250_nand_resource[] =3D {
+	{
+		.start		=3D EP93XX_CS6_PHYS_BASE,
+		.end		=3D EP93XX_CS6_PHYS_BASE + SZ_16M - 1,
+		.flags		=3D IORESOURCE_MEM,
+	},
+};
+
+static struct resource ts9420_nand_resource[] =3D {
+	{
+		.start		=3D EP93XX_CS7_PHYS_BASE,
+		.end		=3D EP93XX_CS7_PHYS_BASE + SZ_16M - 1,
+		.flags		=3D IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device ts72xx_nand_flash =3D {
+	.name			=3D "gen_nand",
+	.id			=3D -1,
+	.dev.platform_data	=3D &ts72xx_nand_data,
+};
+
+
 =
/************************************************************************=
*
  * NOR flash (TS-7200 only)
  =
*************************************************************************=
/
-static struct physmap_flash_data ts72xx_flash_data =3D {
+static struct physmap_flash_data ts72xx_nor_data =3D {
 	.width		=3D 2,
 };
=20
-static struct resource ts72xx_flash_resource =3D {
+static struct resource ts72xx_nor_resource =3D {
 	.start		=3D EP93XX_CS6_PHYS_BASE,
 	.end		=3D EP93XX_CS6_PHYS_BASE + SZ_16M - 1,
 	.flags		=3D IORESOURCE_MEM,
 };
=20
-static struct platform_device ts72xx_flash =3D {
+static struct platform_device ts72xx_nor_flash =3D {
 	.name		=3D "physmap-flash",
 	.id		=3D 0,
 	.dev		=3D {
-		.platform_data	=3D &ts72xx_flash_data,
+		.platform_data	=3D &ts72xx_nor_data,
 	},
 	.num_resources	=3D 1,
-	.resource	=3D &ts72xx_flash_resource,
+	.resource	=3D &ts72xx_nor_resource,
 };
=20
 static void __init ts72xx_register_flash(void)
 {
-	if (board_is_ts7200())
-		platform_device_register(&ts72xx_flash);
+	if (board_is_ts7200()) {
+		platform_device_register(&ts72xx_nor_flash);
+	} else {
+		if (is_ts9420_installed()) {
+			ts72xx_nand_flash.resource =3D ts9420_nand_resource;
+			ts72xx_nand_flash.num_resources =3D
+					ARRAY_SIZE(ts9420_nand_resource);
+		} else {
+			ts72xx_nand_flash.resource =3D ts7250_nand_resource;
+			ts72xx_nand_flash.num_resources =3D
+					ARRAY_SIZE(ts7250_nand_resource);
+		}
+		platform_device_register(&ts72xx_nand_flash);
+	}
 }
=20
+
 static unsigned char ts72xx_rtc_readbyte(unsigned long addr)
 {
 	__raw_writeb(addr, TS72XX_RTC_INDEX_VIRT_BASE);=20
