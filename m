Received: from mail-by2nam01on0050.outbound.protection.outlook.com
 ([104.47.34.50] helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIudg-0003XZ-75
 for linux-mtd@lists.infradead.org; Fri, 01 Jul 2016 09:21:32 +0000
From: Raghav Dogra <raghav.dogra@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>,
 <leoyang.li@nxp.com>, <oss@buserror.net>, <prabhakar.kushwaha@nxp.com>,
 Raghav Dogra <raghav.dogra@nxp.com>
Subject: [PATCH][v2] driver/memory: Update dependency of IFC for Layerscape
Date: Fri, 1 Jul 2016 21:32:30 +0530
Message-ID: <1467388950-4895-1-git-send-email-raghav.dogra@nxp.com>
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

This patch enables IFC NAND support on ARM layerscape platform.
It fixes the dependency to enable NAND. The include files are being modified
to ensure complilation for both PowerPC and ARM architectures.

Signed-off-by: Raghav Dogra <raghav.dogra@nxp.com>
---
Applicable to git://git.infradead.org/l2-mtd.git

Changes for v2: updated commit description

 drivers/memory/Kconfig   | 2 +-
 drivers/memory/fsl_ifc.c | 4 +++-
 drivers/mtd/nand/Kconfig | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 81ddb17..5645705 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -104,7 +104,7 @@ config FSL_CORENET_CF
 
 config FSL_IFC
 	bool
-	depends on FSL_SOC
+	depends on FSL_SOC || ARCH_LAYERSCAPE
 
 config JZ4780_NEMC
 	bool "Ingenic JZ4780 SoC NEMC driver"
diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index 904b4af..1b182b1 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -31,7 +31,9 @@
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
index f05e0e9..eace3ef 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -438,7 +438,7 @@ config MTD_NAND_FSL_ELBC
 
 config MTD_NAND_FSL_IFC
 	tristate "NAND support for Freescale IFC controller"
-	depends on MTD_NAND && FSL_SOC
+	depends on MTD_NAND && (FSL_SOC || ARCH_LAYERSCAPE)
 	select FSL_IFC
 	select MEMORY
 	help
-- 
1.9.1
