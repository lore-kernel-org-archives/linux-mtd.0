Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1emjAf-0007PY-Uf
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 16:47:59 +0000
Received: by mail-wr0-x243.google.com with SMTP id w77so3520539wrc.6
 for <linux-mtd@lists.infradead.org>; Fri, 16 Feb 2018 08:47:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, David Lechner <david@lechnology.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 6/6] ARM: davinci: use aemif platform driver in legacy mode
 for da850-evm
Date: Fri, 16 Feb 2018 17:47:12 +0100
Message-Id: <20180216164712.25898-7-brgl@bgdev.pl>
In-Reply-To: <20180216164712.25898-1-brgl@bgdev.pl>
References: <20180216164712.25898-1-brgl@bgdev.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We now support board files in aemif. Use the platform driver instead
of the handcrafted API in da850-evm.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-da850-evm.c | 93 ++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 42 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 828194045a2b..88e1d00a1f56 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -33,6 +33,7 @@
 #include <linux/platform_data/gpio-davinci.h>
 #include <linux/platform_data/mtd-davinci.h>
 #include <linux/platform_data/mtd-davinci-aemif.h>
+#include <linux/platform_data/ti-aemif.h>
 #include <linux/platform_data/spi-davinci.h>
 #include <linux/platform_data/uio_pruss.h>
 #include <linux/regulator/machine.h>
@@ -185,16 +186,6 @@ static struct resource da850_evm_norflash_resource[] = {
 	},
 };
 
-static struct platform_device da850_evm_norflash_device = {
-	.name		= "physmap-flash",
-	.id		= 0,
-	.dev		= {
-		.platform_data  = &da850_evm_norflash_data,
-	},
-	.num_resources	= 1,
-	.resource	= da850_evm_norflash_resource,
-};
-
 /* DA850/OMAP-L138 EVM includes a 512 MByte large-page NAND flash
  * (128K blocks). It may be used instead of the (default) SPI flash
  * to boot, using TI's tools to install the secondary boot loader
@@ -265,37 +256,58 @@ static struct resource da850_evm_nandflash_resource[] = {
 	},
 };
 
-static struct platform_device da850_evm_nandflash_device = {
-	.name		= "davinci-nand",
-	.id		= 1,
-	.dev		= {
-		.platform_data	= &da850_evm_nandflash_data,
-	},
-	.num_resources	= ARRAY_SIZE(da850_evm_nandflash_resource),
-	.resource	= da850_evm_nandflash_resource,
+static struct resource da850_evm_aemif_resource[] = {
+	{
+		.start	= DA8XX_AEMIF_CTL_BASE,
+		.end	= DA8XX_AEMIF_CTL_BASE + SZ_32K,
+		.flags	= IORESOURCE_MEM,
+	}
 };
 
-static struct platform_device *da850_evm_devices[] = {
-	&da850_evm_nandflash_device,
-	&da850_evm_norflash_device,
+static struct aemif_abus_data da850_evm_aemif_abus_data[] = {
+	{
+		.cs	= 3,
+	}
 };
 
-#define DA8XX_AEMIF_CE2CFG_OFFSET	0x10
-#define DA8XX_AEMIF_ASIZE_16BIT		0x1
-
-static void __init da850_evm_init_nor(void)
-{
-	void __iomem *aemif_addr;
-
-	aemif_addr = ioremap(DA8XX_AEMIF_CTL_BASE, SZ_32K);
+static struct platform_device da850_evm_aemif_devices[] = {
+	{
+		.name		= "davinci-nand",
+		.id		= 1,
+		.dev		= {
+			.platform_data	= &da850_evm_nandflash_data,
+		},
+		.num_resources	= ARRAY_SIZE(da850_evm_nandflash_resource),
+		.resource	= da850_evm_nandflash_resource,
+	},
+	{
+		.name		= "physmap-flash",
+		.id		= 0,
+		.dev		= {
+			.platform_data  = &da850_evm_norflash_data,
+		},
+		.num_resources	= 1,
+		.resource	= da850_evm_norflash_resource,
+	}
+};
 
-	/* Configure data bus width of CS2 to 16 bit */
-	writel(readl(aemif_addr + DA8XX_AEMIF_CE2CFG_OFFSET) |
-		DA8XX_AEMIF_ASIZE_16BIT,
-		aemif_addr + DA8XX_AEMIF_CE2CFG_OFFSET);
+static struct aemif_platform_data da850_evm_aemif_pdata = {
+	.cs_offset = 2,
+	.abus_data = da850_evm_aemif_abus_data,
+	.num_abus_data = ARRAY_SIZE(da850_evm_aemif_abus_data),
+	.sub_devices = da850_evm_aemif_devices,
+	.num_sub_devices = ARRAY_SIZE(da850_evm_aemif_devices),
+};
 
-	iounmap(aemif_addr);
-}
+static struct platform_device da850_evm_aemif_device = {
+	.name		= "ti-aemif",
+	.dev = {
+		.platform_data	= &da850_evm_aemif_pdata,
+	},
+	.resource	= da850_evm_aemif_resource,
+	.num_resources	= ARRAY_SIZE(da850_evm_aemif_resource),
+	.id		= -1,
+};
 
 static const short da850_evm_nand_pins[] = {
 	DA850_EMA_D_0, DA850_EMA_D_1, DA850_EMA_D_2, DA850_EMA_D_3,
@@ -338,13 +350,10 @@ static inline void da850_evm_setup_nor_nand(void)
 			pr_warn("%s: NOR mux setup failed: %d\n",
 				__func__, ret);
 
-		da850_evm_init_nor();
-
-		platform_add_devices(da850_evm_devices,
-					ARRAY_SIZE(da850_evm_devices));
-
-		if (davinci_aemif_setup(&da850_evm_nandflash_device))
-			pr_warn("%s: Cannot configure AEMIF.\n", __func__);
+		ret = platform_device_register(&da850_evm_aemif_device);
+		if (ret)
+			pr_warn("%s: registering aemif failed: %d\n",
+				__func__, ret);
 	}
 }
 
-- 
2.16.1
