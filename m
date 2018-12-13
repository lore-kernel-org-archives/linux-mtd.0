Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXWZP-0005BU-TZ
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 19:22:53 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: omap2: Pass the parent of pdev to
 dma_request_chan()
Date: Thu, 13 Dec 2018 20:22:27 +0100
Message-Id: <20181213192227.3815-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit e1e6255c311b ("mtd: rawnand: omap2: convert driver to
nand_scan()") moved part of the init code in the ->attach_chip hook
and at the same time changed the struct device object passed to
dma_request_chan() (&pdev->dev instead of pdev->dev.parent).

Fixes: e1e6255c311b ("mtd: rawnand: omap2: convert driver to nand_scan()")
Reported-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- Fix the prefix
---
 drivers/mtd/nand/raw/omap2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 886d05c391ef..68e8b9f7f372 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -1944,7 +1944,7 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 	case NAND_OMAP_PREFETCH_DMA:
 		dma_cap_zero(mask);
 		dma_cap_set(DMA_SLAVE, mask);
-		info->dma = dma_request_chan(dev, "rxtx");
+		info->dma = dma_request_chan(dev->parent, "rxtx");
 
 		if (IS_ERR(info->dma)) {
 			dev_err(dev, "DMA engine request failed\n");
-- 
2.17.1
