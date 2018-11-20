Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1vn-0005mD-JC
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 09:02:56 +0000
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
Subject: [PATCH 03/10] mtd: rawnand: fsmc: Make conversion from chip to fsmc
 consistent
Date: Tue, 20 Nov 2018 10:02:32 +0100
Message-Id: <20181120090239.5792-4-boris.brezillon@bootlin.com>
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

nand_to_fsmc() is used almost everywhere except in
fsmc_setup_data_interface() where nand_get_controller_data() is used
instead. Make that consistent and drop the nand_set_controller_data()
call in the probe path.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 01044b858a93..23d00a2c926f 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -344,7 +344,7 @@ static int fsmc_calc_timings(struct fsmc_nand_data *host,
 static int fsmc_setup_data_interface(struct nand_chip *nand, int csline,
 				     const struct nand_data_interface *conf)
 {
-	struct fsmc_nand_data *host = nand_get_controller_data(nand);
+	struct fsmc_nand_data *host = nand_to_fsmc(nand);
 	struct fsmc_nand_timings tims;
 	const struct nand_sdr_timings *sdrt;
 	int ret;
@@ -1076,7 +1076,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 
 	/* Link all private pointers */
 	mtd = nand_to_mtd(&host->nand);
-	nand_set_controller_data(nand, host);
 	nand_set_flash_node(nand, pdev->dev.of_node);
 
 	mtd->dev.parent = &pdev->dev;
-- 
2.17.1
