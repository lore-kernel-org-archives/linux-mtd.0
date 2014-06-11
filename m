From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>
Subject: [PATCH 03/36] ARM: OMAP2+: gpmc: Add platform data
Date: Wed, 11 Jun 2014 11:56:08 +0300
Message-ID: <1402477001-31132-4-git-send-email-rogerq@ti.com>
In-Reply-To: <1402477001-31132-1-git-send-email-rogerq@ti.com>
References: <1402477001-31132-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com, linux-mtd@lists.infradead.org, pekon@ti.com,
 ezequiel.garcia@free-electrons.com, javier@dowhile0.org,
 linux-omap@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a platform data structure for GPMC. It contains all the necessary
platform information that needs to be passed from platform init code
to GPMC driver.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 arch/arm/mach-omap2/gpmc.h              |  4 +---
 include/linux/platform_data/gpmc-omap.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/platform_data/gpmc-omap.h

diff --git a/arch/arm/mach-omap2/gpmc.h b/arch/arm/mach-omap2/gpmc.h
index 707f6d5..c476712 100644
--- a/arch/arm/mach-omap2/gpmc.h
+++ b/arch/arm/mach-omap2/gpmc.h
@@ -12,9 +12,7 @@
 #define __OMAP2_GPMC_H
 
 #include <linux/platform_data/mtd-nand-omap2.h>
-
-/* Maximum Number of Chip Selects */
-#define GPMC_CS_NUM		8
+#include <linux/platform_data/gpmc-omap.h>
 
 #define GPMC_CS_CONFIG1		0x00
 #define GPMC_CS_CONFIG2		0x04
diff --git a/include/linux/platform_data/gpmc-omap.h b/include/linux/platform_data/gpmc-omap.h
new file mode 100644
index 0000000..d32d9de
--- /dev/null
+++ b/include/linux/platform_data/gpmc-omap.h
@@ -0,0 +1,30 @@
+/*
+ * OMAP GPMC Platform data
+ *
+ * Copyright (C) 2014 Texas Instruments, Inc. - http://www.ti.com
+ *	Roger Quadros <rogerq@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ */
+
+#ifndef _GPMC_OMAP_H_
+#define _GPMC_OMAP_H_
+
+/* Maximum Number of Chip Selects */
+#define GPMC_CS_NUM		8
+
+/* Data for each chip select */
+struct gpmc_omap_cs_data {
+	bool valid;			/* data is valid */
+	bool is_nand;			/* device within this CS is NAND */
+	struct platform_device *pdev;	/* device within this CS region */
+	unsigned pdata_size;
+};
+
+struct gpmc_omap_platform_data {
+	struct gpmc_omap_cs_data cs[GPMC_CS_NUM];
+};
+
+#endif /* _GPMC_OMAP_H */
-- 
1.8.3.2
