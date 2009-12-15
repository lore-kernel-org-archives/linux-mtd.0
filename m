From: vimalsingh@ti.com (Vimal Singh)
Date: Tue, 15 Dec 2009 21:10:54 +0530
Subject: [PATCH] OMAP: NAND: Adding config option to enable/disable HW ECC mode
Message-ID: <mailman.94.1260892023.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This patch adds config option to select/deselect HW ECC feature
on OMAP NAND driver. This is a feature provided by OMAP GPMC for
NAND devices.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/Kconfig |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 34598e9..6c4b27c 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -97,6 +97,16 @@ config MTD_NAND_OMAP_PREFETCH_DMA
 	 or in DMA interrupt mode.
 	 Say y for DMA mode or MPU mode will be used

+config MTD_NAND_OMAP_HWECC
+	bool "The Hardware ECC support"
+	depends on MTD_NAND && MTD_NAND_OMAP2
+	default n
+	help
+	 The ECC compuatation for the data to be written/read can be either by
+	 software or omap has Hw ecc engine which calculates it.
+	 MTD_NAND_OMAP_HWECC = y which enables the hw ecc
+	 MTD_NAND_OMAP_HWECC = n enables software ecc
+
 config MTD_NAND_TS7250
 	tristate "NAND Flash device on TS-7250 board"
 	depends on MACH_TS72XX
-- 
1.5.5
