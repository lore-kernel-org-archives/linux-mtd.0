Received: from mail-pd0-f173.google.com ([209.85.192.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vxrfv-0004XB-OR
 for linux-mtd@lists.infradead.org; Tue, 31 Dec 2013 05:15:32 +0000
Received: by mail-pd0-f173.google.com with SMTP id p10so11974916pdj.18
 for <linux-mtd@lists.infradead.org>; Mon, 30 Dec 2013 21:15:09 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd
Date: Tue, 31 Dec 2013 10:41:30 +0530
Message-Id: <1388466690-16435-1-git-send-email-sachin.kamat@linaro.org>
Cc: computersforpeace@gmail.com, kgene.kim@samsung.com,
 linux-samsung-soc@vger.kernel.org, patches@linaro.org, sachin.kamat@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

plat/regs-nand.h is used only by s3c2410 nand driver.
Move this file to the drivers folder to remove platform
dependency.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/s3c2410.c                         |    2 +-
 .../plat/regs-nand.h => drivers/mtd/nand/s3c2410.h |   11 ++++-------
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename arch/arm/plat-samsung/include/plat/regs-nand.h => drivers/mtd/nand/s3c2410.h (96%)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index d65cbe903d40..83fb4feb7556 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -46,8 +46,8 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
-#include <plat/regs-nand.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
+#include "s3c2410.h"
 
 /* new oob placement block for use with hardware ecc generation
  */
diff --git a/arch/arm/plat-samsung/include/plat/regs-nand.h b/drivers/mtd/nand/s3c2410.h
similarity index 96%
rename from arch/arm/plat-samsung/include/plat/regs-nand.h
rename to drivers/mtd/nand/s3c2410.h
index 238efea7b9e4..f3b82d7053a0 100644
--- a/arch/arm/plat-samsung/include/plat/regs-nand.h
+++ b/drivers/mtd/nand/s3c2410.h
@@ -1,5 +1,4 @@
-/* arch/arm/mach-s3c2410/include/mach/regs-nand.h
- *
+/*
  * Copyright (c) 2004-2005 Simtec Electronics <linux@simtec.co.uk>
  *	http://www.simtec.co.uk/products/SWLINUX/
  *
@@ -10,8 +9,8 @@
  * S3C2410 NAND register definitions
 */
 
-#ifndef __ASM_ARM_REGS_NAND
-#define __ASM_ARM_REGS_NAND
+#ifndef __S3C2410_NAND_H
+#define __S3C2410_NAND_H
 
 
 #define S3C2410_NFREG(x) (x)
@@ -117,7 +116,5 @@
 #define S3C2412_NFECCERR_MULTIBIT	(2)
 #define S3C2412_NFECCERR_ECCAREA	(3)
 
-
-
-#endif /* __ASM_ARM_REGS_NAND */
+#endif /* __S3C2410_NAND_H */
 
-- 
1.7.9.5
