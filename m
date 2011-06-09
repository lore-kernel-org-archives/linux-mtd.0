From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Thu, 9 Jun 2011 10:03:26 +0300
Subject: [PATCH] mtd: nand_bbt: turn pr_debug into pr_info
Message-ID: <mailman.12.1307603051.24103.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

In the previous patch we changed all "prink(KERN_DEBUG" messages with
"pr_debug()", which means that the messages will now disappear unless
they are explicitly enabled with DEBUG macro and dynamic debugging means.

But if you look at those messages, they are information messages like "bad
block table found or re-written", so we do want to see them. This patch turns
those messages into 'pr_info()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/nand/nand_bbt.c |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index a1e51dc..e3b0d62 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -219,14 +219,14 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				if (tmp == msk)
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
-					pr_debug("nand_read_bbt: reserved block at 0x%012llx\n",
-						 (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+					pr_info("nand_read_bbt: reserved block at 0x%012llx\n",
+						(loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
 					mtd->ecc_stats.bbtblocks++;
 					continue;
 				}
-				pr_debug("nand_read_bbt: bad block at 0x%012llx\n",
-					 (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+				pr_info("nand_read_bbt: bad block at 0x%012llx\n",
+					(loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
 				if (tmp == 0)
 					this->bbt[offs + (act >> 3)] |= 0x3 << (act & 0x06);
@@ -379,8 +379,8 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
-		pr_debug("Bad block table at page %d, version 0x%02X\n",
-			 td->pages[0], td->version[0]);
+		pr_info("Bad block table at page %d, version 0x%02X\n",
+			td->pages[0], td->version[0]);
 	}
 
 	/* Read the mirror version, if available */
@@ -388,8 +388,8 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
-		pr_debug("Bad block table at page %d, version 0x%02X\n",
-			 md->pages[0], md->version[0]);
+		pr_info("Bad block table at page %d, version 0x%02X\n",
+			md->pages[0], md->version[0]);
 	}
 	return 1;
 }
@@ -492,7 +492,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	} else {
 		if (chip >= this->numchips) {
 			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
-			       chip + 1, this->numchips);
+				chip + 1, this->numchips);
 			return -EINVAL;
 		}
 		numblocks = this->chipsize >> (this->bbt_erase_shift - 1);
@@ -605,8 +605,8 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 		if (td->pages[i] == -1)
 			pr_warn("Bad block table not found for chip %d\n", i);
 		else
-			pr_debug("Bad block table found at page %d, version "
-				 "0x%02X\n", td->pages[i], td->version[i]);
+			pr_info("Bad block table found at page %d, version "
+				"0x%02X\n", td->pages[i], td->version[i]);
 	}
 	return 0;
 }
@@ -834,8 +834,8 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		if (res < 0)
 			goto outerr;
 
-		pr_debug("Bad block table written to 0x%012llx, version 0x%02X\n",
-			 (unsigned long long)to, td->version[chip]);
+		pr_info("Bad block table written to 0x%012llx, version 0x%02X\n",
+			(unsigned long long)to, td->version[chip]);
 
 		/* Mark it as used */
 		td->pages[chip] = page;
-- 
1.7.2.3


-- 
Best Regards,
Artem Bityutskiy (?????????? ????????????????)
