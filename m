Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elwSP-00038O-Pr
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 12:46:46 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Remove unneeded driver.bus assignment
Date: Wed, 14 Feb 2018 13:46:25 +0100
Message-Id: <20180214124625.30765-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

platform_driver_register() takes care of assigning driver->bus
to &platform_bus_type, no need to explicitly assign it in the driver.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 2901c7bd9e30..dc9914fce296 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -1174,7 +1174,6 @@ static int fsl_qspi_resume(struct platform_device *pdev)
 static struct platform_driver fsl_qspi_driver = {
 	.driver = {
 		.name	= "fsl-quadspi",
-		.bus	= &platform_bus_type,
 		.of_match_table = fsl_qspi_dt_ids,
 	},
 	.probe          = fsl_qspi_probe,
-- 
2.14.1
