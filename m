Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5GLG-0006xS-Vb
 for linux-mtd@lists.infradead.org; Wed, 17 Jun 2015 16:37:38 +0000
From: Kamil Debski <kamil.debski@imgtec.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC 1/2] mtd: nand: Separate bad block management from the nand core
Date: Wed, 17 Jun 2015 17:40:34 +0100
Message-ID: <1434559235-3617-2-git-send-email-kamil.debski@imgtec.com>
In-Reply-To: <1434559235-3617-1-git-send-email-kamil.debski@imgtec.com>
References: <1434559235-3617-1-git-send-email-kamil.debski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Ionela.Voinescu@imgtec.com, Kamil Debski <kamil.debski@imgtec.com>,
 kyungmin.park@samsung.com, ezequiel@vanguardiasur.com.ar,
 computersforpeace@gmail.com, James.Hartley@imgtec.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The bad block management code which is embedded in the nand core can
be shared with other mtd types e.g. spi-nand, onenand . This patch
separates the BBM from the nand core, such that it can be used by
other mtd types. The nand_bbt code is changed to use the struct
bbm_info to store relevant BBM state and parameters. Using struct
bbm_info instead of struct nand_chip allows code re-use in other mtd types.

List of changes:
- add struct bbm_info* bbm to struct mtd_info
- add NAND related fields to struct bbm_info
- changes in nand_bbt.c to use struct bbm_info in BBM functions
- move nand_create_badlock_pattern from nand_bbt.c to nand_base.c
- move instances of struct nand_bbt_descr from nand_bbt.c to nand_base.c
  as it is specific to NAND
- remove bbt, bbt_md and bbt_td from struct nand_chip and switch to
  accessing by the following path: struct mtd_info->struct bbm_info->...
- move nand_block_checkbad, nand_block_isbad from nand_base.c to nand_bbt.c
- move nand_default_bbt from nand_bbt.c to nand_base.c
- add nand_init_bbm function used init bad block management

Signed-off-by: Kamil Debski <kamil.debski@imgtec.com>
---
 drivers/mtd/nand/nand_base.c |  203 +++++++++++++++++++-----
 drivers/mtd/nand/nand_bbt.c  |  353 ++++++++++++++++--------------------------
 include/linux/mtd/bbm.h      |   46 +++++-
 include/linux/mtd/mtd.h      |    4 +
 include/linux/mtd/nand.h     |    9 --
 5 files changed, 342 insertions(+), 273 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c2e1232..4244028 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -39,6 +39,7 @@
 #include <linux/slab.h>
 #include <linux/mm.h>
 #include <linux/types.h>
+#include <linux/mtd/bbm.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
@@ -93,6 +94,55 @@ static struct nand_ecclayout nand_oob_128 = {
 		 .length = 78} }
 };
 
+/* Generic flash bbt descriptors */
+static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
+static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
+
+static struct nand_bbt_descr bbt_main_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
+	.offs =	8,
+	.len = 4,
+	.veroffs = 12,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
+	.pattern = bbt_pattern
+};
+
+static struct nand_bbt_descr bbt_mirror_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
+	.offs =	8,
+	.len = 4,
+	.veroffs = 12,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
+	.pattern = mirror_pattern
+};
+
+static struct nand_bbt_descr bbt_main_no_oob_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
+		| NAND_BBT_NO_OOB,
+	.len = 4,
+	.veroffs = 4,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
+	.pattern = bbt_pattern
+};
+
+static struct nand_bbt_descr bbt_mirror_no_oob_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
+		| NAND_BBT_NO_OOB,
+	.len = 4,
+	.veroffs = 4,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
+	.pattern = mirror_pattern
+};
+/*
+ * Define some generic bad / good block scan pattern which are used
+ * while scanning a device for factory marked good / bad blocks.
+ */
+static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+
 static int nand_get_device(struct mtd_info *mtd, int new_state);
 
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
@@ -451,7 +501,7 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 	}
 
 	/* Mark block bad in BBT */
-	if (chip->bbt) {
+	if (mtd->bbm->bbt) {
 		res = nand_markbad_bbt(mtd, ofs);
 		if (!ret)
 			ret = res;
@@ -492,37 +542,13 @@ static int nand_check_wp(struct mtd_info *mtd)
  */
 static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 {
-	struct nand_chip *chip = mtd->priv;
-
-	if (!chip->bbt)
+	if (!mtd->bbm->bbt)
 		return 0;
 	/* Return info from the table */
 	return nand_isreserved_bbt(mtd, ofs);
 }
 
 /**
- * nand_block_checkbad - [GENERIC] Check if a block is marked bad
- * @mtd: MTD device structure
- * @ofs: offset from device start
- * @getchip: 0, if the chip is already selected
- * @allowbbt: 1, if its allowed to access the bbt area
- *
- * Check, if the block is bad. Either by reading the bad block table or
- * calling of the scan function.
- */
-static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int getchip,
-			       int allowbbt)
-{
-	struct nand_chip *chip = mtd->priv;
-
-	if (!chip->bbt)
-		return chip->block_bad(mtd, ofs, getchip);
-
-	/* Return info from the table */
-	return nand_isbad_bbt(mtd, ofs, allowbbt);
-}
-
-/**
  * panic_nand_wait_ready - [GENERIC] Wait for the ready pin after commands.
  * @mtd: MTD device structure
  * @timeo: Timeout
@@ -2854,16 +2880,6 @@ static void nand_sync(struct mtd_info *mtd)
 }
 
 /**
- * nand_block_isbad - [MTD Interface] Check if block at offset is bad
- * @mtd: MTD device structure
- * @offs: offset relative to mtd start
- */
-static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
-{
-	return nand_block_checkbad(mtd, offs, 1, 0);
-}
-
-/**
  * nand_block_markbad - [MTD Interface] Mark block at the given offset as bad
  * @mtd: MTD device structure
  * @ofs: offset relative to mtd start
@@ -2971,6 +2987,94 @@ static void nand_shutdown(struct mtd_info *mtd)
 	nand_get_device(mtd, FL_SHUTDOWN);
 }
 
+/**
+ * nand_default_bbt - [NAND Interface] Select a default bad block table for the device
+ * @mtd: MTD device structure
+ *
+ * This function selects the default bad block table support for the device and
+ * calls the nand_scan_bbt function.
+ */
+int nand_default_bbt(struct mtd_info *mtd)
+{
+	struct bbm_info *bbm = mtd->bbm;
+
+	/* Is a flash based bad block table requested? */
+	if (bbm->options & NAND_BBT_USE_FLASH) {
+		/* Use the default pattern descriptors */
+		if (!bbm->bbt_td) {
+			if (bbm->options & NAND_BBT_NO_OOB) {
+				bbm->bbt_td = &bbt_main_no_oob_descr;
+				bbm->bbt_md = &bbt_mirror_no_oob_descr;
+			} else {
+				bbm->bbt_td = &bbt_main_descr;
+				bbm->bbt_md = &bbt_mirror_descr;
+			}
+		}
+	} else {
+		bbm->bbt_td = NULL;
+		bbm->bbt_md = NULL;
+	}
+
+	if (!bbm->badblock_pattern)
+		return -EINVAL;
+
+	return nand_scan_bbt(mtd, bbm->badblock_pattern);
+}
+
+
+#define BADBLOCK_SCAN_MASK (~NAND_BBT_NO_OOB)
+/**
+ * nand_create_badblock_pattern - [INTERN] Creates a BBT descriptor structure
+ * @this: NAND chip to create descriptor for
+ *
+ * This function allocates and initializes a nand_bbt_descr for BBM detection
+ * based on the properties of @this. The new descriptor is stored in
+ * this->badblock_pattern. Thus, this->badblock_pattern should be NULL when
+ * passed to this function.
+ */
+static int nand_create_badblock_pattern(struct nand_chip *this)
+{
+	struct nand_bbt_descr *bd;
+
+	if (this->badblock_pattern) {
+		pr_warn("Bad block pattern already allocated; not replacing\n");
+		return -EINVAL;
+	}
+	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
+	if (!bd)
+		return -ENOMEM;
+	bd->options = this->bbt_options & BADBLOCK_SCAN_MASK;
+	bd->offs = this->badblockpos;
+	bd->len = (this->options & NAND_BUSWIDTH_16) ? 2 : 1;
+	bd->pattern = scan_ff_pattern;
+	bd->options |= NAND_BBT_DYNAMICSTRUCT;
+	this->badblock_pattern = bd;
+	return 0;
+}
+
+static int nand_init_bbm(struct mtd_info *mtd, struct nand_chip *this)
+{
+	struct bbm_info *bbm;
+
+	bbm = kzalloc(sizeof(*bbm), GFP_KERNEL);
+	if (!bbm)
+		return -ENOMEM;
+
+	bbm->bbt_erase_shift	= this->bbt_erase_shift;
+	bbm->badblockpos	= this->badblockpos;
+	bbm->options		= this->bbt_options;
+	bbm->badblock_pattern	= this->badblock_pattern;
+	bbm->chipsize		= this->chipsize;
+	bbm->numchips		= this->numchips;
+	bbm->chip_shift		= this->chip_shift;
+	bbm->page_shift		= this->page_shift;
+	 /* XXX should databuf be copied or allocated ? */
+	bbm->databuf		= this->buffers->databuf;
+
+	mtd->bbm = bbm;
+	return 0;
+}
+
 /* Set default functions */
 static void nand_set_defaults(struct nand_chip *chip, int busw)
 {
@@ -3812,13 +3916,20 @@ ident_done:
 int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		    struct nand_flash_dev *table)
 {
-	int i, nand_maf_id, nand_dev_id;
+	int i, nand_maf_id, nand_dev_id, ret;
 	struct nand_chip *chip = mtd->priv;
 	struct nand_flash_dev *type;
 
 	/* Set the default functions */
 	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
 
+	/* Set the badblock_pattern if necessary */
+	if (!chip->badblock_pattern) {
+		ret = nand_create_badblock_pattern(chip);
+		if (ret)
+			return ret;
+	}
+
 	/* Read the flash type */
 	type = nand_get_flash_type(mtd, chip, &nand_maf_id,
 				   &nand_dev_id, table);
@@ -3902,7 +4013,7 @@ static bool nand_ecc_strength_good(struct mtd_info *mtd)
  */
 int nand_scan_tail(struct mtd_info *mtd)
 {
-	int i;
+	int i, ret;
 	struct nand_chip *chip = mtd->priv;
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	struct nand_buffers *nbuf;
@@ -4158,6 +4269,11 @@ int nand_scan_tail(struct mtd_info *mtd)
 		break;
 	}
 
+	/* Initialize the bad block management struct */
+	ret = nand_init_bbm(mtd, chip);
+	if (ret)
+		return ret;
+
 	/* Fill in remaining MTD driver data */
 	mtd->type = nand_is_slc(chip) ? MTD_NANDFLASH : MTD_MLCNANDFLASH;
 	mtd->flags = (chip->options & NAND_ROM) ? MTD_CAP_ROM :
@@ -4254,10 +4370,13 @@ void nand_release(struct mtd_info *mtd)
 
 	mtd_device_unregister(mtd);
 
-	/* Free bad block table memory */
-	kfree(chip->bbt);
-	if (!(chip->options & NAND_OWN_BUFFERS))
-		kfree(chip->buffers);
+	/* Free bad block table memory, if allocated */
+	if (mtd->bbm) {
+		kfree(mtd->bbm->bbt);
+		if (!(chip->options & NAND_OWN_BUFFERS))
+			kfree(chip->buffers);
+		kfree(mtd->bbm);
+	}
 
 	/* Free bad block descriptor memory */
 	if (chip->badblock_pattern && chip->badblock_pattern->options
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 9bb8453..21bde20 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -81,18 +81,18 @@
 
 static int nand_update_bbt(struct mtd_info *mtd, loff_t offs);
 
-static inline uint8_t bbt_get_entry(struct nand_chip *chip, int block)
+static inline uint8_t bbt_get_entry(struct bbm_info *bbm, int block)
 {
-	uint8_t entry = chip->bbt[block >> BBT_ENTRY_SHIFT];
+	uint8_t entry = bbm->bbt[block >> BBT_ENTRY_SHIFT];
 	entry >>= (block & BBT_ENTRY_MASK) * 2;
 	return entry & BBT_ENTRY_MASK;
 }
 
-static inline void bbt_mark_entry(struct nand_chip *chip, int block,
+static inline void bbt_mark_entry(struct bbm_info *bbm, int block,
 		uint8_t mark)
 {
 	uint8_t msk = (mark & BBT_ENTRY_MASK) << ((block & BBT_ENTRY_MASK) * 2);
-	chip->bbt[block >> BBT_ENTRY_SHIFT] |= msk;
+	bbm->bbt[block >> BBT_ENTRY_SHIFT] |= msk;
 }
 
 static int check_pattern_no_oob(uint8_t *buf, struct nand_bbt_descr *td)
@@ -175,7 +175,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		struct nand_bbt_descr *td, int offs)
 {
 	int res, ret = 0, i, j, act = 0;
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 	size_t retlen, len, totlen;
 	loff_t from;
 	int bits = td->options & NAND_BBT_NRBITS_MSK;
@@ -185,10 +185,10 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 
 	totlen = (num * bits) >> 3;
 	marker_len = add_marker_len(td);
-	from = ((loff_t)page) << this->page_shift;
+	from = ((loff_t)page) << bbm->page_shift;
 
 	while (totlen) {
-		len = min(totlen, (size_t)(1 << this->bbt_erase_shift));
+		len = min(totlen, (size_t)(1 << bbm->bbt_erase_shift));
 		if (marker_len) {
 			/*
 			 * In case the BBT marker is not in the OOB area it
@@ -224,8 +224,8 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				if (reserved_block_code && (tmp == reserved_block_code)) {
 					pr_info("nand_read_bbt: reserved block at 0x%012llx\n",
 						 (loff_t)(offs + act) <<
-						 this->bbt_erase_shift);
-					bbt_mark_entry(this, offs + act,
+						 bbm->bbt_erase_shift);
+					bbt_mark_entry(bbm, offs + act,
 							BBT_BLOCK_RESERVED);
 					mtd->ecc_stats.bbtblocks++;
 					continue;
@@ -236,13 +236,13 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				 */
 				pr_info("nand_read_bbt: bad block at 0x%012llx\n",
 					 (loff_t)(offs + act) <<
-					 this->bbt_erase_shift);
+					 bbm->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
 				if (tmp == 0)
-					bbt_mark_entry(this, offs + act,
+					bbt_mark_entry(bbm, offs + act,
 							BBT_BLOCK_FACTORY_BAD);
 				else
-					bbt_mark_entry(this, offs + act,
+					bbt_mark_entry(bbm, offs + act,
 							BBT_BLOCK_WORN);
 				mtd->ecc_stats.badblocks++;
 			}
@@ -266,23 +266,23 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
  */
 static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td, int chip)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 	int res = 0, i;
 
 	if (td->options & NAND_BBT_PERCHIP) {
 		int offs = 0;
-		for (i = 0; i < this->numchips; i++) {
+		for (i = 0; i < bbm->numchips; i++) {
 			if (chip == -1 || chip == i)
 				res = read_bbt(mtd, buf, td->pages[i],
-					this->chipsize >> this->bbt_erase_shift,
+					bbm->chipsize >> bbm->bbt_erase_shift,
 					td, offs);
 			if (res)
 				return res;
-			offs += this->chipsize >> this->bbt_erase_shift;
+			offs += bbm->chipsize >> bbm->bbt_erase_shift;
 		}
 	} else {
 		res = read_bbt(mtd, buf, td->pages[0],
-				mtd->size >> this->bbt_erase_shift, td, 0);
+				mtd->size >> bbm->bbt_erase_shift, td, 0);
 		if (res)
 			return res;
 	}
@@ -391,11 +391,11 @@ static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
 static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 			  struct nand_bbt_descr *td, struct nand_bbt_descr *md)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 
 	/* Read the primary version, if available */
 	if (td->options & NAND_BBT_VERSION) {
-		scan_read(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
+		scan_read(mtd, buf, (loff_t)td->pages[0] << bbm->page_shift,
 			      mtd->writesize, td);
 		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
@@ -404,7 +404,7 @@ static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 
 	/* Read the mirror version, if available */
 	if (md && (md->options & NAND_BBT_VERSION)) {
-		scan_read(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
+		scan_read(mtd, buf, (loff_t)md->pages[0] << bbm->page_shift,
 			      mtd->writesize, md);
 		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
@@ -457,7 +457,7 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	struct nand_bbt_descr *bd, int chip)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 	int i, numblocks, numpages;
 	int startblock;
 	loff_t from;
@@ -470,22 +470,22 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		numpages = 1;
 
 	if (chip == -1) {
-		numblocks = mtd->size >> this->bbt_erase_shift;
+		numblocks = mtd->size >> bbm->bbt_erase_shift;
 		startblock = 0;
 		from = 0;
 	} else {
-		if (chip >= this->numchips) {
+		if (chip >= bbm->numchips) {
 			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
-			       chip + 1, this->numchips);
+			       chip + 1, bbm->numchips);
 			return -EINVAL;
 		}
-		numblocks = this->chipsize >> this->bbt_erase_shift;
+		numblocks = bbm->chipsize >> bbm->bbt_erase_shift;
 		startblock = chip * numblocks;
 		numblocks += startblock;
-		from = (loff_t)startblock << this->bbt_erase_shift;
+		from = (loff_t)startblock << bbm->bbt_erase_shift;
 	}
 
-	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
+	if (bbm->options & NAND_BBT_SCANLASTPAGE)
 		from += mtd->erasesize - (mtd->writesize * numpages);
 
 	for (i = startblock; i < numblocks; i++) {
@@ -498,13 +498,13 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 			return ret;
 
 		if (ret) {
-			bbt_mark_entry(this, i, BBT_BLOCK_FACTORY_BAD);
+			bbt_mark_entry(bbm, i, BBT_BLOCK_FACTORY_BAD);
 			pr_warn("Bad eraseblock %d at 0x%012llx\n",
 				i, (unsigned long long)from);
 			mtd->ecc_stats.badblocks++;
 		}
 
-		from += (1 << this->bbt_erase_shift);
+		from += (1 << bbm->bbt_erase_shift);
 	}
 	return 0;
 }
@@ -526,16 +526,16 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
  */
 static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 	int i, chips;
 	int startblock, block, dir;
 	int scanlen = mtd->writesize + mtd->oobsize;
 	int bbtblocks;
-	int blocktopage = this->bbt_erase_shift - this->page_shift;
+	int blocktopage = bbm->bbt_erase_shift - bbm->page_shift;
 
 	/* Search direction top -> down? */
 	if (td->options & NAND_BBT_LASTBLOCK) {
-		startblock = (mtd->size >> this->bbt_erase_shift) - 1;
+		startblock = (mtd->size >> bbm->bbt_erase_shift) - 1;
 		dir = -1;
 	} else {
 		startblock = 0;
@@ -544,12 +544,12 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		chips = this->numchips;
-		bbtblocks = this->chipsize >> this->bbt_erase_shift;
+		chips = bbm->numchips;
+		bbtblocks = bbm->chipsize >> bbm->bbt_erase_shift;
 		startblock &= bbtblocks - 1;
 	} else {
 		chips = 1;
-		bbtblocks = mtd->size >> this->bbt_erase_shift;
+		bbtblocks = mtd->size >> bbm->bbt_erase_shift;
 	}
 
 	for (i = 0; i < chips; i++) {
@@ -560,7 +560,7 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 		for (block = 0; block < td->maxblocks; block++) {
 
 			int actblock = startblock + dir * block;
-			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
+			loff_t offs = (loff_t)actblock << bbm->bbt_erase_shift;
 
 			/* Read first page */
 			scan_read(mtd, buf, offs, mtd->writesize, td);
@@ -573,7 +573,7 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 				break;
 			}
 		}
-		startblock += this->chipsize >> this->bbt_erase_shift;
+		startblock += bbm->chipsize >> bbm->bbt_erase_shift;
 	}
 	/* Check, if we found a bbt for each requested chip */
 	for (i = 0; i < chips; i++) {
@@ -621,7 +621,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		     struct nand_bbt_descr *td, struct nand_bbt_descr *md,
 		     int chipsel)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 	struct erase_info einfo;
 	int i, res, chip = 0;
 	int bits, startblock, dir, page, offs, numblocks, sft, sftmsk;
@@ -641,16 +641,16 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		rcode = 0xff;
 	/* Write bad block table per chip rather than per device? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		numblocks = (int)(this->chipsize >> this->bbt_erase_shift);
+		numblocks = (int)(bbm->chipsize >> bbm->bbt_erase_shift);
 		/* Full device write or specific chip? */
 		if (chipsel == -1) {
-			nrchips = this->numchips;
+			nrchips = bbm->numchips;
 		} else {
 			nrchips = chipsel + 1;
 			chip = chipsel;
 		}
 	} else {
-		numblocks = (int)(mtd->size >> this->bbt_erase_shift);
+		numblocks = (int)(mtd->size >> bbm->bbt_erase_shift);
 		nrchips = 1;
 	}
 
@@ -681,13 +681,13 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		for (i = 0; i < td->maxblocks; i++) {
 			int block = startblock + dir * i;
 			/* Check, if the block is bad */
-			switch (bbt_get_entry(this, block)) {
+			switch (bbt_get_entry(bbm, block)) {
 			case BBT_BLOCK_WORN:
 			case BBT_BLOCK_FACTORY_BAD:
 				continue;
 			}
 			page = block <<
-				(this->bbt_erase_shift - this->page_shift);
+				(bbm->bbt_erase_shift - bbm->page_shift);
 			/* Check, if the block is used by the mirror table */
 			if (!md || md->pages[chip] != page)
 				goto write;
@@ -715,13 +715,13 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		default: return -EINVAL;
 		}
 
-		to = ((loff_t)page) << this->page_shift;
+		to = ((loff_t)page) << bbm->page_shift;
 
 		/* Must we save the block contents? */
 		if (td->options & NAND_BBT_SAVECONTENT) {
 			/* Make it block aligned */
-			to &= ~((loff_t)((1 << this->bbt_erase_shift) - 1));
-			len = 1 << this->bbt_erase_shift;
+			to &= ~((loff_t)((1 << bbm->bbt_erase_shift) - 1));
+			len = 1 << bbm->bbt_erase_shift;
 			res = mtd_read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
@@ -731,15 +731,15 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 				pr_warn("nand_bbt: ECC error while reading block for writing bad block table\n");
 			}
 			/* Read oob data */
-			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
+			ops.ooblen = (len >> bbm->page_shift) * mtd->oobsize;
 			ops.oobbuf = &buf[len];
 			res = mtd_read_oob(mtd, to + mtd->writesize, &ops);
 			if (res < 0 || ops.oobretlen != ops.ooblen)
 				goto outerr;
 
 			/* Calc the byte offset in the buffer */
-			pageoffs = page - (int)(to >> this->page_shift);
-			offs = pageoffs << this->page_shift;
+			pageoffs = page - (int)(to >> bbm->page_shift);
+			offs = pageoffs << bbm->page_shift;
 			/* Preset the bbt area with 0xff */
 			memset(&buf[offs], 0xff, (size_t)(numblocks >> sft));
 			ooboffs = len + (pageoffs * mtd->oobsize);
@@ -766,7 +766,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			len = ALIGN(len, mtd->writesize);
 			/* Preset the buffer with 0xff */
 			memset(buf, 0xff, len +
-			       (len >> this->page_shift)* mtd->oobsize);
+			       (len >> bbm->page_shift) * mtd->oobsize);
 			offs = 0;
 			ooboffs = len;
 			/* Pattern is located in oob area of first page */
@@ -780,7 +780,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		for (i = 0; i < numblocks; i++) {
 			uint8_t dat;
 			int sftcnt = (i << (3 - sft)) & sftmsk;
-			dat = bbt_get_entry(this, chip * numblocks + i);
+			dat = bbt_get_entry(bbm, chip * numblocks + i);
 			/* Do not store the reserved bbt blocks! */
 			buf[offs + (i >> sft)] &= ~(msk[dat] << sftcnt);
 		}
@@ -788,7 +788,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		memset(&einfo, 0, sizeof(einfo));
 		einfo.mtd = mtd;
 		einfo.addr = to;
-		einfo.len = 1 << this->bbt_erase_shift;
+		einfo.len = 1 << bbm->bbt_erase_shift;
 		res = nand_erase_nand(mtd, &einfo, 1);
 		if (res < 0)
 			goto outerr;
@@ -820,11 +820,11 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
  * The function creates a memory based bbt by scanning the device for
  * manufacturer / software marked good / bad blocks.
  */
-static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 
-	return create_bbt(mtd, this->buffers->databuf, bd, -1);
+	return create_bbt(mtd, bbm->databuf, bd, -1);
 }
 
 /**
@@ -841,14 +841,14 @@ static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *b
 static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *bd)
 {
 	int i, chips, writeops, create, chipsel, res, res2;
-	struct nand_chip *this = mtd->priv;
-	struct nand_bbt_descr *td = this->bbt_td;
-	struct nand_bbt_descr *md = this->bbt_md;
+	struct bbm_info *bbm = mtd->bbm;
+	struct nand_bbt_descr *td = bbm->bbt_td;
+	struct nand_bbt_descr *md = bbm->bbt_md;
 	struct nand_bbt_descr *rd, *rd2;
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP)
-		chips = this->numchips;
+		chips = bbm->numchips;
 	else
 		chips = 1;
 
@@ -897,7 +897,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 				continue;
 
 			/* Create the table in memory by scanning the chip(s) */
-			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
+			if (!(bbm->options & NAND_BBT_CREATE_EMPTY))
 				create_bbt(mtd, buf, bd, chipsel);
 
 			td->version[i] = 1;
@@ -965,17 +965,17 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
  */
 static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 	int i, j, chips, block, nrblocks, update;
 	uint8_t oldval;
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		chips = this->numchips;
-		nrblocks = (int)(this->chipsize >> this->bbt_erase_shift);
+		chips = bbm->numchips;
+		nrblocks = (int)(bbm->chipsize >> bbm->bbt_erase_shift);
 	} else {
 		chips = 1;
-		nrblocks = (int)(mtd->size >> this->bbt_erase_shift);
+		nrblocks = (int)(mtd->size >> bbm->bbt_erase_shift);
 	}
 
 	for (i = 0; i < chips; i++) {
@@ -983,13 +983,14 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		    !(td->options & NAND_BBT_WRITE)) {
 			if (td->pages[i] == -1)
 				continue;
-			block = td->pages[i] >> (this->bbt_erase_shift - this->page_shift);
-			oldval = bbt_get_entry(this, block);
-			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
+			block = td->pages[i] >> (bbm->bbt_erase_shift -
+							bbm->page_shift);
+			oldval = bbt_get_entry(bbm, block);
+			bbt_mark_entry(bbm, block, BBT_BLOCK_RESERVED);
 			if ((oldval != BBT_BLOCK_RESERVED) &&
 					td->reserved_block_code)
 				nand_update_bbt(mtd, (loff_t)block <<
-						this->bbt_erase_shift);
+						bbm->bbt_erase_shift);
 			continue;
 		}
 		update = 0;
@@ -998,8 +999,8 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		else
 			block = i * nrblocks;
 		for (j = 0; j < td->maxblocks; j++) {
-			oldval = bbt_get_entry(this, block);
-			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
+			oldval = bbt_get_entry(bbm, block);
+			bbt_mark_entry(bbm, block, BBT_BLOCK_RESERVED);
 			if (oldval != BBT_BLOCK_RESERVED)
 				update = 1;
 			block++;
@@ -1011,7 +1012,7 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		 */
 		if (update && td->reserved_block_code)
 			nand_update_bbt(mtd, (loff_t)(block - 1) <<
-					this->bbt_erase_shift);
+					bbm->bbt_erase_shift);
 	}
 }
 
@@ -1025,7 +1026,7 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
  */
 static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 	u32 pattern_len;
 	u32 bits;
 	u32 table_size;
@@ -1036,16 +1037,16 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	pattern_len = bd->len;
 	bits = bd->options & NAND_BBT_NRBITS_MSK;
 
-	BUG_ON((this->bbt_options & NAND_BBT_NO_OOB) &&
-			!(this->bbt_options & NAND_BBT_USE_FLASH));
+	BUG_ON((bbm->options & NAND_BBT_NO_OOB) &&
+			!(bbm->options & NAND_BBT_USE_FLASH));
 	BUG_ON(!bits);
 
 	if (bd->options & NAND_BBT_VERSION)
 		pattern_len++;
 
 	if (bd->options & NAND_BBT_NO_OOB) {
-		BUG_ON(!(this->bbt_options & NAND_BBT_USE_FLASH));
-		BUG_ON(!(this->bbt_options & NAND_BBT_NO_OOB));
+		BUG_ON(!(bbm->options & NAND_BBT_USE_FLASH));
+		BUG_ON(!(bbm->options & NAND_BBT_NO_OOB));
 		BUG_ON(bd->offs);
 		if (bd->options & NAND_BBT_VERSION)
 			BUG_ON(bd->veroffs != bd->len);
@@ -1053,14 +1054,14 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	}
 
 	if (bd->options & NAND_BBT_PERCHIP)
-		table_size = this->chipsize >> this->bbt_erase_shift;
+		table_size = bbm->chipsize >> bbm->bbt_erase_shift;
 	else
-		table_size = mtd->size >> this->bbt_erase_shift;
+		table_size = mtd->size >> bbm->bbt_erase_shift;
 	table_size >>= 3;
 	table_size *= bits;
 	if (bd->options & NAND_BBT_NO_OOB)
 		table_size += pattern_len;
-	BUG_ON(table_size > (1 << this->bbt_erase_shift));
+	BUG_ON(table_size > (1 << bbm->bbt_erase_shift));
 }
 
 /**
@@ -1077,21 +1078,24 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
  */
 int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 	int len, res = 0;
 	uint8_t *buf;
-	struct nand_bbt_descr *td = this->bbt_td;
-	struct nand_bbt_descr *md = this->bbt_md;
+	struct nand_bbt_descr *td = bbm->bbt_td;
+	struct nand_bbt_descr *md = bbm->bbt_md;
 
-	len = mtd->size >> (this->bbt_erase_shift + 2);
+	len = mtd->size >> (bbm->bbt_erase_shift + 2);
 	/*
 	 * Allocate memory (2bit per block) and clear the memory bad block
 	 * table.
 	 */
-	this->bbt = kzalloc(len, GFP_KERNEL);
-	if (!this->bbt)
+	bbm->bbt = kzalloc(len, GFP_KERNEL);
+	if (!bbm->bbt)
 		return -ENOMEM;
 
+	if (!bbm->isbad_bbt)
+		bbm->isbad_bbt = nand_isbad_bbt;
+
 	/*
 	 * If no primary table decriptor is given, scan the device to build a
 	 * memory based bad block table.
@@ -1099,8 +1103,8 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	if (!td) {
 		if ((res = nand_memory_bbt(mtd, bd))) {
 			pr_err("nand_bbt: can't scan flash and build the RAM-based BBT\n");
-			kfree(this->bbt);
-			this->bbt = NULL;
+			kfree(bbm->bbt);
+			bbm->bbt = NULL;
 		}
 		return res;
 	}
@@ -1108,12 +1112,12 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	verify_bbt_descr(mtd, md);
 
 	/* Allocate a temporary buffer for one eraseblock incl. oob */
-	len = (1 << this->bbt_erase_shift);
-	len += (len >> this->page_shift) * mtd->oobsize;
+	len = (1 << bbm->bbt_erase_shift);
+	len += (len >> bbm->page_shift) * mtd->oobsize;
 	buf = vmalloc(len);
 	if (!buf) {
-		kfree(this->bbt);
-		this->bbt = NULL;
+		kfree(bbm->bbt);
+		bbm->bbt = NULL;
 		return -ENOMEM;
 	}
 
@@ -1145,26 +1149,26 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
  */
 static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 	int len, res = 0;
 	int chip, chipsel;
 	uint8_t *buf;
-	struct nand_bbt_descr *td = this->bbt_td;
-	struct nand_bbt_descr *md = this->bbt_md;
+	struct nand_bbt_descr *td = bbm->bbt_td;
+	struct nand_bbt_descr *md = bbm->bbt_md;
 
-	if (!this->bbt || !td)
+	if (!bbm->bbt || !td)
 		return -EINVAL;
 
 	/* Allocate a temporary buffer for one eraseblock incl. oob */
-	len = (1 << this->bbt_erase_shift);
-	len += (len >> this->page_shift) * mtd->oobsize;
+	len = (1 << bbm->bbt_erase_shift);
+	len += (len >> bbm->page_shift) * mtd->oobsize;
 	buf = kmalloc(len, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		chip = (int)(offs >> this->chip_shift);
+		chip = (int)(offs >> bbm->chip_shift);
 		chipsel = chip;
 	} else {
 		chip = 0;
@@ -1191,135 +1195,52 @@ static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 	return res;
 }
 
-/*
- * Define some generic bad / good block scan pattern which are used
- * while scanning a device for factory marked good / bad blocks.
- */
-static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
-
-/* Generic flash bbt descriptors */
-static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
-static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
-
-static struct nand_bbt_descr bbt_main_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
-	.offs =	8,
-	.len = 4,
-	.veroffs = 12,
-	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
-	.pattern = bbt_pattern
-};
-
-static struct nand_bbt_descr bbt_mirror_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
-	.offs =	8,
-	.len = 4,
-	.veroffs = 12,
-	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
-	.pattern = mirror_pattern
-};
-
-static struct nand_bbt_descr bbt_main_no_oob_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
-		| NAND_BBT_NO_OOB,
-	.len = 4,
-	.veroffs = 4,
-	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
-	.pattern = bbt_pattern
-};
-
-static struct nand_bbt_descr bbt_mirror_no_oob_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
-		| NAND_BBT_NO_OOB,
-	.len = 4,
-	.veroffs = 4,
-	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
-	.pattern = mirror_pattern
-};
-
-#define BADBLOCK_SCAN_MASK (~NAND_BBT_NO_OOB)
 /**
- * nand_create_badblock_pattern - [INTERN] Creates a BBT descriptor structure
- * @this: NAND chip to create descriptor for
- *
- * This function allocates and initializes a nand_bbt_descr for BBM detection
- * based on the properties of @this. The new descriptor is stored in
- * this->badblock_pattern. Thus, this->badblock_pattern should be NULL when
- * passed to this function.
+ * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
+ * @mtd: MTD device structure
+ * @offs: offset in the device
  */
-static int nand_create_badblock_pattern(struct nand_chip *this)
+int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs)
 {
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
+	struct bbm_info *bbm = mtd->bbm;
+	int block;
+
+	block = (int)(offs >> bbm->bbt_erase_shift);
+	return bbt_get_entry(bbm, block) == BBT_BLOCK_RESERVED;
 }
 
 /**
- * nand_default_bbt - [NAND Interface] Select a default bad block table for the device
+ * nand_block_checkbad - [GENERIC] Check if a block is marked bad
  * @mtd: MTD device structure
+ * @ofs: offset from device start
+ * @getchip: 0, if the chip is already selected
+ * @allowbbt: 1, if its allowed to access the bbt area
  *
- * This function selects the default bad block table support for the device and
- * calls the nand_scan_bbt function.
+ * Check, if the block is bad. Either by reading the bad block table or
+ * calling of the scan function.
  */
-int nand_default_bbt(struct mtd_info *mtd)
+int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int getchip,
+			       int allowbbt)
 {
-	struct nand_chip *this = mtd->priv;
-	int ret;
-
-	/* Is a flash based bad block table requested? */
-	if (this->bbt_options & NAND_BBT_USE_FLASH) {
-		/* Use the default pattern descriptors */
-		if (!this->bbt_td) {
-			if (this->bbt_options & NAND_BBT_NO_OOB) {
-				this->bbt_td = &bbt_main_no_oob_descr;
-				this->bbt_md = &bbt_mirror_no_oob_descr;
-			} else {
-				this->bbt_td = &bbt_main_descr;
-				this->bbt_md = &bbt_mirror_descr;
-			}
-		}
-	} else {
-		this->bbt_td = NULL;
-		this->bbt_md = NULL;
-	}
+	struct nand_chip *chip = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 
-	if (!this->badblock_pattern) {
-		ret = nand_create_badblock_pattern(this);
-		if (ret)
-			return ret;
-	}
+	if (!bbm->bbt)
+		return chip->block_bad(mtd, ofs, getchip);
 
-	return nand_scan_bbt(mtd, this->badblock_pattern);
+	/* Return info from the table */
+	return bbm->isbad_bbt(mtd, ofs, allowbbt);
 }
 
+
 /**
- * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
+ * nand_block_isbad - [MTD Interface] Check if block at offset is bad
  * @mtd: MTD device structure
- * @offs: offset in the device
+ * @offs: offset relative to mtd start
  */
-int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs)
+int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 {
-	struct nand_chip *this = mtd->priv;
-	int block;
-
-	block = (int)(offs >> this->bbt_erase_shift);
-	return bbt_get_entry(this, block) == BBT_BLOCK_RESERVED;
+	return nand_block_checkbad(mtd, offs, 1, 0);
 }
 
 /**
@@ -1330,11 +1251,11 @@ int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs)
  */
 int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 	int block, res;
 
-	block = (int)(offs >> this->bbt_erase_shift);
-	res = bbt_get_entry(this, block);
+	block = (int)(offs >> bbm->bbt_erase_shift);
+	res = bbt_get_entry(bbm, block);
 
 	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
 		 (unsigned int)offs, block, res);
@@ -1357,16 +1278,16 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
  */
 int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
 {
-	struct nand_chip *this = mtd->priv;
+	struct bbm_info *bbm = mtd->bbm;
 	int block, ret = 0;
 
-	block = (int)(offs >> this->bbt_erase_shift);
+	block = (int)(offs >> bbm->bbt_erase_shift);
 
 	/* Mark bad block in memory */
-	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
+	bbt_mark_entry(bbm, block, BBT_BLOCK_WORN);
 
 	/* Update flash-based bad block table */
-	if (this->bbt_options & NAND_BBT_USE_FLASH)
+	if (bbm->options & NAND_BBT_USE_FLASH)
 		ret = nand_update_bbt(mtd, offs);
 
 	return ret;
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 36bb6a5..743ac20 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -139,29 +139,51 @@ struct nand_bbt_descr {
 #define ONENAND_BBT_READ_ECC_ERROR	2
 #define ONENAND_BBT_READ_FATAL_ERROR	4
 
+struct mtd_info;
+
 /**
  * struct bbm_info - [GENERIC] Bad Block Table data structure
  * @bbt_erase_shift:	[INTERN] number of address bits in a bbt entry
- * @badblockpos:	[INTERN] position of the bad block marker in the oob area
+ * @badblockpos:	[INTERN] position of the bad block marker in the oob
+ *			area
  * @options:		options for this descriptor
- * @bbt:		[INTERN] bad block table pointer
  * @isbad_bbt:		function to determine if a block is bad
+ * @bbt:		[INTERN] bad block table pointer
+ * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
+ *			lookup.
+ * @bbt_md:		[REPLACEABLE] bad block table mirror descriptor
  * @badblock_pattern:	[REPLACEABLE] bad block scan pattern used for
  *			initial bad block scan
- * @priv:		[OPTIONAL] pointer to private bbm date
+ * @chipsize:		[INTERN] the size of one chip for multichip arrays
+ * @numchips:		[INTERN] number of physical chips
+ * @chip_shift:		[INTERN] number of address bits in one chip
+ * @page_shift:		[INTERN] number of address bits in a page (column
+ *			address bits).
+ * @databuf:		temporary buffer used to create a memory based bad block
+ *			table
+ * @priv:		[OPTIONAL] pointer to private bbm data
  */
 struct bbm_info {
 	int bbt_erase_shift;
 	int badblockpos;
 	int options;
 
-	uint8_t *bbt;
-
 	int (*isbad_bbt)(struct mtd_info *mtd, loff_t ofs, int allowbbt);
 
-	/* TODO Add more NAND specific fileds */
+	uint8_t *bbt;
+	struct nand_bbt_descr *bbt_td;
+	struct nand_bbt_descr *bbt_md;
 	struct nand_bbt_descr *badblock_pattern;
 
+	/* NAND specific fileds */
+	uint64_t chipsize;
+	int numchips;
+	int chip_shift;
+	int page_shift;
+
+	/* Temporary buffer */
+	uint8_t *databuf;
+
 	void *priv;
 };
 
@@ -169,4 +191,16 @@ struct bbm_info {
 extern int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
 extern int onenand_default_bbt(struct mtd_info *mtd);
 
+/* NAND BBT interface */
+extern int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
+extern int nand_default_bbt(struct mtd_info *mtd);
+extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
+extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
+extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
+
+int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
+int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int getchip,
+			       int allowbbt);
+int nand_block_isbad(struct mtd_info *mtd, loff_t offs);
+
 #endif	/* __LINUX_MTD_BBM_H */
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f17fa75..279d3ca 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -24,6 +24,7 @@
 #include <linux/uio.h>
 #include <linux/notifier.h>
 #include <linux/device.h>
+#include <linux/mtd/bbm.h>
 
 #include <mtd/mtd-abi.h>
 
@@ -247,6 +248,9 @@ struct mtd_info {
 	/* Subpage shift (NAND) */
 	int subpage_sft;
 
+	/* Bad Block Management */
+	struct bbm_info *bbm;
+
 	void *priv;
 
 	struct module *owner;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3d4ea7e..bc0aac4 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -711,10 +711,6 @@ struct nand_chip {
 	struct nand_buffers *buffers;
 	struct nand_hw_control hwcontrol;
 
-	uint8_t *bbt;
-	struct nand_bbt_descr *bbt_td;
-	struct nand_bbt_descr *bbt_md;
-
 	struct nand_bbt_descr *badblock_pattern;
 
 	void *priv;
@@ -833,11 +829,6 @@ struct nand_manufacturers {
 extern struct nand_flash_dev nand_flash_ids[];
 extern struct nand_manufacturers nand_manuf_ids[];
 
-extern int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
-extern int nand_default_bbt(struct mtd_info *mtd);
-extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
-extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
 extern int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 			   int allowbbt);
 extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
-- 
1.7.9.5
