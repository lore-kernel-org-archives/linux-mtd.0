Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiJu4-0000Ky-To
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 13:32:36 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>, Stefan Agner <stefan@agner.ch>,
 Lucas Stach <dev@lynxeye.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 10/17] mtd: rawnand: jz4740: group nand_scan_{ident,
 tail} calls
Date: Wed, 25 Jul 2018 15:31:45 +0200
Message-Id: <20180725133152.30898-11-miquel.raynal@bootlin.com>
In-Reply-To: <20180725133152.30898-1-miquel.raynal@bootlin.com>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Prepare the migration to nand_scan() by moving both calls to
nand_scan_ident() and nand_scan_tail() in a single spot.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/jz4740_nand.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
index 3abf87420c10..09541608a45f 100644
--- a/drivers/mtd/nand/raw/jz4740_nand.c
+++ b/drivers/mtd/nand/raw/jz4740_nand.c
@@ -309,6 +309,7 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
 			       size_t chipnr, uint8_t *nand_maf_id,
 			       uint8_t *nand_dev_id)
 {
+	struct jz_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	int ret;
 	char res_name[6];
 	uint32_t ctrl;
@@ -335,8 +336,19 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
 		if (ret)
 			goto notfound_id;
 
+		if (pdata && pdata->ident_callback)
+			pdata->ident_callback(pdev, mtd, &pdata->partitions,
+					      &pdata->num_partitions);
+
+		ret = nand_scan_tail(mtd);
+		if (ret) {
+			dev_err(&pdev->dev,  "Failed to scan NAND\n");
+			goto notfound_id;
+		}
+
 		/* Retrieve the IDs from the first chip. */
 		chip->select_chip(mtd, 0);
+
 		nand_reset_op(chip);
 		nand_readid_op(chip, 0, id, sizeof(id));
 		*nand_maf_id = id[0];
@@ -456,17 +468,6 @@ static int jz_nand_probe(struct platform_device *pdev)
 		goto err_iounmap_mmio;
 	}
 
-	if (pdata && pdata->ident_callback) {
-		pdata->ident_callback(pdev, mtd, &pdata->partitions,
-					&pdata->num_partitions);
-	}
-
-	ret = nand_scan_tail(mtd);
-	if (ret) {
-		dev_err(&pdev->dev,  "Failed to scan NAND\n");
-		goto err_unclaim_banks;
-	}
-
 	ret = mtd_device_register(mtd, pdata ? pdata->partitions : NULL,
 				  pdata ? pdata->num_partitions : 0);
 
@@ -481,7 +482,6 @@ static int jz_nand_probe(struct platform_device *pdev)
 
 err_cleanup_nand:
 	nand_cleanup(chip);
-err_unclaim_banks:
 	while (chipnr--) {
 		unsigned char bank = nand->banks[chipnr];
 		jz_nand_iounmap_resource(nand->bank_mem[bank - 1],
-- 
2.14.1
