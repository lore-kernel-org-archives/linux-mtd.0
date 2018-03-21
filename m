Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eydOD-0001Ye-5A
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 13:03:04 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 08/16] mtd: rawnand: fsmc: fix and enhance probe function
 error path
Date: Wed, 21 Mar 2018 14:01:49 +0100
Message-Id: <20180321130157.9524-9-miquel.raynal@bootlin.com>
In-Reply-To: <20180321130157.9524-1-miquel.raynal@bootlin.com>
References: <20180321130157.9524-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An error after nand_scan_tail() should trigger a nand_cleanup().

Also, goto labels should indicate what the next cleanup is, not the
point from which they can be accessed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 28c48dcc514e..f4a5a317d4ae 100644
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
@@ -1118,26 +1118,29 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	/* Second stage of scan to fill MTD data-structures */
 	ret = nand_scan_tail(mtd);
 	if (ret)
-		goto err_probe;
+		goto release_dma_write_chan;
 
 	mtd->name = "nand";
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
-		goto err_probe;
+		goto cleanup_nand;
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
+
 	return 0;
 
-err_probe:
-err_scan_ident:
+cleanup_nand:
+	nand_cleanup(nand);
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
