Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aak64-0004tw-MI
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2016 13:12:17 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Herve Codina <herve.CODINA@celad.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH] mtd: nand: atmel: correct bitflips in erased pages for
 pre-sama5d4 SoCs
Date: Tue,  1 Mar 2016 14:11:52 +0100
Message-Id: <1456837912-2577-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

New atmel SoCs are able to fix bitflips in erased pages, but old ones
are still impacted by this problem. Use nand_check_erased_ecc_chunk() to
handle this case.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Reported-by: Herve Codina <herve.CODINA@celad.com>
---
 drivers/mtd/nand/atmel_nand.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 20cbaab..0b5da72 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -863,17 +863,6 @@ static int pmecc_correction(struct mtd_info *mtd, u32 pmecc_stat, uint8_t *buf,
 	uint8_t *buf_pos;
 	int max_bitflips = 0;
 
-	/* If can correct bitfilps from erased page, do the normal check */
-	if (host->caps->pmecc_correct_erase_page)
-		goto normal_check;
-
-	for (i = 0; i < nand_chip->ecc.total; i++)
-		if (ecc[i] != 0xff)
-			goto normal_check;
-	/* Erased page, return OK */
-	return 0;
-
-normal_check:
 	for (i = 0; i < nand_chip->ecc.steps; i++) {
 		err_nbr = 0;
 		if (pmecc_stat & 0x1) {
@@ -884,16 +873,30 @@ normal_check:
 			pmecc_get_sigma(mtd);
 
 			err_nbr = pmecc_err_location(mtd);
-			if (err_nbr == -1) {
+			if (err_nbr >= 0) {
+				pmecc_correct_data(mtd, buf_pos, ecc, i,
+						   nand_chip->ecc.bytes,
+						   err_nbr);
+			} else if (!host->caps->pmecc_correct_erase_page) {
+				u8 *ecc_pos = ecc + (i * nand_chip->ecc.bytes);
+
+				/* Try to detect erased pages */
+				err_nbr = nand_check_erased_ecc_chunk(buf_pos,
+							host->pmecc_sector_size,
+							ecc_pos,
+							nand_chip->ecc.bytes,
+							NULL, 0,
+							nand_chip->ecc.strength);
+			}
+
+			if (err_nbr < 0) {
 				dev_err(host->dev, "PMECC: Too many errors\n");
 				mtd->ecc_stats.failed++;
 				return -EIO;
-			} else {
-				pmecc_correct_data(mtd, buf_pos, ecc, i,
-					nand_chip->ecc.bytes, err_nbr);
-				mtd->ecc_stats.corrected += err_nbr;
-				max_bitflips = max_t(int, max_bitflips, err_nbr);
 			}
+
+			mtd->ecc_stats.corrected += err_nbr;
+			max_bitflips = max_t(int, max_bitflips, err_nbr);
 		}
 		pmecc_stat >>= 1;
 	}
-- 
2.1.4
