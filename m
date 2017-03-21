Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGf7-0000Pp-Rn
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:05:21 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 07/13] mtd: nand: fmsc: kill {read,
 write}_dma_priv from fsmc_nand_platform_data
Date: Tue, 21 Mar 2017 11:03:59 +0100
Message-Id: <1490090645-8576-8-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The read_dma_priv and write_dma_priv fields of fsmc_nand_platform_data
are never set, so this commit removes them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 1c9744b..0d618ad 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -152,10 +152,6 @@ struct fsmc_nand_platform_data {
 	unsigned int		bank;
 
 	enum access_mode	mode;
-
-	/* priv structures for dma accesses */
-	void			*read_dma_priv;
-	void			*write_dma_priv;
 };
 
 /**
@@ -1041,14 +1037,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	case USE_DMA_ACCESS:
 		dma_cap_zero(mask);
 		dma_cap_set(DMA_MEMCPY, mask);
-		host->read_dma_chan = dma_request_channel(mask, filter,
-				pdata->read_dma_priv);
+		host->read_dma_chan = dma_request_channel(mask, filter, NULL);
 		if (!host->read_dma_chan) {
 			dev_err(&pdev->dev, "Unable to get read dma channel\n");
 			goto err_req_read_chnl;
 		}
-		host->write_dma_chan = dma_request_channel(mask, filter,
-				pdata->write_dma_priv);
+		host->write_dma_chan = dma_request_channel(mask, filter, NULL);
 		if (!host->write_dma_chan) {
 			dev_err(&pdev->dev, "Unable to get write dma channel\n");
 			goto err_req_write_chnl;
-- 
2.7.4
