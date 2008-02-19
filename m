Received: from wa-out-1112.google.com ([209.85.146.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JRM6a-0003gr-Qg
	for linux-mtd@lists.infradead.org; Tue, 19 Feb 2008 06:37:29 +0000
Received: by wa-out-1112.google.com with SMTP id v33so3021417wah.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Feb 2008 22:37:28 -0800 (PST)
Message-ID: <f17812d70802182237n581c9698vbeea87d506eaf114@mail.gmail.com>
Date: Tue, 19 Feb 2008 14:37:28 +0800
From: "eric miao" <eric.y.miao@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] pxa: add pxa3xx NAND device and clock sources
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>, spodstavin@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From de5ebfd2cef21a6342a540583df87b6c8a591dcc Mon Sep 17 00:00:00 2001
From: eric miao <eric.miao@marvell.com>
Date: Tue, 19 Feb 2008 11:16:12 +0800
Subject: [PATCH] pxa: add pxa3xx NAND device and clock sources

A pxa3xx_set_nand_info() is also introduced to set the PXA3xx NAND driver
specific platform_data structure pointer.

Signed-off-by: eric miao <eric.miao@marvell.com>
Cc: Sergey Podstavin <spodstavin@ru.mvista.com>
---
 arch/arm/mach-pxa/devices.c            |   43 ++++++++++++++++++++++++++++++++
 arch/arm/mach-pxa/devices.h            |    2 +
 arch/arm/mach-pxa/pxa300.c             |   11 ++++++++
 arch/arm/mach-pxa/pxa320.c             |   11 ++++++++
 include/asm-arm/arch-pxa/pxa3xx_nand.h |    2 +
 5 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index bfccb80..af5dd95 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -11,6 +11,7 @@
 #include <asm/arch/irda.h>
 #include <asm/arch/i2c.h>
 #include <asm/arch/ohci.h>
+#include <asm/arch/pxa3xx_nand.h>

 #include "devices.h"

@@ -660,4 +661,46 @@ void __init pxa3xx_set_mci3_info(struct
pxamci_platform_data *info)
 	pxa_register_device(&pxa3xx_device_mci3, info);
 }

+static struct resource pxa3xx_resources_nand[] = {
+	[0] = {
+		.start	= 0x43100000,
+		.end	= 0x43100054,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= IRQ_NAND,
+		.end	= IRQ_NAND,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[2] = {
+		/* DRCMR register index for data transfer */
+		.start	= 97,
+		.end	= 97,
+		.flags	= IORESOURCE_DMA,
+	},
+	[3] = {
+		/* DRCMR register index for command transfer */
+		.start	= 98,
+		.end	= 98,
+		.flags	= IORESOURCE_DMA,
+	},
+};
+
+static u64 pxa3xx_nand_dma_mask = DMA_BIT_MASK(32);
+
+struct platform_device pxa3xx_device_nand = {
+	.name		= "pxa3xx-nand",
+	.id		= -1,
+	.dev		= {
+		.dma_mask = &pxa3xx_nand_dma_mask,
+		.coherent_dma_mask = DMA_BIT_MASK(32),
+	},
+	.resource	= pxa3xx_resources_nand,
+	.num_resources	= ARRAY_SIZE(pxa3xx_resources_nand),
+};
+
+void __init pxa3xx_set_nand_info(struct pxa3xx_nand_platform_data *info)
+{
+	pxa_register_device(&pxa3xx_device_nand, info);
+}
 #endif /* CONFIG_PXA3xx */
diff --git a/arch/arm/mach-pxa/devices.h b/arch/arm/mach-pxa/devices.h
index 96c7c89..95fbd01 100644
--- a/arch/arm/mach-pxa/devices.h
+++ b/arch/arm/mach-pxa/devices.h
@@ -23,4 +23,6 @@ extern struct platform_device pxa27x_device_ssp2;
 extern struct platform_device pxa27x_device_ssp3;
 extern struct platform_device pxa3xx_device_ssp4;

+extern struct platform_device pxa3xx_device_nand;
+
 void __init pxa_register_device(struct platform_device *dev, void *data);
diff --git a/arch/arm/mach-pxa/pxa300.c b/arch/arm/mach-pxa/pxa300.c
index 5477e0a..8afdd6b 100644
--- a/arch/arm/mach-pxa/pxa300.c
+++ b/arch/arm/mach-pxa/pxa300.c
@@ -15,9 +15,14 @@

 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/platform_device.h>

 #include <asm/hardware.h>
 #include <asm/arch/mfp-pxa300.h>
+#include <asm/arch/pxa3xx-regs.h>
+
+#include "devices.h"
+#include "clock.h"

 static struct pxa3xx_mfp_addr_map pxa300_mfp_addr_map[] __initdata = {

@@ -79,11 +84,17 @@ static struct pxa3xx_mfp_addr_map
pxa310_mfp_addr_map[] __initdata = {
 	MFP_ADDR_END,
 };

+static struct clk common_clks[] = {
+	PXA3xx_CKEN("NANDCLK", NAND, 156000000, 0, &pxa3xx_device_nand.dev),
+};
+
 static int __init pxa300_init(void)
 {
 	if (cpu_is_pxa300() || cpu_is_pxa310()) {
 		pxa3xx_init_mfp();
 		pxa3xx_mfp_init_addr(pxa300_mfp_addr_map);
+
+		clks_register(common_clks, ARRAY_SIZE(common_clks));
 	}

 	if (cpu_is_pxa310())
diff --git a/arch/arm/mach-pxa/pxa320.c b/arch/arm/mach-pxa/pxa320.c
index 9edaafd..5a568b4 100644
--- a/arch/arm/mach-pxa/pxa320.c
+++ b/arch/arm/mach-pxa/pxa320.c
@@ -15,10 +15,15 @@

 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/platform_device.h>

 #include <asm/hardware.h>
 #include <asm/arch/mfp.h>
 #include <asm/arch/mfp-pxa320.h>
+#include <asm/arch/pxa3xx-regs.h>
+
+#include "devices.h"
+#include "clock.h"

 static struct pxa3xx_mfp_addr_map pxa320_mfp_addr_map[] __initdata = {

@@ -74,11 +79,17 @@ static struct pxa3xx_mfp_addr_map
pxa320_mfp_addr_map[] __initdata = {
 	MFP_ADDR_END,
 };

+static struct clk pxa320_clks[] = {
+	PXA3xx_CKEN("NANDCLK", NAND, 108000000, 0, &pxa3xx_device_nand.dev),
+};
+
 static int __init pxa320_init(void)
 {
 	if (cpu_is_pxa320()) {
 		pxa3xx_init_mfp();
 		pxa3xx_mfp_init_addr(pxa320_mfp_addr_map);
+
+		clks_register(pxa320_clks, ARRAY_SIZE(pxa320_clks));
 	}

 	return 0;
diff --git a/include/asm-arm/arch-pxa/pxa3xx_nand.h
b/include/asm-arm/arch-pxa/pxa3xx_nand.h
index 81a8937..427fa8a 100644
--- a/include/asm-arm/arch-pxa/pxa3xx_nand.h
+++ b/include/asm-arm/arch-pxa/pxa3xx_nand.h
@@ -15,4 +15,6 @@ struct pxa3xx_nand_platform_data {
 	struct mtd_partition *parts;
 	unsigned int	nr_parts;
 };
+
+void pxa3xx_set_nand_info(struct pxa3xx_nand_platform_data *info);
 #endif /* __ASM_ARCH_PXA3XX_NAND_H */
-- 
1.5.3.8


-- 
Cheers
- eric
