Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afIb8-0004o5-U0
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 02:51:13 +0000
Received: by mail-pa0-x242.google.com with SMTP id q6so13621738pav.0
 for <linux-mtd@lists.infradead.org>; Sun, 13 Mar 2016 19:50:50 -0700 (PDT)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 06/11] mtd: nand_bbt: use struct nand_bbt_ops in BBT
Date: Mon, 14 Mar 2016 02:47:59 +0000
Message-Id: <1457923684-13505-7-git-send-email-peterpandong@micron.com>
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

Since NAND already create its nand_bbt struct, we can use erase()
hook instead of call nand_erase_nand() directly. Also, we can use
is_bad_bbm() to avoid passing badblock_pattern to BBT.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
[Peter: remove @buf in create_bbt()
	introduce struct nand_bbt_ops]
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/nand_bbt.c | 140 +++++---------------------------------------
 1 file changed, 14 insertions(+), 126 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 2ac90a1..d319822 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -122,23 +122,6 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
 }
 
 /**
- * check_short_pattern - [GENERIC] check if a pattern is in the buffer
- * @buf: the buffer to search
- * @td:	search pattern descriptor
- *
- * Check for a pattern at the given place. Used to search bad block tables and
- * good / bad block identifiers. Same as check_pattern, but no optional empty
- * check.
- */
-static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
-{
-	/* Compare the pattern */
-	if (memcmp(buf + td->offs, td->pattern, td->len))
-		return -1;
-	return 0;
-}
-
-/**
  * add_marker_len - compute the length of the marker in data area
  * @td: BBT descriptor used for computation
  *
@@ -409,63 +392,24 @@ static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 	}
 }
 
-/* Scan a given block partially */
-static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
-			   loff_t offs, uint8_t *buf, int numpages)
-{
-	struct mtd_oob_ops ops;
-	int j, ret;
-
-	ops.ooblen = mtd->oobsize;
-	ops.oobbuf = buf;
-	ops.ooboffs = 0;
-	ops.datbuf = NULL;
-	ops.mode = MTD_OPS_PLACE_OOB;
-
-	for (j = 0; j < numpages; j++) {
-		/*
-		 * Read the full oob until read_oob is fixed to handle single
-		 * byte reads for 16 bit buswidth.
-		 */
-		ret = mtd_read_oob(mtd, offs, &ops);
-		/* Ignore ECC errors when checking for BBM */
-		if (ret && !mtd_is_bitflip_or_eccerr(ret))
-			return ret;
-
-		if (check_short_pattern(buf, bd))
-			return 1;
-
-		offs += mtd->writesize;
-	}
-	return 0;
-}
-
 /**
  * create_bbt - [GENERIC] Create a bad block table by scanning the device
  * @mtd: MTD device structure
- * @buf: temporary buffer
- * @bd: descriptor for the good/bad block search pattern
  * @chip: create the table for a specific chip, -1 read all chips; applies only
  *        if NAND_BBT_PERCHIP option is set
  *
  * Create a bad block table by scanning the device for the given good/bad block
  * identify pattern.
  */
-static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
-	struct nand_bbt_descr *bd, int chip)
+static int create_bbt(struct mtd_info *mtd, int chip)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
-	int i, numblocks, numpages;
-	int startblock;
+	int i, numblocks, startblock;
 	loff_t from;
+	struct nand_bbt *nand_bbt = nand_get_bbt(this);
 
 	pr_info("Scanning device for bad blocks\n");
 
-	if (bd->options & NAND_BBT_SCAN2NDPAGE)
-		numpages = 2;
-	else
-		numpages = 1;
-
 	if (chip == -1) {
 		numblocks = mtd->size >> this->bbt_erase_shift;
 		startblock = 0;
@@ -482,15 +426,10 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		from = (loff_t)startblock << this->bbt_erase_shift;
 	}
 
-	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
-		from += mtd->erasesize - (mtd->writesize * numpages);
-
 	for (i = startblock; i < numblocks; i++) {
 		int ret;
 
-		BUG_ON(bd->options & NAND_BBT_NO_OOB);
-
-		ret = scan_block_fast(mtd, bd, from, buf, numpages);
+		ret = nand_bbt->bbt_ops->is_bad_bbm(mtd, from);
 		if (ret < 0)
 			return ret;
 
@@ -619,7 +558,6 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		     int chipsel)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
-	struct erase_info einfo;
 	int i, res, chip = 0;
 	int bits, startblock, dir, page, offs, numblocks, sft, sftmsk;
 	int nrchips, pageoffs, ooboffs;
@@ -628,6 +566,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 	size_t retlen, len = 0;
 	loff_t to;
 	struct mtd_oob_ops ops;
+	struct nand_bbt *nand_bbt = nand_get_bbt(this);
 
 	ops.ooblen = mtd->oobsize;
 	ops.ooboffs = 0;
@@ -782,11 +721,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			buf[offs + (i >> sft)] &= ~(msk[dat] << sftcnt);
 		}
 
-		memset(&einfo, 0, sizeof(einfo));
-		einfo.mtd = mtd;
-		einfo.addr = to;
-		einfo.len = 1 << this->bbt_erase_shift;
-		res = nand_erase_nand(mtd, &einfo, 1);
+		res = nand_bbt->bbt_ops->erase(mtd, to);
 		if (res < 0)
 			goto outerr;
 
@@ -812,30 +747,26 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 /**
  * nand_memory_bbt - [GENERIC] create a memory based bad block table
  * @mtd: MTD device structure
- * @bd: descriptor for the good/bad block search pattern
  *
  * The function creates a memory based bbt by scanning the device for
  * manufacturer / software marked good / bad blocks.
  */
-static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+static inline int nand_memory_bbt(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
-
-	return create_bbt(mtd, this->buffers->databuf, bd, -1);
+	return create_bbt(mtd, -1);
 }
 
 /**
  * check_create - [GENERIC] create and write bbt(s) if necessary
  * @mtd: MTD device structure
  * @buf: temporary buffer
- * @bd: descriptor for the good/bad block search pattern
  *
  * The function checks the results of the previous call to read_bbt and creates
  * / updates the bbt(s) if necessary. Creation is necessary if no bbt was found
  * for the chip/device. Update is necessary if one of the tables is missing or
  * the version nr. of one table is less than the other.
  */
-static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *bd)
+static int check_create(struct mtd_info *mtd, uint8_t *buf)
 {
 	int i, chips, writeops, create, chipsel, res, res2;
 	struct nand_chip *this = mtd_to_nand(mtd);
@@ -895,7 +826,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 
 			/* Create the table in memory by scanning the chip(s) */
 			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
-				create_bbt(mtd, buf, bd, chipsel);
+				create_bbt(mtd, chipsel);
 
 			td->version[i] = 1;
 			if (md)
@@ -1063,7 +994,6 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 /**
  * nand_scan_bbt - [NAND Interface] scan, find, read and maybe create bad block table(s)
  * @mtd: MTD device structure
- * @bd: descriptor for the good/bad block search pattern
  *
  * The function checks, if a bad block table(s) is/are already available. If
  * not it scans the device for manufacturer marked good / bad blocks and writes
@@ -1072,7 +1002,7 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
  * The bad block table memory is allocated here. It must be freed by calling
  * the nand_free_bbt function.
  */
-static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+static int nand_scan_bbt(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
 	int len, res;
@@ -1094,7 +1024,7 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	 * memory based bad block table.
 	 */
 	if (!td) {
-		if ((res = nand_memory_bbt(mtd, bd))) {
+		if ((res = nand_memory_bbt(mtd))) {
 			pr_err("nand_bbt: can't scan flash and build the RAM-based BBT\n");
 			goto err;
 		}
@@ -1120,7 +1050,7 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 		search_read_bbts(mtd, buf, td, md);
 	}
 
-	res = check_create(mtd, buf, bd);
+	res = check_create(mtd, buf);
 	if (res)
 		goto err;
 
@@ -1193,12 +1123,6 @@ static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 	return res;
 }
 
-/*
- * Define some generic bad / good block scan pattern which are used
- * while scanning a device for factory marked good / bad blocks.
- */
-static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
-
 /* Generic flash bbt descriptors */
 static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
 static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
@@ -1243,35 +1167,6 @@ static struct nand_bbt_descr bbt_mirror_no_oob_descr = {
 	.pattern = mirror_pattern
 };
 
-#define BADBLOCK_SCAN_MASK (~NAND_BBT_NO_OOB)
-/**
- * nand_create_badblock_pattern - [INTERN] Creates a BBT descriptor structure
- * @this: NAND chip to create descriptor for
- *
- * This function allocates and initializes a nand_bbt_descr for BBM detection
- * based on the properties of @this. The new descriptor is stored in
- * this->badblock_pattern. Thus, this->badblock_pattern should be NULL when
- * passed to this function.
- */
-static int nand_create_badblock_pattern(struct nand_chip *this)
-{
-	struct nand_bbt_descr *bd;
-	if (this->badblock_pattern) {
-		pr_warn("Bad block pattern already allocated; not replacing\n");
-		return -EINVAL;
-	}
-	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
-	if (!bd)
-		return -ENOMEM;
-	bd->options = this->bbt_options & BADBLOCK_SCAN_MASK;
-	bd->offs = this->badblockpos;
-	bd->len = (this->options & NAND_BUSWIDTH_16) ? 2 : 1;
-	bd->pattern = scan_ff_pattern;
-	bd->options |= NAND_BBT_DYNAMICSTRUCT;
-	this->badblock_pattern = bd;
-	return 0;
-}
-
 /**
  * nand_default_bbt - [NAND Interface] Select a default bad block table for the device
  * @mtd: MTD device structure
@@ -1282,7 +1177,6 @@ static int nand_create_badblock_pattern(struct nand_chip *this)
 int nand_default_bbt(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
-	int ret;
 
 	/* Is a flash based bad block table requested? */
 	if (this->bbt_options & NAND_BBT_USE_FLASH) {
@@ -1301,13 +1195,7 @@ int nand_default_bbt(struct mtd_info *mtd)
 		this->bbt_md = NULL;
 	}
 
-	if (!this->badblock_pattern) {
-		ret = nand_create_badblock_pattern(this);
-		if (ret)
-			return ret;
-	}
-
-	return nand_scan_bbt(mtd, this->badblock_pattern);
+	return nand_scan_bbt(mtd);
 }
 
 /**
-- 
1.9.1
