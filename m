Received: from po-out-1718.google.com ([72.14.252.159])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KMzli-00070r-2L
	for linux-mtd@lists.infradead.org; Sun, 27 Jul 2008 06:30:10 +0000
Received: by po-out-1718.google.com with SMTP id b23so7863501poe.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Jul 2008 23:30:09 -0700 (PDT)
From: Bryan Wu <cooloney@kernel.org>
To: dwmw2@infradead.org,
	akpm@linux-foundation.org
Subject: [PATCH 7/7] [MTD] Blackfin NFC Driver: Cleanup the error exit path of
	bf5xx_nand_probe function
Date: Sun, 27 Jul 2008 14:27:59 +0800
Message-Id: <1217140079-20014-8-git-send-email-cooloney@kernel.org>
In-Reply-To: <1217140079-20014-1-git-send-email-cooloney@kernel.org>
References: <1217140079-20014-1-git-send-email-cooloney@kernel.org>
Sender: Bryan Wu <cooloney.lkml@gmail.com>
Cc: Bryan Wu <cooloney@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/nand/bf5xx_nand.c |   38 ++++++++++++++++++++++++--------------
 1 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 6cf7fb8..9af2a2c 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -549,7 +549,6 @@ static void bf5xx_nand_dma_write_buf(struct mtd_info *mtd,
 /*
  * System initialization functions
  */
-
 static int bf5xx_nand_dma_init(struct bf5xx_nand_info *info)
 {
 	int ret;
@@ -582,6 +581,13 @@ static int bf5xx_nand_dma_init(struct bf5xx_nand_info *info)
 	return 0;
 }
 
+static void bf5xx_nand_dma_remove(struct bf5xx_nand_info *info)
+{
+	/* Free NFC DMA channel */
+	if (hardware_ecc)
+		free_dma(CH_NFC);
+}
+
 /*
  * BF5XX NFC hardware initialization
  *  - pin mux setup
@@ -658,6 +664,7 @@ static int __devexit bf5xx_nand_remove(struct platform_device *pdev)
 	}
 
 	peripheral_free_list(bfin_nfc_pin_req);
+	bf5xx_nand_dma_remove(info);
 
 	/* free the common resources */
 	kfree(info);
@@ -683,21 +690,21 @@ static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "(%p)\n", pdev);
 
+	if (!plat) {
+		dev_err(&pdev->dev, "no platform specific information\n");
+		return -EINVAL;
+	}
+
 	if (peripheral_request_list(bfin_nfc_pin_req, DRV_NAME)) {
 		dev_err(&pdev->dev, "requesting Peripherals failed\n");
 		return -EFAULT;
 	}
 
-	if (!plat) {
-		dev_err(&pdev->dev, "no platform specific information\n");
-		goto exit_error;
-	}
-
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (info == NULL) {
 		dev_err(&pdev->dev, "no memory for flash info\n");
 		err = -ENOMEM;
-		goto exit_error;
+		goto out_err_kzalloc;
 	}
 
 	platform_set_drvdata(pdev, info);
@@ -741,8 +748,8 @@ static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 
 	/* initialise the hardware */
 	err = bf5xx_nand_hw_init(info);
-	if (err != 0)
-		goto exit_error;
+	if (err)
+		goto out_err_hw_init;
 
 	/* setup hardware ECC data struct */
 	if (hardware_ecc) {
@@ -772,7 +779,7 @@ static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 	/* scan hardware nand chip and setup mtd info data struct */
 	if (nand_scan(mtd, 1)) {
 		err = -ENXIO;
-		goto exit_error;
+		goto out_err_nand_scan;
 	}
 
 	/* add NAND partition */
@@ -781,11 +788,14 @@ static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "initialised ok\n");
 	return 0;
 
-exit_error:
-	bf5xx_nand_remove(pdev);
+out_err_nand_scan:
+	bf5xx_nand_dma_remove(info);
+out_err_hw_init:
+	platform_set_drvdata(pdev, NULL);
+	kfree(info);
+out_err_kzalloc:
+	peripheral_free_list(bfin_nfc_pin_req);
 
-	if (err == 0)
-		err = -EINVAL;
 	return err;
 }
 
-- 
1.5.6
