Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5Jjr-0004Wj-TA
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 15:24:50 +0000
Received: by iwn36 with SMTP id 36so2932418iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2011 08:24:45 -0700 (PDT)
From: Bill Gatliff <bgat@billgatliff.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nand_bbt: convert printks to pr_*
Date: Thu, 31 Mar 2011 10:24:40 -0500
Message-Id: <1301585080-6318-1-git-send-email-bgat@billgatliff.com>
Cc: Bill Gatliff <bgat@billgatliff.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Converts "printk(KERN_*" to "pr_*(" and cleans up associated
indentation changes.

Signed-off-by: Bill Gatliff <bgat@billgatliff.com>
---
 drivers/mtd/nand/nand_bbt.c |  143 ++++++++++++++++++++++---------------------
 1 files changed, 72 insertions(+), 71 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 6ebd869..0748100 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -90,7 +90,7 @@ static int check_pattern_no_oob(uint8_t *buf, struct nand_bbt_descr *td)
  * If the SCAN_EMPTY option is set then check, if all bytes except the
  * pattern area contain 0xff
  *
-*/
+ */
 static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
 {
 	int i, end = 0;
@@ -121,7 +121,7 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
 			end += NAND_SMALL_BADBLOCK_POS - td->offs;
 			/* Check region between positions 1 and 6 */
 			for (i = 0; i < NAND_SMALL_BADBLOCK_POS - td->offs - td->len;
-					i++) {
+			     i++) {
 				if (*p++ != 0xff)
 					return -1;
 			}
@@ -156,7 +156,7 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
  * tables and good / bad block identifiers. Same as check_pattern, but
  * no optional empty check
  *
-*/
+ */
 static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
 {
 	int i;
@@ -209,7 +209,7 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
  *
  */
 static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
-		struct nand_bbt_descr *td, int offs)
+		    struct nand_bbt_descr *td, int offs)
 {
 	int res, i, j, act = 0;
 	struct nand_chip *this = mtd->priv;
@@ -238,10 +238,10 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		res = mtd->read(mtd, from, len, &retlen, buf);
 		if (res < 0) {
 			if (retlen != len) {
-				printk(KERN_INFO "nand_bbt: Error reading bad block table\n");
+				pr_info("nand_bbt: Error reading bad block table\n");
 				return res;
 			}
-			printk(KERN_WARNING "nand_bbt: ECC error while reading bad block table\n");
+			pr_warn("nand_bbt: ECC error while reading bad block table\n");
 		}
 
 		/* Analyse data */
@@ -252,16 +252,16 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				if (tmp == msk)
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
-					printk(KERN_DEBUG "nand_read_bbt: Reserved block at 0x%012llx\n",
-					       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+					pr_debug("nand_read_bbt: Reserved block at 0x%012llx\n",
+						 (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
 					mtd->ecc_stats.bbtblocks++;
 					continue;
 				}
 				/* Leave it for now, if its matured we can move this
 				 * message to MTD_DEBUG_LEVEL0 */
-				printk(KERN_DEBUG "nand_read_bbt: Bad block at 0x%012llx\n",
-				       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+				pr_debug("nand_read_bbt: Bad block at 0x%012llx\n",
+					 (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 				/* Factory marked bad or worn out ? */
 				if (tmp == 0)
 					this->bbt[offs + (act >> 3)] |= 0x3 << (act & 0x06);
@@ -286,7 +286,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
  *
  * Read the bad block table for all chips starting at a given page
  * We assume that the bbt bits are in consecutive order.
-*/
+ */
 static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td, int chip)
 {
 	struct nand_chip *this = mtd->priv;
@@ -297,15 +297,15 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 		for (i = 0; i < this->numchips; i++) {
 			if (chip == -1 || chip == i)
 				res = read_bbt(mtd, buf, td->pages[i],
-					this->chipsize >> this->bbt_erase_shift,
-					td, offs);
+					       this->chipsize >> this->bbt_erase_shift,
+					       td, offs);
 			if (res)
 				return res;
 			offs += this->chipsize >> (this->bbt_erase_shift + 2);
 		}
 	} else {
 		res = read_bbt(mtd, buf, td->pages[0],
-				mtd->size >> this->bbt_erase_shift, td, 0);
+			       mtd->size >> this->bbt_erase_shift, td, 0);
 		if (res)
 			return res;
 	}
@@ -316,7 +316,7 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
  * BBT marker is in the first page, no OOB.
  */
 static int scan_read_raw_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
-			 struct nand_bbt_descr *td)
+			      struct nand_bbt_descr *td)
 {
 	size_t retlen;
 	size_t len;
@@ -332,7 +332,7 @@ static int scan_read_raw_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
  * Scan read raw data from flash
  */
 static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
-			 size_t len)
+			     size_t len)
 {
 	struct mtd_oob_ops ops;
 	int res;
@@ -410,7 +410,7 @@ static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
  * Read the bad block table(s) for all chips starting at a given page
  * We assume that the bbt bits are in consecutive order.
  *
-*/
+ */
 static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 			 struct nand_bbt_descr *td, struct nand_bbt_descr *md)
 {
@@ -421,8 +421,8 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
-		printk(KERN_DEBUG "Bad block table at page %d, version 0x%02X\n",
-		       td->pages[0], td->version[0]);
+		pr_debug("Bad block table at page %d, version 0x%02X\n",
+			 td->pages[0], td->version[0]);
 	}
 
 	/* Read the mirror version, if available */
@@ -430,8 +430,8 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
-		printk(KERN_DEBUG "Bad block table at page %d, version 0x%02X\n",
-		       md->pages[0], md->version[0]);
+		pr_debug("Bad block table at page %d, version 0x%02X\n",
+			 md->pages[0], md->version[0]);
 	}
 	return 1;
 }
@@ -501,7 +501,7 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
  * for the given good/bad block identify pattern
  */
 static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
-	struct nand_bbt_descr *bd, int chip)
+		      struct nand_bbt_descr *bd, int chip)
 {
 	struct nand_chip *this = mtd->priv;
 	int i, numblocks, len, scanlen;
@@ -509,7 +509,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	loff_t from;
 	size_t readlen;
 
-	printk(KERN_INFO "Scanning device for bad blocks\n");
+	pr_info("Scanning device for bad blocks\n");
 
 	if (bd->options & NAND_BBT_SCANALLPAGES)
 		len = 1 << (this->bbt_erase_shift - this->page_shift);
@@ -536,8 +536,8 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		from = 0;
 	} else {
 		if (chip >= this->numchips) {
-			printk(KERN_WARNING "create_bbt(): chipnr (%d) > available chips (%d)\n",
-			       chip + 1, this->numchips);
+			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
+				chip + 1, this->numchips);
 			return -EINVAL;
 		}
 		numblocks = this->chipsize >> (this->bbt_erase_shift - 1);
@@ -565,8 +565,8 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 		if (ret) {
 			this->bbt[i >> 3] |= 0x03 << (i & 0x6);
-			printk(KERN_WARNING "Bad eraseblock %d at 0x%012llx\n",
-			       i >> 1, (unsigned long long)from);
+			pr_warn("Bad eraseblock %d at 0x%012llx\n",
+				i >> 1, (unsigned long long)from);
 			mtd->ecc_stats.badblocks++;
 		}
 
@@ -650,10 +650,10 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 	/* Check, if we found a bbt for each requested chip */
 	for (i = 0; i < chips; i++) {
 		if (td->pages[i] == -1)
-			printk(KERN_WARNING "Bad block table not found for chip %d\n", i);
+			pr_warn("Bad block table not found for chip %d\n", i);
 		else
-			printk(KERN_DEBUG "Bad block table found at page %d, version 0x%02X\n", td->pages[i],
-			       td->version[i]);
+			pr_warn("Bad block table found at page %d, version 0x%02X\n", td->pages[i],
+				td->version[i]);
 	}
 	return 0;
 }
@@ -666,7 +666,7 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
  * @md:		descriptor for the bad block table mirror
  *
  * Search and read the bad block table(s)
-*/
+ */
 static int search_read_bbts(struct mtd_info *mtd, uint8_t * buf, struct nand_bbt_descr *td, struct nand_bbt_descr *md)
 {
 	/* Search the primary table */
@@ -691,7 +691,7 @@ static int search_read_bbts(struct mtd_info *mtd, uint8_t * buf, struct nand_bbt
  *
  * (Re)write the bad block table
  *
-*/
+ */
 static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		     struct nand_bbt_descr *td, struct nand_bbt_descr *md,
 		     int chipsel)
@@ -766,7 +766,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			if (!md || md->pages[chip] != page)
 				goto write;
 		}
-		printk(KERN_ERR "No space left to write bad block table\n");
+		pr_err("No space left to write bad block table\n");
 		return -ENOSPC;
 	write:
 
@@ -801,14 +801,14 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			res = mtd->read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
-					printk(KERN_INFO "nand_bbt: Error "
-					       "reading block for writing "
-					       "the bad block table\n");
+					pr_info("nand_bbt: Error "
+						"reading block for writing "
+						"the bad block table\n");
 					return res;
 				}
-				printk(KERN_WARNING "nand_bbt: ECC error "
-				       "while reading block for writing "
-				       "bad block table\n");
+				pr_warn("nand_bbt: ECC error "
+					"while reading block for writing "
+					"bad block table\n");
 			}
 			/* Read oob data */
 			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
@@ -878,22 +878,21 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			goto outerr;
 
 		res = scan_write_bbt(mtd, to, len, buf,
-				td->options & NAND_BBT_NO_OOB ? NULL :
-				&buf[len]);
+				     td->options & NAND_BBT_NO_OOB ? NULL :
+				     &buf[len]);
 		if (res < 0)
 			goto outerr;
 
-		printk(KERN_DEBUG "Bad block table written to 0x%012llx, version "
-		       "0x%02X\n", (unsigned long long)to, td->version[chip]);
+		pr_debug("Bad block table written to 0x%012llx, version "
+			 "0x%02X\n", (unsigned long long)to, td->version[chip]);
 
 		/* Mark it as used */
 		td->pages[chip] = page;
 	}
 	return 0;
 
- outerr:
-	printk(KERN_WARNING
-	       "nand_bbt: Error while writing bad block table %d\n", res);
+outerr:
+	pr_warn("nand_bbt: Error while writing bad block table %d\n", res);
 	return res;
 }
 
@@ -904,7 +903,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
  *
  * The function creates a memory based bbt by scanning the device
  * for manufacturer / software marked good / bad blocks
-*/
+ */
 static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
 	struct nand_chip *this = mtd->priv;
@@ -924,7 +923,7 @@ static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *b
  * Creation is necessary if no bbt was found for the chip/device
  * Update is necessary if one of the tables is missing or the
  * version nr. of one table is less than the other
-*/
+ */
 static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *bd)
 {
 	int i, chips, writeops, chipsel, res;
@@ -1038,7 +1037,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
  * The bad block table regions are marked as "bad" to prevent
  * accidental erasures / writes. The regions are identified by
  * the mark 0x02.
-*/
+ */
 static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 {
 	struct nand_chip *this = mtd->priv;
@@ -1108,7 +1107,7 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	if (!bd)
 		return;
 	BUG_ON((this->options & NAND_USE_FLASH_BBT_NO_OOB) &&
-			!(this->options & NAND_USE_FLASH_BBT));
+	       !(this->options & NAND_USE_FLASH_BBT));
 	BUG_ON(!bits);
 
 	if (bd->options & NAND_BBT_VERSION)
@@ -1147,7 +1146,7 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
  * The bad block table memory is allocated here. It must be freed
  * by calling the nand_free_bbt function.
  *
-*/
+ */
 int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
 	struct nand_chip *this = mtd->priv;
@@ -1160,7 +1159,7 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	/* Allocate memory (2bit per block) and clear the memory bad block table */
 	this->bbt = kzalloc(len, GFP_KERNEL);
 	if (!this->bbt) {
-		printk(KERN_ERR "nand_scan_bbt: Out of memory\n");
+		pr_err("nand_scan_bbt: Out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -1169,7 +1168,7 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	 */
 	if (!td) {
 		if ((res = nand_memory_bbt(mtd, bd))) {
-			printk(KERN_ERR "nand_bbt: Can't scan flash and build the RAM-based BBT\n");
+			pr_err("nand_bbt: Can't scan flash and build the RAM-based BBT\n");
 			kfree(this->bbt);
 			this->bbt = NULL;
 		}
@@ -1183,7 +1182,7 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	len += (len >> this->page_shift) * mtd->oobsize;
 	buf = vmalloc(len);
 	if (!buf) {
-		printk(KERN_ERR "nand_bbt: Out of memory\n");
+		pr_err("nand_bbt: Out of memory\n");
 		kfree(this->bbt);
 		this->bbt = NULL;
 		return -ENOMEM;
@@ -1215,7 +1214,7 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
  * @offs:	the offset of the newly marked block
  *
  * The function updates the bad block table(s)
-*/
+ */
 int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 {
 	struct nand_chip *this = mtd->priv;
@@ -1233,7 +1232,7 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 	len += (len >> this->page_shift) * mtd->oobsize;
 	buf = kmalloc(len, GFP_KERNEL);
 	if (!buf) {
-		printk(KERN_ERR "nand_update_bbt: Out of memory\n");
+		pr_err("nand_update_bbt: Out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -1263,7 +1262,7 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 		res = write_bbt(mtd, buf, md, td, chipsel);
 	}
 
- out:
+out:
 	kfree(buf);
 	return res;
 }
@@ -1296,13 +1295,13 @@ static struct nand_bbt_descr agand_flashbased = {
 };
 
 /* Generic flash bbt decriptors
-*/
+ */
 static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
 static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
 
 static struct nand_bbt_descr bbt_main_descr = {
 	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
+	| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
 	.offs =	8,
 	.len = 4,
 	.veroffs = 12,
@@ -1312,7 +1311,7 @@ static struct nand_bbt_descr bbt_main_descr = {
 
 static struct nand_bbt_descr bbt_mirror_descr = {
 	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
+	| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
 	.offs =	8,
 	.len = 4,
 	.veroffs = 12,
@@ -1322,8 +1321,8 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 
 static struct nand_bbt_descr bbt_main_no_bbt_descr = {
 	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
-		| NAND_BBT_NO_OOB,
+	| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
+	| NAND_BBT_NO_OOB,
 	.len = 4,
 	.veroffs = 4,
 	.maxblocks = 4,
@@ -1332,8 +1331,8 @@ static struct nand_bbt_descr bbt_main_no_bbt_descr = {
 
 static struct nand_bbt_descr bbt_mirror_no_bbt_descr = {
 	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
-		| NAND_BBT_NO_OOB,
+	| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
+	| NAND_BBT_NO_OOB,
 	.len = 4,
 	.veroffs = 4,
 	.maxblocks = 4,
@@ -1341,7 +1340,7 @@ static struct nand_bbt_descr bbt_mirror_no_bbt_descr = {
 };
 
 #define BBT_SCAN_OPTIONS (NAND_BBT_SCANLASTPAGE | NAND_BBT_SCAN2NDPAGE | \
-		NAND_BBT_SCANBYTE1AND6)
+			  NAND_BBT_SCANBYTE1AND6)
 /**
  * nand_create_default_bbt_descr - [Internal] Creates a BBT descriptor structure
  * @this:	NAND chip to create descriptor for
@@ -1360,12 +1359,12 @@ static int nand_create_default_bbt_descr(struct nand_chip *this)
 {
 	struct nand_bbt_descr *bd;
 	if (this->badblock_pattern) {
-		printk(KERN_WARNING "BBT descr already allocated; not replacing.\n");
+		pr_err("BBT descr already allocated; not replacing.\n");
 		return -EINVAL;
 	}
 	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
 	if (!bd) {
-		printk(KERN_ERR "nand_create_default_bbt_descr: Out of memory\n");
+		pr_err("nand_create_default_bbt_descr: Out of memory\n");
 		return -ENOMEM;
 	}
 	bd->options = this->options & BBT_SCAN_OPTIONS;
@@ -1384,7 +1383,7 @@ static int nand_create_default_bbt_descr(struct nand_chip *this)
  * This function selects the default bad block table
  * support for the device and calls the nand_scan_bbt function
  *
-*/
+ */
 int nand_default_bbt(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
@@ -1419,7 +1418,8 @@ int nand_default_bbt(struct mtd_info *mtd)
 			}
 		}
 		if (!this->badblock_pattern) {
-			this->badblock_pattern = (mtd->writesize > 512) ? &largepage_flashbased : &smallpage_flashbased;
+			this->badblock_pattern = (mtd->writesize > 512) ?
+				&largepage_flashbased : &smallpage_flashbased;
 		}
 	} else {
 		this->bbt_td = NULL;
@@ -1436,7 +1436,7 @@ int nand_default_bbt(struct mtd_info *mtd)
  * @offs:	offset in the device
  * @allowbbt:	allow access to bad block table region
  *
-*/
+ */
 int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 {
 	struct nand_chip *this = mtd->priv;
@@ -1447,7 +1447,8 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 	block = (int)(offs >> (this->bbt_erase_shift - 1));
 	res = (this->bbt[block >> 3] >> (block & 0x06)) & 0x03;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
+	DEBUG(MTD_DEBUG_LEVEL2, "nand_isbad_bbt(): bbt info for "
+	      "offs 0x%08x: (block %d) 0x%02x\n",
 	      (unsigned int)offs, block >> 1, res);
 
 	switch ((int)res) {
-- 
1.7.4.1
