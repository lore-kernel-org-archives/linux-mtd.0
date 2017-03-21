Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGf7-0000Qd-Ru
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:05:28 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 11/13] mtd: nand: fsmc: use devm_clk_get()
Date: Tue, 21 Mar 2017 11:04:03 +0100
Message-Id: <1490090645-8576-12-git-send-email-thomas.petazzoni@free-electrons.com>
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

This commit switches the fsmc_nand driver from clk_get() to
devm_clk_get(), which saves a few clk_put().

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 12afae62..296222f 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -948,7 +948,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(host->regs_va))
 		return PTR_ERR(host->regs_va);
 
-	host->clk = clk_get(&pdev->dev, NULL);
+	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
 		dev_err(&pdev->dev, "failed to fetch block clock\n");
 		return PTR_ERR(host->clk);
@@ -956,7 +956,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(host->clk);
 	if (ret)
-		goto err_clk_prepare_enable;
+		return ret;
 
 	/*
 	 * This device ID is actually a common AMBA ID as used on the
@@ -1121,8 +1121,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		dma_release_channel(host->read_dma_chan);
 err_req_read_chnl:
 	clk_disable_unprepare(host->clk);
-err_clk_prepare_enable:
-	clk_put(host->clk);
 	return ret;
 }
 
@@ -1141,7 +1139,6 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 			dma_release_channel(host->read_dma_chan);
 		}
 		clk_disable_unprepare(host->clk);
-		clk_put(host->clk);
 	}
 
 	return 0;
-- 
2.7.4
