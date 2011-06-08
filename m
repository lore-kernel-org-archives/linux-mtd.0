Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUNVA-0002Ic-W2
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 18:29:14 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 4/4] mtd: nand: define pr_fmt() to include __func__
	in debug output
Date: Wed, 8 Jun 2011 11:28:28 -0700
Message-ID: <1307557708-31376-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <BANLkTi=7Xivud_V=uMadL1BA-1ZC7V9RYw@mail.gmail.com>
References: <BANLkTi=7Xivud_V=uMadL1BA-1ZC7V9RYw@mail.gmail.com>
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

Also fix some capitalization that went along with the affected lines.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   44 +++++++++++++++++++++---------------------
 1 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 5835404..3deced4 100644
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
+				pr_info("error reading bad block table\n");
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
+					pr_debug("reserved block at 0x%012llx\n",
 					       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
 					mtd->ecc_stats.bbtblocks++;
 					continue;
 				}
-				pr_debug("nand_read_bbt: Bad block at 0x%012llx\n",
+				pr_debug("bad block at 0x%012llx\n",
 				       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
 				if (tmp == 0)
@@ -379,7 +381,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
-		pr_debug("Bad block table at page %d, version 0x%02X\n",
+		pr_debug("bad block table at page %d, version 0x%02X\n",
 		       td->pages[0], td->version[0]);
 	}
 
@@ -388,7 +390,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
-		pr_debug("Bad block table at page %d, version 0x%02X\n",
+		pr_debug("bad block table at page %d, version 0x%02X\n",
 		       md->pages[0], md->version[0]);
 	}
 	return 1;
@@ -462,7 +464,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	loff_t from;
 	size_t readlen;
 
-	pr_info("Scanning device for bad blocks\n");
+	pr_info("scanning device for bad blocks\n");
 
 	if (bd->options & NAND_BBT_SCANALLPAGES)
 		len = 1 << (this->bbt_erase_shift - this->page_shift);
@@ -491,7 +493,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		from = 0;
 	} else {
 		if (chip >= this->numchips) {
-			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
+			pr_warn("chipnr (%d) > available chips (%d)\n",
 			       chip + 1, this->numchips);
 			return -EINVAL;
 		}
@@ -520,7 +522,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 		if (ret) {
 			this->bbt[i >> 3] |= 0x03 << (i & 0x6);
-			pr_warn("Bad eraseblock %d at 0x%012llx\n",
+			pr_warn("bad eraseblock %d at 0x%012llx\n",
 			       i >> 1, (unsigned long long)from);
 			mtd->ecc_stats.badblocks++;
 		}
@@ -603,9 +605,9 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 	/* Check, if we found a bbt for each requested chip */
 	for (i = 0; i < chips; i++) {
 		if (td->pages[i] == -1)
-			pr_warn("Bad block table not found for chip %d\n", i);
+			pr_warn("bad block table not found for chip %d\n", i);
 		else
-			pr_debug("Bad block table found at page %d, version "
+			pr_debug("bad block table found at page %d, version "
 				 "0x%02X\n", td->pages[i], td->version[i]);
 	}
 	return 0;
@@ -719,7 +721,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			if (!md || md->pages[chip] != page)
 				goto write;
 		}
-		pr_err("No space left to write bad block table\n");
+		pr_err("no space left to write bad block table\n");
 		return -ENOSPC;
 	write:
 
@@ -754,14 +756,12 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			res = mtd->read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
-					pr_info("nand_bbt: Error "
-					       "reading block for writing "
-					       "the bad block table\n");
+					pr_info("error reading block for writing"
+						" the bad block table\n");
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
@@ -836,8 +836,8 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		if (res < 0)
 			goto outerr;
 
-		pr_debug("Bad block table written to 0x%012llx, version "
-		       "0x%02X\n", (unsigned long long)to, td->version[chip]);
+		pr_debug("bad block table written to 0x%012llx, version "
+			 "0x%02X\n", (unsigned long long)to, td->version[chip]);
 
 		/* Mark it as used */
 		td->pages[chip] = page;
@@ -845,7 +845,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 	return 0;
 
  outerr:
-	pr_warning("nand_bbt: Error while writing bad block table %d\n", res);
+	pr_warning("error while writing bad block table %d\n", res);
 	return res;
 }
 
@@ -1125,7 +1125,7 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	 */
 	if (!td) {
 		if ((res = nand_memory_bbt(mtd, bd))) {
-			pr_err("nand_bbt: Can't scan flash and build the RAM-based BBT\n");
+			pr_err("can't scan flash and build the RAM-based BBT\n");
 			kfree(this->bbt);
 			this->bbt = NULL;
 		}
-- 
1.7.0.4
