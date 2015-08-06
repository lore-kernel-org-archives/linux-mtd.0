Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNKrG-0005SD-4a
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 13:05:18 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 1/4] mtd: denali: hide core part from user in Kconfig
Date: Thu,  6 Aug 2015 16:04:21 +0300
Message-Id: <1438866264-11091-1-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no need to user to see the core part of the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/nand/Kconfig | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5b2806a..3324281 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -42,23 +42,20 @@ config MTD_SM_COMMON
 	default n
 
 config MTD_NAND_DENALI
-        tristate "Support Denali NAND controller"
-        depends on HAS_DMA
-        help
-	  Enable support for the Denali NAND controller.  This should be
-	  combined with either the PCI or platform drivers to provide device
-	  registration.
+	tristate
 
 config MTD_NAND_DENALI_PCI
         tristate "Support Denali NAND controller on Intel Moorestown"
-	depends on PCI && MTD_NAND_DENALI
+	select MTD_NAND_DENALI
+	depends on HAS_DMA && PCI
         help
           Enable the driver for NAND flash on Intel Moorestown, using the
           Denali NAND controller core.
 
 config MTD_NAND_DENALI_DT
 	tristate "Support Denali NAND controller as a DT device"
-	depends on HAVE_CLK && MTD_NAND_DENALI
+	select MTD_NAND_DENALI
+	depends on HAS_DMA && HAVE_CLK
 	help
 	  Enable the driver for NAND flash on platforms using a Denali NAND
 	  controller as a DT device.
-- 
2.4.6
