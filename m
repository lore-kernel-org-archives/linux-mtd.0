Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QU5Hq-0002Fk-OH
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 23:02:15 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 4/4] mtd: nand: define pr_fmt() to include __func__ in
	debug output
Date: Tue, 7 Jun 2011 16:01:57 -0700
Message-ID: <1307487717-25402-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1307487717-25402-1-git-send-email-computersforpeace@gmail.com>
References: <1307487717-25402-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   23 ++++++++++++-----------
 1 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 4d18098..e2c9948 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -59,6 +59,8 @@
  *
  */
 
+#define pr_fmt(fmt) "%s: " fmt, __func__
+
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
@@ -205,10 +207,10 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		res = mtd->read(mtd, from, len, &retlen, buf);
 		if (res < 0) {
 			if (retlen != len) {
-				pr_info("nand_bbt: Error reading bad block table\n");
+				pr_info("Error reading bad block table\n");
 				return res;
 			}
-			pr_warn("nand_bbt: ECC error while reading bad block table\n");
+			pr_warn("ECC error while reading bad block table\n");
 		}
 
 		/* Analyse data */
@@ -219,13 +221,13 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				if (tmp == msk)
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
-					pr_debug("nand_read_bbt: Reserved block at 0x%012llx\n",
+					pr_debug("Reserved block at 0x%012llx\n",
 					       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
 					mtd->ecc_stats.bbtblocks++;
 					continue;
 				}
-				pr_debug("nand_read_bbt: Bad block at 0x%012llx\n",
+				pr_debug("Bad block at 0x%012llx\n",
 				       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
 				if (tmp == 0)
@@ -491,7 +493,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		from = 0;
 	} else {
 		if (chip >= this->numchips) {
-			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
+			pr_warn("chipnr (%d) > available chips (%d)\n",
 			       chip + 1, this->numchips);
 			return -EINVAL;
 		}
@@ -754,14 +756,13 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			res = mtd->read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
-					pr_info("nand_bbt: Error "
+					pr_info("Error "
 					       "reading block for writing "
 					       "the bad block table\n");
 					return res;
 				}
-				pr_warn("nand_bbt: ECC error "
-				       "while reading block for writing "
-				       "bad block table\n");
+				pr_warn("ECC error while reading block for "
+					"writing bad block table\n");
 			}
 			/* Read oob data */
 			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
@@ -845,7 +846,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 	return 0;
 
  outerr:
-	pr_warning("nand_bbt: Error while writing bad block table %d\n", res);
+	pr_warning("Error while writing bad block table %d\n", res);
 	return res;
 }
 
@@ -1125,7 +1126,7 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	 */
 	if (!td) {
 		if ((res = nand_memory_bbt(mtd, bd))) {
-			pr_err("nand_bbt: Can't scan flash and build the RAM-based BBT\n");
+			pr_err("Can't scan flash and build the RAM-based BBT\n");
 			kfree(this->bbt);
 			this->bbt = NULL;
 		}
-- 
1.7.0.4
