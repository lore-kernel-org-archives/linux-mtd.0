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
Subject: [PATCH 31/52] mtd: rawnand: omap2: fix the probe function error path
Date: Fri,  2 Mar 2018 18:03:39 +0100
Message-Id: <20180302170400.6712-32-miquel.raynal@bootlin.com>
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

An error after nand_scan_tail() call should trigger a nand_release()
call. This is rightly handled in the remove function, but not in the
probe function.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/omap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 8cdf7d3d8fa7..88c43334d777 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2263,12 +2263,14 @@ static int omap_nand_probe(struct platform_device *pdev)
 
 	err = mtd_device_register(mtd, NULL, 0);
 	if (err)
-		goto return_error;
+		goto release_nand;
 
 	platform_set_drvdata(pdev, mtd);
 
 	return 0;
 
+release_nand:
+	nand_release(mtd);
 return_error:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
-- 
2.14.1
