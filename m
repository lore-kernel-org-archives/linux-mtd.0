Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MtgIz-0005NP-2a
	for linux-mtd@lists.infradead.org; Fri, 02 Oct 2009 11:28:14 +0000
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KQV006ICX6SWQ@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 02 Oct 2009 20:28:04 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KQV006LRX6QJG@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 02 Oct 2009 20:28:04 +0900 (KST)
Date: Fri, 02 Oct 2009 16:59:11 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: [PATCH] [OneNAND] Standardising prints in onenand_base.c
To: dedekind1@gmail.com
Message-id: <34571E389FAD4588BDFEDEE0EDC9295A@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <C45F9E809A3C4FB0A470336A43DCCB74@sisodomain.com>
	<1254384027.32310.18.camel@localhost>
	<F890C3D467A3465090BA4473AF6EC789@sisodomain.com>
	<1254400357.3359.0.camel@localhost>
Cc: Kyungmin Park <kmpark@infradead.org>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch resolves all the prints present in onenand_base.c
Primarily, it replaces the hard-coded function names in the prints,
and makes use of __func__.

Signed-off-by: Amul Kumar Saha <amul.saha@samsung.com>
---
 onenand_base.c |  176 ++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 108 insertions(+), 68 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index ff66e43..8935e63 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -500,25 +500,28 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 		int ecc = onenand_read_ecc(this);
 		if (ecc) {
 			if (ecc & ONENAND_ECC_2BIT_ALL) {
-				printk(KERN_ERR "onenand_wait: ECC error = 0x%04x\n", ecc);
+				printk(KERN_ERR "%s: ECC error = 0x%04x\n",
+					__func__, ecc);
 				mtd->ecc_stats.failed++;
 				return -EBADMSG;
 			} else if (ecc & ONENAND_ECC_1BIT_ALL) {
-				printk(KERN_DEBUG "onenand_wait: correctable ECC error = 0x%04x\n", ecc);
+				printk(KERN_DEBUG "%s: correctable ECC error = 0x%04x\n",
+					__func__, ecc);
 				mtd->ecc_stats.corrected++;
 			}
 		}
 	} else if (state == FL_READING) {
-		printk(KERN_ERR "onenand_wait: read timeout! ctrl=0x%04x intr=0x%04x\n", ctrl, interrupt);
+		printk(KERN_ERR "%s: read timeout! ctrl=0x%04x intr=0x%04x\n",
+			__func__, ctrl, interrupt);
 		return -EIO;
 	}

 	/* If there's controller error, it's a real error */
 	if (ctrl & ONENAND_CTRL_ERROR) {
-		printk(KERN_ERR "onenand_wait: controller error = 0x%04x\n",
-			ctrl);
+		printk(KERN_ERR "%s: controller error = 0x%04x\n",
+			__func__, ctrl);
 		if (ctrl & ONENAND_CTRL_LOCK)
-			printk(KERN_ERR "onenand_wait: it's locked error.\n");
+			printk(KERN_ERR "%s: it's locked error.\n", __func__);
 		return -EIO;
 	}

@@ -1015,7 +1018,8 @@ static int onenand_recover_lsb(struct mtd_info *mtd, loff_t addr, int status)
 	/* We are attempting to reread, so decrement stats.failed
 	 * which was incremented by onenand_wait due to read failure
 	 */
-	printk(KERN_INFO "onenand_recover_lsb: Attempting to recover from uncorrectable read\n");
+	printk(KERN_INFO "%s: Attempting to recover from uncorrectable read\n",
+		__func__);
 	mtd->ecc_stats.failed--;

 	/* Issue the LSB page recovery command */
@@ -1046,7 +1050,8 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	int ret = 0;
 	int writesize = this->writesize;

-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_mlc_read_ops_nolock: from = 0x%08x, len = %i\n", (unsigned int) from, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08x, len = %i\n",
+		(unsigned int) from, (int) len);

 	if (ops->mode == MTD_OOB_AUTO)
 		oobsize = this->ecclayout->oobavail;
@@ -1057,7 +1062,8 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,

 	/* Do not allow reads past end of device */
 	if (from + len > mtd->size) {
-		printk(KERN_ERR "onenand_mlc_read_ops_nolock: Attempt read beyond end of device\n");
+		printk(KERN_ERR "%s: Attempt read beyond end of device\n",
+			__func__);
 		ops->retlen = 0;
 		ops->oobretlen = 0;
 		return -EINVAL;
@@ -1146,7 +1152,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	int ret = 0, boundary = 0;
 	int writesize = this->writesize;

-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_ops_nolock: from = 0x%08x, len = %i\n", (unsigned int) from, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08x, len = %i\n",
+			__func__, (unsigned int) from, (int) len);

 	if (ops->mode == MTD_OOB_AUTO)
 		oobsize = this->ecclayout->oobavail;
@@ -1157,7 +1164,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,

 	/* Do not allow reads past end of device */
 	if ((from + len) > mtd->size) {
-		printk(KERN_ERR "onenand_read_ops_nolock: Attempt read beyond end of device\n");
+		printk(KERN_ERR "%s: Attempt read beyond end of device\n",
+			__func__);
 		ops->retlen = 0;
 		ops->oobretlen = 0;
 		return -EINVAL;
@@ -1275,7 +1283,8 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,

 	from += ops->ooboffs;

-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_oob_nolock: from = 0x%08x, len = %i\n", (unsigned int) from, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08x, len = %i\n",
+		__func__, (unsigned int) from, (int) len);

 	/* Initialize return length value */
 	ops->oobretlen = 0;
@@ -1288,7 +1297,8 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 	column = from & (mtd->oobsize - 1);

 	if (unlikely(column >= oobsize)) {
-		printk(KERN_ERR "onenand_read_oob_nolock: Attempted to start read outside oob\n");
+		printk(KERN_ERR "%s: Attempted to start read outside oob\n",
+			__func__);
 		return -EINVAL;
 	}

@@ -1296,7 +1306,8 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 	if (unlikely(from >= mtd->size ||
 		     column + len > ((mtd->size >> this->page_shift) -
 				     (from >> this->page_shift)) * oobsize)) {
-		printk(KERN_ERR "onenand_read_oob_nolock: Attempted to read beyond end of device\n");
+		printk(KERN_ERR "%s: Attempted to read beyond end of device\n",
+			__func__);
 		return -EINVAL;
 	}

@@ -1319,7 +1330,8 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 			ret = onenand_recover_lsb(mtd, from, ret);

 		if (ret && ret != -EBADMSG) {
-			printk(KERN_ERR "onenand_read_oob_nolock: read failed = 0x%x\n", ret);
+			printk(KERN_ERR "%s: read failed = 0x%x\n",
+				__func__, ret);
 			break;
 		}

@@ -1450,20 +1462,21 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
 	if (interrupt & ONENAND_INT_READ) {
 		int ecc = onenand_read_ecc(this);
 		if (ecc & ONENAND_ECC_2BIT_ALL) {
-			printk(KERN_INFO "onenand_bbt_wait: ecc error = 0x%04x"
-				", controller error 0x%04x\n", ecc, ctrl);
+			printk(KERN_WARNING "%s: ecc error = 0x%04x, "
+				"controller error 0x%04x\n",
+				__func__, ecc, ctrl);
 			return ONENAND_BBT_READ_ECC_ERROR;
 		}
 	} else {
-		printk(KERN_ERR "onenand_bbt_wait: read timeout!"
-			"ctrl=0x%04x intr=0x%04x\n", ctrl, interrupt);
+		printk(KERN_ERR "%s: read timeout! ctrl=0x%04x intr=0x%04x\n",
+			__func__, ctrl, interrupt);
 		return ONENAND_BBT_READ_FATAL_ERROR;
 	}

 	/* Initial bad block case: 0x2400 or 0x0400 */
 	if (ctrl & ONENAND_CTRL_ERROR) {
-		printk(KERN_DEBUG "onenand_bbt_wait: "
-			"controller error = 0x%04x\n", ctrl);
+		printk(KERN_DEBUG "%s: controller error = 0x%04x\n",
+			__func__, ctrl);
 		return ONENAND_BBT_READ_ERROR;
 	}

@@ -1487,14 +1500,16 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 	size_t len = ops->ooblen;
 	u_char *buf = ops->oobbuf;

-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_bbt_read_oob: from = 0x%08x, len = %zi\n", (unsigned int) from, len);
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08x, len = %zi\n",
+		__func__, (unsigned int) from, len);

 	/* Initialize return value */
 	ops->oobretlen = 0;

 	/* Do not allow reads past end of device */
 	if (unlikely((from + len) > mtd->size)) {
-		printk(KERN_ERR "onenand_bbt_read_oob: Attempt read beyond end of device\n");
+		printk(KERN_ERR "%s: Attempt read beyond end of device\n",
+			__func__);
 		return ONENAND_BBT_READ_FATAL_ERROR;
 	}

@@ -1661,21 +1676,23 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	/* Wait for any existing operation to clear */
 	onenand_panic_wait(mtd);

-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_panic_write: to = 0x%08x, len = %i\n",
-	      (unsigned int) to, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
+		__func__, (unsigned int) to, (int) len);

 	/* Initialize retlen, in case of early exit */
 	*retlen = 0;

 	/* Do not allow writes past end of device */
 	if (unlikely((to + len) > mtd->size)) {
-		printk(KERN_ERR "onenand_panic_write: Attempt write to past end of device\n");
+		printk(KERN_ERR "%s: Attempt write to past end of device\n",
+			__func__);
 		return -EINVAL;
 	}

 	/* Reject writes, which are not page aligned */
         if (unlikely(NOTALIGNED(to) || NOTALIGNED(len))) {
-                printk(KERN_ERR "onenand_panic_write: Attempt to write not page aligned data\n");
+		printk(KERN_ERR "%s: Attempt to write not page aligned data\n",
+			__func__);
                 return -EINVAL;
         }

@@ -1711,7 +1728,7 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 		}

 		if (ret) {
-			printk(KERN_ERR "onenand_panic_write: write failed %d\n", ret);
+			printk(KERN_ERR "%s: write failed %d\n", __func__, ret);
 			break;
 		}

@@ -1792,7 +1809,8 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 	u_char *oobbuf;
 	int ret = 0;

-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_ops_nolock: to = 0x%08x, len = %i\n", (unsigned int) to, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
+		__func__, (unsigned int) to, (int) len);

 	/* Initialize retlen, in case of early exit */
 	ops->retlen = 0;
@@ -1800,13 +1818,15 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,

 	/* Do not allow writes past end of device */
 	if (unlikely((to + len) > mtd->size)) {
-		printk(KERN_ERR "onenand_write_ops_nolock: Attempt write to past end of device\n");
+		printk(KERN_ERR "%s: Attempt write to past end of device\n",
+			__func__);
 		return -EINVAL;
 	}

 	/* Reject writes, which are not page aligned */
         if (unlikely(NOTALIGNED(to) || NOTALIGNED(len))) {
-                printk(KERN_ERR "onenand_write_ops_nolock: Attempt to write not page aligned data\n");
+		printk(KERN_ERR "%s: Attempt to write not page aligned data\n",
+			__func__);
                 return -EINVAL;
         }

@@ -1879,7 +1899,8 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 			onenand_update_bufferram(mtd, prev, !ret && !prev_subpage);
 			if (ret) {
 				written -= prevlen;
-				printk(KERN_ERR "onenand_write_ops_nolock: write failed %d\n", ret);
+				printk(KERN_ERR "%s: write failed %d\n",
+					__func__, ret);
 				break;
 			}

@@ -1887,7 +1908,8 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 				/* Only check verify write turn on */
 				ret = onenand_verify(mtd, buf - len, to - len, len);
 				if (ret)
-					printk(KERN_ERR "onenand_write_ops_nolock: verify failed %d\n", ret);
+					printk(KERN_ERR "%s: verify failed %d\n",
+						__func__, ret);
 				break;
 			}

@@ -1905,14 +1927,16 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 			/* In partial page write we don't update bufferram */
 			onenand_update_bufferram(mtd, to, !ret && !subpage);
 			if (ret) {
-				printk(KERN_ERR "onenand_write_ops_nolock: write failed %d\n", ret);
+				printk(KERN_ERR "%s: write failed %d\n",
+					__func__, ret);
 				break;
 			}

 			/* Only check verify write turn on */
 			ret = onenand_verify(mtd, buf, to, thislen);
 			if (ret) {
-				printk(KERN_ERR "onenand_write_ops_nolock: verify failed %d\n", ret);
+				printk(KERN_ERR "%s: verify failed %d\n",
+					__func__, ret);
 				break;
 			}

@@ -1968,7 +1992,8 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,

 	to += ops->ooboffs;

-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_oob_nolock: to = 0x%08x, len = %i\n", (unsigned int) to, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
+		__func__, (unsigned int) to, (int) len);

 	/* Initialize retlen, in case of early exit */
 	ops->oobretlen = 0;
@@ -1981,14 +2006,15 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 	column = to & (mtd->oobsize - 1);

 	if (unlikely(column >= oobsize)) {
-		printk(KERN_ERR "onenand_write_oob_nolock: Attempted to start write outside oob\n");
+		printk(KERN_ERR "%s: Attempted to start write outside oob\n",
+			__func__);
 		return -EINVAL;
 	}

 	/* For compatibility with NAND: Do not allow write past end of page */
 	if (unlikely(column + len > oobsize)) {
-		printk(KERN_ERR "onenand_write_oob_nolock: "
-		      "Attempt to write past end of page\n");
+		printk(KERN_ERR "%s: Attempt to write past end of page\n",
+			__func__);
 		return -EINVAL;
 	}

@@ -1996,7 +2022,8 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 	if (unlikely(to >= mtd->size ||
 		     column + len > ((mtd->size >> this->page_shift) -
 				     (to >> this->page_shift)) * oobsize)) {
-		printk(KERN_ERR "onenand_write_oob_nolock: Attempted to write past end of device\n");
+		printk(KERN_ERR "%s: Attempted to write past end of device\n"
+			__func__);
 		return -EINVAL;
 	}

@@ -2038,13 +2065,14 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,

 		ret = this->wait(mtd, FL_WRITING);
 		if (ret) {
-			printk(KERN_ERR "onenand_write_oob_nolock: write failed %d\n", ret);
+			printk(KERN_ERR "%s: write failed %d\n", __func__, ret);
 			break;
 		}

 		ret = onenand_verify_oob(mtd, oobbuf, to);
 		if (ret) {
-			printk(KERN_ERR "onenand_write_oob_nolock: verify failed %d\n", ret);
+			printk(KERN_ERR "%s: verify failed %d\n",
+				__func__, ret);
 			break;
 		}

@@ -2161,7 +2189,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)

 	/* Do not allow erase past end of device */
 	if (unlikely((len + addr) > mtd->size)) {
-		printk(KERN_ERR "onenand_erase: Erase past end of device\n");
+		printk(KERN_ERR "%s: Erase past end of device\n", __func__);
 		return -EINVAL;
 	}

@@ -2177,7 +2205,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 		 * Erase region's start offset is always block start address.
 		 */
 		if (unlikely((addr - region->offset) & (block_size - 1))) {
-			printk(KERN_ERR "onenand_erase: Unaligned address\n");
+			printk(KERN_ERR "%s: Unaligned address\n", __func__);
 			return -EINVAL;
 		}
 	} else {
@@ -2185,14 +2213,14 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)

 		/* Start address must align on block boundary */
 		if (unlikely(addr & (block_size - 1))) {
-			printk(KERN_ERR "onenand_erase: Unaligned address\n");
+			printk(KERN_ERR "%s: Unaligned address\n", __func__);
 			return -EINVAL;
 		}
 	}

 	/* Length must align on block boundary */
 	if (unlikely(len & (block_size - 1))) {
-		printk(KERN_ERR "onenand_erase: Length not block aligned\n");
+		printk(KERN_ERR "%s: Length not block aligned\n", __func__);
 		return -EINVAL;
 	}

@@ -2209,7 +2237,9 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)

 		/* Check if we have a bad block, we do not erase bad blocks */
 		if (onenand_block_isbad_nolock(mtd, addr, 0)) {
-			printk (KERN_WARNING "onenand_erase: attempt to erase a bad block at addr 0x%012llx\n", (unsigned long long) addr);
+			printk(KERN_WARNING "%s: attempt to erase a bad block "
+					"at addr 0x%012llx\n",
+					__func__, (unsigned long long) addr);
 			instr->state = MTD_ERASE_FAILED;
 			goto erase_exit;
 		}
@@ -2221,8 +2251,8 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 		ret = this->wait(mtd, FL_ERASING);
 		/* Check, if it is write protected */
 		if (ret) {
-			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n",
-						 onenand_block(this, addr));
+			printk(KERN_ERR "%s: Failed erase, block %d\n",
+				__func__, onenand_block(this, addr));
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr = addr;
 			goto erase_exit;
@@ -2241,7 +2271,8 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)

 			if (len & (block_size - 1)) {
 				/* FIXME: This should be handled at MTD partitioning level. */
-				printk(KERN_ERR "onenand_erase: Unaligned address\n");
+				printk(KERN_ERR "%s: Unaligned address\n",
+					__func__);
 				goto erase_exit;
 			}
 		}
@@ -2272,7 +2303,7 @@ erase_exit:
  */
 static void onenand_sync(struct mtd_info *mtd)
 {
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_sync: called\n");
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: called\n", __func__);

 	/* Grab the lock and see if the device is available */
 	onenand_get_device(mtd, FL_SYNCING);
@@ -2406,7 +2437,8 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd, loff_t ofs, size_t len, int
 		/* Check lock status */
 		status = this->read_word(this->base + ONENAND_REG_WP_STATUS);
 		if (!(status & wp_status_mask))
-			printk(KERN_ERR "wp status = 0x%x\n", status);
+			printk(KERN_ERR "%s: wp status = 0x%x\n",
+				__func__, status);

 		return 0;
 	}
@@ -2435,7 +2467,8 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd, loff_t ofs, size_t len, int
 		/* Check lock status */
 		status = this->read_word(this->base + ONENAND_REG_WP_STATUS);
 		if (!(status & wp_status_mask))
-			printk(KERN_ERR "block = %d, wp status = 0x%x\n", block, status);
+			printk(KERN_ERR "%s: block = %d, wp status = 0x%x\n",
+				__func__, block, status);
 	}

 	return 0;
@@ -2502,7 +2535,8 @@ static int onenand_check_lock_status(struct onenand_chip *this)
 		/* Check lock status */
 		status = this->read_word(this->base + ONENAND_REG_WP_STATUS);
 		if (!(status & ONENAND_WP_US)) {
-			printk(KERN_ERR "block = %d, wp status = 0x%x\n", block, status);
+			printk(KERN_ERR "%s: block = %d, wp status = 0x%x\n",
+				__func__, block, status);
 			return 0;
 		}
 	}
@@ -3172,7 +3206,8 @@ static int flexonenand_check_blocks_erased(struct mtd_info *mtd, int start, int
 				break;

 		if (i != mtd->oobsize) {
-			printk(KERN_WARNING "Block %d not erased.\n", block);
+			printk(KERN_WARNING "%s: Block %d not erased.\n",
+				__func__, block);
 			return 1;
 		}
 	}
@@ -3204,8 +3239,8 @@ int flexonenand_set_boundary(struct mtd_info *mtd, int die,
 	blksperdie >>= ONENAND_IS_DDP(this) ? 1 : 0;

 	if (boundary >= blksperdie) {
-		printk(KERN_ERR "flexonenand_set_boundary: Invalid boundary value. "
-				"Boundary not changed.\n");
+		printk(KERN_ERR "%s: Invalid boundary value. "
+				"Boundary not changed.\n", __func__);
 		return -EINVAL;
 	}

@@ -3214,7 +3249,8 @@ int flexonenand_set_boundary(struct mtd_info *mtd, int die,
 	new = boundary + (die * this->density_mask);
 	ret = flexonenand_check_blocks_erased(mtd, min(old, new) + 1, max(old, new));
 	if (ret) {
-		printk(KERN_ERR "flexonenand_set_boundary: Please erase blocks before boundary change\n");
+		printk(KERN_ERR "%s: Please erase blocks "
+				"before boundary change\n", __func__);
 		return ret;
 	}

@@ -3227,12 +3263,12 @@ int flexonenand_set_boundary(struct mtd_info *mtd, int die,

 	thisboundary = this->read_word(this->base + ONENAND_DATARAM);
 	if ((thisboundary >> FLEXONENAND_PI_UNLOCK_SHIFT) != 3) {
-		printk(KERN_ERR "flexonenand_set_boundary: boundary locked\n");
+		printk(KERN_ERR "%s: boundary locked\n", __func__);
 		ret = 1;
 		goto out;
 	}

-	printk(KERN_INFO "flexonenand_set_boundary: Changing die %d boundary: %d%s\n",
+	printk(KERN_INFO "Changing die %d boundary: %d%s\n",
 			die, boundary, lock ? "(Locked)" : "(Unlocked)");

 	addr = die ? this->diesize[0] : 0;
@@ -3243,7 +3279,8 @@ int flexonenand_set_boundary(struct mtd_info *mtd, int die,
 	this->command(mtd, ONENAND_CMD_ERASE, addr, 0);
 	ret = this->wait(mtd, FL_ERASING);
 	if (ret) {
-		printk(KERN_ERR "flexonenand_set_boundary: Failed PI erase for Die %d\n", die);
+		printk(KERN_ERR "%s: flexonenand_set_boundary: "
+				"Failed PI erase for Die %d\n", __func__, die);
 		goto out;
 	}

@@ -3251,7 +3288,8 @@ int flexonenand_set_boundary(struct mtd_info *mtd, int die,
 	this->command(mtd, ONENAND_CMD_PROG, addr, 0);
 	ret = this->wait(mtd, FL_WRITING);
 	if (ret) {
-		printk(KERN_ERR "flexonenand_set_boundary: Failed PI write for Die %d\n", die);
+		printk(KERN_ERR "%s: Failed PI write for Die %d\n",
+			__func__, die);
 		goto out;
 	}

@@ -3408,8 +3446,8 @@ static void onenand_resume(struct mtd_info *mtd)
 	if (this->state == FL_PM_SUSPENDED)
 		onenand_release_device(mtd);
 	else
-		printk(KERN_ERR "resume() called for the chip which is not"
-				"in suspended state\n");
+		printk(KERN_ERR "%s: resume() called for the chip which is not "
+				"in suspended state\n", __func__);
 }

 /**
@@ -3464,7 +3502,8 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	if (!this->page_buf) {
 		this->page_buf = kzalloc(mtd->writesize, GFP_KERNEL);
 		if (!this->page_buf) {
-			printk(KERN_ERR "onenand_scan(): Can't allocate page_buf\n");
+			printk(KERN_ERR "%s: Can't allocate page_buf\n",
+				__func__);
 			return -ENOMEM;
 		}
 		this->options |= ONENAND_PAGEBUF_ALLOC;
@@ -3472,7 +3511,8 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	if (!this->oob_buf) {
 		this->oob_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
 		if (!this->oob_buf) {
-			printk(KERN_ERR "onenand_scan(): Can't allocate oob_buf\n");
+			printk(KERN_ERR "%s: Can't allocate oob_buf\n",
+				__func__);
 			if (this->options & ONENAND_PAGEBUF_ALLOC) {
 				this->options &= ~ONENAND_PAGEBUF_ALLOC;
 				kfree(this->page_buf);
@@ -3505,8 +3545,8 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 		break;

 	default:
-		printk(KERN_WARNING "No OOB scheme defined for oobsize %d\n",
-			mtd->oobsize);
+		printk(KERN_WARNING "%s: No OOB scheme defined for oobsize %d\n",
+			__func__, mtd->oobsize);
 		mtd->subpage_sft = 0;
 		/* To prevent kernel oops */
 		this->ecclayout = &onenand_oob_32;
