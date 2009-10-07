Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH 1/2] Update ts72xx to use generic platform nand driver
Date: Wed, 7 Oct 2009 13:31:24 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901DB7A9E@mi8nycmail19.Mi8.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901DB7A8D@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901DB7967@mi8nycmail19.Mi8.com><jbvtp6-i58.ln1@chipmunk.wormnet.eu>
	<BD79186B4FD85F4B8E60E381CAEE190901DB7A8D@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Matthieu Crapet <mcrapet@gmail.com>,
	Alexander Clouter <alex@digriz.org.uk>
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
Cc: Alexander Clouter <alex@digriz.org.uk>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-mtd@lists.infradead.org>

---

V2 - mark the TS-BOOTROM and RedBoot partitions read-only (Alexander =
Clouter)
     combined the nand mtd_partition structs (Alexander Clouter)
     combined the nand resource structs similarly

diff --git a/arch/arm/mach-ep93xx/ts72xx.c =
b/arch/arm/mach-ep93xx/ts72xx.c
index 259f782..95805cc 100644
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
@@ -54,92 +56,163 @@ static struct map_desc ts72xx_io_desc[] __initdata =
=3D {
 	}
 };
=20
-static struct map_desc ts72xx_nand_io_desc[] __initdata =3D {
-	{
-		.virtual	=3D TS72XX_NAND_DATA_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND1_DATA_PHYS_BASE),
-		.length		=3D TS72XX_NAND_DATA_SIZE,
-		.type		=3D MT_DEVICE,
-	}, {
-		.virtual	=3D TS72XX_NAND_CONTROL_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND1_CONTROL_PHYS_BASE),
-		.length		=3D TS72XX_NAND_CONTROL_SIZE,
-		.type		=3D MT_DEVICE,
-	}, {
-		.virtual	=3D TS72XX_NAND_BUSY_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND1_BUSY_PHYS_BASE),
-		.length		=3D TS72XX_NAND_BUSY_SIZE,
-		.type		=3D MT_DEVICE,
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
 	}
-};
=20
-static struct map_desc ts72xx_alternate_nand_io_desc[] __initdata =3D {
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
+static struct mtd_partition ts72xx_nand_parts[] =3D {
 	{
-		.virtual	=3D TS72XX_NAND_DATA_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND2_DATA_PHYS_BASE),
-		.length		=3D TS72XX_NAND_DATA_SIZE,
-		.type		=3D MT_DEVICE,
+		.name		=3D "TS-BOOTROM",
+		.offset		=3D 0,
+		.size		=3D TS72XX_BOOTROM_PART_SIZE,
+		.mask_flags	=3D MTD_WRITEABLE,	/* force read-only */
 	}, {
-		.virtual	=3D TS72XX_NAND_CONTROL_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND2_CONTROL_PHYS_BASE),
-		.length		=3D TS72XX_NAND_CONTROL_SIZE,
-		.type		=3D MT_DEVICE,
+		.name		=3D "Linux",
+		.offset		=3D MTDPART_OFS_APPEND,
+		.size		=3D 0,			/* filled in later */
 	}, {
-		.virtual	=3D TS72XX_NAND_BUSY_VIRT_BASE,
-		.pfn		=3D __phys_to_pfn(TS72XX_NAND2_BUSY_PHYS_BASE),
-		.length		=3D TS72XX_NAND_BUSY_SIZE,
-		.type		=3D MT_DEVICE,
-	}
+		.name		=3D "RedBoot",
+		.offset		=3D MTDPART_OFS_APPEND,
+		.size		=3D MTDPART_SIZ_FULL,
+		.mask_flags	=3D MTD_WRITEABLE,	/* force read-only */
+	},
 };
=20
-static void __init ts72xx_map_io(void)
+static void ts72xx_nand_set_parts(uint64_t size,
+				  struct platform_nand_chip *chip)
 {
-	ep93xx_map_io();
-	iotable_init(ts72xx_io_desc, ARRAY_SIZE(ts72xx_io_desc));
+	/* Factory TS-72xx board only come with 32MB or 128MB NAND options */
+	if (size =3D=3D SZ_32M || size =3D=3D SZ_128M) {
+		/* Set the "Linux" partition size */
+		ts72xx_nand_parts[1].size =3D size - TS72XX_REDBOOT_PART_SIZE;
=20
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
+		chip->partitions =3D ts72xx_nand_parts;
+		chip->nr_partitions =3D ARRAY_SIZE(ts72xx_nand_parts);
+	} else {
+		pr_warning("ts72xx: Unknown nand disk size:%lluMB\n", size >> 20);
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
+static struct resource ts72xx_nand_resource[] =3D {
+	{
+		.start		=3D 0,			/* filled in later */
+		.end		=3D 0,			/* filled in later */
+		.flags		=3D IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device ts72xx_nand_flash =3D {
+	.name			=3D "gen_nand",
+	.id			=3D -1,
+	.dev.platform_data	=3D &ts72xx_nand_data,
+	.resource		=3D ts72xx_nand_resource,
+	.num_resources		=3D ARRAY_SIZE(ts72xx_nand_resource),
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
+		resource_size_t start;
+
+		if (is_ts9420_installed())
+			start =3D EP93XX_CS7_PHYS_BASE;
+		else
+			start =3D EP93XX_CS6_PHYS_BASE;
+
+		ts72xx_nand_resource[0].start =3D start;
+		ts72xx_nand_resource[0].end =3D start + SZ_16M - 1;
+
+		platform_device_register(&ts72xx_nand_flash);
+	}
 }
=20
+
 static unsigned char ts72xx_rtc_readbyte(unsigned long addr)
 {
 	__raw_writeb(addr, TS72XX_RTC_INDEX_VIRT_BASE);=20
