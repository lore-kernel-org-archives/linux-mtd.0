From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <bcousson@baylibre.com>
CC: <ezequiel@vanguardiasur.com.ar>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 01/12] ARM: OMAP2+: gpmc: Add platform data
Date: Fri, 10 Jul 2015 15:23:28 +0300
Message-ID: <1436531019-18088-2-git-send-email-rogerq@ti.com>
In-Reply-To: <1436531019-18088-1-git-send-email-rogerq@ti.com>
References: <1436531019-18088-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
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
 include/linux/omap-gpmc.h               |  3 +--
 include/linux/platform_data/gpmc-omap.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/platform_data/gpmc-omap.h

diff --git a/include/linux/omap-gpmc.h b/include/linux/omap-gpmc.h
index 7dee0014..5c79190 100644
--- a/include/linux/omap-gpmc.h
+++ b/include/linux/omap-gpmc.h
@@ -7,8 +7,7 @@
  *  option) any later version.
  */
 
-/* Maximum Number of Chip Selects */
-#define GPMC_CS_NUM		8
+#include <linux/platform_data/gpmc-omap.h>
 
 #define GPMC_CONFIG_WP		0x00000005
 
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
2.1.4
