From: Huang Shijie <b32955@freescale.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: [ PATCH V2  2/7] dmaengine: change the flags of request_irq()
Date: Fri, 25 Mar 2011 18:22:56 +0800
Message-ID: <1301048581-21321-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1301048581-21321-1-git-send-email-b32955@freescale.com>
References: <1301048581-21321-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, ffainelli@freebox.fr,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The GPMI may have many DMA channels, such as the imx23 has
four DMA channels. All these DMA channels share the same interrupt.
So change the flags from '0' to IRQF_SHARED, else there will be
an EBUSY error returns.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/dma/mxs-dma.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 88aad4f..0ee5b52 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -328,7 +328,7 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
 	memset(mxs_chan->ccw, 0, PAGE_SIZE);
 
 	ret = request_irq(mxs_chan->chan_irq, mxs_dma_int_handler,
-				0, "mxs-dma", mxs_dma);
+				IRQF_SHARED, "mxs-dma", mxs_dma);
 	if (ret)
 		goto err_irq;
 
-- 
1.7.0.4
