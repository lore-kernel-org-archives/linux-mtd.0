Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXWvK-0002xB-Dt
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 15:59:39 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 3/5] mtd: nand: use nand_check_erased_ecc_chunk in default
 ECC read functions
Date: Thu,  3 Sep 2015 17:58:48 +0200
Message-Id: <1441295932-14868-7-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1441295932-14868-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1441295932-14868-1-git-send-email-boris.brezillon@free-electrons.com>
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
 drivers/mtd/nand/nand_base.c | 50 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a2687ea..9a109a5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1419,6 +1419,15 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 
 		stat = chip->ecc.correct(mtd, p,
 			&chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
+		if (stat == -EBADMSG) {
+			/* check for empty pages with bitflips */
+			stat = nand_check_erased_ecc_chunk(p, chip->ecc.size,
+						&chip->buffers->ecccode[i],
+						chip->ecc.bytes,
+						NULL, 0,
+						chip->ecc.strength);
+		}
+
 		if (stat < 0) {
 			mtd->ecc_stats.failed++;
 		} else {
@@ -1468,6 +1477,14 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 		int stat;
 
 		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
+		if (stat == -EBADMSG) {
+			/* check for empty pages with bitflips */
+			stat = nand_check_erased_ecc_chunk(p, eccsize,
+						&ecc_code[i], eccbytes,
+						NULL, 0,
+						chip->ecc.strength);
+		}
+
 		if (stat < 0) {
 			mtd->ecc_stats.failed++;
 		} else {
@@ -1520,6 +1537,14 @@ static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
 		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
 
 		stat = chip->ecc.correct(mtd, p, &ecc_code[i], NULL);
+		if (stat == -EBADMSG) {
+			/* check for empty pages with bitflips */
+			stat = nand_check_erased_ecc_chunk(p, eccsize,
+						&ecc_code[i], eccbytes,
+						NULL, 0,
+						chip->ecc.strength);
+		}
+
 		if (stat < 0) {
 			mtd->ecc_stats.failed++;
 		} else {
@@ -1547,6 +1572,8 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
 	int eccsteps = chip->ecc.steps;
+	int eccstepsize = eccsize + eccbytes + chip->ecc.prepad +
+			  chip->ecc.postpad;
 	uint8_t *p = buf;
 	uint8_t *oob = chip->oob_poi;
 	unsigned int max_bitflips = 0;
@@ -1566,19 +1593,28 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
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
+		if (stat == -EBADMSG) {
+			/* check for empty pages with bitflips */
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
