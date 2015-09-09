Received: from mail-bn1on0142.outbound.protection.outlook.com
 ([157.56.110.142] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZo8z-0007Qn-Kx
 for linux-mtd@lists.infradead.org; Wed, 09 Sep 2015 22:47:11 +0000
From: Han Xu <b45815@freescale.com>
To: <shijie.huang@arm.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <b45815@freescale.com>, <boris.brezillon@free-electrons.com>,
 <fabio.estevam@freescale.com>, <hofrat@osadl.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vinod.koul@intel.com>, <dan.j.williams@intel.com>,
 <dmaengine@vger.kernel.org>
Subject: [PATCH v4 2/6] dmaengine: mxs: support i.MX7D and deep sleep mode
Date: Wed, 9 Sep 2015 17:37:20 -0500
Message-ID: <1441838244-2106-3-git-send-email-b45815@freescale.com>
In-Reply-To: <1441838244-2106-1-git-send-email-b45815@freescale.com>
References: <1441838244-2106-1-git-send-email-b45815@freescale.com>
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

From: Huang Shijie <b32955@freescale.com>

The patch support i.MX7D platform by adding extra DMA clock.

Deep Sleep Mode(dsm) turns off the power for APBH DMA module, add
suspend/resume function and re-init the APBH DMA during resume.

Signed-off-by: Huang Shijie <b32955@freescale.com>
Signed-off-by: Han Xu <han.xu@freescale.com>
Signed-off-by: Adrian Alonso <aalonso@freescale.com>
---
 drivers/dma/mxs-dma.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 60de352..5be13ad 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -1,5 +1,5 @@
 /*
- * Copyright 2011 Freescale Semiconductor, Inc. All Rights Reserved.
+ * Copyright 2011-2015 Freescale Semiconductor, Inc. All Rights Reserved.
  *
  * Refer to drivers/dma/imx-sdma.c
  *
@@ -28,7 +28,6 @@
 #include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/list.h>
-
 #include <asm/irq.h>
 
 #include "dmaengine.h"
@@ -135,6 +134,7 @@ enum mxs_dma_devtype {
 enum mxs_dma_id {
 	IMX23_DMA,
 	IMX28_DMA,
+	IMX7D_DMA,
 };
 
 struct mxs_dma_engine {
@@ -142,6 +142,7 @@ struct mxs_dma_engine {
 	enum mxs_dma_devtype		type;
 	void __iomem			*base;
 	struct clk			*clk;
+	struct clk			*clk_io;
 	struct dma_device		dma_device;
 	struct device_dma_parameters	dma_parms;
 	struct mxs_dma_chan		mxs_chans[MXS_DMA_CHANNELS];
@@ -167,6 +168,9 @@ static struct mxs_dma_type mxs_dma_types[] = {
 	}, {
 		.id = IMX28_DMA,
 		.type = MXS_DMA_APBX,
+	}, {
+		.id = IMX7D_DMA,
+		.type = MXS_DMA_APBH,
 	}
 };
 
@@ -184,6 +188,9 @@ static const struct platform_device_id mxs_dma_ids[] = {
 		.name = "imx28-dma-apbx",
 		.driver_data = (kernel_ulong_t) &mxs_dma_types[3],
 	}, {
+		.name = "imx7d-dma-apbh",
+		.driver_data = (kernel_ulong_t) &mxs_dma_types[4],
+	}, {
 		/* end of list */
 	}
 };
@@ -193,6 +200,7 @@ static const struct of_device_id mxs_dma_dt_ids[] = {
 	{ .compatible = "fsl,imx23-dma-apbx", .data = &mxs_dma_ids[1], },
 	{ .compatible = "fsl,imx28-dma-apbh", .data = &mxs_dma_ids[2], },
 	{ .compatible = "fsl,imx28-dma-apbx", .data = &mxs_dma_ids[3], },
+	{ .compatible = "fsl,imx7d-dma-apbh", .data = &mxs_dma_ids[4], },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxs_dma_dt_ids);
@@ -440,6 +448,12 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
 	if (ret)
 		goto err_clk;
 
+	if (mxs_dma->dev_id == IMX7D_DMA) {
+		ret = clk_prepare_enable(mxs_dma->clk_io);
+		if (ret)
+			goto err_clk_unprepare;
+	}
+
 	mxs_dma_reset_chan(chan);
 
 	dma_async_tx_descriptor_init(&mxs_chan->desc, chan);
@@ -450,6 +464,8 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
 
 	return 0;
 
+err_clk_unprepare:
+	clk_disable_unprepare(mxs_dma->clk);
 err_clk:
 	free_irq(mxs_chan->chan_irq, mxs_dma);
 err_irq:
@@ -471,6 +487,9 @@ static void mxs_dma_free_chan_resources(struct dma_chan *chan)
 	dma_free_coherent(mxs_dma->dma_device.dev, CCW_BLOCK_SIZE,
 			mxs_chan->ccw, mxs_chan->ccw_phys);
 
+	if (mxs_dma->dev_id == IMX7D_DMA)
+		clk_disable_unprepare(mxs_dma->clk_io);
+
 	clk_disable_unprepare(mxs_dma->clk);
 }
 
@@ -693,7 +712,7 @@ static enum dma_status mxs_dma_tx_status(struct dma_chan *chan,
 	return mxs_chan->status;
 }
 
-static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
+static int mxs_dma_init(struct mxs_dma_engine *mxs_dma)
 {
 	int ret;
 
@@ -701,6 +720,12 @@ static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
 	if (ret)
 		return ret;
 
+	if (mxs_dma->dev_id == IMX7D_DMA) {
+		ret = clk_prepare_enable(mxs_dma->clk_io);
+		if (ret)
+			goto err_out;
+	}
+
 	ret = stmp_reset_block(mxs_dma->base);
 	if (ret)
 		goto err_out;
@@ -803,9 +828,19 @@ static int __init mxs_dma_probe(struct platform_device *pdev)
 	if (IS_ERR(mxs_dma->base))
 		return PTR_ERR(mxs_dma->base);
 
-	mxs_dma->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(mxs_dma->clk))
-		return PTR_ERR(mxs_dma->clk);
+	if (mxs_dma->dev_id == IMX7D_DMA) {
+		mxs_dma->clk = devm_clk_get(&pdev->dev, "dma_apbh_bch");
+		if (IS_ERR(mxs_dma->clk))
+			return PTR_ERR(mxs_dma->clk);
+		mxs_dma->clk_io = devm_clk_get(&pdev->dev, "dma_apbh_io");
+		if (IS_ERR(mxs_dma->clk_io))
+			return PTR_ERR(mxs_dma->clk_io);
+
+	} else {
+		mxs_dma->clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(mxs_dma->clk))
+			return PTR_ERR(mxs_dma->clk);
+	}
 
 	dma_cap_set(DMA_SLAVE, mxs_dma->dma_device.cap_mask);
 	dma_cap_set(DMA_CYCLIC, mxs_dma->dma_device.cap_mask);
@@ -835,6 +870,7 @@ static int __init mxs_dma_probe(struct platform_device *pdev)
 
 	mxs_dma->pdev = pdev;
 	mxs_dma->dma_device.dev = &pdev->dev;
+	dev_set_drvdata(&pdev->dev, mxs_dma);
 
 	/* mxs_dma gets 65535 bytes maximum sg size */
 	mxs_dma->dma_device.dev->dma_parms = &mxs_dma->dma_parms;
@@ -872,9 +908,25 @@ static int __init mxs_dma_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int mxs_dma_pm_resume(struct device *dev)
+{
+	struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
+	int ret;
+
+	ret = mxs_dma_init(mxs_dma);
+	if (ret)
+		return ret;
+	return 0;
+}
+
+static const struct dev_pm_ops mxs_dma_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, mxs_dma_pm_resume)
+};
+
 static struct platform_driver mxs_dma_driver = {
 	.driver		= {
 		.name	= "mxs-dma",
+		.pm = &mxs_dma_pm_ops,
 		.of_match_table = mxs_dma_dt_ids,
 	},
 	.id_table	= mxs_dma_ids,
-- 
1.9.1
