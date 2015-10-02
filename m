Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::12])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zhxlg-0000jg-1R
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2015 10:40:49 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/3] mtd: nand: fsmc: Small whitespace cleanup
Date: Fri,  2 Oct 2015 12:40:20 +0200
Message-Id: <1443782422-4515-1-git-send-email-sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove tab in empty line.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/fsmc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 793872f..dc94882 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -960,7 +960,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	host->data_va = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->data_va))
 		return PTR_ERR(host->data_va);
-	
+
 	host->data_pa = (dma_addr_t)res->start;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_addr");
-- 
2.5.3
