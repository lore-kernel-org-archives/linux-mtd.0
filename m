Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9v8E-0006My-Tv
 for linux-mtd@lists.infradead.org; Wed, 23 Jul 2014 11:54:51 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: omap: save Bad-Block-Table (BBT) on device
Date: Wed, 23 Jul 2014 17:24:21 +0530
Message-ID: <1406116461-27089-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Sekhar Nori <nsekhar@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes OMAP NAND driver to
- save Bad-Block-Table (BBT) on NAND Flash device
- scan on device BBT during probe

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index f0ed92e..2ad7451 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1663,7 +1663,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	mtd->owner		= THIS_MODULE;
 	nand_chip		= &info->nand;
 	nand_chip->ecc.priv	= NULL;
-	nand_chip->options	|= NAND_SKIP_BBTSCAN;
+	nand_chip->bbt_options  |= NAND_BBT_USE_FLASH;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	nand_chip->IO_ADDR_R = devm_ioremap_resource(&pdev->dev, res);
-- 
1.8.5.1.163.gd7aced9
