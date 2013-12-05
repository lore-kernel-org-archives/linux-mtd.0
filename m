Received: from mail-qe0-x231.google.com ([2607:f8b0:400d:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VofPS-0004WD-RN
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 20:20:31 +0000
Received: by mail-qe0-f49.google.com with SMTP id w7so17436092qeb.8
 for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2013 12:20:09 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] mtd: nand: localize ECC failures per page
Date: Thu,  5 Dec 2013 12:19:57 -0800
Message-Id: <1386274800-22013-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ECC failures can be tracked at the page level, not the do_read_ops level
(i.e., a potentially multi-page transaction).

This helps prepare for READ RETRY support.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index bd39f7b67906..239f1dacee58 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1420,7 +1420,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 {
 	int chipnr, page, realpage, col, bytes, aligned, oob_required;
 	struct nand_chip *chip = mtd->priv;
-	struct mtd_ecc_stats stats;
 	int ret = 0;
 	uint32_t readlen = ops->len;
 	uint32_t oobreadlen = ops->ooblen;
@@ -1430,7 +1429,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	uint8_t *bufpoi, *oob, *buf;
 	unsigned int max_bitflips = 0;
 
-	stats = mtd->ecc_stats;
+	bool ecc_fail = false;
 
 	chipnr = (int)(from >> chip->chip_shift);
 	chip->select_chip(mtd, chipnr);
@@ -1445,6 +1444,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	oob_required = oob ? 1 : 0;
 
 	while (1) {
+		unsigned int ecc_failures = mtd->ecc_stats.failed;
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
 
@@ -1481,7 +1481,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			/* Transfer not aligned data */
 			if (!aligned) {
 				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
-				    !(mtd->ecc_stats.failed - stats.failed) &&
+				    !(mtd->ecc_stats.failed - ecc_failures) &&
 				    (ops->mode != MTD_OPS_RAW)) {
 					chip->pagebuf = realpage;
 					chip->pagebuf_bitflips = ret;
@@ -1511,6 +1511,9 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				else
 					nand_wait_ready(mtd);
 			}
+
+			if (mtd->ecc_stats.failed - ecc_failures)
+				ecc_fail = true;
 		} else {
 			memcpy(buf, chip->buffers->databuf + col, bytes);
 			buf += bytes;
@@ -1545,7 +1548,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	if (ret < 0)
 		return ret;
 
-	if (mtd->ecc_stats.failed - stats.failed)
+	if (ecc_fail)
 		return -EBADMSG;
 
 	return max_bitflips;
-- 
1.8.5
