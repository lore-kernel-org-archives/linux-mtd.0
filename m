Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJK7H-000295-BA
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 04:29:54 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KLQ0049Y74QDD@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 13:29:14 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KLQ00IRU74QNW@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 13:29:14 +0900 (KST)
Date: Wed, 24 Jun 2009 13:17:42 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH] Samsung SOC OneNAND controller support
To: linux-arm-kernel@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org
Message-id: <20090624041742.GA24852@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: ben-linux@fluff.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

S3C64XX/S5PC100 has own OneNAND controller.
Register OneNAND device to platform

Note: S3C64XX has 2 OneNAND controller but S5PC100 has only 1.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index 10d4128..31d3cc2 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -11,6 +11,7 @@ config CPU_S5PC100
 	bool
 	select CPU_S5PC100_INIT
 	select CPU_S5PC100_CLOCK
+	select S3C_DEV_ONENAND
 	help
 	  Enable S5PC100 CPU support
 
diff --git a/arch/arm/plat-s3c/Kconfig b/arch/arm/plat-s3c/Kconfig
index 935c755..4c5491e 100644
--- a/arch/arm/plat-s3c/Kconfig
+++ b/arch/arm/plat-s3c/Kconfig
@@ -178,6 +178,11 @@ config S3C_DEV_HSMMC1
 	help
 	  Compile in platform device definitions for HSMMC channel 1
 
+config S3C_DEV_ONENAND
+	bool
+	help
+	  Compile in platform device definitions for OneNAND
+
 config S3C_DEV_I2C1
 	bool
 	help
diff --git a/arch/arm/plat-s3c/Makefile b/arch/arm/plat-s3c/Makefile
index 6106514..0d2f3e2 100644
--- a/arch/arm/plat-s3c/Makefile
+++ b/arch/arm/plat-s3c/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_S3C2410_PM_CHECK)	+= pm-check.o
 
 obj-$(CONFIG_S3C_DEV_HSMMC)	+= dev-hsmmc.o
 obj-$(CONFIG_S3C_DEV_HSMMC1)	+= dev-hsmmc1.o
+obj-$(CONFIG_S3C_DEV_ONENAND)	+= dev-onenand.o
 obj-y				+= dev-i2c0.o
 obj-$(CONFIG_S3C_DEV_I2C1)	+= dev-i2c1.o
 obj-$(CONFIG_S3C_DEV_FB)	+= dev-fb.o
diff --git a/arch/arm/plat-s3c/dev-onenand.c b/arch/arm/plat-s3c/dev-onenand.c
new file mode 100644
index 0000000..2976662
--- /dev/null
+++ b/arch/arm/plat-s3c/dev-onenand.c
@@ -0,0 +1,81 @@
+/*
+ * linux/arch/arm/plat-s3c/dev-onenand.c
+ *
+ *  Copyright (c) 2008-2009 Samsung Electronics
+ *  Kyungmin Park <kyungmin.park@samsung.com>
+ *
+ * S3C64XX/S5PC100 series device definition for OneNAND devices
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+
+#include <asm/mach/flash.h>
+#include <plat/irqs.h>
+#include <plat/regs-onenand.h>
+
+static struct flash_platform_data samsung_onenand_data = { };
+
+static struct resource samsung_onenand_resources[] = {
+	[0] = {
+		.start	= SAMSUNG_ONENAND_BASE,
+		.end	= SAMSUNG_ONENAND_BASE + 0x400 - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= IRQ_ONENAND,
+		.end	= IRQ_ONENAND,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device samsung_device_onenand = {
+	.name		= "samsung-onenand",
+	.id		= 0,
+	.dev		= {
+		.platform_data	= &samsung_onenand_data,
+	},
+	.num_resources	= ARRAY_SIZE(samsung_onenand_resources),
+	.resource	= samsung_onenand_resources,
+};
+
+void samsung_onenand_set_platdata(struct flash_platform_data *pdata)
+{
+	memcpy(&samsung_onenand_data, pdata, sizeof(*pdata));
+}
+
+#ifdef CONFIG_ARCH_S3C64XX
+static struct flash_platform_data s3c_onenand1_data = { };
+
+static struct resource s3c64xx_onenand1_resources[] = {
+        [0] = {
+                .start  = S3C64XX_ONENAND1_BASE,
+                .end    = S3C64XX_ONENAND1_BASE + 0x400 - 1,
+                .flags  = IORESOURCE_MEM,
+        },
+        [1] = {
+                .start = IRQ_ONENAND1,
+                .end   = IRQ_ONENAND1,
+                .flags = IORESOURCE_IRQ,
+        },
+};
+
+struct platform_device s3c_device_onenand1 = {
+        .name           = "s3c64xx-onenand",
+        .id             = 1,
+        .dev            = {
+                .platform_data = &s3c_onenand1_data,
+        },
+        .num_resources  = ARRAY_SIZE(s3c64xx_onenand1_resources),
+        .resource       = s3c64xx_onenand1_resources,
+};
+
+void s3c_onenand1_set_platdata(struct flash_platform_data *pdata)
+{
+        memcpy(&s3c_onenand1_data, pdata, sizeof(*pdata));
+}
+#endif
diff --git a/arch/arm/plat-s3c/include/plat/devs.h b/arch/arm/plat-s3c/include/plat/devs.h
index a0b6768..7bd2eae 100644
--- a/arch/arm/plat-s3c/include/plat/devs.h
+++ b/arch/arm/plat-s3c/include/plat/devs.h
@@ -43,6 +43,7 @@ extern struct platform_device s3c_device_spi0;
 extern struct platform_device s3c_device_spi1;
 
 extern struct platform_device s3c_device_nand;
+extern struct platform_device samsung_device_onenand;
 
 extern struct platform_device s3c_device_usbgadget;
 extern struct platform_device s3c_device_usb_hsotg;
diff --git a/arch/arm/plat-s3c64xx/include/plat/irqs.h b/arch/arm/plat-s3c64xx/include/plat/irqs.h
index 743a700..926ed6d 100644
--- a/arch/arm/plat-s3c64xx/include/plat/irqs.h
+++ b/arch/arm/plat-s3c64xx/include/plat/irqs.h
@@ -148,6 +148,7 @@
 /* compatibility for device defines */
 
 #define IRQ_IIC1		IRQ_S3C6410_IIC1
+#define IRQ_ONENAND		IRQ_ONENAND0
 
 /* Since the IRQ_EINT(x) are a linear mapping on current s3c64xx series
  * we just defined them as an IRQ_EINT(x) macro from S3C_IRQ_EINT_BASE
diff --git a/arch/arm/plat-s3c/include/plat/regs-onenand.h b/arch/arm/plat-s3c/include/plat/regs-onenand.h
new file mode 100644
index 0000000..2ddc3fa
--- /dev/null
+++ b/arch/arm/plat-s3c/include/plat/regs-onenand.h
@@ -0,0 +1,74 @@
+/*
+ * linux/arch/arm/plat-s3c/include/plat/regs-onenand.h
+ *
+ *  Copyright (C) 2008-2009 Samsung Electronics
+ *  Kyungmin Park <kyungmin.park@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __SAMSUNG_ONENAND_H__
+#define __SAMSUNG_ONENAND_H__
+
+#include <mach/hardware.h>
+
+/*
+ * OneNAND Controller
+ */
+#define S3C64XX_ONENAND0_BASE	0x70100000
+#define S3C64XX_ONENAND1_BASE	0x70200000
+#define S5PC100_ONENAND_BASE	0xE7100000
+
+#ifdef CONFIG_ARCH_S3C64XX
+#define SAMSUNG_ONENAND_BASE	S3C64XX_ONENAND0_BASE
+#endif
+#ifdef CONFIG_ARCH_S5PC1XX
+#define SAMSUNG_ONENAND_BASE	S5PC100_ONENAND_BASE
+#endif
+
+#define MEM_CFG_OFFSET		0x0000
+#define BURST_LEN_OFFSET	0x0010
+#define MEM_RESET_OFFSET	0x0020
+#define INT_ERR_STAT_OFFSET	0x0030
+#define INT_ERR_MASK_OFFSET	0x0040
+#define INT_ERR_ACK_OFFSET	0x0050
+#define ECC_ERR_STAT_OFFSET	0x0060
+#define MANUFACT_ID_OFFSET	0x0070
+#define DEVICE_ID_OFFSET	0x0080
+#define DATA_BUF_SIZE_OFFSET	0x0090
+#define BOOT_BUF_SIZE_OFFSET	0x00A0
+#define BUF_AMOUNT_OFFSET	0x00B0
+#define TECH_OFFSET		0x00C0
+#define FBA_WIDTH_OFFSET	0x00D0
+#define FPA_WIDTH_OFFSET	0x00E0
+#define FSA_WIDTH_OFFSET	0x00F0
+#define TRANS_SPARE_OFFSET	0x0140
+#define DBS_DFS_WIDTH_OFFSET	0x0160
+#define INT_PIN_ENABLE_OFFSET	0x01A0
+#define ACC_CLOCK_OFFSET	0x01C0
+#define FLASH_VER_ID_OFFSET	0x01F0
+#define FLASH_AUX_CNTRL_OFFSET	0x0300		/* s3c64xx only */
+
+#define ONENAND_MEM_RESET_HOT	0x3
+#define ONENAND_MEM_RESET_COLD	0x2
+#define ONENAND_MEM_RESET_WARM	0x1
+
+#define CACHE_OP_ERR		(1 << 13)
+#define RST_CMP			(1 << 12)
+#define RDY_ACT			(1 << 11)
+#define INT_ACT			(1 << 10)
+#define UNSUP_CMD		(1 << 9)
+#define LOCKED_BLK		(1 << 8)
+#define BLK_RW_CMP		(1 << 7)
+#define ERS_CMP			(1 << 6)
+#define PGM_CMP			(1 << 5)
+#define LOAD_CMP		(1 << 4)
+#define ERS_FAIL		(1 << 3)
+#define PGM_FAIL		(1 << 2)
+#define INT_TO			(1 << 1)
+#define LD_FAIL_ECC_ERR		(1 << 0)
+
+#define TSRF			(1 << 0)
+
+#endif
