Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZToNy-0004qU-V3
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 09:49:51 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 2/2] mtd: nand: use nand_check_erased_ecc_chunk in default
 ECC read functions
Date: Mon, 24 Aug 2015 11:47:22 +0200
Message-Id: <1440409642-5495-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1440409642-5495-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1440409642-5495-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The default NAND read functions are relying on an underlying controller
to correct bitflips, but some of those controller cannot properly fix
bitflips in erased pages.
In case of ECC failures, check if the page of subpage is empty before
reporting an ECC failure.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 62 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4d2ef65..e095d86 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1400,6 +1400,19 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 		stat = chip->ecc.correct(mtd, p,
 			&chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
 		if (stat < 0) {
+			/* check for empty pages with bitflips */
+			int col = (int)(p - bufpoi);
+
+			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, col, -1);
+			chip->read_buf(mtd, p, chip->ecc.size);
+			stat = nand_check_erased_ecc_chunk(p, chip->ecc.size,
+						&chip->buffers->ecccode[i],
+						chip->ecc.bytes,
+						NULL, 0,
+						chip->ecc.strength);
+		}
+
+		if (stat < 0) {
 			mtd->ecc_stats.failed++;
 		} else {
 			mtd->ecc_stats.corrected += stat;
@@ -1449,6 +1462,16 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 
 		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
 		if (stat < 0) {
+			/* check for empty pages with bitflips */
+			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, i, -1);
+			chip->read_buf(mtd, p, eccsize);
+			stat = nand_check_erased_ecc_chunk(p, eccsize,
+						&ecc_code[i], eccbytes,
+						NULL, 0,
+						chip->ecc.strength);
+		}
+
+		if (stat < 0) {
 			mtd->ecc_stats.failed++;
 		} else {
 			mtd->ecc_stats.corrected += stat;
@@ -1501,6 +1524,17 @@ static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
 
 		stat = chip->ecc.correct(mtd, p, &ecc_code[i], NULL);
 		if (stat < 0) {
+			/* check for empty pages with bitflips */
+			chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
+				      i + mtd->oobsize, -1);
+			chip->read_buf(mtd, p, eccsize);
+			stat = nand_check_erased_ecc_chunk(p, eccsize,
+						&ecc_code[i], eccbytes,
+						NULL, 0,
+						chip->ecc.strength);
+		}
+
+		if (stat < 0) {
 			mtd->ecc_stats.failed++;
 		} else {
 			mtd->ecc_stats.corrected += stat;
@@ -1527,6 +1561,8 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
 	int eccsteps = chip->ecc.steps;
+	int eccstepsize = eccsize + eccbytes + chip->ecc.prepad +
+			  chip->ecc.postpad;
 	uint8_t *p = buf;
 	uint8_t *oob = chip->oob_poi;
 	unsigned int max_bitflips = 0;
@@ -1546,19 +1582,31 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->read_buf(mtd, oob, eccbytes);
 		stat = chip->ecc.correct(mtd, p, oob, NULL);
 
-		if (stat < 0) {
-			mtd->ecc_stats.failed++;
-		} else {
-			mtd->ecc_stats.corrected += stat;
-			max_bitflips = max_t(unsigned int, max_bitflips, stat);
-		}
-
 		oob += eccbytes;
 
 		if (chip->ecc.postpad) {
 			chip->read_buf(mtd, oob, chip->ecc.postpad);
 			oob += chip->ecc.postpad;
 		}
+
+		if (stat < 0) {
+			/* check for empty pages with bitflips */
+			chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
+				      i * eccstepsize, -1);
+			chip->read_buf(mtd, p, chip->ecc.size);
+			stat = nand_check_erased_ecc_chunk(p, chip->ecc.size,
+							   oob - eccstepsize,
+							   eccstepsize,
+							   NULL, 0,
+							   chip->ecc.strength);
+		}
+
+		if (stat < 0) {
+			mtd->ecc_stats.failed++;
+		} else {
+			mtd->ecc_stats.corrected += stat;
+			max_bitflips = max_t(unsigned int, max_bitflips, stat);
+		}
 	}
 
 	/* Calculate remaining oob bytes */
-- 
1.9.1
