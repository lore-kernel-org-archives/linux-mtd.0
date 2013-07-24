Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1sZ6-0001xx-Vk
 for linux-mtd@lists.infradead.org; Wed, 24 Jul 2013 06:28:56 +0000
Received: by mail-pd0-f169.google.com with SMTP id y10so15977pdj.14
 for <linux-mtd@lists.infradead.org>; Tue, 23 Jul 2013 23:28:26 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] mtd: nand: add accessors, macros for in-memory BBT
Date: Tue, 23 Jul 2013 23:27:56 -0700
Message-Id: <1374647279-14083-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1374647279-14083-1-git-send-email-computersforpeace@gmail.com>
References: <1374647279-14083-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is an abundance of magic numbers and complicated shifting/masking
logic in the in-memory BBT code, and due to the complicated
shifting/masking, we often store the block number multiplied by 2.
Together, these features make the code unnecessary complex and hard to
read.

This patch adds macros to represent the 00b, 01b, 10b, and 11b
memory-BBT magic numbers, as well as two accessor functions for reading
and marking the memory-BBT bitfield for a given block.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c | 132 ++++++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 60 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 2672643..3f18776 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -71,6 +71,28 @@
 #include <linux/export.h>
 #include <linux/string.h>
 
+#define BBT_BLOCK_GOOD		0x00
+#define BBT_BLOCK_WORN		0x01
+#define BBT_BLOCK_RESERVED	0x02
+#define BBT_BLOCK_FACTORY_BAD	0x03
+
+#define BBT_ENTRY_MASK		0x03
+#define BBT_ENTRY_SHIFT		2
+
+static inline uint8_t bbt_get_entry(struct nand_chip *chip, int block)
+{
+	uint8_t entry = chip->bbt[block >> BBT_ENTRY_SHIFT];
+	entry >>= (block & BBT_ENTRY_MASK) * 2;
+	return entry & BBT_ENTRY_MASK;
+}
+
+static inline void bbt_mark_entry(struct nand_chip *chip, int block,
+		uint8_t mark)
+{
+	uint8_t msk = (mark & BBT_ENTRY_MASK) << ((block & BBT_ENTRY_MASK) * 2);
+	chip->bbt[block >> BBT_ENTRY_SHIFT] |= msk;
+}
+
 static int check_pattern_no_oob(uint8_t *buf, struct nand_bbt_descr *td)
 {
 	if (memcmp(buf, td->pattern, td->len))
@@ -159,7 +181,7 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
  * @page: the starting page
  * @num: the number of bbt descriptors to read
  * @td: the bbt describtion table
- * @offs: offset in the memory table
+ * @offs: block number offset in the table
  *
  * Read the bad block table starting from page.
  */
@@ -209,14 +231,16 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		/* Analyse data */
 		for (i = 0; i < len; i++) {
 			uint8_t dat = buf[i];
-			for (j = 0; j < 8; j += bits, act += 2) {
+			for (j = 0; j < 8; j += bits, act++) {
 				uint8_t tmp = (dat >> j) & msk;
 				if (tmp == msk)
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
 					pr_info("nand_read_bbt: reserved block at 0x%012llx\n",
-						 (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
-					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
+						 (loff_t)(offs + act) <<
+						 this->bbt_erase_shift);
+					bbt_mark_entry(this, offs + act,
+							BBT_BLOCK_RESERVED);
 					mtd->ecc_stats.bbtblocks++;
 					continue;
 				}
@@ -225,12 +249,15 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				 * move this message to pr_debug.
 				 */
 				pr_info("nand_read_bbt: bad block at 0x%012llx\n",
-					 (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+					 (loff_t)(offs + act) <<
+					 this->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
 				if (tmp == 0)
-					this->bbt[offs + (act >> 3)] |= 0x3 << (act & 0x06);
+					bbt_mark_entry(this, offs + act,
+							BBT_BLOCK_FACTORY_BAD);
 				else
-					this->bbt[offs + (act >> 3)] |= 0x1 << (act & 0x06);
+					bbt_mark_entry(this, offs + act,
+							BBT_BLOCK_WORN);
 				mtd->ecc_stats.badblocks++;
 			}
 		}
@@ -265,7 +292,7 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 					td, offs);
 			if (res)
 				return res;
-			offs += this->chipsize >> (this->bbt_erase_shift + 2);
+			offs += this->chipsize >> this->bbt_erase_shift;
 		}
 	} else {
 		res = read_bbt(mtd, buf, td->pages[0],
@@ -489,11 +516,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	}
 
 	if (chip == -1) {
-		/*
-		 * Note that numblocks is 2 * (real numblocks) here, see i+=2
-		 * below as it makes shifting and masking less painful
-		 */
-		numblocks = mtd->size >> (this->bbt_erase_shift - 1);
+		numblocks = mtd->size >> this->bbt_erase_shift;
 		startblock = 0;
 		from = 0;
 	} else {
@@ -502,16 +525,16 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 			       chip + 1, this->numchips);
 			return -EINVAL;
 		}
-		numblocks = this->chipsize >> (this->bbt_erase_shift - 1);
+		numblocks = this->chipsize >> this->bbt_erase_shift;
 		startblock = chip * numblocks;
 		numblocks += startblock;
-		from = (loff_t)startblock << (this->bbt_erase_shift - 1);
+		from = (loff_t)startblock << this->bbt_erase_shift;
 	}
 
 	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
 		from += mtd->erasesize - (mtd->writesize * numpages);
 
-	for (i = startblock; i < numblocks;) {
+	for (i = startblock; i < numblocks; i++) {
 		int ret;
 
 		BUG_ON(bd->options & NAND_BBT_NO_OOB);
@@ -526,13 +549,12 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 			return ret;
 
 		if (ret) {
-			this->bbt[i >> 3] |= 0x03 << (i & 0x6);
+			bbt_mark_entry(this, i, BBT_BLOCK_FACTORY_BAD);
 			pr_warn("Bad eraseblock %d at 0x%012llx\n",
-				i >> 1, (unsigned long long)from);
+				i, (unsigned long long)from);
 			mtd->ecc_stats.badblocks++;
 		}
 
-		i += 2;
 		from += (1 << this->bbt_erase_shift);
 	}
 	return 0;
@@ -655,9 +677,9 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 {
 	struct nand_chip *this = mtd->priv;
 	struct erase_info einfo;
-	int i, j, res, chip = 0;
+	int i, res, chip = 0;
 	int bits, startblock, dir, page, offs, numblocks, sft, sftmsk;
-	int nrchips, bbtoffs, pageoffs, ooboffs;
+	int nrchips, pageoffs, ooboffs;
 	uint8_t msk[4];
 	uint8_t rcode = td->reserved_block_code;
 	size_t retlen, len = 0;
@@ -713,10 +735,9 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		for (i = 0; i < td->maxblocks; i++) {
 			int block = startblock + dir * i;
 			/* Check, if the block is bad */
-			switch ((this->bbt[block >> 2] >>
-				 (2 * (block & 0x03))) & 0x03) {
-			case 0x01:
-			case 0x03:
+			switch (bbt_get_entry(this, block)) {
+			case BBT_BLOCK_WORN:
+			case BBT_BLOCK_FACTORY_BAD:
 				continue;
 			}
 			page = block <<
@@ -748,8 +769,6 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		default: return -EINVAL;
 		}
 
-		bbtoffs = chip * (numblocks >> 2);
-
 		to = ((loff_t)page) << this->page_shift;
 
 		/* Must we save the block contents? */
@@ -814,16 +833,12 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			buf[ooboffs + td->veroffs] = td->version[chip];
 
 		/* Walk through the memory table */
-		for (i = 0; i < numblocks;) {
+		for (i = 0; i < numblocks; i++) {
 			uint8_t dat;
-			dat = this->bbt[bbtoffs + (i >> 2)];
-			for (j = 0; j < 4; j++, i++) {
-				int sftcnt = (i << (3 - sft)) & sftmsk;
-				/* Do not store the reserved bbt blocks! */
-				buf[offs + (i >> sft)] &=
-					~(msk[dat & 0x03] << sftcnt);
-				dat >>= 2;
-			}
+			int sftcnt = (i << (3 - sft)) & sftmsk;
+			dat = bbt_get_entry(this, chip * numblocks + i);
+			/* Do not store the reserved bbt blocks! */
+			buf[offs + (i >> sft)] &= ~(msk[dat] << sftcnt);
 		}
 
 		memset(&einfo, 0, sizeof(einfo));
@@ -1009,7 +1024,7 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 {
 	struct nand_chip *this = mtd->priv;
 	int i, j, chips, block, nrblocks, update;
-	uint8_t oldval, newval;
+	uint8_t oldval;
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
@@ -1026,12 +1041,12 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 			if (td->pages[i] == -1)
 				continue;
 			block = td->pages[i] >> (this->bbt_erase_shift - this->page_shift);
-			block <<= 1;
-			oldval = this->bbt[(block >> 3)];
-			newval = oldval | (0x2 << (block & 0x06));
-			this->bbt[(block >> 3)] = newval;
-			if ((oldval != newval) && td->reserved_block_code)
-				nand_update_bbt(mtd, (loff_t)block << (this->bbt_erase_shift - 1));
+			oldval = bbt_get_entry(this, block);
+			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
+			if ((oldval != BBT_BLOCK_RESERVED) &&
+					td->reserved_block_code)
+				nand_update_bbt(mtd, (loff_t)block <<
+						this->bbt_erase_shift);
 			continue;
 		}
 		update = 0;
@@ -1039,14 +1054,12 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 			block = ((i + 1) * nrblocks) - td->maxblocks;
 		else
 			block = i * nrblocks;
-		block <<= 1;
 		for (j = 0; j < td->maxblocks; j++) {
-			oldval = this->bbt[(block >> 3)];
-			newval = oldval | (0x2 << (block & 0x06));
-			this->bbt[(block >> 3)] = newval;
-			if (oldval != newval)
+			oldval = bbt_get_entry(this, block);
+			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
+			if (oldval != BBT_BLOCK_RESERVED)
 				update = 1;
-			block += 2;
+			block++;
 		}
 		/*
 		 * If we want reserved blocks to be recorded to flash, and some
@@ -1054,7 +1067,8 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		 * bbts.  This should only happen once.
 		 */
 		if (update && td->reserved_block_code)
-			nand_update_bbt(mtd, (loff_t)(block - 2) << (this->bbt_erase_shift - 1));
+			nand_update_bbt(mtd, (loff_t)(block - 1) <<
+					this->bbt_erase_shift);
 	}
 }
 
@@ -1356,23 +1370,21 @@ int nand_default_bbt(struct mtd_info *mtd)
 int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 {
 	struct nand_chip *this = mtd->priv;
-	int block;
-	uint8_t res;
+	int block, res;
 
-	/* Get block number * 2 */
-	block = (int)(offs >> (this->bbt_erase_shift - 1));
-	res = (this->bbt[block >> 3] >> (block & 0x06)) & 0x03;
+	block = (int)(offs >> this->bbt_erase_shift);
+	res = bbt_get_entry(this, block);
 
 	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: "
 			"(block %d) 0x%02x\n",
-			(unsigned int)offs, block >> 1, res);
+			(unsigned int)offs, block, res);
 
-	switch ((int)res) {
-	case 0x00:
+	switch (res) {
+	case BBT_BLOCK_GOOD:
 		return 0;
-	case 0x01:
+	case BBT_BLOCK_WORN:
 		return 1;
-	case 0x02:
+	case BBT_BLOCK_RESERVED:
 		return allowbbt ? 0 : 1;
 	}
 	return 1;
-- 
1.8.3.2
