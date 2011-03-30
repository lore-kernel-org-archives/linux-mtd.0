From: Hong Xu <hong.xu@atmel.com>
To: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] MTD: atmel_nand: trivial: change DMA usage information
	trace
Date: Wed, 30 Mar 2011 16:26:40 +0800
Message-Id: <1301473601-29570-2-git-send-email-hong.xu@atmel.com>
In-Reply-To: <1301473601-29570-1-git-send-email-hong.xu@atmel.com>
References: <1301473601-29570-1-git-send-email-hong.xu@atmel.com>
Cc: nicolas.ferre@atmel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Nicolas Ferre <nicolas.ferre@atmel.com>

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 9acecdc..c36ea50 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -611,7 +611,8 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		}
 	}
 	if (use_dma)
-		dev_info(host->dev, "Using DMA for NAND access.\n");
+		dev_info(host->dev, "Using %s for DMA transfers.\n",
+					dma_chan_name(host->dma_chan));
 	else
 		dev_info(host->dev, "No DMA support for NAND access.\n");
 
-- 
1.7.3.3
