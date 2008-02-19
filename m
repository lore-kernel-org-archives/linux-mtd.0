Received: from wa-out-1112.google.com ([209.85.146.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JRM7C-0003kA-Dq
	for linux-mtd@lists.infradead.org; Tue, 19 Feb 2008 06:38:07 +0000
Received: by wa-out-1112.google.com with SMTP id v33so3021765wah.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Feb 2008 22:38:05 -0800 (PST)
Message-ID: <f17812d70802182238o9f7d009q8b4049e78e06017e@mail.gmail.com>
Date: Tue, 19 Feb 2008 14:38:05 +0800
From: "eric miao" <eric.y.miao@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] pxa: add PXA3xx NAND support for Zylonite
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

>From 060877de6089c9541b775bd361b4ab78726ea874 Mon Sep 17 00:00:00 2001
From: eric miao <eric.miao@marvell.com>
Date: Tue, 19 Feb 2008 11:16:49 +0800
Subject: [PATCH] pxa: add PXA3xx NAND support for Zylonite

Signed-off-by: eric miao <eric.miao@marvell.com>
Cc: Sergey Podstavin <spodstavin@ru.mvista.com>
---
 arch/arm/mach-pxa/zylonite.c |   52 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
index 7731d50..2a0caa4 100644
--- a/arch/arm/mach-pxa/zylonite.c
+++ b/arch/arm/mach-pxa/zylonite.c
@@ -26,6 +26,7 @@
 #include <asm/arch/pxafb.h>
 #include <asm/arch/zylonite.h>
 #include <asm/arch/mmc.h>
+#include <asm/arch/pxa3xx_nand.h>

 #include "generic.h"

@@ -249,6 +250,56 @@ static void __init zylonite_init_mmc(void)
 static inline void zylonite_init_mmc(void) {}
 #endif

+#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULES)
+static struct mtd_partition zylonite_nand_partitions[] = {
+	[0] = {
+		.name        = "Bootloader",
+		.offset      = 0,
+		.size        = 0x060000,
+		.mask_flags  = MTD_WRITEABLE, /* force read-only */
+	},
+	[1] = {
+		.name        = "Kernel",
+		.offset      = 0x060000,
+		.size        = 0x200000,
+		.mask_flags  = MTD_WRITEABLE, /* force read-only */
+	},
+	[2] = {
+		.name        = "Filesystem",
+		.offset      = 0x0260000,
+		.size        = 0x3000000,     /* 48M - rootfs */
+	},
+	[3] = {
+		.name        = "MassStorage",
+		.offset      = 0x3260000,
+		.size        = 0x3d40000,
+	},
+	[4] = {
+		.name        = "BBT",
+		.offset      = 0x6FA0000,
+		.size        = 0x80000,
+		.mask_flags  = MTD_WRITEABLE,  /* force read-only */
+	},
+	/* NOTES: We reserve some blocks for PXA3xx BBM at the end of NAND.
+	 * And the max relocation blocks is not same on different platform.
+	 * Please take care it when define the partition table.
+	 */
+};
+
+static struct pxa3xx_nand_platform_data zylonite_nand_info = {
+	.enable_arbiter	= 1,
+	.parts		= zylonite_nand_partitions,
+	.nr_parts	= ARRAY_SIZE(zylonite_nand_partitions),
+};
+
+static void __init zylonite_init_nand(void)
+{
+	pxa3xx_set_nand_info(&zylonite_nand_info);
+}
+#else
+static inline void zylonite_init_nand(void) {}
+#endif
+
 static void __init zylonite_init(void)
 {
 	/* board-processor specific initialization */
@@ -265,6 +316,7 @@ static void __init zylonite_init(void)

 	zylonite_init_lcd();
 	zylonite_init_mmc();
+	zylonite_init_nand();
 }

 MACHINE_START(ZYLONITE, "PXA3xx Platform Development Kit (aka Zylonite)")
-- 
1.5.3.8



-- 
Cheers
- eric
