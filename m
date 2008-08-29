Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KZ1hw-0004St-FR
	for linux-mtd@lists.infradead.org; Fri, 29 Aug 2008 11:00:00 +0000
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] pxa3xx_nand: allow to disable builtin flash-type table
Date: Fri, 29 Aug 2008 12:59:49 +0200
Message-Id: <1220007592-26894-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1220007448-26801-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1220007448-26801-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a MTD_NAND_PXA3xx_BUILTIN configuration variables which
allows to disable usage of builtin flash-type table.  Not enabling this
option saves some space in the generated driver.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 drivers/mtd/nand/Kconfig       |    7 +++++++
 drivers/mtd/nand/pxa3xx_nand.c |    4 ++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 41f361c..1f4edfe 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -340,6 +340,13 @@ config MTD_NAND_PXA3xx
 	  This enables the driver for the NAND flash device found on
 	  PXA3xx processors
 
+config MTD_NAND_PXA3xx_BUILTIN
+	bool "Use builtin definitions for some NAND chips (deprecated)"
+	depends on MTD_NAND_PXA3xx
+	help
+	  This enables builtin definitions for some NAND chips. This
+	  is deprecated in favor of platform specific data.
+
 config MTD_NAND_CM_X270
 	tristate "Support for NAND Flash on CM-X270 modules"
 	depends on MTD_NAND && MACH_ARMCORE
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 17915d7..bff2ac3 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -164,6 +164,7 @@ static int use_dma = 1;
 module_param(use_dma, bool, 0444);
 MODULE_PARM_DESC(use_dma, "enable DMA for data transfering to/from NAND HW");
 
+#ifdef CONFIG_MTD_NAND_PXA3xx_BUILTIN
 static struct pxa3xx_nand_cmdset smallpage_cmdset = {
 	.read1		= 0x0000,
 	.read2		= 0x0050,
@@ -252,6 +253,7 @@ static struct pxa3xx_nand_flash *builtin_flash_types[] = {
 	&micron1GbX8,
 	&micron1GbX16,
 };
+#endif
 
 #define NDTR0_tCH(c)	(min((c), 7) << 19)
 #define NDTR0_tCS(c)	(min((c), 7) << 16)
@@ -908,6 +910,7 @@ static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
 			return 0;
 	}
 
+#ifdef CONFIG_MTD_NAND_PXA3xx_BUILTIN
 	for (i = 0; i < ARRAY_SIZE(builtin_flash_types); i++) {
 
 		f = builtin_flash_types[i];
@@ -921,6 +924,7 @@ static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
 		if (id == f->chip_id)
 			return 0;
 	}
+#endif
 
 	return -ENODEV;
 }
-- 
1.5.5.1
