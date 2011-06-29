From: Nicolas Ferre <nicolas.ferre@atmel.com>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] MTD: atmel_nand: fix wrong use of 0 as NULL
Date: Wed, 29 Jun 2011 18:41:16 +0200
Message-Id: <1309365676-19210-1-git-send-email-nicolas.ferre@atmel.com>
Cc: hong.xu@atmel.com, Nicolas Ferre <nicolas.ferre@atmel.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixing this error:
atmel_nand.c:718:20: warning: Using plain integer as NULL pointer

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index b300705..bbdf062 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -593,7 +593,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 
 		dma_cap_zero(mask);
 		dma_cap_set(DMA_MEMCPY, mask);
-		host->dma_chan = dma_request_channel(mask, 0, NULL);
+		host->dma_chan = dma_request_channel(mask, NULL, NULL);
 		if (!host->dma_chan) {
 			dev_err(host->dev, "Failed to request DMA channel\n");
 			use_dma = 0;
-- 
1.7.3
