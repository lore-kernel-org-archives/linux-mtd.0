Received: from devils.ext.ti.com ([198.47.26.153])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zcx54-00036x-S3
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 14:56:07 +0000
From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <fcooper@ti.com>, <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v3 18/27] mtd: nand: omap2: Implement NAND ready using gpiolib
Date: Fri, 18 Sep 2015 17:53:40 +0300
Message-ID: <1442588029-13769-19-git-send-email-rogerq@ti.com>
In-Reply-To: <1442588029-13769-1-git-send-email-rogerq@ti.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
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

The GPMC WAIT pin status are now available over gpiolib.
Update the omap_dev_ready() function to use gpio instead of
directly accessing GPMC register space.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/mtd/nand/omap2.c                     | 29 +++++++++++++++++-----------
 include/linux/platform_data/mtd-nand-omap2.h |  2 +-
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 228f498..d0f2620 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -12,6 +12,7 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
@@ -184,6 +185,8 @@ struct omap_nand_info {
 	/* fields specific for BCHx_HW ECC scheme */
 	struct device			*elm_dev;
 	struct device_node		*of_node;
+	/* NAND ready gpio */
+	struct gpio_desc		*ready_gpiod;
 };
 
 /**
@@ -1047,22 +1050,17 @@ static int omap_wait(struct mtd_info *mtd, struct nand_chip *chip)
 }
 
 /**
- * omap_dev_ready - calls the platform specific dev_ready function
+ * omap_dev_ready - checks the NAND Ready GPIO line
  * @mtd: MTD device structure
+ *
+ * Returns true if ready and false if busy.
  */
 static int omap_dev_ready(struct mtd_info *mtd)
 {
-	unsigned int val = 0;
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 							mtd);
 
-	val = readl(info->reg.gpmc_status);
-
-	if ((val & 0x100) == 0x100) {
-		return 1;
-	} else {
-		return 0;
-	}
+	return gpiod_get_value(info->ready_gpiod);
 }
 
 /**
@@ -1782,7 +1780,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 		info->reg = pdata->reg;
 		info->of_node = pdata->of_node;
 		info->ecc_opt = pdata->ecc_opt;
-		info->dev_ready	= pdata->dev_ready;
+		if (pdata->dev_ready)
+			dev_info(&pdev->dev, "pdata->dev_ready is deprecated\n");
+
 		info->xfer_type = pdata->xfer_type;
 		info->devsize = pdata->devsize;
 		info->elm_of_node = pdata->elm_of_node;
@@ -1815,6 +1815,13 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_chip->IO_ADDR_W = nand_chip->IO_ADDR_R;
 	nand_chip->cmd_ctrl  = omap_hwcontrol;
 
+	info->ready_gpiod = devm_gpiod_get_optional(&pdev->dev, "ready",
+						    GPIOD_IN);
+	if (IS_ERR(info->ready_gpiod)) {
+		dev_err(dev, "failed to get ready gpio\n");
+		return PTR_ERR(info->ready_gpiod);
+	}
+
 	/*
 	 * If RDY/BSY line is connected to OMAP then use the omap ready
 	 * function and the generic nand_wait function which reads the status
@@ -1822,7 +1829,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	 * chip delay which is slightly more than tR (AC Timing) of the NAND
 	 * device and read status register until you get a failure or success
 	 */
-	if (info->dev_ready) {
+	if (info->ready_gpiod) {
 		nand_chip->dev_ready = omap_dev_ready;
 		nand_chip->chip_delay = 0;
 	} else {
diff --git a/include/linux/platform_data/mtd-nand-omap2.h b/include/linux/platform_data/mtd-nand-omap2.h
index ff27e5a..19e509d 100644
--- a/include/linux/platform_data/mtd-nand-omap2.h
+++ b/include/linux/platform_data/mtd-nand-omap2.h
@@ -70,7 +70,6 @@ struct omap_nand_platform_data {
 	int			cs;
 	struct mtd_partition	*parts;
 	int			nr_parts;
-	bool			dev_ready;
 	bool			flash_bbt;
 	enum nand_io		xfer_type;
 	int			devsize;
@@ -81,5 +80,6 @@ struct omap_nand_platform_data {
 	/* deprecated */
 	struct gpmc_nand_regs	reg;
 	struct device_node	*of_node;
+	bool			dev_ready;
 };
 #endif
-- 
2.1.4
