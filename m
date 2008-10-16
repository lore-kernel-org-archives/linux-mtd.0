Received: from fg-out-1718.google.com ([72.14.220.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqc3u-00049M-ES
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 23:15:23 +0000
Received: by fg-out-1718.google.com with SMTP id l26so165587fgb.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Oct 2008 16:15:22 -0700 (PDT)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/6] [MTD] sharpsl-nand: move registration to board code
Date: Fri, 17 Oct 2008 03:15:09 +0400
Message-Id: <1224198909-17568-6-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1224198909-17568-5-git-send-email-dbaryshkov@gmail.com>
References: <20081016231127.GA17131@doriath.ww600.siemens.net>
	<1224198909-17568-1-git-send-email-dbaryshkov@gmail.com>
	<1224198909-17568-2-git-send-email-dbaryshkov@gmail.com>
	<1224198909-17568-3-git-send-email-dbaryshkov@gmail.com>
	<1224198909-17568-4-git-send-email-dbaryshkov@gmail.com>
	<1224198909-17568-5-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Eric Miao <eric.miao@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Finally move registration of sharpsl-nand device to board-specific code.
sharpsl nand driver is now clean and simple.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 arch/arm/mach-pxa/corgi.c  |   54 +++++++++++++++++++++++++++
 arch/arm/mach-pxa/poodle.c |   51 ++++++++++++++++++++++++++
 arch/arm/mach-pxa/spitz.c  |   76 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/sharpsl.c |   87 +-------------------------------------------
 4 files changed, 182 insertions(+), 86 deletions(-)

diff --git a/arch/arm/mach-pxa/corgi.c b/arch/arm/mach-pxa/corgi.c
index e703a8d..a46b785 100644
--- a/arch/arm/mach-pxa/corgi.c
+++ b/arch/arm/mach-pxa/corgi.c
@@ -21,6 +21,7 @@
 #include <linux/mmc/host.h>
 #include <linux/pm.h>
 #include <linux/backlight.h>
+#include <linux/mtd/sharpsl.h>
 #include <video/w100fb.h>
 
 #include <asm/setup.h>
@@ -483,6 +484,55 @@ static struct pxa2xx_udc_mach_info udc_info __initdata = {
 	.gpio_pullup		= CORGI_GPIO_USB_PULLUP,
 };
 
+static struct mtd_partition sharpsl_nand_partitions[] = {
+	{
+		.name = "System Area",
+		.offset = 0,
+		.size = 7 * 1024 * 1024,
+	},
+	{
+		.name = "Root Filesystem",
+		.offset = 7 * 1024 * 1024,
+		.size = 25 * 1024 * 1024,
+	},
+	{
+		.name = "Home Filesystem",
+		.offset = MTDPART_OFS_APPEND,
+		.size = MTDPART_SIZ_FULL,
+	},
+};
+
+static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+
+static struct nand_bbt_descr sharpsl_bbt = {
+	.options = 0,
+	.offs = 4,
+	.len = 2,
+	.pattern = scan_ff_pattern
+};
+
+static struct sharpsl_nand_platform_data sharpsl_nand_platform_data = {
+	.badblock_pattern	= &sharpsl_bbt,
+	.partitions		= sharpsl_nand_partitions,
+	.nr_partitions		= ARRAY_SIZE(sharpsl_nand_partitions),
+};
+
+static struct resource sharpsl_nand_resources[] = {
+	{
+		.start	= 0x0C000000,
+		.end	= 0x0C000FFF,
+		.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device sharpsl_nand_device = {
+	.name		= "sharpsl-nand",
+	.id		= -1,
+	.resource	= sharpsl_nand_resources,
+	.num_resources	= ARRAY_SIZE(sharpsl_nand_resources),
+	.dev.platform_data	= &sharpsl_nand_platform_data,
+};
+
 
 static struct platform_device *devices[] __initdata = {
 	&corgiscoop_device,
@@ -492,6 +542,7 @@ static struct platform_device *devices[] __initdata = {
 	&corgibl_device,
 	&corgits_device,
 	&corgiled_device,
+	&sharpsl_nand_device,
 };
 
 static void corgi_poweroff(void)
@@ -537,6 +588,9 @@ static void __init corgi_init(void)
 
 	platform_scoop_config = &corgi_pcmcia_config;
 
+	if (machine_is_husky())
+		sharpsl_nand_partitions[1].size = 53 * 1024 * 1024;
+
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 }
 
diff --git a/arch/arm/mach-pxa/poodle.c b/arch/arm/mach-pxa/poodle.c
index 3f5f484..2edb8e3 100644
--- a/arch/arm/mach-pxa/poodle.c
+++ b/arch/arm/mach-pxa/poodle.c
@@ -20,6 +20,7 @@
 #include <linux/fb.h>
 #include <linux/pm.h>
 #include <linux/delay.h>
+#include <linux/mtd/sharpsl.h>
 
 #include <mach/hardware.h>
 #include <asm/mach-types.h>
@@ -320,11 +321,61 @@ static struct pxafb_mach_info poodle_fb_info = {
 	.lccr3		= 0,
 };
 
+static struct mtd_partition sharpsl_nand_partitions[] = {
+	{
+		.name = "System Area",
+		.offset = 0,
+		.size = 7 * 1024 * 1024,
+	},
+	{
+		.name = "Root Filesystem",
+		.offset = 7 * 1024 * 1024,
+		.size = 22 * 1024 * 1024,
+	},
+	{
+		.name = "Home Filesystem",
+		.offset = MTDPART_OFS_APPEND,
+		.size = MTDPART_SIZ_FULL,
+	},
+};
+
+static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+
+static struct nand_bbt_descr sharpsl_bbt = {
+	.options = 0,
+	.offs = 4,
+	.len = 2,
+	.pattern = scan_ff_pattern
+};
+
+static struct sharpsl_nand_platform_data sharpsl_nand_platform_data = {
+	.badblock_pattern	= &sharpsl_bbt,
+	.partitions		= sharpsl_nand_partitions,
+	.nr_partitions		= ARRAY_SIZE(sharpsl_nand_partitions),
+};
+
+static struct resource sharpsl_nand_resources[] = {
+	{
+		.start	= 0x0C000000,
+		.end	= 0x0C000FFF,
+		.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device sharpsl_nand_device = {
+	.name		= "sharpsl-nand",
+	.id		= -1,
+	.resource	= sharpsl_nand_resources,
+	.num_resources	= ARRAY_SIZE(sharpsl_nand_resources),
+	.dev.platform_data	= &sharpsl_nand_platform_data,
+};
+
 static struct platform_device *devices[] __initdata = {
 	&poodle_locomo_device,
 	&poodle_scoop_device,
 	&poodle_ssp_device,
 	&poodle_ts_device,
+	&sharpsl_nand_device,
 };
 
 static void poodle_poweroff(void)
diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index b569f3b..fb6b74b 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -22,6 +22,7 @@
 #include <linux/mmc/host.h>
 #include <linux/pm.h>
 #include <linux/backlight.h>
+#include <linux/mtd/sharpsl.h>
 
 #include <asm/setup.h>
 #include <asm/memory.h>
@@ -522,6 +523,54 @@ static struct pxafb_mach_info spitz_pxafb_info = {
 	.pxafb_lcd_power = spitz_lcd_power,
 };
 
+static struct mtd_partition sharpsl_nand_partitions[] = {
+	{
+		.name = "System Area",
+		.offset = 0,
+		.size = 7 * 1024 * 1024,
+	},
+	{
+		.name = "Root Filesystem",
+		.offset = 7 * 1024 * 1024,
+	},
+	{
+		.name = "Home Filesystem",
+		.offset = MTDPART_OFS_APPEND,
+		.size = MTDPART_SIZ_FULL,
+	},
+};
+
+static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+
+static struct nand_bbt_descr sharpsl_bbt = {
+	.options = 0,
+	.offs = 4,
+	.len = 2,
+	.pattern = scan_ff_pattern
+};
+
+static struct sharpsl_nand_platform_data sharpsl_nand_platform_data = {
+	.badblock_pattern	= &sharpsl_bbt,
+	.partitions		= sharpsl_nand_partitions,
+	.nr_partitions		= ARRAY_SIZE(sharpsl_nand_partitions),
+};
+
+static struct resource sharpsl_nand_resources[] = {
+	{
+		.start	= 0x0C000000,
+		.end	= 0x0C000FFF,
+		.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device sharpsl_nand_device = {
+	.name		= "sharpsl-nand",
+	.id		= -1,
+	.resource	= sharpsl_nand_resources,
+	.num_resources	= ARRAY_SIZE(sharpsl_nand_resources),
+	.dev.platform_data	= &sharpsl_nand_platform_data,
+};
+
 
 static struct platform_device *devices[] __initdata = {
 	&spitzscoop_device,
@@ -552,6 +601,14 @@ static void __init common_init(void)
 	pm_power_off = spitz_poweroff;
 	arm_pm_restart = spitz_restart;
 
+	if (machine_is_spitz()) {
+		sharpsl_nand_partitions[1].size = 5 * 1024 * 1024;
+	} else if (machine_is_akita()) {
+		sharpsl_nand_partitions[1].size = 58 * 1024 * 1024;
+	} else if (machine_is_borzoi()) {
+		sharpsl_nand_partitions[1].size = 32 * 1024 * 1024;
+	}
+
 	PMCR = 0x00;
 
 	/* setup sleep mode values */
@@ -642,10 +699,29 @@ static void akita_bl_set_intensity(int intensity)
 		akita_reset_ioexp(&akitaioexp_device.dev, AKITA_IOEXP_BACKLIGHT_ON);
 }
 
+static struct nand_bbt_descr sharpsl_akita_bbt = {
+	.options = 0,
+	.offs = 4,
+	.len = 1,
+	.pattern = scan_ff_pattern
+};
+
+static struct nand_ecclayout akita_oobinfo = {
+	.eccbytes = 24,
+	.eccpos = {
+		   0x5, 0x1, 0x2, 0x3, 0x6, 0x7, 0x15, 0x11,
+		   0x12, 0x13, 0x16, 0x17, 0x25, 0x21, 0x22, 0x23,
+		   0x26, 0x27, 0x35, 0x31, 0x32, 0x33, 0x36, 0x37},
+	.oobfree = {{0x08, 0x09}}
+};
+
 static void __init akita_init(void)
 {
 	spitz_ficp_platform_data.transceiver_mode = akita_irda_transceiver_mode;
 
+	sharpsl_nand_platform_data.badblock_pattern = &sharpsl_akita_bbt;
+	sharpsl_nand_platform_data.ecc_layout = &akita_oobinfo;
+
 	/* We just pretend the second element of the array doesn't exist */
 	spitz_pcmcia_config.num_devs = 1;
 	platform_scoop_config = &spitz_pcmcia_config;
diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 698378c..97b69ce 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -247,93 +247,8 @@ static struct platform_driver sharpsl_nand_driver = {
 	.remove		= __devexit_p(sharpsl_nand_remove),
 };
 
-/*
- * Define partitions for flash device
- */
-static struct mtd_partition sharpsl_nand_partitions[] = {
-	{
-	 .name = "System Area",
-	 .offset = 0,
-	 .size = 7 * 1024 * 1024,
-	 },
-	{
-	 .name = "Root Filesystem",
-	 .offset = 7 * 1024 * 1024,
-	 .size = 30 * 1024 * 1024,
-	 },
-	{
-	 .name = "Home Filesystem",
-	 .offset = MTDPART_OFS_APPEND,
-	 .size = MTDPART_SIZ_FULL,
-	 },
-};
-
-static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
-
-static struct nand_bbt_descr sharpsl_bbt = {
-	.options = 0,
-	.offs = 4,
-	.len = 2,
-	.pattern = scan_ff_pattern
-};
-
-static struct nand_bbt_descr sharpsl_akita_bbt = {
-	.options = 0,
-	.offs = 4,
-	.len = 1,
-	.pattern = scan_ff_pattern
-};
-
-static struct nand_ecclayout akita_oobinfo = {
-	.eccbytes = 24,
-	.eccpos = {
-		   0x5, 0x1, 0x2, 0x3, 0x6, 0x7, 0x15, 0x11,
-		   0x12, 0x13, 0x16, 0x17, 0x25, 0x21, 0x22, 0x23,
-		   0x26, 0x27, 0x35, 0x31, 0x32, 0x33, 0x36, 0x37},
-	.oobfree = {{0x08, 0x09}}
-};
-
-static struct sharpsl_nand_platform_data sharpsl_nand_platform_data = {
-	.badblock_pattern	= &sharpsl_bbt,
-	.partitions		= sharpsl_nand_partitions,
-	.nr_partitions		= ARRAY_SIZE(sharpsl_nand_partitions),
-};
-
-static struct resource sharpsl_nand_resources[] = {
-	{
-		.start	= 0x0C000000,
-		.end	= 0x0C000FFF,
-		.flags	= IORESOURCE_MEM,
-	},
-};
-
-static struct platform_device sharpsl_nand_device = {
-	.name		= "sharpsl-nand",
-	.id		= -1,
-	.resource	= sharpsl_nand_resources,
-	.num_resources	= ARRAY_SIZE(sharpsl_nand_resources),
-	.dev.platform_data	= &sharpsl_nand_platform_data,
-};
-
 static int __init sharpsl_nand_init(void)
 {
-	if (machine_is_poodle()) {
-		sharpsl_nand_partitions[1].size = 22 * 1024 * 1024;
-	} else if (machine_is_corgi() || machine_is_shepherd()) {
-		sharpsl_nand_partitions[1].size = 25 * 1024 * 1024;
-	} else if (machine_is_husky()) {
-		sharpsl_nand_partitions[1].size = 53 * 1024 * 1024;
-	} else if (machine_is_spitz()) {
-		sharpsl_nand_partitions[1].size = 5 * 1024 * 1024;
-	} else if (machine_is_akita()) {
-		sharpsl_nand_partitions[1].size = 58 * 1024 * 1024;
-		sharpsl_nand_platform_data.badblock_pattern = &sharpsl_akita_bbt;
-		sharpsl_nand_platform_data.ecc_layout = &akita_oobinfo;
-	} else if (machine_is_borzoi()) {
-		sharpsl_nand_partitions[1].size = 32 * 1024 * 1024;
-	}
-
-	platform_device_register(&sharpsl_nand_device);
 	return platform_driver_register(&sharpsl_nand_driver);
 }
 module_init(sharpsl_nand_init);
@@ -341,10 +256,10 @@ module_init(sharpsl_nand_init);
 static void __exit sharpsl_nand_exit(void)
 {
 	platform_driver_unregister(&sharpsl_nand_driver);
-	platform_device_unregister(&sharpsl_nand_device);
 }
 module_exit(sharpsl_nand_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Richard Purdie <rpurdie@rpsys.net>");
 MODULE_DESCRIPTION("Device specific logic for NAND flash on Sharp SL-C7xx Series");
+
-- 
1.5.6.5
