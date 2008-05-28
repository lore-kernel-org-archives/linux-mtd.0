Date: Wed, 28 May 2008 14:08:01 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, tglx@linutronix.de, joern@logfs.org,
	dedekind@infradead.org, linux-mtd@lists.infradead.org
Subject: [RFC/PATCH 2/3] NAND multiple plane feature 
Message-ID: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As NAND multiple plane architecture assumes simultaneous write/erase of
several pages/blocks at the same time, we have to modify page/eraseblock
sizes and report modified size to upper layers. In other words physical
erase block size/ page size != reported erase block size/ page size.
For example if we have dual plane device we have to extend erase block
size and page size in 2 times. 

Also this patch keep track on bad block management. NAND datasheets
alows us combine only pair of neibour blocks into dual/multiple plane
operations. So if we have multiple plane device and one block is bad,
reported extended block should be considered as bad. 

Signed-off-by: Vasiliy Leonenko <vasiliy.leonenko@gmail.com>
Signed-off-by: Alexey Korolev <akorolev@infradead.org>
--------
 drivers/mtd/nand/diskonchip.c |    8 ++---
 drivers/mtd/nand/nand_base.c  |   60 ++++++++++++++++++++++++++----------------
 drivers/mtd/nand/nand_bbt.c   |   27 ++++++++++++++----
 include/linux/mtd/nand.h      |   14 ++++++---
 4 files changed, 71 insertions(+), 38 deletions(-)

diff -Nurp linux-2.6.24.3/drivers/mtd/nand/diskonchip.c linux-2.6.24.3-dp/drivers/mtd/nand/diskonchip.c
--- linux-2.6.24.3/drivers/mtd/nand/diskonchip.c	2008-02-26 03:20:20.000000000 +0300
+++ linux-2.6.24.3-dp/drivers/mtd/nand/diskonchip.c	2008-05-28 14:18:43.000000000 +0400
@@ -1142,7 +1142,7 @@ static inline int __init nftl_partscan(s
 		mh->FirstPhysicalEUN, mh->FormattedSize,
 		mh->UnitSizeFactor);
 
-	blocks = mtd->size >> this->phys_erase_shift;
+	blocks = mtd->size >> this->erase_shift;
 	maxblocks = min(32768U, mtd->erasesize - psize);
 
 	if (mh->UnitSizeFactor == 0x00) {
@@ -1226,7 +1226,7 @@ static inline int __init inftl_partscan(
 	int end = mtd->size;
 
 	if (inftl_bbt_write)
-		end -= (INFTL_BBT_RESERVED_BLOCKS << this->phys_erase_shift);
+		end -= (INFTL_BBT_RESERVED_BLOCKS << this->erase_shift);
 
 	buf = kmalloc(mtd->writesize, GFP_KERNEL);
 	if (!buf) {
@@ -1264,7 +1264,7 @@ static inline int __init inftl_partscan(
 		((unsigned char *) &mh->OsakVersion)[3] & 0xf,
 		mh->PercentUsed);
 
-	vshift = this->phys_erase_shift + mh->BlockMultiplierBits;
+	vshift = this->erase_shift + mh->BlockMultiplierBits;
 
 	blocks = mtd->size >> vshift;
 	if (blocks > 32768) {
@@ -1272,7 +1272,7 @@ static inline int __init inftl_partscan(
 		goto out;
 	}
 
-	blocks = doc->chips_per_floor << (this->chip_shift - this->phys_erase_shift);
+	blocks = doc->chips_per_floor << (this->chip_shift - this->erase_shift);
 	if (inftl_bbt_write && (blocks > mtd->erasesize)) {
 		printk(KERN_ERR "Writeable BBTs spanning more than one erase block are not yet supported.  FIX ME!\n");
 		goto out;
diff -Nurp linux-2.6.24.3/drivers/mtd/nand/nand_base.c linux-2.6.24.3-dp/drivers/mtd/nand/nand_base.c
--- linux-2.6.24.3/drivers/mtd/nand/nand_base.c	2008-05-28 14:04:59.000000000 +0400
+++ linux-2.6.24.3-dp/drivers/mtd/nand/nand_base.c	2008-05-28 14:43:15.000000000 +0400
@@ -554,7 +554,7 @@ static void nand_command_lp(struct mtd_i
 
 	/* Emulate NAND_CMD_READOOB */
 	if (command == NAND_CMD_READOOB) {
-		column += mtd->writesize;
+		column += chip->page_phys_size;
 		command = NAND_CMD_READ0;
 	}
 
@@ -752,8 +752,8 @@ static int nand_wait(struct mtd_info *mt
 static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			      uint8_t *buf)
 {
-	chip->read_buf(mtd, buf, mtd->writesize);
-	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	chip->read_buf(mtd, buf, chip->page_phys_size);
+	chip->read_buf(mtd, chip->oob_poi, chip->oob_phys_size);
 	return 0;
 }
 
@@ -958,7 +958,7 @@ static int nand_do_read_ops(struct mtd_i
 	int chipnr, page, realpage, col, bytes, aligned;
 	struct nand_chip *chip = mtd->priv;
 	struct mtd_ecc_stats stats;
-	int blkcheck = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
+	int blkcheck = (1 << (chip->erase_shift - chip->page_shift)) - 1;
 	int sndcmd = 1;
 	int ret = 0;
 	uint32_t readlen = ops->len;
@@ -1267,7 +1267,7 @@ static int nand_do_read_oob(struct mtd_i
 {
 	int page, realpage, chipnr, sndcmd = 1;
 	struct nand_chip *chip = mtd->priv;
-	int blkcheck = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
+	int blkcheck = (1 << (chip->erase_shift - chip->page_shift)) - 1;
 	int readlen = ops->ooblen;
 	int len;
 	uint8_t *buf = ops->oobbuf;
@@ -1402,8 +1402,8 @@ static int nand_read_oob(struct mtd_info
 static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 				const uint8_t *buf)
 {
-	chip->write_buf(mtd, buf, mtd->writesize);
-	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	chip->write_buf(mtd, buf, chip->page_phys_size);
+	chip->write_buf(mtd, chip->oob_poi, chip->oob_phys_size);
 }
 
 /**
@@ -1655,7 +1655,7 @@ static int nand_do_write_ops(struct mtd_
 
 	realpage = (int)(to >> chip->page_shift);
 	page = realpage & chip->pagemask;
-	blockmask = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
+	blockmask = (1 << (chip->erase_shift - chip->page_shift)) - 1;
 
 	/* Invalidate the page cache, when we write to the cached page */
 	if (to <= (chip->pagebuf << chip->page_shift) &&
@@ -1939,13 +1939,13 @@ int nand_erase_nand(struct mtd_info *mtd
 	      (unsigned int)instr->addr, (unsigned int)instr->len);
 
 	/* Start address must align on block boundary */
-	if (instr->addr & ((1 << chip->phys_erase_shift) - 1)) {
+	if (instr->addr & ((1 << chip->erase_shift) - 1)) {
 		DEBUG(MTD_DEBUG_LEVEL0, "nand_erase: Unaligned address\n");
 		return -EINVAL;
 	}
 
 	/* Length must align on block boundary */
-	if (instr->len & ((1 << chip->phys_erase_shift) - 1)) {
+	if (instr->len & ((1 << chip->erase_shift) - 1)) {
 		DEBUG(MTD_DEBUG_LEVEL0, "nand_erase: "
 		      "Length not block aligned\n");
 		return -EINVAL;
@@ -1968,7 +1968,7 @@ int nand_erase_nand(struct mtd_info *mtd
 	chipnr = (int)(instr->addr >> chip->chip_shift);
 
 	/* Calculate pages in each block */
-	pages_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
+	pages_per_block = 1 << (chip->erase_shift - chip->page_shift);
 
 	/* Select the NAND device */
 	chip->select_chip(mtd, chipnr);
@@ -2045,7 +2045,7 @@ int nand_erase_nand(struct mtd_info *mtd
 			    rewrite_bbt[chipnr] = (page << chip->page_shift);
 
 		/* Increment page address and decrement length */
-		len -= (1 << chip->phys_erase_shift);
+		len -= (1 << chip->erase_shift);
 		page += pages_per_block;
 
 		/* Check, if we cross a chip boundary */
@@ -2269,13 +2269,13 @@ static struct nand_flash_dev *nand_get_f
 		/* Number of planes*/
 		chip->numplanes = 1 << ((planeid >> 2) & 0x03);
 		/* Calc pagesize */
-		mtd->writesize = 1024 << (extid & 0x3);
+		mtd->writesize = (1024 << (extid & 0x3)) * chip->numplanes;
 		extid >>= 2;
 		/* Calc oobsize */
 		mtd->oobsize = (8 << (extid & 0x01)) * (mtd->writesize >> 9);
 		extid >>= 2;
 		/* Calc blocksize. Blocksize is multiples of 64KiB */
-		mtd->erasesize = (64 * 1024) << (extid & 0x03);
+		mtd->erasesize = ((64 * 1024) << (extid & 0x03)) * chip->numplanes;
 		extid >>= 2;
 		/* Get buswidth information */
 		busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
@@ -2290,6 +2290,8 @@ static struct nand_flash_dev *nand_get_f
 		busw = type->options & NAND_BUSWIDTH_16;
 	}
 
+	chip->oob_phys_size = mtd->oobsize / chip->numplanes;
+
 	/* Try to identify manufacturer */
 	for (maf_idx = 0; nand_manuf_ids[maf_idx].id != 0x0; maf_idx++) {
 		if (nand_manuf_ids[maf_idx].id == *maf_id)
@@ -2312,10 +2314,11 @@ static struct nand_flash_dev *nand_get_f
 
 	/* Calculate the address shift from the page size */
 	chip->page_shift = ffs(mtd->writesize) - 1;
+	chip->page_phys_size = mtd->writesize / chip->numplanes;
 	/* Convert chipsize to number of pages per chip -1. */
 	chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
 
-	chip->bbt_erase_shift = chip->phys_erase_shift =
+	chip->bbt_erase_shift = chip->erase_shift =
 		ffs(mtd->erasesize) - 1;
 	chip->chip_shift = ffs(chip->chipsize) - 1;
 
@@ -2417,7 +2420,8 @@ int nand_scan_ident(struct mtd_info *mtd
  */
 int nand_scan_tail(struct mtd_info *mtd)
 {
-	int i;
+	int i, j;
+	int oobfree_len;
 	struct nand_chip *chip = mtd->priv;
 
 	if (!(chip->options & NAND_OWN_BUFFERS))
@@ -2432,7 +2436,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 * If no default placement scheme is given, select an appropriate one
 	 */
 	if (!chip->ecc.layout) {
-		switch (mtd->oobsize) {
+		switch (chip->oob_phys_size) {
 		case 8:
 			chip->ecc.layout = &nand_oob_8;
 			break;
@@ -2449,9 +2453,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 		}
 	}
 
-	if (!chip->write_page)
-		chip->write_page = nand_write_page;
-
 	/*
 	 * check ECC mode, default to software if 3byte/512byte hardware ECC is
 	 * selected and we have 256 byte pagesize fallback to software ECC
@@ -2539,8 +2540,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 * Set the number of read / write steps for one page depending on ECC
 	 * mode
 	 */
-	chip->ecc.steps = mtd->writesize / chip->ecc.size;
-	if(chip->ecc.steps * chip->ecc.size != mtd->writesize) {
+	chip->ecc.steps = chip->page_phys_size / chip->ecc.size;
+	if (chip->ecc.steps * chip->ecc.size != chip->page_phys_size) {
 		printk(KERN_WARNING "Invalid ecc parameters\n");
 		BUG();
 	}
@@ -2593,6 +2594,21 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 	/* propagate ecc.layout to mtd_info */
 	mtd->ecclayout = chip->ecc.layout;
+	if (chip->numplanes > 1) {
+		for (oobfree_len = 0; chip->ecc.layout->oobfree[oobfree_len].length; oobfree_len++)
+			;
+		i = 0;
+		while (i < chip->numplanes) {
+			for (j = 0; j < oobfree_len ; j++) {
+				chip->ecc.layout->oobfree[j + i * oobfree_len].length = chip->ecc.layout->oobfree[j].length;
+				chip->ecc.layout->oobfree[j + i * oobfree_len].offset = chip->ecc.layout->oobfree[j].offset + chip->oob_phys_size * i;
+			}
+			for (j = 0; j < chip->ecc.layout->eccbytes; j++)
+				chip->ecc.layout->eccpos[j + i * chip->ecc.layout->eccbytes] = chip->ecc.layout->eccpos[j] + chip->oob_phys_size * i;
+			i++;
+		}
+		chip->ecc.layout->eccbytes *= chip->numplanes;
+	}
 
 	/* Check, if we should skip the bad block table scan */
 	if (chip->options & NAND_SKIP_BBTSCAN)
diff -Nurp linux-2.6.24.3/drivers/mtd/nand/nand_bbt.c linux-2.6.24.3-dp/drivers/mtd/nand/nand_bbt.c
--- linux-2.6.24.3/drivers/mtd/nand/nand_bbt.c	2008-02-26 03:20:20.000000000 +0300
+++ linux-2.6.24.3-dp/drivers/mtd/nand/nand_bbt.c	2008-05-28 14:57:56.000000000 +0400
@@ -75,12 +75,15 @@
  * pattern area contain 0xff
  *
 */
-static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
+static int check_pattern(struct mtd_info *mtd, uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
 {
 	int i, end = 0;
+	struct nand_chip *this = mtd->priv;
+	int plane_num = 0;
 	uint8_t *p = buf;
 
-	end = paglen + td->offs;
+	do {
+	end = this->page_phys_size + td->offs;
 	if (td->options & NAND_BBT_SCANEMPTY) {
 		for (i = 0; i < end; i++) {
 			if (p[i] != 0xff)
@@ -103,6 +106,10 @@ static int check_pattern(uint8_t *buf, i
 				return -1;
 		}
 	}
+	p += len - end;
+	plane_num++;
+	}
+	while (plane_num < this->numplanes);
 	return 0;
 }
 
@@ -116,16 +123,22 @@ static int check_pattern(uint8_t *buf, i
  * no optional empty check
  *
 */
-static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
+static int check_short_pattern(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td)
 {
 	int i;
 	uint8_t *p = buf;
 
+	struct nand_chip *this = mtd->priv;
+	int plane_num = 0;
 	/* Compare the pattern */
+	do {
 	for (i = 0; i < td->len; i++) {
-		if (p[td->offs + i] != td->pattern[i])
+		if (p[this->oob_phys_size * plane_num + td->offs + i] != td->pattern[i])
 			return -1;
 	}
+	plane_num++;
+	}
+	while (plane_num < this->numplanes);
 	return 0;
 }
 
@@ -318,7 +331,7 @@ static int scan_block_full(struct mtd_in
 		return ret;
 
 	for (j = 0; j < len; j++, buf += scanlen) {
-		if (check_pattern(buf, scanlen, mtd->writesize, bd))
+		if (check_pattern(mtd, buf, scanlen, mtd->writesize, bd))
 			return 1;
 	}
 	return 0;
@@ -349,7 +362,7 @@ static int scan_block_fast(struct mtd_in
 		if (ret)
 			return ret;
 
-		if (check_short_pattern(buf, bd))
+		if (check_short_pattern(mtd, buf, bd))
 			return 1;
 
 		offs += mtd->writesize;
@@ -501,7 +514,7 @@ static int search_bbt(struct mtd_info *m
 
 			/* Read first page */
 			scan_read_raw(mtd, buf, offs, mtd->writesize);
-			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
+			if (!check_pattern(mtd, buf, scanlen, mtd->writesize, td)) {
 				td->pages[i] = actblock << blocktopage;
 				if (td->options & NAND_BBT_VERSION) {
 					td->version[i] = buf[mtd->writesize + td->veroffs];
diff -Nurp linux-2.6.24.3/include/linux/mtd/nand.h linux-2.6.24.3-dp/include/linux/mtd/nand.h
--- linux-2.6.24.3/include/linux/mtd/nand.h	2008-05-28 14:04:59.000000000 +0400
+++ linux-2.6.24.3-dp/include/linux/mtd/nand.h	2008-05-28 15:02:26.000000000 +0400
@@ -45,8 +45,8 @@ extern void nand_wait_ready(struct mtd_i
  * is supported now. If you add a chip with bigger oobsize/page
  * adjust this accordingly.
  */
-#define NAND_MAX_OOBSIZE	64
-#define NAND_MAX_PAGESIZE	2048
+#define NAND_MAX_OOBSIZE	128
+#define NAND_MAX_PAGESIZE	4096
 
 /*
  * Constants for hardware specific CLE/ALE/NCE function
@@ -332,8 +332,8 @@ struct nand_buffers {
  * @wq:			[INTERN] wait queue to sleep on if a NAND operation is in progress
  * @state:		[INTERN] the current state of the NAND device
  * @oob_poi:		poison value buffer
- * @page_shift:		[INTERN] number of address bits in a page (column address bits)
- * @phys_erase_shift:	[INTERN] number of address bits in a physical eraseblock
+ * @page_shift:		[INTERN] number of address bits in a page reported to upper layer drivers 
+ * @erase_shift:	[INTERN] number of address bits in eraseblock reported to upper layer drivers
  * @bbt_erase_shift:	[INTERN] number of address bits in a bbt entry
  * @chip_shift:		[INTERN] number of address bits in one chip
  * @datbuf:		[INTERN] internal buffer for one page + oob
@@ -344,6 +344,8 @@ struct nand_buffers {
  *			special functionality. See the defines for further explanation
  * @badblockpos:	[INTERN] position of the bad block marker in the oob area
  * @numplanes:		[INTERN] number of ident planes on NAND device
+ * @oob_phys_size:	[INTERN] physical size of NAND oob area 
+ * @page_phys_size:	[INTERN] physical size of NAND page 
  * @cellinfo:		[INTERN] MLC/multichip data from chip ident
  * @numchips:		[INTERN] number of physical chips
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
@@ -390,7 +392,7 @@ struct nand_chip {
 	unsigned int	options;
 
 	int		page_shift;
-	int		phys_erase_shift;
+	int		erase_shift;
 	int		bbt_erase_shift;
 	int		chip_shift;
 	int		numchips;
@@ -401,6 +403,8 @@ struct nand_chip {
 	uint8_t		cellinfo;
 	int		badblockpos;
 	int		numplanes;
+	int		oob_phys_size;
+	int		page_phys_size;
 
 	nand_state_t	state;
 
