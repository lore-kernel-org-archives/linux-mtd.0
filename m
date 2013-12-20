Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtsDU-0007AJ-RG
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 05:01:42 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY3001UA9XYFBD0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 14:01:10 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
In-reply-to: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
Subject: [PATCH 5/8] mtd: lpc32xx_slc: Use devm_*() functions
Date: Fri, 20 Dec 2013 14:01:09 +0900
Message-id: <001401cefd40$7f907170$7eb15450$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Roland Stigge' <stigge@antcom.de>, linux-mtd@lists.infradead.org,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_*() functions to make cleanup paths simpler.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/lpc32xx_slc.c |   10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index 23e6974..5f20394 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -791,8 +791,8 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	}
 	if (host->ncfg->wp_gpio == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
-	if (gpio_is_valid(host->ncfg->wp_gpio) &&
-			gpio_request(host->ncfg->wp_gpio, "NAND WP")) {
+	if (gpio_is_valid(host->ncfg->wp_gpio) && devm_gpio_request(&pdev->dev,
+			host->ncfg->wp_gpio, "NAND WP")) {
 		dev_err(&pdev->dev, "GPIO not available\n");
 		return -EBUSY;
 	}
@@ -808,7 +808,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	mtd->dev.parent = &pdev->dev;
 
 	/* Get NAND clock */
-	host->clk = clk_get(&pdev->dev, NULL);
+	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
 		dev_err(&pdev->dev, "Clock failure\n");
 		res = -ENOENT;
@@ -927,10 +927,8 @@ err_exit3:
 	dma_release_channel(host->dma_chan);
 err_exit2:
 	clk_disable(host->clk);
-	clk_put(host->clk);
 err_exit1:
 	lpc32xx_wp_enable(host);
-	gpio_free(host->ncfg->wp_gpio);
 
 	return res;
 }
@@ -953,9 +951,7 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	clk_disable(host->clk);
-	clk_put(host->clk);
 	lpc32xx_wp_enable(host);
-	gpio_free(host->ncfg->wp_gpio);
 
 	return 0;
 }
-- 
1.7.10.4
