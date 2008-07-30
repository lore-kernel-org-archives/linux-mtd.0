Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOHS6-0000vB-UM
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 19:35:15 +0000
Message-Id: <200807301935.m6UJZ47R012309@imap1.linux-foundation.org>
Subject: [patch 11/13] Blackfin NFC Driver: Cleanup the error exit path of
	bf5xx_nand_probe function
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 30 Jul 2008 12:35:04 -0700
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	cooloney@kernel.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bryan Wu <cooloney@kernel.org>

Signed-off-by: Bryan Wu <cooloney@kernel.org>
Cc: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/bf5xx_nand.c |   38 ++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff -puN drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-cleanup-the-error-exit-path-of-bf5xx_nand_probe-function drivers/mtd/nand/bf5xx_nand.c
--- a/drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-cleanup-the-error-exit-path-of-bf5xx_nand_probe-function
+++ a/drivers/mtd/nand/bf5xx_nand.c
@@ -549,7 +549,6 @@ static void bf5xx_nand_dma_write_buf(str
 /*
  * System initialization functions
  */
-
 static int bf5xx_nand_dma_init(struct bf5xx_nand_info *info)
 {
 	int ret;
@@ -582,6 +581,13 @@ static int bf5xx_nand_dma_init(struct bf
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
@@ -658,6 +664,7 @@ static int __devexit bf5xx_nand_remove(s
 	}
 
 	peripheral_free_list(bfin_nfc_pin_req);
+	bf5xx_nand_dma_remove(info);
 
 	/* free the common resources */
 	kfree(info);
@@ -683,21 +690,21 @@ static int __devinit bf5xx_nand_probe(st
 
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
@@ -741,8 +748,8 @@ static int __devinit bf5xx_nand_probe(st
 
 	/* initialise the hardware */
 	err = bf5xx_nand_hw_init(info);
-	if (err != 0)
-		goto exit_error;
+	if (err)
+		goto out_err_hw_init;
 
 	/* setup hardware ECC data struct */
 	if (hardware_ecc) {
@@ -772,7 +779,7 @@ static int __devinit bf5xx_nand_probe(st
 	/* scan hardware nand chip and setup mtd info data struct */
 	if (nand_scan(mtd, 1)) {
 		err = -ENXIO;
-		goto exit_error;
+		goto out_err_nand_scan;
 	}
 
 	/* add NAND partition */
@@ -781,11 +788,14 @@ static int __devinit bf5xx_nand_probe(st
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
 
_
