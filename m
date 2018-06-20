Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVXng-0001tR-Jg
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 07:45:10 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] mtd: rawnand: micron: Update ecc_stats.corrected
Date: Wed, 20 Jun 2018 09:44:43 +0200
Message-Id: <20180620074443.30235-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Even if we can't update ecc_stats.corrected with an accurate value we
should at least increase the number of bitflips so that MTD users can
know that there was some bitflips.

Just add chip->ecc.strength to mtd->ecc_stats.corrected which should
account for the worst case situation.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_micron.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 5ec4c90a637d..203faba0a9c1 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -137,18 +137,19 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
 	if (ret)
 		goto out;
 
-	if (status & NAND_STATUS_FAIL)
+	if (status & NAND_STATUS_FAIL) {
 		mtd->ecc_stats.failed++;
-
-	/*
-	 * The internal ECC doesn't tell us the number of bitflips
-	 * that have been corrected, but tells us if it recommends to
-	 * rewrite the block. If it's the case, then we pretend we had
-	 * a number of bitflips equal to the ECC strength, which will
-	 * hint the NAND core to rewrite the block.
-	 */
-	else if (status & NAND_STATUS_WRITE_RECOMMENDED)
+	} else if (status & NAND_STATUS_WRITE_RECOMMENDED) {
+		/*
+		 * The internal ECC doesn't tell us the number of bitflips
+		 * that have been corrected, but tells us if it recommends to
+		 * rewrite the block. If it's the case, then we pretend we had
+		 * a number of bitflips equal to the ECC strength, which will
+		 * hint the NAND core to rewrite the block.
+		 */
+		mtd->ecc_stats.corrected += chip->ecc.strength;
 		max_bitflips = chip->ecc.strength;
+	}
 
 	ret = nand_read_data_op(chip, buf, mtd->writesize, false);
 	if (!ret && oob_required)
-- 
2.14.1
