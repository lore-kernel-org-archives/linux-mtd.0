Received: from perceval.ideasonboard.com ([95.142.166.194])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlT6O-0002pW-9k
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 00:35:36 +0000
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-sh@vger.kernel.org
Subject: [PATCH] mtd: sh_flctl: Fix warnings due to improper casts
Date: Wed, 27 Nov 2013 01:35:11 +0100
Message-Id: <1385512511-10477-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cast pointers to unsigned long instead of unsigned int. This fixes
warnings on platforms where pointers have a different size than int.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/mtd/nand/sh_flctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index a3c84eb..b1e2b13 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -151,7 +151,7 @@ static void flctl_setup_dma(struct sh_flctl *flctl)
 	dma_cap_set(DMA_SLAVE, mask);
 
 	flctl->chan_fifo0_tx = dma_request_channel(mask, shdma_chan_filter,
-					    (void *)pdata->slave_id_fifo0_tx);
+			(void *)(unsigned long)pdata->slave_id_fifo0_tx);
 	dev_dbg(&pdev->dev, "%s: TX: got channel %p\n", __func__,
 		flctl->chan_fifo0_tx);
 
@@ -168,7 +168,7 @@ static void flctl_setup_dma(struct sh_flctl *flctl)
 		goto err;
 
 	flctl->chan_fifo0_rx = dma_request_channel(mask, shdma_chan_filter,
-					    (void *)pdata->slave_id_fifo0_rx);
+			(void *)(unsigned long)pdata->slave_id_fifo0_rx);
 	dev_dbg(&pdev->dev, "%s: RX: got channel %p\n", __func__,
 		flctl->chan_fifo0_rx);
 
-- 
1.8.3.2
