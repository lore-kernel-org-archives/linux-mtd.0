Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiJu4-0000LJ-UC
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 13:32:43 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>, Stefan Agner <stefan@agner.ch>,
 Lucas Stach <dev@lynxeye.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 13/17] mtd: rawnand: txx9ndfmc: clarify ECC parameters
 assignation
Date: Wed, 25 Jul 2018 15:31:48 +0200
Message-Id: <20180725133152.30898-14-miquel.raynal@bootlin.com>
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

A comment in the probe declares that values are assigned to ecc.size
and ecc.bytes, but these values will be overwritten. This is not
entirely right as they are overwritten only if
mtd->writesize >= 512. Let's clarify this by moving these assignations
to txx9ndfmc_nand_scan().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 9019022774f7..9808b18b15e2 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -262,10 +262,13 @@ static int txx9ndfmc_nand_scan(struct mtd_info *mtd)
 	ret = nand_scan_ident(mtd, 1, NULL);
 	if (!ret) {
 		if (mtd->writesize >= 512) {
-			/* Hardware ECC 6 byte ECC per 512 Byte data */
 			chip->ecc.size = 512;
 			chip->ecc.bytes = 6;
+		} else {
+			chip->ecc.size = 256;
+			chip->ecc.bytes = 3;
 		}
+
 		ret = nand_scan_tail(mtd);
 	}
 	return ret;
@@ -332,9 +335,6 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		chip->ecc.correct = txx9ndfmc_correct_data;
 		chip->ecc.hwctl = txx9ndfmc_enable_hwecc;
 		chip->ecc.mode = NAND_ECC_HW;
-		/* txx9ndfmc_nand_scan will overwrite ecc.size and ecc.bytes */
-		chip->ecc.size = 256;
-		chip->ecc.bytes = 3;
 		chip->ecc.strength = 1;
 		chip->chip_delay = 100;
 		chip->controller = &drvdata->controller;
-- 
2.14.1
