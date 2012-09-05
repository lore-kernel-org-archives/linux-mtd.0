From: Josh Wu <josh.wu@atmel.com>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com, plagnioj@jcrosoft.com
Subject: [PATCH] mtd: atmel_nand: fix the compile error which miss label
 "err_ecc_ioremap".
Date: Wed,  5 Sep 2012 14:00:42 +0800
Message-Id: <1346824842-18875-1-git-send-email-josh.wu@atmel.com>
Cc: Josh Wu <josh.wu@atmel.com>, nicolas.ferre@atmel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 6a5a35b..9144557 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1399,7 +1399,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	if (pdev->dev.of_node) {
 		res = atmel_of_init_port(host, pdev->dev.of_node);
 		if (res)
-			goto err_nand_ioremap;
+			goto err_ecc_ioremap;
 	} else {
 		memcpy(&host->board, pdev->dev.platform_data,
 		       sizeof(struct atmel_nand_data));
@@ -1560,6 +1560,7 @@ err_no_card:
 	platform_set_drvdata(pdev, NULL);
 	if (host->dma_chan)
 		dma_release_channel(host->dma_chan);
+err_ecc_ioremap:
 	iounmap(host->io_base);
 err_nand_ioremap:
 	kfree(host);
-- 
1.7.9.5
