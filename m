Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afIb7-0004o7-AL
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 02:51:15 +0000
Received: by mail-pa0-x244.google.com with SMTP id hj7so13598804pac.1
 for <linux-mtd@lists.infradead.org>; Sun, 13 Mar 2016 19:50:53 -0700 (PDT)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 08/11] mtd: nand_bbt: remove struct nand_chip from nand_bbt.c
Date: Mon, 14 Mar 2016 02:48:01 +0000
Message-Id: <1457923684-13505-9-git-send-email-peterpandong@micron.com>
In-Reply-To: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Brian Norris <computersforpeace@gmail.com>

This commit contains most of modification. But the job is quite
simple --- replace struct nand_chip with struct nand_bbt, nand_bbt_ops
and nand_chip_layout_info . There is no algorithm change, just
replacement.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
[Peter Pan: replacement with struct nand_chip_layout_info]
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/nand_bbt.c | 410 +++++++++++++++++++++++---------------------
 1 file changed, 210 insertions(+), 200 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index d319822..0dda0c5 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -60,8 +60,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/bbm.h>
-#include <linux/mtd/nand.h>
+#include <linux/mtd/nand_bbt.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/vmalloc.h>
@@ -76,20 +75,20 @@
 #define BBT_ENTRY_MASK		0x03
 #define BBT_ENTRY_SHIFT		2
 
-static int nand_update_bbt(struct mtd_info *mtd, loff_t offs);
+static int nand_update_bbt(struct nand_bbt *bbt, loff_t offs);
 
-static inline uint8_t bbt_get_entry(struct nand_chip *chip, int block)
+static inline uint8_t bbt_get_entry(struct nand_bbt *bbt, int block)
 {
-	uint8_t entry = chip->bbt[block >> BBT_ENTRY_SHIFT];
+	uint8_t entry = bbt->bbt[block >> BBT_ENTRY_SHIFT];
 	entry >>= (block & BBT_ENTRY_MASK) * 2;
 	return entry & BBT_ENTRY_MASK;
 }
 
-static inline void bbt_mark_entry(struct nand_chip *chip, int block,
+static inline void bbt_mark_entry(struct nand_bbt *bbt, int block,
 		uint8_t mark)
 {
 	uint8_t msk = (mark & BBT_ENTRY_MASK) << ((block & BBT_ENTRY_MASK) * 2);
-	chip->bbt[block >> BBT_ENTRY_SHIFT] |= msk;
+	bbt->bbt[block >> BBT_ENTRY_SHIFT] |= msk;
 }
 
 static int check_pattern_no_oob(uint8_t *buf, struct nand_bbt_descr *td)
@@ -142,7 +141,7 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
 
 /**
  * read_bbt - [GENERIC] Read the bad block table starting from page
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @buf: temporary buffer
  * @page: the starting page
  * @num: the number of bbt descriptors to read
@@ -151,11 +150,12 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
  *
  * Read the bad block table starting from page.
  */
-static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
+static int read_bbt(struct nand_bbt *bbt, uint8_t *buf, int page, int num,
 		struct nand_bbt_descr *td, int offs)
 {
+	struct mtd_info *mtd = bbt->mtd;
+	struct nand_chip_layout_info *info = bbt->info;
 	int res, ret = 0, i, j, act = 0;
-	struct nand_chip *this = mtd_to_nand(mtd);
 	size_t retlen, len, totlen;
 	loff_t from;
 	int bits = td->options & NAND_BBT_NRBITS_MSK;
@@ -165,10 +165,10 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 
 	totlen = (num * bits) >> 3;
 	marker_len = add_marker_len(td);
-	from = ((loff_t)page) << this->page_shift;
+	from = ((loff_t)page) << info->page_shift;
 
 	while (totlen) {
-		len = min(totlen, (size_t)(1 << this->bbt_erase_shift));
+		len = min(totlen, (size_t)(1 << info->bbt_erase_shift));
 		if (marker_len) {
 			/*
 			 * In case the BBT marker is not in the OOB area it
@@ -204,8 +204,8 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				if (reserved_block_code && (tmp == reserved_block_code)) {
 					pr_info("nand_read_bbt: reserved block at 0x%012llx\n",
 						 (loff_t)(offs + act) <<
-						 this->bbt_erase_shift);
-					bbt_mark_entry(this, offs + act,
+						 info->bbt_erase_shift);
+					bbt_mark_entry(bbt, offs + act,
 							BBT_BLOCK_RESERVED);
 					mtd->ecc_stats.bbtblocks++;
 					continue;
@@ -216,13 +216,13 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				 */
 				pr_info("nand_read_bbt: bad block at 0x%012llx\n",
 					 (loff_t)(offs + act) <<
-					 this->bbt_erase_shift);
+					 info->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
 				if (tmp == 0)
-					bbt_mark_entry(this, offs + act,
+					bbt_mark_entry(bbt, offs + act,
 							BBT_BLOCK_FACTORY_BAD);
 				else
-					bbt_mark_entry(this, offs + act,
+					bbt_mark_entry(bbt, offs + act,
 							BBT_BLOCK_WORN);
 				mtd->ecc_stats.badblocks++;
 			}
@@ -235,7 +235,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 
 /**
  * read_abs_bbt - [GENERIC] Read the bad block table starting at a given page
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @chip: read the table for a specific chip, -1 read all chips; applies only if
@@ -244,25 +244,27 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
  * Read the bad block table for all chips starting at a given page. We assume
  * that the bbt bits are in consecutive order.
  */
-static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td, int chip)
+static int read_abs_bbt(struct nand_bbt *bbt, uint8_t *buf,
+			struct nand_bbt_descr *td, int chip)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = bbt->mtd;
+	struct nand_chip_layout_info *info = bbt->info;
 	int res = 0, i;
 
 	if (td->options & NAND_BBT_PERCHIP) {
 		int offs = 0;
-		for (i = 0; i < this->numchips; i++) {
+		for (i = 0; i < info->numchips; i++) {
 			if (chip == -1 || chip == i)
-				res = read_bbt(mtd, buf, td->pages[i],
-					this->chipsize >> this->bbt_erase_shift,
+				res = read_bbt(bbt, buf, td->pages[i],
+					info->chipsize >> info->bbt_erase_shift,
 					td, offs);
 			if (res)
 				return res;
-			offs += this->chipsize >> this->bbt_erase_shift;
+			offs += info->chipsize >> info->bbt_erase_shift;
 		}
 	} else {
-		res = read_bbt(mtd, buf, td->pages[0],
-				mtd->size >> this->bbt_erase_shift, td, 0);
+		res = read_bbt(bbt, buf, td->pages[0],
+				mtd->size >> info->bbt_erase_shift, td, 0);
 		if (res)
 			return res;
 	}
@@ -270,7 +272,7 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 }
 
 /* BBT marker is in the first page, no OOB */
-static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
+static int scan_read_data(struct nand_bbt *bbt, uint8_t *buf, loff_t offs,
 			 struct nand_bbt_descr *td)
 {
 	size_t retlen;
@@ -280,12 +282,12 @@ static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 	if (td->options & NAND_BBT_VERSION)
 		len++;
 
-	return mtd_read(mtd, offs, len, &retlen, buf);
+	return mtd_read(bbt->mtd, offs, len, &retlen, buf);
 }
 
 /**
  * scan_read_oob - [GENERIC] Scan data+OOB region to buffer
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @buf: temporary buffer
  * @offs: offset at which to scan
  * @len: length of data region to read
@@ -294,9 +296,10 @@ static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
  * page,OOB,page,OOB,... in buf. Completes transfer and returns the "strongest"
  * ECC condition (error or bitflip). May quit on the first (non-ECC) error.
  */
-static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
+static int scan_read_oob(struct nand_bbt *bbt, uint8_t *buf, loff_t offs,
 			 size_t len)
 {
+	struct mtd_info *mtd = bbt->mtd;
 	struct mtd_oob_ops ops;
 	int res, ret = 0;
 
@@ -324,19 +327,20 @@ static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 	return ret;
 }
 
-static int scan_read(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
+static int scan_read(struct nand_bbt *bbt, uint8_t *buf, loff_t offs,
 			 size_t len, struct nand_bbt_descr *td)
 {
 	if (td->options & NAND_BBT_NO_OOB)
-		return scan_read_data(mtd, buf, offs, td);
+		return scan_read_data(bbt, buf, offs, td);
 	else
-		return scan_read_oob(mtd, buf, offs, len);
+		return scan_read_oob(bbt, buf, offs, len);
 }
 
 /* Scan write data with oob to flash */
-static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,
+static int scan_write_bbt(struct nand_bbt *bbt, loff_t offs, size_t len,
 			  uint8_t *buf, uint8_t *oob)
 {
+	struct mtd_info *mtd = bbt->mtd;
 	struct mtd_oob_ops ops;
 
 	ops.mode = MTD_OPS_PLACE_OOB;
@@ -349,18 +353,18 @@ static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,
 	return mtd_write_oob(mtd, offs, &ops);
 }
 
-static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
+static u32 bbt_get_ver_offs(struct nand_bbt *bbt, struct nand_bbt_descr *td)
 {
 	u32 ver_offs = td->veroffs;
 
 	if (!(td->options & NAND_BBT_NO_OOB))
-		ver_offs += mtd->writesize;
+		ver_offs += bbt->mtd->writesize;
 	return ver_offs;
 }
 
 /**
  * read_abs_bbts - [GENERIC] Read the bad block table(s) for all chips starting at a given page
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @md:	descriptor for the bad block table mirror
@@ -368,25 +372,26 @@ static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
  * Read the bad block table(s) for all chips starting at a given page. We
  * assume that the bbt bits are in consecutive order.
  */
-static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
+static void read_abs_bbts(struct nand_bbt *bbt, uint8_t *buf,
 			  struct nand_bbt_descr *td, struct nand_bbt_descr *md)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = bbt->mtd;
+	struct nand_chip_layout_info *info = bbt->info;
 
 	/* Read the primary version, if available */
 	if (td->options & NAND_BBT_VERSION) {
-		scan_read(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
+		scan_read(bbt, buf, (loff_t)td->pages[0] << info->page_shift,
 			      mtd->writesize, td);
-		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
+		td->version[0] = buf[bbt_get_ver_offs(bbt, td)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
 			 td->pages[0], td->version[0]);
 	}
 
 	/* Read the mirror version, if available */
 	if (md && (md->options & NAND_BBT_VERSION)) {
-		scan_read(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
+		scan_read(bbt, buf, (loff_t)md->pages[0] << info->page_shift,
 			      mtd->writesize, md);
-		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
+		md->version[0] = buf[bbt_get_ver_offs(bbt, md)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
 			 md->pages[0], md->version[0]);
 	}
@@ -394,60 +399,60 @@ static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 
 /**
  * create_bbt - [GENERIC] Create a bad block table by scanning the device
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @chip: create the table for a specific chip, -1 read all chips; applies only
  *        if NAND_BBT_PERCHIP option is set
  *
  * Create a bad block table by scanning the device for the given good/bad block
  * identify pattern.
  */
-static int create_bbt(struct mtd_info *mtd, int chip)
+static int create_bbt(struct nand_bbt *bbt, int chip)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = bbt->mtd;
+	struct nand_chip_layout_info *info = bbt->info;
 	int i, numblocks, startblock;
 	loff_t from;
-	struct nand_bbt *nand_bbt = nand_get_bbt(this);
 
 	pr_info("Scanning device for bad blocks\n");
 
 	if (chip == -1) {
-		numblocks = mtd->size >> this->bbt_erase_shift;
+		numblocks = mtd->size >> info->bbt_erase_shift;
 		startblock = 0;
 		from = 0;
 	} else {
-		if (chip >= this->numchips) {
+		if (chip >= info->numchips) {
 			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
-			       chip + 1, this->numchips);
+			       chip + 1, info->numchips);
 			return -EINVAL;
 		}
-		numblocks = this->chipsize >> this->bbt_erase_shift;
+		numblocks = info->chipsize >> info->bbt_erase_shift;
 		startblock = chip * numblocks;
 		numblocks += startblock;
-		from = (loff_t)startblock << this->bbt_erase_shift;
+		from = (loff_t)startblock << info->bbt_erase_shift;
 	}
 
 	for (i = startblock; i < numblocks; i++) {
 		int ret;
 
-		ret = nand_bbt->bbt_ops->is_bad_bbm(mtd, from);
+		ret = bbt->bbt_ops->is_bad_bbm(mtd, from);
 		if (ret < 0)
 			return ret;
 
 		if (ret) {
-			bbt_mark_entry(this, i, BBT_BLOCK_FACTORY_BAD);
+			bbt_mark_entry(bbt, i, BBT_BLOCK_FACTORY_BAD);
 			pr_warn("Bad eraseblock %d at 0x%012llx\n",
 				i, (unsigned long long)from);
 			mtd->ecc_stats.badblocks++;
 		}
 
-		from += (1 << this->bbt_erase_shift);
+		from += (1 << info->bbt_erase_shift);
 	}
 	return 0;
 }
 
 /**
  * search_bbt - [GENERIC] scan the device for a specific bad block table
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  *
@@ -460,18 +465,20 @@ static int create_bbt(struct mtd_info *mtd, int chip)
  *
  * The bbt ident pattern resides in the oob area of the first page in a block.
  */
-static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td)
+static int search_bbt(struct nand_bbt *bbt, uint8_t *buf,
+			struct nand_bbt_descr *td)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = bbt->mtd;
+	struct nand_chip_layout_info *info = bbt->info;
 	int i, chips;
 	int startblock, block, dir;
 	int scanlen = mtd->writesize + mtd->oobsize;
 	int bbtblocks;
-	int blocktopage = this->bbt_erase_shift - this->page_shift;
+	int blocktopage = info->bbt_erase_shift - info->page_shift;
 
 	/* Search direction top -> down? */
 	if (td->options & NAND_BBT_LASTBLOCK) {
-		startblock = (mtd->size >> this->bbt_erase_shift) - 1;
+		startblock = (mtd->size >> info->bbt_erase_shift) - 1;
 		dir = -1;
 	} else {
 		startblock = 0;
@@ -480,12 +487,12 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		chips = this->numchips;
-		bbtblocks = this->chipsize >> this->bbt_erase_shift;
+		chips = info->numchips;
+		bbtblocks = info->chipsize >> info->bbt_erase_shift;
 		startblock &= bbtblocks - 1;
 	} else {
 		chips = 1;
-		bbtblocks = mtd->size >> this->bbt_erase_shift;
+		bbtblocks = mtd->size >> info->bbt_erase_shift;
 	}
 
 	for (i = 0; i < chips; i++) {
@@ -496,20 +503,20 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 		for (block = 0; block < td->maxblocks; block++) {
 
 			int actblock = startblock + dir * block;
-			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
+			loff_t offs = (loff_t)actblock << info->bbt_erase_shift;
 
 			/* Read first page */
-			scan_read(mtd, buf, offs, mtd->writesize, td);
+			scan_read(bbt, buf, offs, mtd->writesize, td);
 			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
 				td->pages[i] = actblock << blocktopage;
 				if (td->options & NAND_BBT_VERSION) {
-					offs = bbt_get_ver_offs(mtd, td);
+					offs = bbt_get_ver_offs(bbt, td);
 					td->version[i] = buf[offs];
 				}
 				break;
 			}
 		}
-		startblock += this->chipsize >> this->bbt_erase_shift;
+		startblock += info->chipsize >> info->bbt_erase_shift;
 	}
 	/* Check, if we found a bbt for each requested chip */
 	for (i = 0; i < chips; i++) {
@@ -524,28 +531,28 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 
 /**
  * search_read_bbts - [GENERIC] scan the device for bad block table(s)
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @md: descriptor for the bad block table mirror
  *
  * Search and read the bad block table(s).
  */
-static void search_read_bbts(struct mtd_info *mtd, uint8_t *buf,
+static void search_read_bbts(struct nand_bbt *bbt, uint8_t *buf,
 			     struct nand_bbt_descr *td,
 			     struct nand_bbt_descr *md)
 {
 	/* Search the primary table */
-	search_bbt(mtd, buf, td);
+	search_bbt(bbt, buf, td);
 
 	/* Search the mirror table */
 	if (md)
-		search_bbt(mtd, buf, md);
+		search_bbt(bbt, buf, md);
 }
 
 /**
  * write_bbt - [GENERIC] (Re)write the bad block table
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @md: descriptor for the bad block table mirror
@@ -553,11 +560,12 @@ static void search_read_bbts(struct mtd_info *mtd, uint8_t *buf,
  *
  * (Re)write the bad block table.
  */
-static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
+static int write_bbt(struct nand_bbt *bbt, uint8_t *buf,
 		     struct nand_bbt_descr *td, struct nand_bbt_descr *md,
 		     int chipsel)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = bbt->mtd;
+	struct nand_chip_layout_info *info = bbt->info;
 	int i, res, chip = 0;
 	int bits, startblock, dir, page, offs, numblocks, sft, sftmsk;
 	int nrchips, pageoffs, ooboffs;
@@ -566,7 +574,6 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 	size_t retlen, len = 0;
 	loff_t to;
 	struct mtd_oob_ops ops;
-	struct nand_bbt *nand_bbt = nand_get_bbt(this);
 
 	ops.ooblen = mtd->oobsize;
 	ops.ooboffs = 0;
@@ -577,16 +584,16 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		rcode = 0xff;
 	/* Write bad block table per chip rather than per device? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		numblocks = (int)(this->chipsize >> this->bbt_erase_shift);
+		numblocks = (int)(info->chipsize >> info->bbt_erase_shift);
 		/* Full device write or specific chip? */
 		if (chipsel == -1) {
-			nrchips = this->numchips;
+			nrchips = info->numchips;
 		} else {
 			nrchips = chipsel + 1;
 			chip = chipsel;
 		}
 	} else {
-		numblocks = (int)(mtd->size >> this->bbt_erase_shift);
+		numblocks = (int)(mtd->size >> info->bbt_erase_shift);
 		nrchips = 1;
 	}
 
@@ -617,13 +624,13 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		for (i = 0; i < td->maxblocks; i++) {
 			int block = startblock + dir * i;
 			/* Check, if the block is bad */
-			switch (bbt_get_entry(this, block)) {
+			switch (bbt_get_entry(bbt, block)) {
 			case BBT_BLOCK_WORN:
 			case BBT_BLOCK_FACTORY_BAD:
 				continue;
 			}
 			page = block <<
-				(this->bbt_erase_shift - this->page_shift);
+				(info->bbt_erase_shift - info->page_shift);
 			/* Check, if the block is used by the mirror table */
 			if (!md || md->pages[chip] != page)
 				goto write;
@@ -651,13 +658,13 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		default: return -EINVAL;
 		}
 
-		to = ((loff_t)page) << this->page_shift;
+		to = ((loff_t)page) << info->page_shift;
 
 		/* Must we save the block contents? */
 		if (td->options & NAND_BBT_SAVECONTENT) {
 			/* Make it block aligned */
-			to &= ~(((loff_t)1 << this->bbt_erase_shift) - 1);
-			len = 1 << this->bbt_erase_shift;
+			to &= ~(((loff_t)1 << info->bbt_erase_shift) - 1);
+			len = 1 << info->bbt_erase_shift;
 			res = mtd_read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
@@ -667,15 +674,15 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 				pr_warn("nand_bbt: ECC error while reading block for writing bad block table\n");
 			}
 			/* Read oob data */
-			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
+			ops.ooblen = (len >> info->page_shift) * mtd->oobsize;
 			ops.oobbuf = &buf[len];
 			res = mtd_read_oob(mtd, to + mtd->writesize, &ops);
 			if (res < 0 || ops.oobretlen != ops.ooblen)
 				goto outerr;
 
 			/* Calc the byte offset in the buffer */
-			pageoffs = page - (int)(to >> this->page_shift);
-			offs = pageoffs << this->page_shift;
+			pageoffs = page - (int)(to >> info->page_shift);
+			offs = pageoffs << info->page_shift;
 			/* Preset the bbt area with 0xff */
 			memset(&buf[offs], 0xff, (size_t)(numblocks >> sft));
 			ooboffs = len + (pageoffs * mtd->oobsize);
@@ -702,7 +709,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			len = ALIGN(len, mtd->writesize);
 			/* Preset the buffer with 0xff */
 			memset(buf, 0xff, len +
-			       (len >> this->page_shift)* mtd->oobsize);
+			       (len >> info->page_shift) * mtd->oobsize);
 			offs = 0;
 			ooboffs = len;
 			/* Pattern is located in oob area of first page */
@@ -716,16 +723,16 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		for (i = 0; i < numblocks; i++) {
 			uint8_t dat;
 			int sftcnt = (i << (3 - sft)) & sftmsk;
-			dat = bbt_get_entry(this, chip * numblocks + i);
+			dat = bbt_get_entry(bbt, chip * numblocks + i);
 			/* Do not store the reserved bbt blocks! */
 			buf[offs + (i >> sft)] &= ~(msk[dat] << sftcnt);
 		}
 
-		res = nand_bbt->bbt_ops->erase(mtd, to);
+		res = bbt->bbt_ops->erase(mtd, to);
 		if (res < 0)
 			goto outerr;
 
-		res = scan_write_bbt(mtd, to, len, buf,
+		res = scan_write_bbt(bbt, to, len, buf,
 				td->options & NAND_BBT_NO_OOB ? NULL :
 				&buf[len]);
 		if (res < 0)
@@ -746,19 +753,19 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 /**
  * nand_memory_bbt - [GENERIC] create a memory based bad block table
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  *
  * The function creates a memory based bbt by scanning the device for
  * manufacturer / software marked good / bad blocks.
  */
-static inline int nand_memory_bbt(struct mtd_info *mtd)
+static inline int nand_memory_bbt(struct nand_bbt *bbt)
 {
-	return create_bbt(mtd, -1);
+	return create_bbt(bbt, -1);
 }
 
 /**
  * check_create - [GENERIC] create and write bbt(s) if necessary
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @buf: temporary buffer
  *
  * The function checks the results of the previous call to read_bbt and creates
@@ -766,17 +773,17 @@ static inline int nand_memory_bbt(struct mtd_info *mtd)
  * for the chip/device. Update is necessary if one of the tables is missing or
  * the version nr. of one table is less than the other.
  */
-static int check_create(struct mtd_info *mtd, uint8_t *buf)
+static int check_create(struct nand_bbt *bbt, uint8_t *buf)
 {
+	struct nand_chip_layout_info *info = bbt->info;
 	int i, chips, writeops, create, chipsel, res, res2;
-	struct nand_chip *this = mtd_to_nand(mtd);
-	struct nand_bbt_descr *td = this->bbt_td;
-	struct nand_bbt_descr *md = this->bbt_md;
+	struct nand_bbt_descr *td = bbt->bbt_td;
+	struct nand_bbt_descr *md = bbt->bbt_md;
 	struct nand_bbt_descr *rd, *rd2;
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP)
-		chips = this->numchips;
+		chips = info->numchips;
 	else
 		chips = 1;
 
@@ -825,8 +832,8 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf)
 				continue;
 
 			/* Create the table in memory by scanning the chip(s) */
-			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
-				create_bbt(mtd, chipsel);
+			if (!(bbt->bbt_options & NAND_BBT_CREATE_EMPTY))
+				create_bbt(bbt, chipsel);
 
 			td->version[i] = 1;
 			if (md)
@@ -835,7 +842,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf)
 
 		/* Read back first? */
 		if (rd) {
-			res = read_abs_bbt(mtd, buf, rd, chipsel);
+			res = read_abs_bbt(bbt, buf, rd, chipsel);
 			if (mtd_is_eccerr(res)) {
 				/* Mark table as invalid */
 				rd->pages[i] = -1;
@@ -846,7 +853,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf)
 		}
 		/* If they weren't versioned, read both */
 		if (rd2) {
-			res2 = read_abs_bbt(mtd, buf, rd2, chipsel);
+			res2 = read_abs_bbt(bbt, buf, rd2, chipsel);
 			if (mtd_is_eccerr(res2)) {
 				/* Mark table as invalid */
 				rd2->pages[i] = -1;
@@ -868,14 +875,14 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf)
 
 		/* Write the bad block table to the device? */
 		if ((writeops & 0x01) && (td->options & NAND_BBT_WRITE)) {
-			res = write_bbt(mtd, buf, td, md, chipsel);
+			res = write_bbt(bbt, buf, td, md, chipsel);
 			if (res < 0)
 				return res;
 		}
 
 		/* Write the mirror bad block table to the device? */
 		if ((writeops & 0x02) && md && (md->options & NAND_BBT_WRITE)) {
-			res = write_bbt(mtd, buf, md, td, chipsel);
+			res = write_bbt(bbt, buf, md, td, chipsel);
 			if (res < 0)
 				return res;
 		}
@@ -885,25 +892,26 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf)
 
 /**
  * mark_bbt_regions - [GENERIC] mark the bad block table regions
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @td: bad block table descriptor
  *
  * The bad block table regions are marked as "bad" to prevent accidental
  * erasures / writes. The regions are identified by the mark 0x02.
  */
-static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
+static void mark_bbt_region(struct nand_bbt *bbt, struct nand_bbt_descr *td)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = bbt->mtd;
+	struct nand_chip_layout_info *info = bbt->info;
 	int i, j, chips, block, nrblocks, update;
 	uint8_t oldval;
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		chips = this->numchips;
-		nrblocks = (int)(this->chipsize >> this->bbt_erase_shift);
+		chips = info->numchips;
+		nrblocks = (int)(info->chipsize >> info->bbt_erase_shift);
 	} else {
 		chips = 1;
-		nrblocks = (int)(mtd->size >> this->bbt_erase_shift);
+		nrblocks = (int)(mtd->size >> info->bbt_erase_shift);
 	}
 
 	for (i = 0; i < chips; i++) {
@@ -911,13 +919,14 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		    !(td->options & NAND_BBT_WRITE)) {
 			if (td->pages[i] == -1)
 				continue;
-			block = td->pages[i] >> (this->bbt_erase_shift - this->page_shift);
-			oldval = bbt_get_entry(this, block);
-			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
+			block = td->pages[i] >>
+				(info->bbt_erase_shift - info->page_shift);
+			oldval = bbt_get_entry(bbt, block);
+			bbt_mark_entry(bbt, block, BBT_BLOCK_RESERVED);
 			if ((oldval != BBT_BLOCK_RESERVED) &&
 					td->reserved_block_code)
-				nand_update_bbt(mtd, (loff_t)block <<
-						this->bbt_erase_shift);
+				nand_update_bbt(bbt, (loff_t)block <<
+						info->bbt_erase_shift);
 			continue;
 		}
 		update = 0;
@@ -926,8 +935,8 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		else
 			block = i * nrblocks;
 		for (j = 0; j < td->maxblocks; j++) {
-			oldval = bbt_get_entry(this, block);
-			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
+			oldval = bbt_get_entry(bbt, block);
+			bbt_mark_entry(bbt, block, BBT_BLOCK_RESERVED);
 			if (oldval != BBT_BLOCK_RESERVED)
 				update = 1;
 			block++;
@@ -938,22 +947,23 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		 * bbts.  This should only happen once.
 		 */
 		if (update && td->reserved_block_code)
-			nand_update_bbt(mtd, (loff_t)(block - 1) <<
-					this->bbt_erase_shift);
+			nand_update_bbt(bbt, (loff_t)(block - 1) <<
+					info->bbt_erase_shift);
 	}
 }
 
 /**
  * verify_bbt_descr - verify the bad block description
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @bd: the table to verify
  *
  * This functions performs a few sanity checks on the bad block description
  * table.
  */
-static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+static void verify_bbt_descr(struct nand_bbt *bbt, struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = bbt->mtd;
+	struct nand_chip_layout_info *info = bbt->info;
 	u32 pattern_len;
 	u32 bits;
 	u32 table_size;
@@ -964,16 +974,16 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	pattern_len = bd->len;
 	bits = bd->options & NAND_BBT_NRBITS_MSK;
 
-	BUG_ON((this->bbt_options & NAND_BBT_NO_OOB) &&
-			!(this->bbt_options & NAND_BBT_USE_FLASH));
+	BUG_ON((bbt->bbt_options & NAND_BBT_NO_OOB) &&
+			!(bbt->bbt_options & NAND_BBT_USE_FLASH));
 	BUG_ON(!bits);
 
 	if (bd->options & NAND_BBT_VERSION)
 		pattern_len++;
 
 	if (bd->options & NAND_BBT_NO_OOB) {
-		BUG_ON(!(this->bbt_options & NAND_BBT_USE_FLASH));
-		BUG_ON(!(this->bbt_options & NAND_BBT_NO_OOB));
+		BUG_ON(!(bbt->bbt_options & NAND_BBT_USE_FLASH));
+		BUG_ON(!(bbt->bbt_options & NAND_BBT_NO_OOB));
 		BUG_ON(bd->offs);
 		if (bd->options & NAND_BBT_VERSION)
 			BUG_ON(bd->veroffs != bd->len);
@@ -981,19 +991,19 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	}
 
 	if (bd->options & NAND_BBT_PERCHIP)
-		table_size = this->chipsize >> this->bbt_erase_shift;
+		table_size = info->chipsize >> info->bbt_erase_shift;
 	else
-		table_size = mtd->size >> this->bbt_erase_shift;
+		table_size = mtd->size >> info->bbt_erase_shift;
 	table_size >>= 3;
 	table_size *= bits;
 	if (bd->options & NAND_BBT_NO_OOB)
 		table_size += pattern_len;
-	BUG_ON(table_size > (1 << this->bbt_erase_shift));
+	BUG_ON(table_size > (1 << info->bbt_erase_shift));
 }
 
 /**
  * nand_scan_bbt - [NAND Interface] scan, find, read and maybe create bad block table(s)
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  *
  * The function checks, if a bad block table(s) is/are already available. If
  * not it scans the device for manufacturer marked good / bad blocks and writes
@@ -1002,21 +1012,22 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
  * The bad block table memory is allocated here. It must be freed by calling
  * the nand_free_bbt function.
  */
-static int nand_scan_bbt(struct mtd_info *mtd)
+static int nand_scan_bbt(struct nand_bbt *bbt)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = bbt->mtd;
+	struct nand_chip_layout_info *info = bbt->info;
 	int len, res;
 	uint8_t *buf;
-	struct nand_bbt_descr *td = this->bbt_td;
-	struct nand_bbt_descr *md = this->bbt_md;
+	struct nand_bbt_descr *td = bbt->bbt_td;
+	struct nand_bbt_descr *md = bbt->bbt_md;
 
-	len = (mtd->size >> (this->bbt_erase_shift + 2)) ? : 1;
+	len = (mtd->size >> (info->bbt_erase_shift + 2)) ? : 1;
 	/*
 	 * Allocate memory (2bit per block) and clear the memory bad block
 	 * table.
 	 */
-	this->bbt = kzalloc(len, GFP_KERNEL);
-	if (!this->bbt)
+	bbt->bbt = kzalloc(len, GFP_KERNEL);
+	if (!bbt->bbt)
 		return -ENOMEM;
 
 	/*
@@ -1024,18 +1035,18 @@ static int nand_scan_bbt(struct mtd_info *mtd)
 	 * memory based bad block table.
 	 */
 	if (!td) {
-		if ((res = nand_memory_bbt(mtd))) {
+		if ((res = nand_memory_bbt(bbt))) {
 			pr_err("nand_bbt: can't scan flash and build the RAM-based BBT\n");
 			goto err;
 		}
 		return 0;
 	}
-	verify_bbt_descr(mtd, td);
-	verify_bbt_descr(mtd, md);
+	verify_bbt_descr(bbt, td);
+	verify_bbt_descr(bbt, md);
 
 	/* Allocate a temporary buffer for one eraseblock incl. oob */
-	len = (1 << this->bbt_erase_shift);
-	len += (len >> this->page_shift) * mtd->oobsize;
+	len = (1 << info->bbt_erase_shift);
+	len += (len >> info->page_shift) * mtd->oobsize;
 	buf = vmalloc(len);
 	if (!buf) {
 		res = -ENOMEM;
@@ -1044,59 +1055,60 @@ static int nand_scan_bbt(struct mtd_info *mtd)
 
 	/* Is the bbt at a given page? */
 	if (td->options & NAND_BBT_ABSPAGE) {
-		read_abs_bbts(mtd, buf, td, md);
+		read_abs_bbts(bbt, buf, td, md);
 	} else {
 		/* Search the bad block table using a pattern in oob */
-		search_read_bbts(mtd, buf, td, md);
+		search_read_bbts(bbt, buf, td, md);
 	}
 
-	res = check_create(mtd, buf);
+	res = check_create(bbt, buf);
 	if (res)
 		goto err;
 
 	/* Prevent the bbt regions from erasing / writing */
-	mark_bbt_region(mtd, td);
+	mark_bbt_region(bbt, td);
 	if (md)
-		mark_bbt_region(mtd, md);
+		mark_bbt_region(bbt, md);
 
 	vfree(buf);
 	return 0;
 
 err:
-	kfree(this->bbt);
-	this->bbt = NULL;
+	kfree(bbt->bbt);
+	bbt->bbt = NULL;
 	return res;
 }
 
 /**
  * nand_update_bbt - update bad block table(s)
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @offs: the offset of the newly marked block
  *
  * The function updates the bad block table(s).
  */
-static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
+static int nand_update_bbt(struct nand_bbt *bbt, loff_t offs)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = bbt->mtd;
+	struct nand_chip_layout_info *info = bbt->info;
 	int len, res = 0;
 	int chip, chipsel;
 	uint8_t *buf;
-	struct nand_bbt_descr *td = this->bbt_td;
-	struct nand_bbt_descr *md = this->bbt_md;
+	struct nand_bbt_descr *td = bbt->bbt_td;
+	struct nand_bbt_descr *md = bbt->bbt_md;
 
-	if (!this->bbt || !td)
+	if (!bbt->bbt || !td)
 		return -EINVAL;
 
 	/* Allocate a temporary buffer for one eraseblock incl. oob */
-	len = (1 << this->bbt_erase_shift);
-	len += (len >> this->page_shift) * mtd->oobsize;
+	len = (1 << info->bbt_erase_shift);
+	len += (len >> info->page_shift) * mtd->oobsize;
 	buf = kmalloc(len, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		chip = (int)(offs >> this->chip_shift);
+		chip = (int)(offs >> info->chip_shift);
 		chipsel = chip;
 	} else {
 		chip = 0;
@@ -1109,13 +1121,13 @@ static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 
 	/* Write the bad block table to the device? */
 	if (td->options & NAND_BBT_WRITE) {
-		res = write_bbt(mtd, buf, td, md, chipsel);
+		res = write_bbt(bbt, buf, td, md, chipsel);
 		if (res < 0)
 			goto out;
 	}
 	/* Write the mirror bad block table to the device? */
 	if (md && (md->options & NAND_BBT_WRITE)) {
-		res = write_bbt(mtd, buf, md, td, chipsel);
+		res = write_bbt(bbt, buf, md, td, chipsel);
 	}
 
  out:
@@ -1169,62 +1181,60 @@ static struct nand_bbt_descr bbt_mirror_no_oob_descr = {
 
 /**
  * nand_default_bbt - [NAND Interface] Select a default bad block table for the device
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  *
  * This function selects the default bad block table support for the device and
  * calls the nand_scan_bbt function.
  */
-int nand_default_bbt(struct mtd_info *mtd)
+int nand_default_bbt(struct nand_bbt *bbt)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
-
 	/* Is a flash based bad block table requested? */
-	if (this->bbt_options & NAND_BBT_USE_FLASH) {
+	if (bbt->bbt_options & NAND_BBT_USE_FLASH) {
 		/* Use the default pattern descriptors */
-		if (!this->bbt_td) {
-			if (this->bbt_options & NAND_BBT_NO_OOB) {
-				this->bbt_td = &bbt_main_no_oob_descr;
-				this->bbt_md = &bbt_mirror_no_oob_descr;
+		if (!bbt->bbt_td) {
+			if (bbt->bbt_options & NAND_BBT_NO_OOB) {
+				bbt->bbt_td = &bbt_main_no_oob_descr;
+				bbt->bbt_md = &bbt_mirror_no_oob_descr;
 			} else {
-				this->bbt_td = &bbt_main_descr;
-				this->bbt_md = &bbt_mirror_descr;
+				bbt->bbt_td = &bbt_main_descr;
+				bbt->bbt_md = &bbt_mirror_descr;
 			}
 		}
 	} else {
-		this->bbt_td = NULL;
-		this->bbt_md = NULL;
+		bbt->bbt_td = NULL;
+		bbt->bbt_md = NULL;
 	}
 
-	return nand_scan_bbt(mtd);
+	return nand_scan_bbt(bbt);
 }
 
 /**
  * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @offs: offset in the device
  */
-int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs)
+int nand_isreserved_bbt(struct nand_bbt *bbt, loff_t offs)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip_layout_info *info = bbt->info;
 	int block;
 
-	block = (int)(offs >> this->bbt_erase_shift);
-	return bbt_get_entry(this, block) == BBT_BLOCK_RESERVED;
+	block = (int)(offs >> info->bbt_erase_shift);
+	return bbt_get_entry(bbt, block) == BBT_BLOCK_RESERVED;
 }
 
 /**
  * nand_isbad_bbt - [NAND Interface] Check if a block is bad
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @offs: offset in the device
  * @allowbbt: allow access to bad block table region
  */
-int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
+int nand_isbad_bbt(struct nand_bbt *bbt, loff_t offs, int allowbbt)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip_layout_info *info = bbt->info;
 	int block, res;
 
-	block = (int)(offs >> this->bbt_erase_shift);
-	res = bbt_get_entry(this, block);
+	block = (int)(offs >> info->bbt_erase_shift);
+	res = bbt_get_entry(bbt, block);
 
 	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
 		 (unsigned int)offs, block, res);
@@ -1242,35 +1252,35 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 
 /**
  * nand_bbt_update_mark - update mark in the BBT
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @offs: offset of the bad block
  * @mark: block type mark
  */
-static int nand_bbt_update_mark(struct mtd_info *mtd, loff_t offs, uint8_t mark)
+static int nand_bbt_update_mark(struct nand_bbt *bbt, loff_t offs, uint8_t mark)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip_layout_info *info = bbt->info;
 	int block, ret = 0;
 
-	block = (int)(offs >> this->bbt_erase_shift);
+	block = (int)(offs >> info->bbt_erase_shift);
 
 	/* Mark bad block in memory */
-	bbt_mark_entry(this, block, mark);
+	bbt_mark_entry(bbt, block, mark);
 
 	/* Update flash-based bad block table */
-	if (this->bbt_options & NAND_BBT_USE_FLASH)
-		ret = nand_update_bbt(mtd, offs);
+	if (bbt->bbt_options & NAND_BBT_USE_FLASH)
+		ret = nand_update_bbt(bbt, offs);
 
 	return ret;
 }
 
 /**
  * nand_markbad_bbt - [NAND Interface] Mark a block bad in the BBT
- * @mtd: MTD device structure
+ * @bbt: NAND BBT structure
  * @offs: offset of the bad block
  */
-int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
+int nand_markbad_bbt(struct nand_bbt *bbt, loff_t offs)
 {
-	return nand_bbt_update_mark(mtd, offs, BBT_BLOCK_WORN);
+	return nand_bbt_update_mark(bbt, offs, BBT_BLOCK_WORN);
 }
 
 /**
@@ -1286,7 +1296,7 @@ static int nand_bbt_init(struct nand_bbt *bbt)
 	 * FIXME: For now, we call nand_default_bbt() directly. It will change
 	 * when we use struct nand_bbt instead of struct nand_chip.
 	 */
-	return nand_default_bbt(bbt->mtd);
+	return nand_default_bbt(bbt);
 }
 
 static void nand_bbt_release(struct nand_bbt *bbt)
@@ -1350,7 +1360,7 @@ int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs)
 	 * FIXME: For now, we call nand_isreserved_bbt() directly. It will
 	 * change when we use struct nand_bbt instead of struct nand_chip.
 	 */
-	return nand_isreserved_bbt(bbt->mtd, offs);
+	return nand_isreserved_bbt(bbt, offs);
 }
 EXPORT_SYMBOL(nand_bbt_isreserved);
 
@@ -1367,7 +1377,7 @@ int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs)
 	 * Since we already have nand_bbt_isreserved(), we don't need to
 	 * check pass down allow_bbt.
 	 */
-	return nand_isbad_bbt(bbt->mtd, offs, 1);
+	return nand_isbad_bbt(bbt, offs, 1);
 }
 EXPORT_SYMBOL(nand_bbt_isbad);
 
@@ -1382,7 +1392,7 @@ int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs)
 	 * FIXME: For now, we call nand_markbad_bbt() directly. It will change
 	 * when we use struct nand_bbt instead of struct nand_chip.
 	 */
-	return nand_markbad_bbt(bbt->mtd, offs);
+	return nand_markbad_bbt(bbt, offs);
 }
 EXPORT_SYMBOL(nand_bbt_markbad);
 
@@ -1398,6 +1408,6 @@ int nand_bbt_markbad_factory(struct nand_bbt *bbt, loff_t offs)
 	 * FIXME: For now, we call nand_markbad_bbt() directly. It will change
 	 * when we use struct nand_bbt instead of struct nand_chip.
 	 */
-	return nand_bbt_update_mark(bbt->mtd, offs, BBT_BLOCK_FACTORY_BAD);
+	return nand_bbt_update_mark(bbt, offs, BBT_BLOCK_FACTORY_BAD);
 }
 EXPORT_SYMBOL(nand_bbt_markbad_factory);
-- 
1.9.1
