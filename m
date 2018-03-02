From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Josh Wu <rainyfeeling@outlook.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Stefan Agner <stefan@agner.ch>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 16/52] mtd: rawnand: fsmc: fix probe function error path
Date: Fri,  2 Mar 2018 18:03:24 +0100
Message-Id: <20180302170400.6712-17-miquel.raynal@bootlin.com>
In-Reply-To: <20180302170400.6712-1-miquel.raynal@bootlin.com>
References: <20180302170400.6712-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An error after nand_scan_tail() should trigger a nand_release().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 28c48dcc514e..1bf73d4d4c0d 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1123,14 +1123,16 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	mtd->name = "nand";
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
-		goto err_probe;
+		goto err_release_nand;
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
+
 	return 0;
 
+err_release_nand:
+	nand_release(mtd);
 err_probe:
-err_scan_ident:
 	if (host->mode == USE_DMA_ACCESS)
 		dma_release_channel(host->write_dma_chan);
 err_req_write_chnl:
-- 
2.14.1
