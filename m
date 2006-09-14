Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GNspF-0005a6-Fl
	for linux-mtd@lists.infradead.org; Thu, 14 Sep 2006 16:08:26 +0100
Date: Thu, 14 Sep 2006 16:34:21 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: Andrew Morton <akpm@osdl.org>
Subject: [-mm patch 4/4] AVR32 MTD: AT49BV6416 platform device for atstk1000
Message-ID: <20060914163421.53ac453e@cad-250-152.norway.atmel.com>
In-Reply-To: <20060914163259.068abe6d@cad-250-152.norway.atmel.com>
References: <20060914162926.6c117b36@cad-250-152.norway.atmel.com>
	<20060914163026.49766346@cad-250-152.norway.atmel.com>
	<20060914163121.241dec3e@cad-250-152.norway.atmel.com>
	<20060914163259.068abe6d@cad-250-152.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Register a platform device for the AT49BV6416 NOR flash chip on the
ATSTK1000 development board for use by the ATSTK1000 MTD map driver.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
---
 arch/avr32/boards/atstk1000/atstk1002.c |   46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

Index: linux-2.6.18-rc5-mm1/arch/avr32/boards/atstk1000/atstk1002.c
===================================================================
--- linux-2.6.18-rc5-mm1.orig/arch/avr32/boards/atstk1000/atstk1002.c	2006-09-07 15:18:55.000000000 +0200
+++ linux-2.6.18-rc5-mm1/arch/avr32/boards/atstk1000/atstk1002.c	2006-09-07 15:21:18.000000000 +0200
@@ -8,6 +8,9 @@
  * published by the Free Software Foundation.
  */
 #include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
 
 #include <asm/arch/board.h>
 
@@ -20,6 +23,47 @@ struct eth_platform_data __initdata eth0
 
 extern struct lcdc_platform_data atstk1000_fb0_data;
 
+static struct mtd_partition flash_parts[] = {
+	{
+		.name           = "u-boot",
+		.offset         = 0x00000000,
+		.size           = 0x00020000,           /* 128 KiB */
+		.mask_flags     = MTD_WRITEABLE,
+	},
+	{
+		.name           = "root",
+		.offset         = 0x00020000,
+		.size           = 0x007d0000,
+	},
+	{
+		.name           = "env",
+		.offset         = 0x007f0000,
+		.size           = 0x00010000,
+		.mask_flags     = MTD_WRITEABLE,
+	},
+};
+
+static struct flash_platform_data flash_data = {
+	.nr_parts	= ARRAY_SIZE(flash_parts),
+	.parts		= flash_parts,
+};
+
+struct resource flash_resource = {
+	.start		= 0x00000000,
+	.end		= 0x007fffff,
+	.flags		= IORESOURCE_MEM,
+};
+
+struct platform_device flash_device = {
+	.name		= "atstk1000-flash",
+	.id		= 0,
+	.resource	= &flash_resource,
+	.num_resources	= 1,
+	.dev		= {
+		.platform_data = &flash_data,
+	},
+};
+
 static int __init atstk1002_init(void)
 {
 	at32_add_system_devices();
@@ -32,6 +76,8 @@ static int __init atstk1002_init(void)
 	at32_add_device_spi(0);
 	at32_add_device_lcdc(0, &atstk1000_fb0_data);
 
+	platform_device_register(&flash_device);
+
 	return 0;
 }
 postcore_initcall(atstk1002_init);
