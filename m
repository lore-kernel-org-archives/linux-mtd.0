Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5GLV-0006xY-00
 for linux-mtd@lists.infradead.org; Wed, 17 Jun 2015 16:37:51 +0000
From: Kamil Debski <kamil.debski@imgtec.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC 2/2] mtd: nand: onenand: Switch OneNAND core to use the common
 BBM code
Date: Wed, 17 Jun 2015 17:40:35 +0100
Message-ID: <1434559235-3617-3-git-send-email-kamil.debski@imgtec.com>
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

This patch switches the OneNAND core to use the common Bad Block
Management.

List of changes:
- move instance of struct nand_bbt_descr from onenand_bbt.c to
  onenand_base.c
- move onenand_default_bbt, onenand_init_bbm, from onenand_bbt.c to
  onenand_base.c
- change onenand_base.c to use struct mtd_info to access struct bbm_info
  instead of struct onenand_chip
- remove functions from onenad_bbt.c that are already in nand_bbt.c:
  check_short_pattern, create_bbt, onenand_memory_bbt, onenand_isbad_bbt,

Signed-off-by: Kamil Debski <kamil.debski@imgtec.com>
---
 drivers/mtd/onenand/onenand_base.c |   71 +++++++++++--
 drivers/mtd/onenand/onenand_bbt.c  |  201 +-----------------------------------
 include/linux/mtd/onenand.h        |    2 -
 3 files changed, 69 insertions(+), 205 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 43b3392..5377e62 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1560,6 +1560,62 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
 	return 0;
 }
 
+/*
+ * Define some generic bad / good block scan pattern which are used
+ * while scanning a device for factory marked good / bad blocks.
+ */
+static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+
+static struct nand_bbt_descr largepage_memorybased = {
+	.options = 0,
+	.offs = 0,
+	.len = 2,
+	.pattern = scan_ff_pattern,
+};
+
+/**
+ * onenand_default_bbt - [OneNAND Interface] Select a default bad block table for the device
+ * @param mtd		MTD device structure
+ *
+ * This function selects the default bad block table
+ * support for the device and calls the onenand_scan_bbt function
+ */
+int onenand_default_bbt(struct mtd_info *mtd)
+{
+	struct bbm_info *bbm = mtd->bbm;
+
+	return onenand_scan_bbt(mtd, bbm->badblock_pattern);
+}
+EXPORT_SYMBOL(onenand_default_bbt);
+
+static int onenand_init_bbm(struct mtd_info *mtd, struct onenand_chip *this)
+{
+	struct bbm_info *bbm;
+
+	bbm = kzalloc(sizeof(*bbm) + this->writesize, GFP_KERNEL);
+	if (!bbm)
+		return -ENOMEM;
+
+	bbm->bbt_erase_shift	= this->erase_shift;
+	bbm->badblockpos	= ONENAND_BADBLOCK_POS;
+	/* The default behaviour of OneNAND BBM was equivalent
+	 * to the behaviour of NAND BBM with the following
+	 * option set. */
+	bbm->options		= NAND_BBT_SCAN2NDPAGE;
+	/* bbm->badblock_pattern	= this->badblock_pattern; */
+	/* bbm->badblock_pattern was always assigned &largepage_memorybase
+	 * by the OneNAND BBM. */
+	bbm->badblock_pattern	= &largepage_memorybased;
+	bbm->chipsize		= this->chipsize;
+	bbm->numchips		= 1;
+	bbm->page_shift		= this->page_shift;
+	/* XXX should it be copied or allocated ? */
+	bbm->databuf		= (uint8_t *)(bbm + 1);
+
+	mtd->bbm = bbm;
+	return 0;
+}
+
 /**
  * onenand_bbt_read_oob - [MTD Interface] OneNAND read out-of-band for bbt scan
  * @param mtd		MTD device structure
@@ -1568,7 +1624,7 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
  *
  * OneNAND read out-of-band data from the spare area for bbt scan
  */
-int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from, 
+int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this = mtd->priv;
@@ -2225,8 +2281,7 @@ static int onenand_write_oob(struct mtd_info *mtd, loff_t to,
  */
 static int onenand_block_isbad_nolock(struct mtd_info *mtd, loff_t ofs, int allowbbt)
 {
-	struct onenand_chip *this = mtd->priv;
-	struct bbm_info *bbm = this->bbm;
+	struct bbm_info *bbm = mtd->bbm;
 
 	/* Return info from the table */
 	return bbm->isbad_bbt(mtd, ofs, allowbbt);
@@ -2566,7 +2621,7 @@ static int onenand_block_isbad(struct mtd_info *mtd, loff_t ofs)
 static int onenand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct onenand_chip *this = mtd->priv;
-	struct bbm_info *bbm = this->bbm;
+	struct bbm_info *bbm = mtd->bbm;
 	u_char buf[2] = {0, 0};
 	struct mtd_oob_ops ops = {
 		.mode = MTD_OPS_PLACE_OOB,
@@ -4043,6 +4098,8 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 		break;
 	}
 
+	ret = onenand_init_bbm(mtd, this);
+
 	this->subpagesize = mtd->writesize >> mtd->subpage_sft;
 
 	/*
@@ -4116,10 +4173,10 @@ void onenand_release(struct mtd_info *mtd)
 	mtd_device_unregister(mtd);
 
 	/* Free bad block table memory, if allocated */
-	if (this->bbm) {
-		struct bbm_info *bbm = this->bbm;
+	if (mtd->bbm) {
+		struct bbm_info *bbm = mtd->bbm;
 		kfree(bbm->bbt);
-		kfree(this->bbm);
+		kfree(bbm);
 	}
 	/* Buffers allocated by onenand_scan */
 	if (this->options & ONENAND_PAGEBUF_ALLOC) {
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index 08d0085..932e511 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -7,165 +7,15 @@
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *
  *  Derived from nand_bbt.c
- *
- *  TODO:
- *    Split BBT core and chip specific BBT.
  */
 
 #include <linux/slab.h>
+#include <linux/mtd/bbm.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/onenand.h>
 #include <linux/export.h>
 
 /**
- * check_short_pattern - [GENERIC] check if a pattern is in the buffer
- * @param buf		the buffer to search
- * @param len		the length of buffer to search
- * @param paglen	the pagelength
- * @param td		search pattern descriptor
- *
- * Check for a pattern at the given place. Used to search bad block
- * tables and good / bad block identifiers. Same as check_pattern, but
- * no optional empty check and the pattern is expected to start
- * at offset 0.
- *
- */
-static int check_short_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
-{
-	int i;
-	uint8_t *p = buf;
-
-	/* Compare the pattern */
-	for (i = 0; i < td->len; i++) {
-		if (p[i] != td->pattern[i])
-			return -1;
-	}
-        return 0;
-}
-
-/**
- * create_bbt - [GENERIC] Create a bad block table by scanning the device
- * @param mtd		MTD device structure
- * @param buf		temporary buffer
- * @param bd		descriptor for the good/bad block search pattern
- * @param chip		create the table for a specific chip, -1 read all chips.
- *              Applies only if NAND_BBT_PERCHIP option is set
- *
- * Create a bad block table by scanning the device
- * for the given good/bad block identify pattern
- */
-static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *bd, int chip)
-{
-	struct onenand_chip *this = mtd->priv;
-	struct bbm_info *bbm = this->bbm;
-	int i, j, numblocks, len, scanlen;
-	int startblock;
-	loff_t from;
-	size_t readlen, ooblen;
-	struct mtd_oob_ops ops;
-	int rgn;
-
-	printk(KERN_INFO "Scanning device for bad blocks\n");
-
-	len = 2;
-
-	/* We need only read few bytes from the OOB area */
-	scanlen = ooblen = 0;
-	readlen = bd->len;
-
-	/* chip == -1 case only */
-	/* Note that numblocks is 2 * (real numblocks) here;
-	 * see i += 2 below as it makses shifting and masking less painful
-	 */
-	numblocks = this->chipsize >> (bbm->bbt_erase_shift - 1);
-	startblock = 0;
-	from = 0;
-
-	ops.mode = MTD_OPS_PLACE_OOB;
-	ops.ooblen = readlen;
-	ops.oobbuf = buf;
-	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
-
-	for (i = startblock; i < numblocks; ) {
-		int ret;
-
-		for (j = 0; j < len; j++) {
-			/* No need to read pages fully,
-			 * just read required OOB bytes */
-			ret = onenand_bbt_read_oob(mtd,
-				from + j * this->writesize + bd->offs, &ops);
-
-			/* If it is a initial bad block, just ignore it */
-			if (ret == ONENAND_BBT_READ_FATAL_ERROR)
-				return -EIO;
-
-			if (ret || check_short_pattern(&buf[j * scanlen],
-					       scanlen, this->writesize, bd)) {
-				bbm->bbt[i >> 3] |= 0x03 << (i & 0x6);
-				printk(KERN_INFO "OneNAND eraseblock %d is an "
-					"initial bad block\n", i >> 1);
-				mtd->ecc_stats.badblocks++;
-				break;
-			}
-		}
-		i += 2;
-
-		if (FLEXONENAND(this)) {
-			rgn = flexonenand_region(mtd, from);
-			from += mtd->eraseregions[rgn].erasesize;
-		} else
-			from += (1 << bbm->bbt_erase_shift);
-	}
-
-	return 0;
-}
-
-
-/**
- * onenand_memory_bbt - [GENERIC] create a memory based bad block table
- * @param mtd		MTD device structure
- * @param bd		descriptor for the good/bad block search pattern
- *
- * The function creates a memory based bbt by scanning the device
- * for manufacturer / software marked good / bad blocks
- */
-static inline int onenand_memory_bbt (struct mtd_info *mtd, struct nand_bbt_descr *bd)
-{
-	struct onenand_chip *this = mtd->priv;
-
-	return create_bbt(mtd, this->page_buf, bd, -1);
-}
-
-/**
- * onenand_isbad_bbt - [OneNAND Interface] Check if a block is bad
- * @param mtd		MTD device structure
- * @param offs		offset in the device
- * @param allowbbt	allow access to bad block table region
- */
-static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
-{
-	struct onenand_chip *this = mtd->priv;
-	struct bbm_info *bbm = this->bbm;
-	int block;
-	uint8_t res;
-
-	/* Get block number * 2 */
-	block = (int) (onenand_block(this, offs) << 1);
-	res = (bbm->bbt[block >> 3] >> (block & 0x06)) & 0x03;
-
-	pr_debug("onenand_isbad_bbt: bbt info for offs 0x%08x: (block %d) 0x%02x\n",
-		(unsigned int) offs, block >> 1, res);
-
-	switch ((int) res) {
-	case 0x00:	return 0;
-	case 0x01:	return 1;
-	case 0x02:	return allowbbt ? 0 : 1;
-	}
-
-	return 1;
-}
-
-/**
  * onenand_scan_bbt - [OneNAND Interface] scan, find, read and maybe create bad block table(s)
  * @param mtd		MTD device structure
  * @param bd		descriptor for the good/bad block search pattern
@@ -182,7 +32,7 @@ static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
 	struct onenand_chip *this = mtd->priv;
-	struct bbm_info *bbm = this->bbm;
+	struct bbm_info *bbm = mtd->bbm;
 	int len, ret = 0;
 
 	len = this->chipsize >> (this->erase_shift + 2);
@@ -194,14 +44,12 @@ int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	/* Set the bad block position */
 	bbm->badblockpos = ONENAND_BADBLOCK_POS;
 
-	/* Set erase shift */
-	bbm->bbt_erase_shift = this->erase_shift;
-
 	if (!bbm->isbad_bbt)
-		bbm->isbad_bbt = onenand_isbad_bbt;
+		bbm->isbad_bbt = nand_isbad_bbt;
 
 	/* Scan the device to build a memory based bad block table */
-	if ((ret = onenand_memory_bbt(mtd, bd))) {
+	ret = nand_memory_bbt(mtd, bd);
+	if (ret) {
 		printk(KERN_ERR "onenand_scan_bbt: Can't scan flash and build the RAM-based BBT\n");
 		kfree(bbm->bbt);
 		bbm->bbt = NULL;
@@ -210,43 +58,4 @@ int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	return ret;
 }
 
-/*
- * Define some generic bad / good block scan pattern which are used
- * while scanning a device for factory marked good / bad blocks.
- */
-static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
-
-static struct nand_bbt_descr largepage_memorybased = {
-	.options = 0,
-	.offs = 0,
-	.len = 2,
-	.pattern = scan_ff_pattern,
-};
-
-/**
- * onenand_default_bbt - [OneNAND Interface] Select a default bad block table for the device
- * @param mtd		MTD device structure
- *
- * This function selects the default bad block table
- * support for the device and calls the onenand_scan_bbt function
- */
-int onenand_default_bbt(struct mtd_info *mtd)
-{
-	struct onenand_chip *this = mtd->priv;
-	struct bbm_info *bbm;
-
-	this->bbm = kzalloc(sizeof(struct bbm_info), GFP_KERNEL);
-	if (!this->bbm)
-		return -ENOMEM;
-
-	bbm = this->bbm;
-
-	/* 1KB page has same configuration as 2KB page */
-	if (!bbm->badblock_pattern)
-		bbm->badblock_pattern = &largepage_memorybased;
-
-	return onenand_scan_bbt(mtd, bbm->badblock_pattern);
-}
-
 EXPORT_SYMBOL(onenand_scan_bbt);
-EXPORT_SYMBOL(onenand_default_bbt);
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 4596503..0d624bd 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -136,8 +136,6 @@ struct onenand_chip {
 	int			subpagesize;
 	struct nand_ecclayout	*ecclayout;
 
-	void			*bbm;
-
 	void			*priv;
 
 	/*
-- 
1.7.9.5
