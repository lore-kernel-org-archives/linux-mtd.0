Received: from mail-by2on0114.outbound.protection.outlook.com
 ([207.46.100.114] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a99b2-0004Hz-VZ
 for linux-mtd@lists.infradead.org; Wed, 16 Dec 2015 10:46:13 +0000
From: Raghav Dogra <raghav@freescale.com>
To: <linux-mtd@lists.infradead.org>
CC: <prabhakar@freescale.com>, <scottwood@freescale.com>, Raghav Dogra
 <raghav@freescale.com>
Subject: [PATCH 2/3] driver/memory: Update dependency of IFC for Layerscape
Date: Wed, 16 Dec 2015 16:11:50 +0530
Message-ID: <1450262510-5176-1-git-send-email-raghav@freescale.com>
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

IFC NAND is not working on ARM layescape platform due to 
undefined macro FSL_SOC.
This patch fixes the dependency to enable NAND.

Signed-off-by: Raghav Dogra <raghav@freescale.com>
---
 drivers/memory/Kconfig   | 2 +-
 drivers/memory/fsl_ifc.c | 4 +++-
 drivers/mtd/nand/Kconfig | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index c6a644b..1146c1f 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -97,7 +97,7 @@ config FSL_CORENET_CF
 
 config FSL_IFC
 	bool
-	depends on FSL_SOC
+	depends on FSL_SOC || ARCH_LAYERSCAPE
 
 config JZ4780_NEMC
 	bool "Ingenic JZ4780 SoC NEMC driver"
diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index 8436c59..903c0a5 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -30,7 +30,9 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/fsl_ifc.h>
-#include <asm/prom.h>
+#include <linux/irqdomain.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 struct fsl_ifc_ctrl *fsl_ifc_ctrl_dev;
 EXPORT_SYMBOL(fsl_ifc_ctrl_dev);
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 3324281..934a8a2 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -436,7 +436,7 @@ config MTD_NAND_FSL_ELBC
 
 config MTD_NAND_FSL_IFC
 	tristate "NAND support for Freescale IFC controller"
-	depends on MTD_NAND && FSL_SOC
+	depends on MTD_NAND && (FSL_SOC || ARCH_LAYERSCAPE)
 	select FSL_IFC
 	select MEMORY
 	help
-- 
1.9.1
