From: alex@digriz.org.uk (Alexander Clouter)
Date: Sat, 7 Feb 2009 12:38:43 +0000
Subject: [PATCH] [ARM] ep93xx: add hooks to ts7xxx NAND driver
Message-ID: <mailman.0.1234090352.3132.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
---
 arch/arm/mach-ep93xx/include/mach/ts72xx.h |    8 ++
 arch/arm/mach-ep93xx/ts72xx.c              |  129 +++++++++++++++++++++++++++-
 2 files changed, 136 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
index 34ddec0..2244389 100644
--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
@@ -44,6 +44,7 @@
 #define TS72XX_NOR_PHYS_BASE		0x60000000
 #define TS72XX_NOR2_PHYS_BASE		0x62000000
 
+/* MTD_NAND_TS7250 defines */
 #define TS72XX_NAND1_DATA_PHYS_BASE	0x60000000
 #define TS72XX_NAND2_DATA_PHYS_BASE	0x70000000
 #define TS72XX_NAND_DATA_VIRT_BASE	0xfebfc000
@@ -59,6 +60,13 @@
 #define TS72XX_NAND_BUSY_VIRT_BASE	0xfebfa000
 #define TS72XX_NAND_BUSY_SIZE		0x00001000
 
+/* MTD_NAND_TS7XXX defines */
+#define TS72XX_NAND_DATA_PHYS_BASE	0x60000000
+#define TS72XX_NAND_CONTROL_PHYS_BASE	0x60400000
+#define TS72XX_NAND_BUSY_PHYS_BASE	0x60800000
+#define TS72XX_NAND_IO_SIZE		4
+#define TS72XX_NAND1_NAND2_DIFF		0x10000000
+
 
 #define TS72XX_RTC_INDEX_VIRT_BASE	0xfebf9000
 #define TS72XX_RTC_INDEX_PHYS_BASE	0x10800000
diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx.c
index 7ee024d..4c3ba22 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -19,6 +19,9 @@
 #include <linux/mtd/physmap.h>
 #include <linux/platform_device.h>
 #include <linux/m48t86.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/nand-ts7xxx.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
 #include <mach/hardware.h>
@@ -55,6 +58,7 @@ static struct map_desc ts72xx_io_desc[] __initdata = {
 	}
 };
 
+#ifdef CONFIG_MTD_NAND_TS7250
 static struct map_desc ts72xx_nand_io_desc[] __initdata = {
 	{
 		.virtual	= TS72XX_NAND_DATA_VIRT_BASE,
@@ -92,6 +96,7 @@ static struct map_desc ts72xx_alternate_nand_io_desc[] __initdata = {
 		.type		= MT_DEVICE,
 	}
 };
+#endif
 
 static void __init ts72xx_map_io(void)
 {
@@ -101,6 +106,7 @@ static void __init ts72xx_map_io(void)
 	/*
 	 * The TS-7200 has NOR flash, the other models have NAND flash.
 	 */
+#ifdef CONFIG_MTD_NAND_TS7250
 	if (!board_is_ts7200()) {
 		if (is_ts9420_installed()) {
 			iotable_init(ts72xx_alternate_nand_io_desc,
@@ -110,8 +116,125 @@ static void __init ts72xx_map_io(void)
 				ARRAY_SIZE(ts72xx_nand_io_desc));
 		}
 	}
+#endif
 }
 
+#ifdef CONFIG_MTD_NAND_TS7XXX
+static struct mtd_partition ts72xx_nand_parts32[] = {
+	{
+		.name		= "TS-BOOTROM",
+		.offset		= 0,
+		.size		= SZ_128K,
+		.mask_flags	= MTD_WRITEABLE,
+	}, {
+		.name		= "Linux",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= 29 * SZ_1M,
+	}, {
+		.name		= "RedBoot",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= MTDPART_SIZ_FULL,
+	}
+};
+
+static struct mtd_partition ts72xx_nand_parts128[] = {
+	{
+		.name		= "TS-BOOTROM",
+		.offset		= 0,
+		.size		= SZ_128K,
+		.mask_flags	= MTD_WRITEABLE,
+	}, {
+		.name		= "Linux",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= 125 * SZ_1M,
+	}, {
+		.name		= "RedBoot",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= MTDPART_SIZ_FULL,
+	}
+};
+
+static struct ts7xxx_nand_data ts72xx_nand_data = {
+	.partitions	= NULL,
+	.nr_partitions	= 0,
+
+	.ioports	= {
+		.ctrl	= {
+			.res	= 0,
+			.offset	= 0,
+		},
+		.data	= {
+			.res	= 1,
+			.offset	= 0,
+		},
+
+		.busy	= {
+			.res	= 2,
+			.offset	= 0,
+		},
+	},
+};
+
+static struct resource ts72xx_nand_flash_resource[] = {
+	{
+		.flags		= IORESOURCE_MEM,
+		.start		= TS72XX_NAND_DATA_PHYS_BASE,
+		.end		= TS72XX_NAND_DATA_PHYS_BASE
+					+ TS72XX_NAND_IO_SIZE - 1,
+	}, {
+		.flags		= IORESOURCE_MEM,
+		.start		= TS72XX_NAND_DATA_PHYS_BASE,
+		.end		= TS72XX_NAND_DATA_PHYS_BASE
+					+ TS72XX_NAND_IO_SIZE - 1,
+	}, {
+		.flags		= IORESOURCE_MEM,
+		.start		= TS72XX_NAND_BUSY_PHYS_BASE,
+		.end		= TS72XX_NAND_BUSY_PHYS_BASE
+					+ TS72XX_NAND_IO_SIZE - 1,
+	},
+};
+
+static struct ts7xxx_nand_data *ts72xx_nand(unsigned int size)
+{
+	unsigned int i;
+
+	/*
+	 * The TS-72[56]0's come with either 32MiB or 128MiB of NAND
+	 */
+	if (size == 32 * SZ_1M) {
+		ts72xx_nand_data.partitions = ts72xx_nand_parts32;
+		ts72xx_nand_data.nr_partitions
+					= ARRAY_SIZE(ts72xx_nand_parts32);
+	} else if (size == 128 * SZ_1M) {
+		ts72xx_nand_data.partitions = ts72xx_nand_parts128;
+		ts72xx_nand_data.nr_partitions
+					= ARRAY_SIZE(ts72xx_nand_parts128);
+	}
+
+	/* we only munch this on the init (when size is zero) */
+	if (size == 0 && is_ts9420_installed()) {
+		for (i = 0; i < ARRAY_SIZE(ts72xx_nand_flash_resource); i++) {
+			ts72xx_nand_flash_resource[i].start
+				+= TS72XX_NAND1_NAND2_DIFF;
+			ts72xx_nand_flash_resource[i].end
+				+= TS72XX_NAND1_NAND2_DIFF;
+		}
+	}
+
+	return &ts72xx_nand_data;
+};
+
+static struct platform_device ts72xx_nand_flash = {
+	.name		= "ts7xxx_nand",
+	.id		= -1,
+	.dev		= {
+		.platform_data	= &ts72xx_nand,
+	},
+	.num_resources	= ARRAY_SIZE(ts72xx_nand_flash_resource),
+	.resource	= ts72xx_nand_flash_resource,
+};
+#endif
+
 static struct physmap_flash_data ts72xx_flash_data = {
 	.width		= 1,
 };
@@ -165,8 +288,12 @@ static struct ep93xx_eth_data ts72xx_eth_data = {
 static void __init ts72xx_init_machine(void)
 {
 	ep93xx_init_devices();
-	if (board_is_ts7200())
+	if (board_is_ts7200()) {
 		platform_device_register(&ts72xx_flash);
+#ifdef CONFIG_MTD_NAND_TS7XXX
+		platform_device_register(&ts72xx_nand_flash);
+#endif
+	}
 	platform_device_register(&ts72xx_rtc_device);
 
 	ep93xx_register_eth(&ts72xx_eth_data, 1);
-- 
1.5.6.5
