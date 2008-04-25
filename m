Received: from nwd2mail10.analog.com ([137.71.25.55])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JpFE5-0005QH-Kn
	for linux-mtd@lists.infradead.org; Fri, 25 Apr 2008 04:07:57 +0000
From: Bryan Wu <cooloney@kernel.org>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] [mtd] bf5xx_nand driver: Fix BUG - nand driver on bf527
	ezkit board crashes if bfin_mac installed
Date: Fri, 25 Apr 2008 12:07:31 +0800
Message-Id: <1209096453-21610-2-git-send-email-cooloney@kernel.org>
In-Reply-To: <1209096453-21610-1-git-send-email-cooloney@kernel.org>
References: <1209096453-21610-1-git-send-email-cooloney@kernel.org>
Cc: Bryan Wu <cooloney@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michael Hennerich <michael.hennerich@analog.com>

http://blackfin.uclinux.org/gf/project/uclinux-dist/tracker/?action=TrackerItemEdit&tracker_item_id=4053

Singed-off-by: Michael Hennerich <michael.hennerich@analog.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/nand/bf5xx_nand.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 747042a..a7afe35 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -1,6 +1,6 @@
 /* linux/drivers/mtd/nand/bf5xx_nand.c
  *
- * Copyright 2006-2007 Analog Devices Inc.
+ * Copyright 2006-2008 Analog Devices Inc.
  *	http://blackfin.uclinux.org/
  *	Bryan Wu <bryan.wu@analog.com>
  *
@@ -74,7 +74,7 @@ static int hardware_ecc = 1;
 static int hardware_ecc;
 #endif
 
-static unsigned short bfin_nfc_pin_req[] =
+static const unsigned short bfin_nfc_pin_req[] =
 	{P_NAND_CE,
 	 P_NAND_RB,
 	 P_NAND_D0,
@@ -581,12 +581,6 @@ static int bf5xx_nand_hw_init(struct bf5xx_nand_info *info)
 	bfin_write_NFC_IRQSTAT(val);
 	SSYNC();
 
-	if (peripheral_request_list(bfin_nfc_pin_req, DRV_NAME)) {
-		printk(KERN_ERR DRV_NAME
-		": Requesting Peripherals failed\n");
-		return -EFAULT;
-	}
-
 	/* DMA initialization  */
 	if (bf5xx_nand_dma_init(info))
 		err = -ENXIO;
@@ -654,6 +648,12 @@ static int bf5xx_nand_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "(%p)\n", pdev);
 
+	if (peripheral_request_list(bfin_nfc_pin_req, DRV_NAME)) {
+		printk(KERN_ERR DRV_NAME
+		": Requesting Peripherals failed\n");
+		return -EFAULT;
+	}
+
 	if (!plat) {
 		dev_err(&pdev->dev, "no platform specific information\n");
 		goto exit_error;
-- 
1.5.5
