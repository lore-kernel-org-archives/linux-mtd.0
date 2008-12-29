Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LHQ3M-0000RC-5s
	for linux-mtd@lists.infradead.org; Mon, 29 Dec 2008 21:53:36 +0000
Date: Mon, 29 Dec 2008 21:53:30 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC 3/3] [MTD] NAND: hooks for ts72xx.c to use ts7xxx.c
	NAND driver
Message-ID: <20081229215330.GI3381@woodchuck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH RFC] [MTD] NAND: add hooks so ts72xx.c can use the NAND

Add the NAND hooks in the platform code for the ts78xx.c.  Completely 
removes the hooks used by the ts7200.c NAND driver, which probably is a 
bad idea.

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
---
 arch/arm/mach-ep93xx/include/mach/ts72xx.h |   20 +---
 arch/arm/mach-ep93xx/ts72xx.c              |  175 ++++++++++++++++++++--------
 2 files changed, 130 insertions(+), 65 deletions(-)

diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
index 34ddec0..474f30d 100644
--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
@@ -44,20 +44,12 @@
 #define TS72XX_NOR_PHYS_BASE		0x60000000
 #define TS72XX_NOR2_PHYS_BASE		0x62000000
 
-#define TS72XX_NAND1_DATA_PHYS_BASE	0x60000000
-#define TS72XX_NAND2_DATA_PHYS_BASE	0x70000000
-#define TS72XX_NAND_DATA_VIRT_BASE	0xfebfc000
-#define TS72XX_NAND_DATA_SIZE		0x00001000
-
-#define TS72XX_NAND1_CONTROL_PHYS_BASE	0x60400000
-#define TS72XX_NAND2_CONTROL_PHYS_BASE	0x70400000
-#define TS72XX_NAND_CONTROL_VIRT_BASE	0xfebfb000
-#define TS72XX_NAND_CONTROL_SIZE	0x00001000
-
-#define TS72XX_NAND1_BUSY_PHYS_BASE	0x60800000
-#define TS72XX_NAND2_BUSY_PHYS_BASE	0x70800000
-#define TS72XX_NAND_BUSY_VIRT_BASE	0xfebfa000
-#define TS72XX_NAND_BUSY_SIZE		0x00001000
+
+#define TS72XX_NAND_DATA_PHYS_BASE	0x60000000
+#define TS72XX_NAND_CONTROL_PHYS_BASE	0x60400000
+#define TS72XX_NAND_BUSY_PHYS_BASE	0x60800000
+#define TS72XX_NAND_IO_SIZE		4
+#define TS72XX_NAND1_NAND2_DIFF		0x10000000
 
 
 #define TS72XX_RTC_INDEX_VIRT_BASE	0xfebf9000
diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx.c
index 7ee024d..0d51910 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -19,6 +19,9 @@
 #include <linux/mtd/physmap.h>
 #include <linux/platform_device.h>
 #include <linux/m48t86.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/ts7xxx.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
 #include <mach/hardware.h>
@@ -55,61 +58,10 @@ static struct map_desc ts72xx_io_desc[] __initdata = {
 	}
 };
 
-static struct map_desc ts72xx_nand_io_desc[] __initdata = {
-	{
-		.virtual	= TS72XX_NAND_DATA_VIRT_BASE,
-		.pfn		= __phys_to_pfn(TS72XX_NAND1_DATA_PHYS_BASE),
-		.length		= TS72XX_NAND_DATA_SIZE,
-		.type		= MT_DEVICE,
-	}, {
-		.virtual	= TS72XX_NAND_CONTROL_VIRT_BASE,
-		.pfn		= __phys_to_pfn(TS72XX_NAND1_CONTROL_PHYS_BASE),
-		.length		= TS72XX_NAND_CONTROL_SIZE,
-		.type		= MT_DEVICE,
-	}, {
-		.virtual	= TS72XX_NAND_BUSY_VIRT_BASE,
-		.pfn		= __phys_to_pfn(TS72XX_NAND1_BUSY_PHYS_BASE),
-		.length		= TS72XX_NAND_BUSY_SIZE,
-		.type		= MT_DEVICE,
-	}
-};
-
-static struct map_desc ts72xx_alternate_nand_io_desc[] __initdata = {
-	{
-		.virtual	= TS72XX_NAND_DATA_VIRT_BASE,
-		.pfn		= __phys_to_pfn(TS72XX_NAND2_DATA_PHYS_BASE),
-		.length		= TS72XX_NAND_DATA_SIZE,
-		.type		= MT_DEVICE,
-	}, {
-		.virtual	= TS72XX_NAND_CONTROL_VIRT_BASE,
-		.pfn		= __phys_to_pfn(TS72XX_NAND2_CONTROL_PHYS_BASE),
-		.length		= TS72XX_NAND_CONTROL_SIZE,
-		.type		= MT_DEVICE,
-	}, {
-		.virtual	= TS72XX_NAND_BUSY_VIRT_BASE,
-		.pfn		= __phys_to_pfn(TS72XX_NAND2_BUSY_PHYS_BASE),
-		.length		= TS72XX_NAND_BUSY_SIZE,
-		.type		= MT_DEVICE,
-	}
-};
-
 static void __init ts72xx_map_io(void)
 {
 	ep93xx_map_io();
 	iotable_init(ts72xx_io_desc, ARRAY_SIZE(ts72xx_io_desc));
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
-	}
 }
 
 static struct physmap_flash_data ts72xx_flash_data = {
@@ -132,6 +84,125 @@ static struct platform_device ts72xx_flash = {
 	.resource	= &ts72xx_flash_resource,
 };
 
+/*****************************************************************************
+ * NAND Flash
+ ****************************************************************************/
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
+
+/****************************************************************************/
+
 static unsigned char ts72xx_rtc_readbyte(unsigned long addr)
 {
 	__raw_writeb(addr, TS72XX_RTC_INDEX_VIRT_BASE);
@@ -167,6 +238,8 @@ static void __init ts72xx_init_machine(void)
 	ep93xx_init_devices();
 	if (board_is_ts7200())
 		platform_device_register(&ts72xx_flash);
+	if (!board_is_ts7200())
+		platform_device_register(&ts72xx_nand_flash);
 	platform_device_register(&ts72xx_rtc_device);
 
 	ep93xx_register_eth(&ts72xx_eth_data, 1);
-- 
1.5.6.5
