Received: from mail-oa0-x229.google.com ([2607:f8b0:4003:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq79J-0000hD-6U
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 20:09:49 +0000
Received: by mail-oa0-f41.google.com with SMTP id j17so4454154oag.14
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 12:09:25 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 1/4] mtd: nand: localize ECC failures per page
Date: Mon,  9 Dec 2013 12:09:10 -0800
Message-Id: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
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
v1 -> v2: no change

 drivers/mtd/nand/nand_base.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9b3bb3c519e9..e85b07f4293d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1422,7 +1422,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 {
 	int chipnr, page, realpage, col, bytes, aligned, oob_required;
 	struct nand_chip *chip = mtd->priv;
-	struct mtd_ecc_stats stats;
 	int ret = 0;
 	uint32_t readlen = ops->len;
 	uint32_t oobreadlen = ops->ooblen;
@@ -1432,7 +1431,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	uint8_t *bufpoi, *oob, *buf;
 	unsigned int max_bitflips = 0;
 
-	stats = mtd->ecc_stats;
+	bool ecc_fail = false;
 
 	chipnr = (int)(from >> chip->chip_shift);
 	chip->select_chip(mtd, chipnr);
@@ -1447,6 +1446,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	oob_required = oob ? 1 : 0;
 
 	while (1) {
+		unsigned int ecc_failures = mtd->ecc_stats.failed;
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
 
@@ -1483,7 +1483,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			/* Transfer not aligned data */
 			if (!aligned) {
 				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
-				    !(mtd->ecc_stats.failed - stats.failed) &&
+				    !(mtd->ecc_stats.failed - ecc_failures) &&
 				    (ops->mode != MTD_OPS_RAW)) {
 					chip->pagebuf = realpage;
 					chip->pagebuf_bitflips = ret;
@@ -1513,6 +1513,9 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				else
 					nand_wait_ready(mtd);
 			}
+
+			if (mtd->ecc_stats.failed - ecc_failures)
+				ecc_fail = true;
 		} else {
 			memcpy(buf, chip->buffers->databuf + col, bytes);
 			buf += bytes;
@@ -1547,7 +1550,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	if (ret < 0)
 		return ret;
 
-	if (mtd->ecc_stats.failed - stats.failed)
+	if (ecc_fail)
 		return -EBADMSG;
 
 	return max_bitflips;
-- 
1.8.5
