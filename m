Received: from mail-by2on0137.outbound.protection.outlook.com
 ([207.46.100.137] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4GO7-0008MY-R1
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 23:00:42 +0000
From: Han Xu <b45815@freescale.com>
To: <shijie.huang@arm.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <b45815@freescale.com>, <boris.brezillon@free-electrons.com>,
 <fabio.estevam@freescale.com>, <hofrat@osadl.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vinod.koul@intel.com>, <dan.j.williams@intel.com>,
 <dmaengine@vger.kernel.org>
Subject: [PATCH v8 2/7] dmaengine: mxs: APBH DMA supports deep sleep mode
Date: Wed, 2 Dec 2015 16:47:41 -0600
Message-ID: <1449096466-18064-3-git-send-email-b45815@freescale.com>
In-Reply-To: <1449096466-18064-1-git-send-email-b45815@freescale.com>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
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

Deep Sleep Mode(dsm) turns off the power for APBH DMA module, DMA
need to be re-initialized when system resumed back.

Signed-off-by: Huang Shijie <b32955@freescale.com>
Signed-off-by: Han Xu <b45815@freescale.com>
---
 drivers/dma/mxs-dma.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 60de352..eba51fc 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -693,7 +693,7 @@ static enum dma_status mxs_dma_tx_status(struct dma_chan *chan,
 	return mxs_chan->status;
 }
 
-static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
+static int mxs_dma_init(struct mxs_dma_engine *mxs_dma)
 {
 	int ret;
 
@@ -835,6 +835,7 @@ static int __init mxs_dma_probe(struct platform_device *pdev)
 
 	mxs_dma->pdev = pdev;
 	mxs_dma->dma_device.dev = &pdev->dev;
+	dev_set_drvdata(&pdev->dev, mxs_dma);
 
 	/* mxs_dma gets 65535 bytes maximum sg size */
 	mxs_dma->dma_device.dev->dma_parms = &mxs_dma->dma_parms;
@@ -872,9 +873,23 @@ static int __init mxs_dma_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int mxs_dma_pm_resume(struct device *dev)
+{
+	struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
+
+	return mxs_dma_init(mxs_dma);
+}
+#endif /* CONFIG_PM_SLEEP */
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
