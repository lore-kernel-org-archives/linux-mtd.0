Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LHQ22-0005AK-28
	for linux-mtd@lists.infradead.org; Mon, 29 Dec 2008 21:52:19 +0000
Date: Mon, 29 Dec 2008 21:52:07 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC 2/3] [MTD] NAND: hooks for ts78xx.c to use ts7xxx.c
	NAND driver
Message-ID: <20081229215207.GH3381@woodchuck>
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

[PATCH RFC] [MTD] NAND: add hooks so TS78xx can use the NAND

Add the NAND hooks in the platform code for the ts78xx.c

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
---
 arch/arm/mach-orion5x/ts78xx-fpga.h  |    1 +
 arch/arm/mach-orion5x/ts78xx-setup.c |  115 ++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-orion5x/ts78xx-fpga.h b/arch/arm/mach-orion5x/ts78xx-fpga.h
index 247e7ea..44c2b3c 100644
--- a/arch/arm/mach-orion5x/ts78xx-fpga.h
+++ b/arch/arm/mach-orion5x/ts78xx-fpga.h
@@ -12,6 +12,7 @@ struct fpga_device {
 struct fpga_devices {
 	/* Technologic Systems */
 	struct fpga_device ts_rtc;
+	struct fpga_device ts_nand;
 };
 
 struct ts78xx_fpga_data {
diff --git a/arch/arm/mach-orion5x/ts78xx-setup.c b/arch/arm/mach-orion5x/ts78xx-setup.c
index 2d020ac..b0fb96d 100644
--- a/arch/arm/mach-orion5x/ts78xx-setup.c
+++ b/arch/arm/mach-orion5x/ts78xx-setup.c
@@ -15,6 +15,9 @@
 #include <linux/mv643xx_eth.h>
 #include <linux/ata_platform.h>
 #include <linux/m48t86.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/ts7xxx.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -159,11 +162,118 @@ static void ts78xx_ts_rtc_unload(void)
 #endif
 
 /*****************************************************************************
+ * NAND Flash
+ ****************************************************************************/
+#ifdef CONFIG_MTD_NAND_TS7XXX
+#define TS_NAND_IOBASE		TS78XX_FPGA_REGS_PHYS_BASE
+#define TS_NAND_SIZE		SZ_4K
+#define TS_NAND_CTRL_OFFSET	0x800
+#define TS_NAND_DATA_OFFSET	0x804
+
+static struct mtd_partition ts78xx_ts_nand_parts512[] = {
+	{
+		.name		= "mbr",
+		.offset		= 0,
+		.size		= SZ_128K,
+		.mask_flags	= MTD_WRITEABLE,
+	}, {
+		.name		= "kernel",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= SZ_4M,
+	}, {
+		.name		= "initrd",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= SZ_4M,
+	}, {
+		.name		= "rootfs",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= MTDPART_SIZ_FULL,
+	}
+};
+
+static struct ts7xxx_nand_data ts78xx_ts_nand_data = {
+	.partitions	= NULL,
+	.nr_partitions	= 0,
+
+	.ioports	= {
+		.ctrl	= {
+			.res	= 0,
+			.offset	= TS_NAND_CTRL_OFFSET,
+		},
+		.data	= {
+			.res	= 0,
+			.offset	= TS_NAND_DATA_OFFSET,
+		},
+
+		.busy	= {
+			.res	= 0,
+			.offset	= TS_NAND_CTRL_OFFSET,
+		},
+	},
+};
+
+static struct resource ts78xx_ts_nand_flash_resource[] = {
+	{
+		.flags		= IORESOURCE_MEM,
+		.start		= TS_NAND_IOBASE,
+		.end		= TS_NAND_IOBASE + TS_NAND_SIZE - 1,
+	},
+};
+
+static struct ts7xxx_nand_data *ts78xx_ts_nand(unsigned int size)
+{
+	/*
+	 * currently only the TS-7800 is out there with a 512MiB NAND
+	 */
+	if (size == 512 * SZ_1M) {
+		ts78xx_ts_nand_data.partitions = ts78xx_ts_nand_parts512;
+		ts78xx_ts_nand_data.nr_partitions
+					= ARRAY_SIZE(ts78xx_ts_nand_parts512);
+	}
+
+	return &ts78xx_ts_nand_data;
+};
+
+static struct platform_device ts78xx_ts_nand_device = {
+	.name		= "ts7xxx_nand",
+	.id		= -1,
+	.dev		= {
+		.platform_data	= &ts78xx_ts_nand,
+	},
+	.num_resources	= ARRAY_SIZE(ts78xx_ts_nand_flash_resource),
+	.resource	= ts78xx_ts_nand_flash_resource,
+};
+
+static void ts78xx_ts_nand_load(void)
+{
+	if (ts78xx_fpga.supports.ts_nand.init == 0) {
+		ts78xx_fpga.supports.ts_nand.init = 1;
+		platform_device_register(&ts78xx_ts_nand_device);
+	} else
+		platform_device_add(&ts78xx_ts_nand_device);
+};
+
+static void ts78xx_ts_nand_unload(void)
+{
+	platform_device_del(&ts78xx_ts_nand_device);
+}
+#else
+static void ts78xx_ts_nand_load(void)
+{
+}
+
+static void ts78xx_ts_nand_unload(void)
+{
+}
+#endif
+
+/*****************************************************************************
  * FPGA 'hotplug' support code
  ****************************************************************************/
 static void ts78xx_fpga_devices_zero_init(void)
 {
 	ts78xx_fpga.supports.ts_rtc.init = 0;
+	ts78xx_fpga.supports.ts_nand.init = 0;
 }
 
 static void ts78xx_fpga_supports(void)
@@ -172,6 +282,7 @@ static void ts78xx_fpga_supports(void)
 	switch (ts78xx_fpga.id) {
 	case TS7800_REV_B:
 		ts78xx_fpga.supports.ts_rtc.present = 1;
+		ts78xx_fpga.supports.ts_nand.present = 1;
 		break;
 	}
 }
@@ -186,6 +297,8 @@ static int ts78xx_fpga_load_devices(void)
 			printk(KERN_INFO "TS-78xx RTC not detected or enabled\n");
 		ret |= tmp;
 	}
+	if (ts78xx_fpga.supports.ts_nand.present == 1)
+		ts78xx_ts_nand_load();
 
 	return ret;
 }
@@ -196,6 +309,8 @@ static int ts78xx_fpga_unload_devices(void)
 
 	if (ts78xx_fpga.supports.ts_rtc.present == 1)
 		ts78xx_ts_rtc_unload();
+	if (ts78xx_fpga.supports.ts_nand.present == 1)
+		ts78xx_ts_nand_unload();
 
 	return ret;
 }
-- 
1.5.6.5
