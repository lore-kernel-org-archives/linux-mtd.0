Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MO7mM-0007z9-1Q
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 10:20:08 +0000
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id n67AJo3u015753
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 05:19:57 -0500
Received: from webmail.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id n67AJlhu018519
	for <linux-mtd@lists.infradead.org>;
	Tue, 7 Jul 2009 05:19:48 -0500 (CDT)
Message-ID: <61362.192.168.10.89.1246961989.squirrel@dbdmail.itg.ti.com>
Date: Tue, 7 Jul 2009 15:49:49 +0530 (IST)
Subject: [PATCH] nand_base.c: removing function names from debug prints and
	using macro '__func__'
From: "vimal singh" <vimalsingh@ti.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Correcting debug prints by removing function names from print messages
and using '__func__' macro instead.

Function names were wrong in few places.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8c21b89..4557fe8 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1413,8 +1413,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t
from,
 	int len;
 	uint8_t *buf = ops->oobbuf;

-	DEBUG(MTD_DEBUG_LEVEL3, "nand_read_oob: from = 0x%08Lx, len = %i\n",
-	      (unsigned long long)from, readlen);
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08Lx, len = %i\n",
+			__func__, (unsigned long long)from, readlen);

 	if (ops->mode == MTD_OOB_AUTO)
 		len = chip->ecc.layout->oobavail;
@@ -1422,8 +1422,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t
from,
 		len = mtd->oobsize;

 	if (unlikely(ops->ooboffs >= len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
-			"Attempt to start read outside oob\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to start read "
+					"outside oob\n", __func__);
 		return -EINVAL;
 	}

@@ -1431,8 +1431,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t
from,
 	if (unlikely(from >= mtd->size ||
 		     ops->ooboffs + readlen > ((mtd->size >> chip->page_shift) -
 					(from >> chip->page_shift)) * len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
-			"Attempt read beyond end of device\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt read beyond end "
+					"of device\n", __func__);
 		return -EINVAL;
 	}

@@ -1506,8 +1506,8 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,

 	/* Do not allow reads past end of device */
 	if (ops->datbuf && (from + ops->len) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
-		      "Attempt read beyond end of device\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt read "
+				"beyond end of device\n", __func__);
 		return -EINVAL;
 	}

@@ -1816,8 +1816,8 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t
to,

 	/* reject writes, which are not page aligned */
 	if (NOTALIGNED(to) || NOTALIGNED(ops->len)) {
-		printk(KERN_NOTICE "nand_write: "
-		       "Attempt to write not page aligned data\n");
+		printk(KERN_NOTICE "%s: Attempt to write not "
+				"page aligned data\n", __func__);
 		return -EINVAL;
 	}

@@ -1944,8 +1944,8 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t
to,
 	int chipnr, page, status, len;
 	struct nand_chip *chip = mtd->priv;

-	DEBUG(MTD_DEBUG_LEVEL3, "nand_write_oob: to = 0x%08x, len = %i\n",
-	      (unsigned int)to, (int)ops->ooblen);
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
+			 __func__, (unsigned int)to, (int)ops->ooblen);

 	if (ops->mode == MTD_OOB_AUTO)
 		len = chip->ecc.layout->oobavail;
@@ -1954,14 +1954,14 @@ static int nand_do_write_oob(struct mtd_info *mtd,
loff_t to,

 	/* Do not allow write past end of page */
 	if ((ops->ooboffs + ops->ooblen) > len) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_write_oob: "
-		      "Attempt to write past end of page\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to write "
+				"past end of page\n", __func__);
 		return -EINVAL;
 	}

 	if (unlikely(ops->ooboffs >= len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_do_write_oob: "
-			"Attempt to start write outside oob\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to start "
+				"write outside oob\n", __func__);
 		return -EINVAL;
 	}

@@ -1970,8 +1970,8 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t
to,
 		     ops->ooboffs + ops->ooblen >
 			((mtd->size >> chip->page_shift) -
 			 (to >> chip->page_shift)) * len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_do_write_oob: "
-			"Attempt write beyond end of device\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt write beyond "
+				"end of device\n", __func__);
 		return -EINVAL;
 	}

@@ -2026,8 +2026,8 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,

 	/* Do not allow writes past end of device */
 	if (ops->datbuf && (to + ops->len) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_write_oob: "
-		      "Attempt write beyond end of device\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt write beyond "
+				"end of device\n", __func__);
 		return -EINVAL;
 	}

@@ -2117,26 +2117,27 @@ int nand_erase_nand(struct mtd_info *mtd, struct
erase_info *instr,
 	unsigned int bbt_masked_page = 0xffffffff;
 	loff_t len;

-	DEBUG(MTD_DEBUG_LEVEL3, "nand_erase: start = 0x%012llx, len = %llu\n",
-	      (unsigned long long)instr->addr, (unsigned long long)instr->len);
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
+				__func__, (unsigned long long)instr->addr,
+				(unsigned long long)instr->len);

 	/* Start address must align on block boundary */
 	if (instr->addr & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_erase: Unaligned address\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
 		return -EINVAL;
 	}

 	/* Length must align on block boundary */
 	if (instr->len & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_erase: "
-		      "Length not block aligned\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
+					__func__);
 		return -EINVAL;
 	}

 	/* Do not allow erase past end of device */
 	if ((instr->len + instr->addr) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_erase: "
-		      "Erase past end of device\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Erase past end of device\n",
+					__func__);
 		return -EINVAL;
 	}

@@ -2157,8 +2158,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct
erase_info *instr,

 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_erase: "
-		      "Device is write protected!!!\n");
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Device is write protected!!!\n",
+					__func__);
 		instr->state = MTD_ERASE_FAILED;
 		goto erase_exit;
 	}
@@ -2183,8 +2184,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct
erase_info *instr,
 		 */
 		if (nand_block_checkbad(mtd, ((loff_t) page) <<
 					chip->page_shift, 0, allowbbt)) {
-			printk(KERN_WARNING "nand_erase: attempt to erase a "
-			       "bad block at page 0x%08x\n", page);
+			printk(KERN_WARNING "%s: attempt to erase a bad block "
+					"at page 0x%08x\n", __func__, page);
 			instr->state = MTD_ERASE_FAILED;
 			goto erase_exit;
 		}
@@ -2211,8 +2212,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct
erase_info *instr,

 		/* See if block erase succeeded */
 		if (status & NAND_STATUS_FAIL) {
-			DEBUG(MTD_DEBUG_LEVEL0, "nand_erase: "
-			      "Failed erase, page 0x%08x\n", page);
+			DEBUG(MTD_DEBUG_LEVEL0, "%s: Failed erase, "
+					"page 0x%08x\n", __func__, page);
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr =
 				((loff_t)page << chip->page_shift);
@@ -2272,9 +2273,9 @@ int nand_erase_nand(struct mtd_info *mtd, struct
erase_info *instr,
 		if (!rewrite_bbt[chipnr])
 			continue;
 		/* update the BBT for chip */
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_erase_nand: nand_update_bbt "
-		      "(%d:0x%0llx 0x%0x)\n", chipnr, rewrite_bbt[chipnr],
-		      chip->bbt_td->pages[chipnr]);
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: nand_update_bbt "
+			"(%d:0x%0llx 0x%0x)\n", __func__, chipnr,
+			rewrite_bbt[chipnr], chip->bbt_td->pages[chipnr]);
 		nand_update_bbt(mtd, rewrite_bbt[chipnr]);
 	}

@@ -2292,7 +2293,7 @@ static void nand_sync(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;

-	DEBUG(MTD_DEBUG_LEVEL3, "nand_sync: called\n");
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: called\n", __func__);

 	/* Grab the lock and see if the device is available */
 	nand_get_device(chip, mtd, FL_SYNCING);
@@ -2356,8 +2357,8 @@ static void nand_resume(struct mtd_info *mtd)
 	if (chip->state == FL_PM_SUSPENDED)
 		nand_release_device(mtd);
 	else
-		printk(KERN_ERR "nand_resume() called for a chip which is not "
-		       "in suspended state\n");
+		printk(KERN_ERR "%s called for a chip which is not "
+		       "in suspended state\n", __func__);
 }

 /*
@@ -2858,7 +2859,8 @@ int nand_scan(struct mtd_info *mtd, int maxchips)

 	/* Many callers got this wrong, so check for it for a while... */
 	if (!mtd->owner && caller_is_module()) {
-		printk(KERN_CRIT "nand_scan() called with NULL mtd->owner!\n");
+		printk(KERN_CRIT "%s called with NULL mtd->owner!\n",
+				__func__);
 		BUG();
 	}
