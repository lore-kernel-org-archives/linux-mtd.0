Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLkan-0000OD-Tf
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 07:55:45 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 01/22] mtd: rawnand: Stop passing mtd_info objects to
 internal functions
Date: Sun, 11 Nov 2018 08:55:03 +0100
Message-Id: <20181111075524.13123-2-boris.brezillon@bootlin.com>
In-Reply-To: <20181111075524.13123-1-boris.brezillon@bootlin.com>
References: <20181111075524.13123-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After having reworked the rawnand API to avoid passing mtd_info
objects around, let's do the same for internal functions.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changes in v3:
- Add Janusz's T-b

Changes in v2:
- Patch a few more functions
- Update kernel-doc headers
---
 drivers/mtd/nand/raw/nand_base.c   | 171 +++++++++++++-------------
 drivers/mtd/nand/raw/nand_bbt.c    | 185 +++++++++++++++--------------
 drivers/mtd/nand/raw/nand_legacy.c |  18 ++-
 3 files changed, 184 insertions(+), 190 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 4bc89c959f23..2a50afbdeeeb 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -49,9 +49,9 @@
 
 #include "internals.h"
 
-static int nand_get_device(struct mtd_info *mtd, int new_state);
+static int nand_get_device(struct nand_chip *chip, int new_state);
 
-static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
+static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 			     struct mtd_oob_ops *ops);
 
 /* Define default oob placement schemes for large and small page devices */
@@ -214,10 +214,8 @@ static const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
 	.free = nand_ooblayout_free_lp_hamming,
 };
 
-static int check_offs_len(struct mtd_info *mtd,
-					loff_t ofs, uint64_t len)
+static int check_offs_len(struct nand_chip *chip, loff_t ofs, uint64_t len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
 	int ret = 0;
 
 	/* Start address must align on block boundary */
@@ -237,14 +235,12 @@ static int check_offs_len(struct mtd_info *mtd,
 
 /**
  * nand_release_device - [GENERIC] release chip
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct mtd_info *mtd)
+static void nand_release_device(struct nand_chip *chip)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
-
 	/* Release the controller and the chip */
 	spin_lock(&chip->controller->lock);
 	chip->controller->active = NULL;
@@ -321,7 +317,7 @@ static int nand_default_block_markbad(struct nand_chip *chip, loff_t ofs)
 	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 	do {
-		res = nand_do_write_oob(mtd, ofs, &ops);
+		res = nand_do_write_oob(chip, ofs, &ops);
 		if (!ret)
 			ret = res;
 
@@ -355,7 +351,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
 
 /**
  * nand_block_markbad_lowlevel - mark a block bad
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @ofs: offset from device start
  *
  * This function performs the generic NAND bad block marking steps (i.e., bad
@@ -372,9 +368,9 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  * Note that we retain the first error encountered in (2) or (3), finish the
  * procedures, and dump the error in the end.
 */
-static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
+static int nand_block_markbad_lowlevel(struct nand_chip *chip, loff_t ofs)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int res, ret = 0;
 
 	if (!(chip->bbt_options & NAND_BBT_NO_OOB_BBM)) {
@@ -387,9 +383,9 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 		nand_erase_nand(chip, &einfo, 0);
 
 		/* Write bad block marker to OOB */
-		nand_get_device(mtd, FL_WRITING);
+		nand_get_device(chip, FL_WRITING);
 		ret = nand_markbad_bbm(chip, ofs);
-		nand_release_device(mtd);
+		nand_release_device(chip);
 	}
 
 	/* Mark block bad in BBT */
@@ -407,14 +403,13 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 
 /**
  * nand_check_wp - [GENERIC] check if the chip is write protected
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  *
  * Check, if the device is write protected. The function expects, that the
  * device is already selected.
  */
-static int nand_check_wp(struct mtd_info *mtd)
+static int nand_check_wp(struct nand_chip *chip)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
 	u8 status;
 	int ret;
 
@@ -449,17 +444,15 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 
 /**
  * nand_block_checkbad - [GENERIC] Check if a block is marked bad
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @ofs: offset from device start
  * @allowbbt: 1, if its allowed to access the bbt area
  *
  * Check, if the block is bad. Either by reading the bad block table or
  * calling of the scan function.
  */
-static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int allowbbt)
+static int nand_block_checkbad(struct nand_chip *chip, loff_t ofs, int allowbbt)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
-
 	/* Return info from the table */
 	if (chip->bbt)
 		return nand_isbad_bbt(chip, ofs, allowbbt);
@@ -565,13 +558,11 @@ EXPORT_SYMBOL_GPL(nand_gpio_waitrdy);
 /**
  * panic_nand_get_device - [GENERIC] Get chip for selected access
  * @chip: the nand chip descriptor
- * @mtd: MTD device structure
  * @new_state: the state which is requested
  *
  * Used when in panic, no locks are taken.
  */
-static void panic_nand_get_device(struct nand_chip *chip,
-		      struct mtd_info *mtd, int new_state)
+static void panic_nand_get_device(struct nand_chip *chip, int new_state)
 {
 	/* Hardware controller shared among independent devices */
 	chip->controller->active = chip;
@@ -580,15 +571,14 @@ static void panic_nand_get_device(struct nand_chip *chip,
 
 /**
  * nand_get_device - [GENERIC] Get chip for selected access
- * @mtd: MTD device structure
+ * @chip: NAND chip structure
  * @new_state: the state which is requested
  *
  * Get the device and lock it for exclusive access
  */
 static int
-nand_get_device(struct mtd_info *mtd, int new_state)
+nand_get_device(struct nand_chip *chip, int new_state)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
 	spinlock_t *lock = &chip->controller->lock;
 	wait_queue_head_t *wq = &chip->controller->wq;
 	DECLARE_WAITQUEUE(wait, current);
@@ -2955,15 +2945,15 @@ static int nand_read_page_syndrome(struct nand_chip *chip, uint8_t *buf,
 
 /**
  * nand_transfer_oob - [INTERN] Transfer oob to client buffer
- * @mtd: mtd info structure
+ * @chip: NAND chip object
  * @oob: oob destination address
  * @ops: oob ops structure
  * @len: size of oob to transfer
  */
-static uint8_t *nand_transfer_oob(struct mtd_info *mtd, uint8_t *oob,
+static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
 				  struct mtd_oob_ops *ops, size_t len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int ret;
 
 	switch (ops->mode) {
@@ -3020,17 +3010,17 @@ static void nand_wait_readrdy(struct nand_chip *chip)
 
 /**
  * nand_do_read_ops - [INTERN] Read data with ECC
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @from: offset to read from
  * @ops: oob ops structure
  *
  * Internal function. Called with chip held.
  */
-static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
+static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
 	int chipnr, page, realpage, col, bytes, aligned, oob_required;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int ret = 0;
 	uint32_t readlen = ops->len;
 	uint32_t oobreadlen = ops->ooblen;
@@ -3118,8 +3108,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				int toread = min(oobreadlen, max_oobsize);
 
 				if (toread) {
-					oob = nand_transfer_oob(mtd,
-						oob, ops, toread);
+					oob = nand_transfer_oob(chip, oob, ops,
+								toread);
 					oobreadlen -= toread;
 				}
 			}
@@ -3349,18 +3339,18 @@ static int nand_write_oob_syndrome(struct nand_chip *chip, int page)
 
 /**
  * nand_do_read_oob - [INTERN] NAND read out-of-band
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @from: offset to read from
  * @ops: oob operations description structure
  *
  * NAND read out-of-band data from the spare area.
  */
-static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
+static int nand_do_read_oob(struct nand_chip *chip, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	unsigned int max_bitflips = 0;
 	int page, realpage, chipnr;
-	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct mtd_ecc_stats stats;
 	int readlen = ops->ooblen;
 	int len;
@@ -3391,7 +3381,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 			break;
 
 		len = min(len, readlen);
-		buf = nand_transfer_oob(mtd, buf, ops, len);
+		buf = nand_transfer_oob(chip, buf, ops, len);
 
 		nand_wait_readrdy(chip);
 
@@ -3436,6 +3426,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops)
 {
+	struct nand_chip *chip = mtd_to_nand(mtd);
 	int ret;
 
 	ops->retlen = 0;
@@ -3445,14 +3436,14 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	    ops->mode != MTD_OPS_RAW)
 		return -ENOTSUPP;
 
-	nand_get_device(mtd, FL_READING);
+	nand_get_device(chip, FL_READING);
 
 	if (!ops->datbuf)
-		ret = nand_do_read_oob(mtd, from, ops);
+		ret = nand_do_read_oob(chip, from, ops);
 	else
-		ret = nand_do_read_ops(mtd, from, ops);
+		ret = nand_do_read_ops(chip, from, ops);
 
-	nand_release_device(mtd);
+	nand_release_device(chip);
 	return ret;
 }
 
@@ -3780,7 +3771,6 @@ static int nand_write_page_syndrome(struct nand_chip *chip, const uint8_t *buf,
 
 /**
  * nand_write_page - write one page
- * @mtd: MTD device structure
  * @chip: NAND chip descriptor
  * @offset: address offset within the page
  * @data_len: length of actual data to be written
@@ -3789,10 +3779,11 @@ static int nand_write_page_syndrome(struct nand_chip *chip, const uint8_t *buf,
  * @page: page number to write
  * @raw: use _raw version of write_page
  */
-static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-		uint32_t offset, int data_len, const uint8_t *buf,
-		int oob_required, int page, int raw)
+static int nand_write_page(struct nand_chip *chip, uint32_t offset,
+			   int data_len, const uint8_t *buf, int oob_required,
+			   int page, int raw)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int status, subpage;
 
 	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
@@ -3818,15 +3809,15 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 /**
  * nand_fill_oob - [INTERN] Transfer client buffer to oob
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @oob: oob data buffer
  * @len: oob data write length
  * @ops: oob ops structure
  */
-static uint8_t *nand_fill_oob(struct mtd_info *mtd, uint8_t *oob, size_t len,
+static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob, size_t len,
 			      struct mtd_oob_ops *ops)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int ret;
 
 	/*
@@ -3858,17 +3849,17 @@ static uint8_t *nand_fill_oob(struct mtd_info *mtd, uint8_t *oob, size_t len,
 
 /**
  * nand_do_write_ops - [INTERN] NAND write with ECC
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @to: offset to write to
  * @ops: oob operations description structure
  *
  * NAND write with ECC.
  */
-static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
+static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int chipnr, realpage, page, column;
-	struct nand_chip *chip = mtd_to_nand(mtd);
 	uint32_t writelen = ops->len;
 
 	uint32_t oobwritelen = ops->ooblen;
@@ -3896,7 +3887,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	chip->select_chip(chip, chipnr);
 
 	/* Check, if it is write protected */
-	if (nand_check_wp(mtd)) {
+	if (nand_check_wp(chip)) {
 		ret = -EIO;
 		goto err_out;
 	}
@@ -3944,14 +3935,14 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 
 		if (unlikely(oob)) {
 			size_t len = min(oobwritelen, oobmaxlen);
-			oob = nand_fill_oob(mtd, oob, len, ops);
+			oob = nand_fill_oob(chip, oob, len, ops);
 			oobwritelen -= len;
 		} else {
 			/* We still need to erase leftover OOB data */
 			memset(chip->oob_poi, 0xff, mtd->oobsize);
 		}
 
-		ret = nand_write_page(mtd, chip, column, bytes, wbuf,
+		ret = nand_write_page(chip, column, bytes, wbuf,
 				      oob_required, page,
 				      (ops->mode == MTD_OPS_RAW));
 		if (ret)
@@ -4003,7 +3994,7 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int ret;
 
 	/* Grab the device */
-	panic_nand_get_device(chip, mtd, FL_WRITING);
+	panic_nand_get_device(chip, FL_WRITING);
 
 	chip->select_chip(chip, chipnr);
 
@@ -4015,7 +4006,7 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	ops.datbuf = (uint8_t *)buf;
 	ops.mode = MTD_OPS_PLACE_OOB;
 
-	ret = nand_do_write_ops(mtd, to, &ops);
+	ret = nand_do_write_ops(chip, to, &ops);
 
 	*retlen = ops.retlen;
 	return ret;
@@ -4023,17 +4014,17 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 /**
  * nand_do_write_oob - [MTD Interface] NAND write out-of-band
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @to: offset to write to
  * @ops: oob operation description structure
  *
  * NAND write out-of-band.
  */
-static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
+static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int chipnr, page, status, len;
-	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	pr_debug("%s: to = 0x%08x, len = %i\n",
 			 __func__, (unsigned int)to, (int)ops->ooblen);
@@ -4063,7 +4054,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 	page = (int)(to >> chip->page_shift);
 
 	/* Check, if it is write protected */
-	if (nand_check_wp(mtd)) {
+	if (nand_check_wp(chip)) {
 		chip->select_chip(chip, -1);
 		return -EROFS;
 	}
@@ -4072,7 +4063,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 	if (page == chip->pagebuf)
 		chip->pagebuf = -1;
 
-	nand_fill_oob(mtd, ops->oobbuf, ops->ooblen, ops);
+	nand_fill_oob(chip, ops->oobbuf, ops->ooblen, ops);
 
 	if (ops->mode == MTD_OPS_RAW)
 		status = chip->ecc.write_oob_raw(chip, page & chip->pagemask);
@@ -4098,11 +4089,12 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 			  struct mtd_oob_ops *ops)
 {
+	struct nand_chip *chip = mtd_to_nand(mtd);
 	int ret = -ENOTSUPP;
 
 	ops->retlen = 0;
 
-	nand_get_device(mtd, FL_WRITING);
+	nand_get_device(chip, FL_WRITING);
 
 	switch (ops->mode) {
 	case MTD_OPS_PLACE_OOB:
@@ -4115,12 +4107,12 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 	}
 
 	if (!ops->datbuf)
-		ret = nand_do_write_oob(mtd, to, ops);
+		ret = nand_do_write_oob(chip, to, ops);
 	else
-		ret = nand_do_write_ops(mtd, to, ops);
+		ret = nand_do_write_ops(chip, to, ops);
 
 out:
-	nand_release_device(mtd);
+	nand_release_device(chip);
 	return ret;
 }
 
@@ -4164,7 +4156,6 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
 	int page, status, pages_per_block, ret, chipnr;
 	loff_t len;
 
@@ -4172,11 +4163,11 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 			__func__, (unsigned long long)instr->addr,
 			(unsigned long long)instr->len);
 
-	if (check_offs_len(mtd, instr->addr, instr->len))
+	if (check_offs_len(chip, instr->addr, instr->len))
 		return -EINVAL;
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(mtd, FL_ERASING);
+	nand_get_device(chip, FL_ERASING);
 
 	/* Shift to get first page */
 	page = (int)(instr->addr >> chip->page_shift);
@@ -4189,7 +4180,7 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 	chip->select_chip(chip, chipnr);
 
 	/* Check, if it is write protected */
-	if (nand_check_wp(mtd)) {
+	if (nand_check_wp(chip)) {
 		pr_debug("%s: device is write protected!\n",
 				__func__);
 		ret = -EIO;
@@ -4201,7 +4192,7 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 
 	while (len) {
 		/* Check if we have a bad block, we do not erase bad blocks! */
-		if (nand_block_checkbad(mtd, ((loff_t) page) <<
+		if (nand_block_checkbad(chip, ((loff_t) page) <<
 					chip->page_shift, allowbbt)) {
 			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
 				    __func__, page);
@@ -4250,7 +4241,7 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 
 	/* Deselect and wake up anyone waiting on the device */
 	chip->select_chip(chip, -1);
-	nand_release_device(mtd);
+	nand_release_device(chip);
 
 	/* Return more or less happy */
 	return ret;
@@ -4264,12 +4255,14 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
  */
 static void nand_sync(struct mtd_info *mtd)
 {
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
 	pr_debug("%s: called\n", __func__);
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(mtd, FL_SYNCING);
+	nand_get_device(chip, FL_SYNCING);
 	/* Release it and go back */
-	nand_release_device(mtd);
+	nand_release_device(chip);
 }
 
 /**
@@ -4284,13 +4277,13 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 	int ret;
 
 	/* Select the NAND device */
-	nand_get_device(mtd, FL_READING);
+	nand_get_device(chip, FL_READING);
 	chip->select_chip(chip, chipnr);
 
-	ret = nand_block_checkbad(mtd, offs, 0);
+	ret = nand_block_checkbad(chip, offs, 0);
 
 	chip->select_chip(chip, -1);
-	nand_release_device(mtd);
+	nand_release_device(chip);
 
 	return ret;
 }
@@ -4312,7 +4305,7 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		return ret;
 	}
 
-	return nand_block_markbad_lowlevel(mtd, ofs);
+	return nand_block_markbad_lowlevel(mtd_to_nand(mtd), ofs);
 }
 
 /**
@@ -4357,7 +4350,7 @@ static int nand_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
  */
 static int nand_suspend(struct mtd_info *mtd)
 {
-	return nand_get_device(mtd, FL_PM_SUSPENDED);
+	return nand_get_device(mtd_to_nand(mtd), FL_PM_SUSPENDED);
 }
 
 /**
@@ -4369,7 +4362,7 @@ static void nand_resume(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	if (chip->state == FL_PM_SUSPENDED)
-		nand_release_device(mtd);
+		nand_release_device(chip);
 	else
 		pr_err("%s called for a chip which is not in suspended state\n",
 			__func__);
@@ -4382,7 +4375,7 @@ static void nand_resume(struct mtd_info *mtd)
  */
 static void nand_shutdown(struct mtd_info *mtd)
 {
-	nand_get_device(mtd, FL_PM_SUSPENDED);
+	nand_get_device(mtd_to_nand(mtd), FL_PM_SUSPENDED);
 }
 
 /* Set default functions */
@@ -5052,9 +5045,9 @@ static void nand_scan_ident_cleanup(struct nand_chip *chip)
 	kfree(chip->parameters.onfi);
 }
 
-static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
+static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
 	if (WARN_ON(ecc->mode != NAND_ECC_SOFT))
@@ -5410,9 +5403,9 @@ EXPORT_SYMBOL_GPL(nand_ecc_choose_conf);
  * Requirement (2) ensures we can correct even when all bitflips are clumped
  * in the same sector.
  */
-static bool nand_ecc_strength_good(struct mtd_info *mtd)
+static bool nand_ecc_strength_good(struct nand_chip *chip)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	int corr, ds_corr;
 
@@ -5577,7 +5570,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 		ecc->algo = NAND_ECC_HAMMING;
 
 	case NAND_ECC_SOFT:
-		ret = nand_set_ecc_soft_ops(mtd);
+		ret = nand_set_ecc_soft_ops(chip);
 		if (ret) {
 			ret = -EINVAL;
 			goto err_nand_manuf_cleanup;
@@ -5662,7 +5655,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 	mtd->oobavail = ret;
 
 	/* ECC sanity check: warn if it's too weak */
-	if (!nand_ecc_strength_good(mtd))
+	if (!nand_ecc_strength_good(chip))
 		pr_warn("WARNING: %s: the ECC used on your system is too weak compared to the one required by the NAND chip\n",
 			mtd->name);
 
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 98a826838b60..b5e3b54cc767 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -77,7 +77,7 @@
 #define BBT_ENTRY_MASK		0x03
 #define BBT_ENTRY_SHIFT		2
 
-static int nand_update_bbt(struct mtd_info *mtd, loff_t offs);
+static int nand_update_bbt(struct nand_chip *chip, loff_t offs);
 
 static inline uint8_t bbt_get_entry(struct nand_chip *chip, int block)
 {
@@ -160,7 +160,7 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
 
 /**
  * read_bbt - [GENERIC] Read the bad block table starting from page
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @buf: temporary buffer
  * @page: the starting page
  * @num: the number of bbt descriptors to read
@@ -169,11 +169,11 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
  *
  * Read the bad block table starting from page.
  */
-static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
-		struct nand_bbt_descr *td, int offs)
+static int read_bbt(struct nand_chip *this, uint8_t *buf, int page, int num,
+		    struct nand_bbt_descr *td, int offs)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
 	int res, ret = 0, i, j, act = 0;
-	struct nand_chip *this = mtd_to_nand(mtd);
 	size_t retlen, len, totlen;
 	loff_t from;
 	int bits = td->options & NAND_BBT_NRBITS_MSK;
@@ -253,7 +253,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 
 /**
  * read_abs_bbt - [GENERIC] Read the bad block table starting at a given page
- * @mtd: MTD device structure
+ * @this: NAND chip object
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @chip: read the table for a specific chip, -1 read all chips; applies only if
@@ -262,16 +262,17 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
  * Read the bad block table for all chips starting at a given page. We assume
  * that the bbt bits are in consecutive order.
  */
-static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td, int chip)
+static int read_abs_bbt(struct nand_chip *this, uint8_t *buf,
+			struct nand_bbt_descr *td, int chip)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 	int res = 0, i;
 
 	if (td->options & NAND_BBT_PERCHIP) {
 		int offs = 0;
 		for (i = 0; i < this->numchips; i++) {
 			if (chip == -1 || chip == i)
-				res = read_bbt(mtd, buf, td->pages[i],
+				res = read_bbt(this, buf, td->pages[i],
 					this->chipsize >> this->bbt_erase_shift,
 					td, offs);
 			if (res)
@@ -279,7 +280,7 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 			offs += this->chipsize >> this->bbt_erase_shift;
 		}
 	} else {
-		res = read_bbt(mtd, buf, td->pages[0],
+		res = read_bbt(this, buf, td->pages[0],
 				mtd->size >> this->bbt_erase_shift, td, 0);
 		if (res)
 			return res;
@@ -288,9 +289,10 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 }
 
 /* BBT marker is in the first page, no OOB */
-static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
-			 struct nand_bbt_descr *td)
+static int scan_read_data(struct nand_chip *this, uint8_t *buf, loff_t offs,
+			  struct nand_bbt_descr *td)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
 	size_t retlen;
 	size_t len;
 
@@ -303,7 +305,7 @@ static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 
 /**
  * scan_read_oob - [GENERIC] Scan data+OOB region to buffer
- * @mtd: MTD device structure
+ * @this: NAND chip object
  * @buf: temporary buffer
  * @offs: offset at which to scan
  * @len: length of data region to read
@@ -312,9 +314,10 @@ static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
  * page,OOB,page,OOB,... in buf. Completes transfer and returns the "strongest"
  * ECC condition (error or bitflip). May quit on the first (non-ECC) error.
  */
-static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
+static int scan_read_oob(struct nand_chip *this, uint8_t *buf, loff_t offs,
 			 size_t len)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
 	struct mtd_oob_ops ops;
 	int res, ret = 0;
 
@@ -342,19 +345,20 @@ static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 	return ret;
 }
 
-static int scan_read(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
-			 size_t len, struct nand_bbt_descr *td)
+static int scan_read(struct nand_chip *this, uint8_t *buf, loff_t offs,
+		     size_t len, struct nand_bbt_descr *td)
 {
 	if (td->options & NAND_BBT_NO_OOB)
-		return scan_read_data(mtd, buf, offs, td);
+		return scan_read_data(this, buf, offs, td);
 	else
-		return scan_read_oob(mtd, buf, offs, len);
+		return scan_read_oob(this, buf, offs, len);
 }
 
 /* Scan write data with oob to flash */
-static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,
+static int scan_write_bbt(struct nand_chip *this, loff_t offs, size_t len,
 			  uint8_t *buf, uint8_t *oob)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
 	struct mtd_oob_ops ops;
 
 	ops.mode = MTD_OPS_PLACE_OOB;
@@ -367,8 +371,9 @@ static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,
 	return mtd_write_oob(mtd, offs, &ops);
 }
 
-static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
+static u32 bbt_get_ver_offs(struct nand_chip *this, struct nand_bbt_descr *td)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
 	u32 ver_offs = td->veroffs;
 
 	if (!(td->options & NAND_BBT_NO_OOB))
@@ -378,7 +383,7 @@ static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
 
 /**
  * read_abs_bbts - [GENERIC] Read the bad block table(s) for all chips starting at a given page
- * @mtd: MTD device structure
+ * @this: NAND chip object
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @md:	descriptor for the bad block table mirror
@@ -386,34 +391,35 @@ static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
  * Read the bad block table(s) for all chips starting at a given page. We
  * assume that the bbt bits are in consecutive order.
  */
-static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
+static void read_abs_bbts(struct nand_chip *this, uint8_t *buf,
 			  struct nand_bbt_descr *td, struct nand_bbt_descr *md)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 
 	/* Read the primary version, if available */
 	if (td->options & NAND_BBT_VERSION) {
-		scan_read(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
-			      mtd->writesize, td);
-		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
+		scan_read(this, buf, (loff_t)td->pages[0] << this->page_shift,
+			  mtd->writesize, td);
+		td->version[0] = buf[bbt_get_ver_offs(this, td)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
 			 td->pages[0], td->version[0]);
 	}
 
 	/* Read the mirror version, if available */
 	if (md && (md->options & NAND_BBT_VERSION)) {
-		scan_read(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
-			      mtd->writesize, md);
-		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
+		scan_read(this, buf, (loff_t)md->pages[0] << this->page_shift,
+			  mtd->writesize, md);
+		md->version[0] = buf[bbt_get_ver_offs(this, md)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
 			 md->pages[0], md->version[0]);
 	}
 }
 
 /* Scan a given block partially */
-static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
+static int scan_block_fast(struct nand_chip *this, struct nand_bbt_descr *bd,
 			   loff_t offs, uint8_t *buf, int numpages)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
 	struct mtd_oob_ops ops;
 	int j, ret;
 
@@ -443,7 +449,7 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 
 /**
  * create_bbt - [GENERIC] Create a bad block table by scanning the device
- * @mtd: MTD device structure
+ * @this: NAND chip object
  * @buf: temporary buffer
  * @bd: descriptor for the good/bad block search pattern
  * @chip: create the table for a specific chip, -1 read all chips; applies only
@@ -452,10 +458,10 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
  * Create a bad block table by scanning the device for the given good/bad block
  * identify pattern.
  */
-static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
-	struct nand_bbt_descr *bd, int chip)
+static int create_bbt(struct nand_chip *this, uint8_t *buf,
+		      struct nand_bbt_descr *bd, int chip)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 	int i, numblocks, numpages;
 	int startblock;
 	loff_t from;
@@ -491,7 +497,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 		BUG_ON(bd->options & NAND_BBT_NO_OOB);
 
-		ret = scan_block_fast(mtd, bd, from, buf, numpages);
+		ret = scan_block_fast(this, bd, from, buf, numpages);
 		if (ret < 0)
 			return ret;
 
@@ -509,7 +515,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 /**
  * search_bbt - [GENERIC] scan the device for a specific bad block table
- * @mtd: MTD device structure
+ * @this: NAND chip object
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  *
@@ -522,9 +528,10 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
  *
  * The bbt ident pattern resides in the oob area of the first page in a block.
  */
-static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td)
+static int search_bbt(struct nand_chip *this, uint8_t *buf,
+		      struct nand_bbt_descr *td)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 	int i, chips;
 	int startblock, block, dir;
 	int scanlen = mtd->writesize + mtd->oobsize;
@@ -561,11 +568,11 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
 
 			/* Read first page */
-			scan_read(mtd, buf, offs, mtd->writesize, td);
+			scan_read(this, buf, offs, mtd->writesize, td);
 			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
 				td->pages[i] = actblock << blocktopage;
 				if (td->options & NAND_BBT_VERSION) {
-					offs = bbt_get_ver_offs(mtd, td);
+					offs = bbt_get_ver_offs(this, td);
 					td->version[i] = buf[offs];
 				}
 				break;
@@ -586,23 +593,23 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 
 /**
  * search_read_bbts - [GENERIC] scan the device for bad block table(s)
- * @mtd: MTD device structure
+ * @this: NAND chip object
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @md: descriptor for the bad block table mirror
  *
  * Search and read the bad block table(s).
  */
-static void search_read_bbts(struct mtd_info *mtd, uint8_t *buf,
+static void search_read_bbts(struct nand_chip *this, uint8_t *buf,
 			     struct nand_bbt_descr *td,
 			     struct nand_bbt_descr *md)
 {
 	/* Search the primary table */
-	search_bbt(mtd, buf, td);
+	search_bbt(this, buf, td);
 
 	/* Search the mirror table */
 	if (md)
-		search_bbt(mtd, buf, md);
+		search_bbt(this, buf, md);
 }
 
 /**
@@ -700,7 +707,7 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 
 /**
  * write_bbt - [GENERIC] (Re)write the bad block table
- * @mtd: MTD device structure
+ * @this: NAND chip object
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @md: descriptor for the bad block table mirror
@@ -708,11 +715,11 @@ static void mark_bbt_block_bad(struct nand_chip *this,
  *
  * (Re)write the bad block table.
  */
-static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
+static int write_bbt(struct nand_chip *this, uint8_t *buf,
 		     struct nand_bbt_descr *td, struct nand_bbt_descr *md,
 		     int chipsel)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 	struct erase_info einfo;
 	int i, res, chip = 0;
 	int bits, page, offs, numblocks, sft, sftmsk;
@@ -862,9 +869,9 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			continue;
 		}
 
-		res = scan_write_bbt(mtd, to, len, buf,
-				td->options & NAND_BBT_NO_OOB ? NULL :
-				&buf[len]);
+		res = scan_write_bbt(this, to, len, buf,
+				     td->options & NAND_BBT_NO_OOB ?
+				     NULL : &buf[len]);
 		if (res < 0) {
 			pr_warn("nand_bbt: error while writing BBT block %d\n",
 				res);
@@ -887,22 +894,21 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 /**
  * nand_memory_bbt - [GENERIC] create a memory based bad block table
- * @mtd: MTD device structure
+ * @this: NAND chip object
  * @bd: descriptor for the good/bad block search pattern
  *
  * The function creates a memory based bbt by scanning the device for
  * manufacturer / software marked good / bad blocks.
  */
-static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+static inline int nand_memory_bbt(struct nand_chip *this,
+				  struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
-
-	return create_bbt(mtd, this->data_buf, bd, -1);
+	return create_bbt(this, this->data_buf, bd, -1);
 }
 
 /**
  * check_create - [GENERIC] create and write bbt(s) if necessary
- * @mtd: MTD device structure
+ * @this: the NAND device
  * @buf: temporary buffer
  * @bd: descriptor for the good/bad block search pattern
  *
@@ -911,10 +917,10 @@ static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *b
  * for the chip/device. Update is necessary if one of the tables is missing or
  * the version nr. of one table is less than the other.
  */
-static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *bd)
+static int check_create(struct nand_chip *this, uint8_t *buf,
+			struct nand_bbt_descr *bd)
 {
 	int i, chips, writeops, create, chipsel, res, res2;
-	struct nand_chip *this = mtd_to_nand(mtd);
 	struct nand_bbt_descr *td = this->bbt_td;
 	struct nand_bbt_descr *md = this->bbt_md;
 	struct nand_bbt_descr *rd, *rd2;
@@ -971,7 +977,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 
 			/* Create the table in memory by scanning the chip(s) */
 			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
-				create_bbt(mtd, buf, bd, chipsel);
+				create_bbt(this, buf, bd, chipsel);
 
 			td->version[i] = 1;
 			if (md)
@@ -980,7 +986,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 
 		/* Read back first? */
 		if (rd) {
-			res = read_abs_bbt(mtd, buf, rd, chipsel);
+			res = read_abs_bbt(this, buf, rd, chipsel);
 			if (mtd_is_eccerr(res)) {
 				/* Mark table as invalid */
 				rd->pages[i] = -1;
@@ -991,7 +997,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 		}
 		/* If they weren't versioned, read both */
 		if (rd2) {
-			res2 = read_abs_bbt(mtd, buf, rd2, chipsel);
+			res2 = read_abs_bbt(this, buf, rd2, chipsel);
 			if (mtd_is_eccerr(res2)) {
 				/* Mark table as invalid */
 				rd2->pages[i] = -1;
@@ -1013,14 +1019,14 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 
 		/* Write the bad block table to the device? */
 		if ((writeops & 0x01) && (td->options & NAND_BBT_WRITE)) {
-			res = write_bbt(mtd, buf, td, md, chipsel);
+			res = write_bbt(this, buf, td, md, chipsel);
 			if (res < 0)
 				return res;
 		}
 
 		/* Write the mirror bad block table to the device? */
 		if ((writeops & 0x02) && md && (md->options & NAND_BBT_WRITE)) {
-			res = write_bbt(mtd, buf, md, td, chipsel);
+			res = write_bbt(this, buf, md, td, chipsel);
 			if (res < 0)
 				return res;
 		}
@@ -1030,15 +1036,15 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 
 /**
  * mark_bbt_regions - [GENERIC] mark the bad block table regions
- * @mtd: MTD device structure
+ * @this: the NAND device
  * @td: bad block table descriptor
  *
  * The bad block table regions are marked as "bad" to prevent accidental
  * erasures / writes. The regions are identified by the mark 0x02.
  */
-static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
+static void mark_bbt_region(struct nand_chip *this, struct nand_bbt_descr *td)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 	int i, j, chips, block, nrblocks, update;
 	uint8_t oldval;
 
@@ -1061,7 +1067,7 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
 			if ((oldval != BBT_BLOCK_RESERVED) &&
 					td->reserved_block_code)
-				nand_update_bbt(mtd, (loff_t)block <<
+				nand_update_bbt(this, (loff_t)block <<
 						this->bbt_erase_shift);
 			continue;
 		}
@@ -1083,22 +1089,22 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		 * bbts.  This should only happen once.
 		 */
 		if (update && td->reserved_block_code)
-			nand_update_bbt(mtd, (loff_t)(block - 1) <<
+			nand_update_bbt(this, (loff_t)(block - 1) <<
 					this->bbt_erase_shift);
 	}
 }
 
 /**
  * verify_bbt_descr - verify the bad block description
- * @mtd: MTD device structure
+ * @this: the NAND device
  * @bd: the table to verify
  *
  * This functions performs a few sanity checks on the bad block description
  * table.
  */
-static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+static void verify_bbt_descr(struct nand_chip *this, struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 	u32 pattern_len;
 	u32 bits;
 	u32 table_size;
@@ -1138,7 +1144,7 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 
 /**
  * nand_scan_bbt - [NAND Interface] scan, find, read and maybe create bad block table(s)
- * @mtd: MTD device structure
+ * @this: the NAND device
  * @bd: descriptor for the good/bad block search pattern
  *
  * The function checks, if a bad block table(s) is/are already available. If
@@ -1148,9 +1154,9 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
  * The bad block table memory is allocated here. It must be freed by calling
  * the nand_free_bbt function.
  */
-static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+static int nand_scan_bbt(struct nand_chip *this, struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 	int len, res;
 	uint8_t *buf;
 	struct nand_bbt_descr *td = this->bbt_td;
@@ -1170,14 +1176,14 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	 * memory based bad block table.
 	 */
 	if (!td) {
-		if ((res = nand_memory_bbt(mtd, bd))) {
+		if ((res = nand_memory_bbt(this, bd))) {
 			pr_err("nand_bbt: can't scan flash and build the RAM-based BBT\n");
 			goto err;
 		}
 		return 0;
 	}
-	verify_bbt_descr(mtd, td);
-	verify_bbt_descr(mtd, md);
+	verify_bbt_descr(this, td);
+	verify_bbt_descr(this, md);
 
 	/* Allocate a temporary buffer for one eraseblock incl. oob */
 	len = (1 << this->bbt_erase_shift);
@@ -1190,20 +1196,20 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 
 	/* Is the bbt at a given page? */
 	if (td->options & NAND_BBT_ABSPAGE) {
-		read_abs_bbts(mtd, buf, td, md);
+		read_abs_bbts(this, buf, td, md);
 	} else {
 		/* Search the bad block table using a pattern in oob */
-		search_read_bbts(mtd, buf, td, md);
+		search_read_bbts(this, buf, td, md);
 	}
 
-	res = check_create(mtd, buf, bd);
+	res = check_create(this, buf, bd);
 	if (res)
 		goto err;
 
 	/* Prevent the bbt regions from erasing / writing */
-	mark_bbt_region(mtd, td);
+	mark_bbt_region(this, td);
 	if (md)
-		mark_bbt_region(mtd, md);
+		mark_bbt_region(this, md);
 
 	vfree(buf);
 	return 0;
@@ -1216,14 +1222,14 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 
 /**
  * nand_update_bbt - update bad block table(s)
- * @mtd: MTD device structure
+ * @this: the NAND device
  * @offs: the offset of the newly marked block
  *
  * The function updates the bad block table(s).
  */
-static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
+static int nand_update_bbt(struct nand_chip *this, loff_t offs)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 	int len, res = 0;
 	int chip, chipsel;
 	uint8_t *buf;
@@ -1255,13 +1261,13 @@ static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 
 	/* Write the bad block table to the device? */
 	if (td->options & NAND_BBT_WRITE) {
-		res = write_bbt(mtd, buf, td, md, chipsel);
+		res = write_bbt(this, buf, td, md, chipsel);
 		if (res < 0)
 			goto out;
 	}
 	/* Write the mirror bad block table to the device? */
 	if (md && (md->options & NAND_BBT_WRITE)) {
-		res = write_bbt(mtd, buf, md, td, chipsel);
+		res = write_bbt(this, buf, md, td, chipsel);
 	}
 
  out:
@@ -1382,7 +1388,7 @@ int nand_create_bbt(struct nand_chip *this)
 			return ret;
 	}
 
-	return nand_scan_bbt(nand_to_mtd(this), this->badblock_pattern);
+	return nand_scan_bbt(this, this->badblock_pattern);
 }
 EXPORT_SYMBOL(nand_create_bbt);
 
@@ -1433,7 +1439,6 @@ int nand_isbad_bbt(struct nand_chip *this, loff_t offs, int allowbbt)
  */
 int nand_markbad_bbt(struct nand_chip *this, loff_t offs)
 {
-	struct mtd_info *mtd = nand_to_mtd(this);
 	int block, ret = 0;
 
 	block = (int)(offs >> this->bbt_erase_shift);
@@ -1443,7 +1448,7 @@ int nand_markbad_bbt(struct nand_chip *this, loff_t offs)
 
 	/* Update flash-based bad block table */
 	if (this->bbt_options & NAND_BBT_USE_FLASH)
-		ret = nand_update_bbt(mtd, offs);
+		ret = nand_update_bbt(this, offs);
 
 	return ret;
 }
diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index c5ddc86cd98c..bf0304c4a640 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -165,15 +165,14 @@ static void nand_read_buf16(struct nand_chip *chip, uint8_t *buf, int len)
 
 /**
  * panic_nand_wait_ready - [GENERIC] Wait for the ready pin after commands.
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @timeo: Timeout
  *
  * Helper function for nand_wait_ready used when needing to wait in interrupt
  * context.
  */
-static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
+static void panic_nand_wait_ready(struct nand_chip *chip, unsigned long timeo)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
 	int i;
 
 	/* Wait for the device to get ready */
@@ -193,11 +192,10 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
  */
 void nand_wait_ready(struct nand_chip *chip)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
 	unsigned long timeo = 400;
 
 	if (in_interrupt() || oops_in_progress)
-		return panic_nand_wait_ready(mtd, timeo);
+		return panic_nand_wait_ready(chip, timeo);
 
 	/* Wait until command is processed or timeout occurs */
 	timeo = jiffies + msecs_to_jiffies(timeo);
@@ -214,14 +212,13 @@ EXPORT_SYMBOL_GPL(nand_wait_ready);
 
 /**
  * nand_wait_status_ready - [GENERIC] Wait for the ready status after commands.
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @timeo: Timeout in ms
  *
  * Wait for status ready (i.e. command done) or timeout.
  */
-static void nand_wait_status_ready(struct mtd_info *mtd, unsigned long timeo)
+static void nand_wait_status_ready(struct nand_chip *chip, unsigned long timeo)
 {
-	register struct nand_chip *chip = mtd_to_nand(mtd);
 	int ret;
 
 	timeo = jiffies + msecs_to_jiffies(timeo);
@@ -321,7 +318,7 @@ static void nand_command(struct nand_chip *chip, unsigned int command,
 		chip->legacy.cmd_ctrl(chip, NAND_CMD_NONE,
 				      NAND_NCE | NAND_CTRL_CHANGE);
 		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
-		nand_wait_status_ready(mtd, 250);
+		nand_wait_status_ready(chip, 250);
 		return;
 
 		/* This applies to read commands */
@@ -458,7 +455,7 @@ static void nand_command_lp(struct nand_chip *chip, unsigned int command,
 		chip->legacy.cmd_ctrl(chip, NAND_CMD_NONE,
 				      NAND_NCE | NAND_CTRL_CHANGE);
 		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
-		nand_wait_status_ready(mtd, 250);
+		nand_wait_status_ready(chip, 250);
 		return;
 
 	case NAND_CMD_RNDOUT:
@@ -525,7 +522,6 @@ EXPORT_SYMBOL(nand_get_set_features_notsupp);
 
 /**
  * nand_wait - [DEFAULT] wait until the command is done
- * @mtd: MTD device structure
  * @chip: NAND chip structure
  *
  * Wait for command done. This applies to erase and program only.
-- 
2.17.1
