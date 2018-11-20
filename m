Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1vn-0005mG-JA
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 09:02:55 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 04/10] mtd: rawnand: fsmc: Stop using the dummy controller obj
Date: Tue, 20 Nov 2018 10:02:33 +0100
Message-Id: <20181120090239.5792-5-boris.brezillon@bootlin.com>
In-Reply-To: <20181120090239.5792-1-boris.brezillon@bootlin.com>
References: <20181120090239.5792-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The dummy controller is kept around to support old drivers. Let's
patch this one and declare our own nand_controller instance.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 23d00a2c926f..db5174c336d4 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -122,6 +122,7 @@ enum access_mode {
 /**
  * struct fsmc_nand_data - structure for FSMC NAND device state
  *
+ * @base:		Inherit from the nand_controller struct
  * @pid:		Part ID on the AMBA PrimeCell format
  * @nand:		Chip related info for a NAND flash.
  *
@@ -143,6 +144,7 @@ enum access_mode {
  * @regs_va:		Registers base address for a given bank.
  */
 struct fsmc_nand_data {
+	struct nand_controller	base;
 	u32			pid;
 	struct nand_chip	nand;
 
@@ -1117,10 +1119,13 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->ecc.strength = 8;
 	}
 
+	nand_controller_init(&host->base);
+	host->base.ops = &fsmc_nand_controller_ops;
+	nand->controller = &host->base;
+
 	/*
 	 * Scan to find existence of the device
 	 */
-	nand->dummy_controller.ops = &fsmc_nand_controller_ops;
 	ret = nand_scan(nand, 1);
 	if (ret)
 		goto release_dma_write_chan;
-- 
2.17.1
