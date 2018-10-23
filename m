Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gF1lE-0005WU-Og
 for linux-mtd@lists.infradead.org; Tue, 23 Oct 2018 18:50:47 +0000
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
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 02/15] mtd: rawnand: Reorganize code to avoid forward
 declarations
Date: Tue, 23 Oct 2018 20:49:58 +0200
Message-Id: <20181023185011.3356-3-boris.brezillon@bootlin.com>
In-Reply-To: <20181023185011.3356-1-boris.brezillon@bootlin.com>
References: <20181023185011.3356-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Avoid forward declaration of nand_get_device(), nand_do_write_oob()
and nand_update_bbt() by moving functions around.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 391 +++++++++++++++----------------
 drivers/mtd/nand/raw/nand_bbt.c  | 112 +++++----
 2 files changed, 248 insertions(+), 255 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 2a660dfa64d5..f0b35b5d9674 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -48,11 +48,6 @@
 
 #include "internals.h"
 
-static int nand_get_device(struct nand_chip *chip, int new_state);
-
-static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
-			     struct mtd_oob_ops *ops);
-
 /* Define default oob placement schemes for large and small page devices */
 static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
@@ -287,6 +282,199 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
 	return 0;
 }
 
+static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
+{
+	if (chip->legacy.block_bad)
+		return chip->legacy.block_bad(chip, ofs);
+
+	return nand_block_bad(chip, ofs);
+}
+
+/**
+ * panic_nand_get_device - [GENERIC] Get chip for selected access
+ * @chip: the nand chip descriptor
+ * @new_state: the state which is requested
+ *
+ * Used when in panic, no locks are taken.
+ */
+static void panic_nand_get_device(struct nand_chip *chip, int new_state)
+{
+	/* Hardware controller shared among independent devices */
+	chip->controller->active = chip;
+	chip->state = new_state;
+}
+
+/**
+ * nand_get_device - [GENERIC] Get chip for selected access
+ * @mtd: MTD device structure
+ * @new_state: the state which is requested
+ *
+ * Get the device and lock it for exclusive access
+ */
+static int
+nand_get_device(struct nand_chip *chip, int new_state)
+{
+	spinlock_t *lock = &chip->controller->lock;
+	wait_queue_head_t *wq = &chip->controller->wq;
+	DECLARE_WAITQUEUE(wait, current);
+retry:
+	spin_lock(lock);
+
+	/* Hardware controller shared among independent devices */
+	if (!chip->controller->active)
+		chip->controller->active = chip;
+
+	if (chip->controller->active == chip && chip->state == FL_READY) {
+		chip->state = new_state;
+		spin_unlock(lock);
+		return 0;
+	}
+	if (new_state == FL_PM_SUSPENDED) {
+		if (chip->controller->active->state == FL_PM_SUSPENDED) {
+			chip->state = FL_PM_SUSPENDED;
+			spin_unlock(lock);
+			return 0;
+		}
+	}
+	set_current_state(TASK_UNINTERRUPTIBLE);
+	add_wait_queue(wq, &wait);
+	spin_unlock(lock);
+	schedule();
+	remove_wait_queue(wq, &wait);
+	goto retry;
+}
+
+/**
+ * nand_check_wp - [GENERIC] check if the chip is write protected
+ * @mtd: MTD device structure
+ *
+ * Check, if the device is write protected. The function expects, that the
+ * device is already selected.
+ */
+static int nand_check_wp(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	u8 status;
+	int ret;
+
+	/* Broken xD cards report WP despite being writable */
+	if (chip->options & NAND_BROKEN_XD)
+		return 0;
+
+	/* Check the WP bit */
+	ret = nand_status_op(chip, &status);
+	if (ret)
+		return ret;
+
+	return status & NAND_STATUS_WP ? 0 : 1;
+}
+
+/**
+ * nand_fill_oob - [INTERN] Transfer client buffer to oob
+ * @mtd: MTD device structure
+ * @oob: oob data buffer
+ * @len: oob data write length
+ * @ops: oob ops structure
+ */
+static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob, size_t len,
+			      struct mtd_oob_ops *ops)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
+
+	/*
+	 * Initialise to all 0xFF, to avoid the possibility of left over OOB
+	 * data from a previous OOB read.
+	 */
+	memset(chip->oob_poi, 0xff, mtd->oobsize);
+
+	switch (ops->mode) {
+
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_RAW:
+		memcpy(chip->oob_poi + ops->ooboffs, oob, len);
+		return oob + len;
+
+	case MTD_OPS_AUTO_OOB:
+		ret = mtd_ooblayout_set_databytes(mtd, oob, chip->oob_poi,
+						  ops->ooboffs, len);
+		BUG_ON(ret);
+		return oob + len;
+
+	default:
+		BUG();
+	}
+	return NULL;
+}
+
+/**
+ * nand_do_write_oob - [MTD Interface] NAND write out-of-band
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operation description structure
+ *
+ * NAND write out-of-band.
+ */
+static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
+			     struct mtd_oob_ops *ops)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int chipnr, page, status, len;
+
+	pr_debug("%s: to = 0x%08x, len = %i\n",
+			 __func__, (unsigned int)to, (int)ops->ooblen);
+
+	len = mtd_oobavail(mtd, ops);
+
+	/* Do not allow write past end of page */
+	if ((ops->ooboffs + ops->ooblen) > len) {
+		pr_debug("%s: attempt to write past end of page\n",
+				__func__);
+		return -EINVAL;
+	}
+
+	chipnr = (int)(to >> chip->chip_shift);
+
+	/*
+	 * Reset the chip. Some chips (like the Toshiba TC5832DC found in one
+	 * of my DiskOnChip 2000 test units) will clear the whole data page too
+	 * if we don't do this. I have no clue why, but I seem to have 'fixed'
+	 * it in the doc2000 driver in August 1999.  dwmw2.
+	 */
+	nand_reset(chip, chipnr);
+
+	chip->select_chip(chip, chipnr);
+
+	/* Shift to get page */
+	page = (int)(to >> chip->page_shift);
+
+	/* Check, if it is write protected */
+	if (nand_check_wp(mtd)) {
+		chip->select_chip(chip, -1);
+		return -EROFS;
+	}
+
+	/* Invalidate the page cache, if we write to the cached page */
+	if (page == chip->pagebuf)
+		chip->pagebuf = -1;
+
+	nand_fill_oob(chip, ops->oobbuf, ops->ooblen, ops);
+
+	if (ops->mode == MTD_OPS_RAW)
+		status = chip->ecc.write_oob_raw(chip, page & chip->pagemask);
+	else
+		status = chip->ecc.write_oob(chip, page & chip->pagemask);
+
+	chip->select_chip(chip, -1);
+
+	if (status)
+		return status;
+
+	ops->oobretlen = ops->ooblen;
+
+	return 0;
+}
+
 /**
  * nand_default_block_markbad - [DEFAULT] mark a block bad via bad block marker
  * @chip: NAND chip object
@@ -342,14 +530,6 @@ int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs)
 	return nand_default_block_markbad(chip, ofs);
 }
 
-static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
-{
-	if (chip->legacy.block_bad)
-		return chip->legacy.block_bad(chip, ofs);
-
-	return nand_block_bad(chip, ofs);
-}
-
 /**
  * nand_block_markbad_lowlevel - mark a block bad
  * @mtd: MTD device structure
@@ -402,31 +582,6 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 	return ret;
 }
 
-/**
- * nand_check_wp - [GENERIC] check if the chip is write protected
- * @mtd: MTD device structure
- *
- * Check, if the device is write protected. The function expects, that the
- * device is already selected.
- */
-static int nand_check_wp(struct mtd_info *mtd)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	u8 status;
-	int ret;
-
-	/* Broken xD cards report WP despite being writable */
-	if (chip->options & NAND_BROKEN_XD)
-		return 0;
-
-	/* Check the WP bit */
-	ret = nand_status_op(chip, &status);
-	if (ret)
-		return ret;
-
-	return status & NAND_STATUS_WP ? 0 : 1;
-}
-
 /**
  * nand_block_isreserved - [GENERIC] Check if a block is marked reserved.
  * @mtd: MTD device structure
@@ -529,60 +684,6 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 };
 EXPORT_SYMBOL_GPL(nand_soft_waitrdy);
 
-/**
- * panic_nand_get_device - [GENERIC] Get chip for selected access
- * @chip: the nand chip descriptor
- * @new_state: the state which is requested
- *
- * Used when in panic, no locks are taken.
- */
-static void panic_nand_get_device(struct nand_chip *chip, int new_state)
-{
-	/* Hardware controller shared among independent devices */
-	chip->controller->active = chip;
-	chip->state = new_state;
-}
-
-/**
- * nand_get_device - [GENERIC] Get chip for selected access
- * @mtd: MTD device structure
- * @new_state: the state which is requested
- *
- * Get the device and lock it for exclusive access
- */
-static int
-nand_get_device(struct nand_chip *chip, int new_state)
-{
-	spinlock_t *lock = &chip->controller->lock;
-	wait_queue_head_t *wq = &chip->controller->wq;
-	DECLARE_WAITQUEUE(wait, current);
-retry:
-	spin_lock(lock);
-
-	/* Hardware controller shared among independent devices */
-	if (!chip->controller->active)
-		chip->controller->active = chip;
-
-	if (chip->controller->active == chip && chip->state == FL_READY) {
-		chip->state = new_state;
-		spin_unlock(lock);
-		return 0;
-	}
-	if (new_state == FL_PM_SUSPENDED) {
-		if (chip->controller->active->state == FL_PM_SUSPENDED) {
-			chip->state = FL_PM_SUSPENDED;
-			spin_unlock(lock);
-			return 0;
-		}
-	}
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	add_wait_queue(wq, &wait);
-	spin_unlock(lock);
-	schedule();
-	remove_wait_queue(wq, &wait);
-	goto retry;
-}
-
 /**
  * panic_nand_wait - [GENERIC] wait until the command is done
  * @mtd: MTD device structure
@@ -3782,44 +3883,6 @@ static int nand_write_page(struct nand_chip *chip, uint32_t offset,
 	return 0;
 }
 
-/**
- * nand_fill_oob - [INTERN] Transfer client buffer to oob
- * @mtd: MTD device structure
- * @oob: oob data buffer
- * @len: oob data write length
- * @ops: oob ops structure
- */
-static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob, size_t len,
-			      struct mtd_oob_ops *ops)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	int ret;
-
-	/*
-	 * Initialise to all 0xFF, to avoid the possibility of left over OOB
-	 * data from a previous OOB read.
-	 */
-	memset(chip->oob_poi, 0xff, mtd->oobsize);
-
-	switch (ops->mode) {
-
-	case MTD_OPS_PLACE_OOB:
-	case MTD_OPS_RAW:
-		memcpy(chip->oob_poi + ops->ooboffs, oob, len);
-		return oob + len;
-
-	case MTD_OPS_AUTO_OOB:
-		ret = mtd_ooblayout_set_databytes(mtd, oob, chip->oob_poi,
-						  ops->ooboffs, len);
-		BUG_ON(ret);
-		return oob + len;
-
-	default:
-		BUG();
-	}
-	return NULL;
-}
-
 #define NOTALIGNED(x)	((x & (chip->subpagesize - 1)) != 0)
 
 /**
@@ -3987,74 +4050,6 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return ret;
 }
 
-/**
- * nand_do_write_oob - [MTD Interface] NAND write out-of-band
- * @mtd: MTD device structure
- * @to: offset to write to
- * @ops: oob operation description structure
- *
- * NAND write out-of-band.
- */
-static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
-			     struct mtd_oob_ops *ops)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	int chipnr, page, status, len;
-
-	pr_debug("%s: to = 0x%08x, len = %i\n",
-			 __func__, (unsigned int)to, (int)ops->ooblen);
-
-	len = mtd_oobavail(mtd, ops);
-
-	/* Do not allow write past end of page */
-	if ((ops->ooboffs + ops->ooblen) > len) {
-		pr_debug("%s: attempt to write past end of page\n",
-				__func__);
-		return -EINVAL;
-	}
-
-	chipnr = (int)(to >> chip->chip_shift);
-
-	/*
-	 * Reset the chip. Some chips (like the Toshiba TC5832DC found in one
-	 * of my DiskOnChip 2000 test units) will clear the whole data page too
-	 * if we don't do this. I have no clue why, but I seem to have 'fixed'
-	 * it in the doc2000 driver in August 1999.  dwmw2.
-	 */
-	nand_reset(chip, chipnr);
-
-	chip->select_chip(chip, chipnr);
-
-	/* Shift to get page */
-	page = (int)(to >> chip->page_shift);
-
-	/* Check, if it is write protected */
-	if (nand_check_wp(mtd)) {
-		chip->select_chip(chip, -1);
-		return -EROFS;
-	}
-
-	/* Invalidate the page cache, if we write to the cached page */
-	if (page == chip->pagebuf)
-		chip->pagebuf = -1;
-
-	nand_fill_oob(chip, ops->oobbuf, ops->ooblen, ops);
-
-	if (ops->mode == MTD_OPS_RAW)
-		status = chip->ecc.write_oob_raw(chip, page & chip->pagemask);
-	else
-		status = chip->ecc.write_oob(chip, page & chip->pagemask);
-
-	chip->select_chip(chip, -1);
-
-	if (status)
-		return status;
-
-	ops->oobretlen = ops->ooblen;
-
-	return 0;
-}
-
 /**
  * nand_write_oob - [MTD Interface] NAND write data and/or out-of-band
  * @mtd: MTD device structure
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index cd69f29a45e2..1766f1abdf08 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -77,8 +77,6 @@
 #define BBT_ENTRY_MASK		0x03
 #define BBT_ENTRY_SHIFT		2
 
-static int nand_update_bbt(struct nand_chip *chip, loff_t offs);
-
 static inline uint8_t bbt_get_entry(struct nand_chip *chip, int block)
 {
 	uint8_t entry = chip->bbt[block >> BBT_ENTRY_SHIFT];
@@ -1034,6 +1032,61 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 	return 0;
 }
 
+/**
+ * nand_update_bbt - update bad block table(s)
+ * @this: the NAND device
+ * @offs: the offset of the newly marked block
+ *
+ * The function updates the bad block table(s).
+ */
+static int nand_update_bbt(struct nand_chip *this, loff_t offs)
+{
+	struct mtd_info *mtd = nand_to_mtd(this);
+	int len, res = 0;
+	int chip, chipsel;
+	uint8_t *buf;
+	struct nand_bbt_descr *td = this->bbt_td;
+	struct nand_bbt_descr *md = this->bbt_md;
+
+	if (!this->bbt || !td)
+		return -EINVAL;
+
+	/* Allocate a temporary buffer for one eraseblock incl. oob */
+	len = (1 << this->bbt_erase_shift);
+	len += (len >> this->page_shift) * mtd->oobsize;
+	buf = kmalloc(len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/* Do we have a bbt per chip? */
+	if (td->options & NAND_BBT_PERCHIP) {
+		chip = (int)(offs >> this->chip_shift);
+		chipsel = chip;
+	} else {
+		chip = 0;
+		chipsel = -1;
+	}
+
+	td->version[chip]++;
+	if (md)
+		md->version[chip]++;
+
+	/* Write the bad block table to the device? */
+	if (td->options & NAND_BBT_WRITE) {
+		res = write_bbt(this, buf, td, md, chipsel);
+		if (res < 0)
+			goto out;
+	}
+	/* Write the mirror bad block table to the device? */
+	if (md && (md->options & NAND_BBT_WRITE)) {
+		res = write_bbt(this, buf, md, td, chipsel);
+	}
+
+ out:
+	kfree(buf);
+	return res;
+}
+
 /**
  * mark_bbt_regions - [GENERIC] mark the bad block table regions
  * @this: the NAND device
@@ -1220,61 +1273,6 @@ static int nand_scan_bbt(struct nand_chip *this, struct nand_bbt_descr *bd)
 	return res;
 }
 
-/**
- * nand_update_bbt - update bad block table(s)
- * @this: the NAND device
- * @offs: the offset of the newly marked block
- *
- * The function updates the bad block table(s).
- */
-static int nand_update_bbt(struct nand_chip *this, loff_t offs)
-{
-	struct mtd_info *mtd = nand_to_mtd(this);
-	int len, res = 0;
-	int chip, chipsel;
-	uint8_t *buf;
-	struct nand_bbt_descr *td = this->bbt_td;
-	struct nand_bbt_descr *md = this->bbt_md;
-
-	if (!this->bbt || !td)
-		return -EINVAL;
-
-	/* Allocate a temporary buffer for one eraseblock incl. oob */
-	len = (1 << this->bbt_erase_shift);
-	len += (len >> this->page_shift) * mtd->oobsize;
-	buf = kmalloc(len, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	/* Do we have a bbt per chip? */
-	if (td->options & NAND_BBT_PERCHIP) {
-		chip = (int)(offs >> this->chip_shift);
-		chipsel = chip;
-	} else {
-		chip = 0;
-		chipsel = -1;
-	}
-
-	td->version[chip]++;
-	if (md)
-		md->version[chip]++;
-
-	/* Write the bad block table to the device? */
-	if (td->options & NAND_BBT_WRITE) {
-		res = write_bbt(this, buf, td, md, chipsel);
-		if (res < 0)
-			goto out;
-	}
-	/* Write the mirror bad block table to the device? */
-	if (md && (md->options & NAND_BBT_WRITE)) {
-		res = write_bbt(this, buf, md, td, chipsel);
-	}
-
- out:
-	kfree(buf);
-	return res;
-}
-
 /*
  * Define some generic bad / good block scan pattern which are used
  * while scanning a device for factory marked good / bad blocks.
-- 
2.17.1
