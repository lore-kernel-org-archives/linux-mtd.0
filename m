Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VVF3s-0006P3-2X
 for linux-mtd@lists.infradead.org; Sun, 13 Oct 2013 06:21:56 +0000
From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: nand: remove deprecated IRQF_DISABLED
Date: Sun, 13 Oct 2013 08:21:32 +0200
Message-Id: <1381645292-9499-1-git-send-email-michael.opdenacker@free-electrons.com>
Cc: Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch proposes to remove the use of the IRQF_DISABLED flag

It's a NOOP since 2.6.35 and it will be removed one day.

Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>
---
 drivers/mtd/nand/mxc_nand.c    | 2 +-
 drivers/mtd/nand/pxa3xx_nand.c | 3 +--
 drivers/mtd/nand/tmio_nand.c   | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index ce8242b..58edc85 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1507,7 +1507,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	host->devtype_data->irq_control(host, 0);
 
 	err = devm_request_irq(&pdev->dev, host->irq, mxc_nfc_irq,
-			IRQF_DISABLED, DRIVER_NAME, host);
+			0, DRIVER_NAME, host);
 	if (err)
 		return err;
 
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index dd03dfd..78a79a0 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1194,8 +1194,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	/* initialize all interrupts to be disabled */
 	disable_int(info, NDSR_MASK);
 
-	ret = request_irq(irq, pxa3xx_nand_irq, IRQF_DISABLED,
-			  pdev->name, info);
+	ret = request_irq(irq, pxa3xx_nand_irq, 0, pdev->name, info);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request IRQ\n");
 		goto fail_free_buf;
diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index 396530d..a3747c9 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -428,8 +428,7 @@ static int tmio_probe(struct platform_device *dev)
 	/* 15 us command delay time */
 	nand_chip->chip_delay = 15;
 
-	retval = request_irq(irq, &tmio_irq,
-				IRQF_DISABLED, dev_name(&dev->dev), tmio);
+	retval = request_irq(irq, &tmio_irq, 0, dev_name(&dev->dev), tmio);
 	if (retval) {
 		dev_err(&dev->dev, "request_irq error %d\n", retval);
 		goto err_irq;
-- 
1.8.1.2
