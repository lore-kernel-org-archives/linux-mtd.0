Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9woj-0007tF-4R
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2018 18:01:01 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 04/11] mtd: rawnand: fsmc: clean the probe function style
Date: Sat, 21 Apr 2018 20:00:36 +0200
Message-Id: <20180421180043.18366-5-miquel.raynal@bootlin.com>
In-Reply-To: <20180421180043.18366-1-miquel.raynal@bootlin.com>
References: <20180421180043.18366-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Before fixing the error path of the probe function, fix the style of the
probe function and mostly the goto labels: they should indicate what
the next cleanup is, not the point from which they can be accessed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 28c48dcc514e..35af3890ddba 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1022,12 +1022,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		host->read_dma_chan = dma_request_channel(mask, filter, NULL);
 		if (!host->read_dma_chan) {
 			dev_err(&pdev->dev, "Unable to get read dma channel\n");
-			goto err_req_read_chnl;
+			goto disable_clk;
 		}
 		host->write_dma_chan = dma_request_channel(mask, filter, NULL);
 		if (!host->write_dma_chan) {
 			dev_err(&pdev->dev, "Unable to get write dma channel\n");
-			goto err_req_write_chnl;
+			goto release_dma_read_chan;
 		}
 	}
 
@@ -1050,7 +1050,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	ret = nand_scan_ident(mtd, 1, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "No NAND Device found!\n");
-		goto err_scan_ident;
+		goto release_dma_write_chan;
 	}
 
 	if (AMBA_REV_BITS(host->pid) >= 8) {
@@ -1065,7 +1065,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 			dev_warn(&pdev->dev, "No oob scheme defined for oobsize %d\n",
 				 mtd->oobsize);
 			ret = -EINVAL;
-			goto err_probe;
+			goto release_dma_write_chan;
 		}
 
 		mtd_set_ooblayout(mtd, &fsmc_ecc4_ooblayout_ops);
@@ -1090,7 +1090,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 
 		default:
 			dev_err(&pdev->dev, "Unsupported ECC mode!\n");
-			goto err_probe;
+			goto release_dma_write_chan;
 		}
 
 		/*
@@ -1110,7 +1110,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 					 "No oob scheme defined for oobsize %d\n",
 					 mtd->oobsize);
 				ret = -EINVAL;
-				goto err_probe;
+				goto release_dma_write_chan;
 			}
 		}
 	}
@@ -1118,26 +1118,27 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	/* Second stage of scan to fill MTD data-structures */
 	ret = nand_scan_tail(mtd);
 	if (ret)
-		goto err_probe;
+		goto release_dma_write_chan;
 
 	mtd->name = "nand";
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
-		goto err_probe;
+		goto release_dma_write_chan;
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
+
 	return 0;
 
-err_probe:
-err_scan_ident:
+release_dma_write_chan:
 	if (host->mode == USE_DMA_ACCESS)
 		dma_release_channel(host->write_dma_chan);
-err_req_write_chnl:
+release_dma_read_chan:
 	if (host->mode == USE_DMA_ACCESS)
 		dma_release_channel(host->read_dma_chan);
-err_req_read_chnl:
+disable_clk:
 	clk_disable_unprepare(host->clk);
+
 	return ret;
 }
 
-- 
2.14.1
