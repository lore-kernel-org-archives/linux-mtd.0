Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9wov-0007v3-EV
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2018 18:01:14 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 11/11] mtd: rawnand: lpc32xx_slc: fix the probe function
 error path
Date: Sat, 21 Apr 2018 20:00:43 +0200
Message-Id: <20180421180043.18366-12-miquel.raynal@bootlin.com>
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

An error after nand_scan_tail() should trigger a nand_cleanup() and not
a nand_release(). The latter doing an mtd_device_unregister() which is
not needed if mtd_device_register() failed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 342f666ad435..143e1ec3a90a 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -926,12 +926,12 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	res = mtd_device_register(mtd, host->ncfg->parts,
 				  host->ncfg->num_parts);
 	if (res)
-		goto release_nand;
+		goto cleanup_nand;
 
 	return 0;
 
-release_nand:
-	nand_release(mtd);
+cleanup_nand:
+	nand_cleanup(chip);
 release_dma:
 	dma_release_channel(host->dma_chan);
 release_clk:
-- 
2.14.1
