Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm3-0002Y7-Ab
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:05 +0000
Received: by mail-pa0-x244.google.com with SMTP id pv5so7920666pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:39 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 04/17] drivers:mtd:nand:enable dual plane page program
 function
Date: Tue,  2 Feb 2016 02:30:39 +0000
Message-Id: <1454380252-16170-5-git-send-email-jackyard88@gmail.com>
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bean Huo <beanhuo@micron.com>

The PROGRAM PAGE MULTI-PLANE (80h-11h) command enables
the host to input data to the addressed plane's cache register
and queue the cache register to ultimately be moved to the
NAND Flash array. This command can be issued one or more times.
Each time a new plane address is specified that plane is also
queued for data transfer. To input data for the final plane and
to begin the program operation for all previously queued planes,
issue either the PROGRAM PAGE (80h-10h) command or the PROGRAM
PAGE CACHE (80h-15h) command. All of the queued planes will move
the data to the NAND Flash array.

For this version patches, currently, only support dual plane page program.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/nand/nand_base.c | 405 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 405 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ceb68ca..b5cbd0a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2249,6 +2249,75 @@ static int nand_write_page_syndrome(struct mtd_info *mtd,
 
 	return 0;
 }
+/**
+ * nand_write_plane_page - [REPLACEABLE] write one page
+ * @mtd: MTD device structure
+ * @chip: NAND chip descriptor
+ * @offset: address offset within the page
+ * @data_len: length of actual data to be written
+ * @buf: the data to write
+ * @oob_required: must write chip->oob_poi to OOB
+ * @page: page number to write
+ * @plane: multiple plane programming
+ * @raw: use _raw version of write_page
+ */
+static int nand_write_plane_page(struct mtd_info *mtd, struct nand_chip *chip,
+			    uint32_t offset, int data_len, const uint8_t *buf,
+			    int oob_required, int page, int plane, int raw)
+{
+	int status, subpage;
+
+	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
+	    chip->ecc.write_subpage)
+		subpage = offset || (data_len < mtd->writesize);
+	else
+		subpage = 0;
+
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
+
+	if (unlikely(raw))
+		status = chip->ecc.write_page_raw(mtd, chip, buf,
+							oob_required);
+	else if (subpage)
+		status = chip->ecc.write_subpage(mtd, chip, offset, data_len,
+							buf, oob_required);
+	else
+		status = chip->ecc.write_page(mtd, chip, buf, oob_required);
+
+	if (status < 0)
+		return status;
+
+	/* Multipal plane progamming */
+	if (plane) {
+		chip->cmdfunc(mtd, NAND_CMD_MULTI_PAGEPROG, -1, -1);
+		status = chip->waitfunc(mtd, chip);
+		/*
+		 * See if operation failed and additional status checks are
+		 * available.
+		 */
+	    if ((status & NAND_STATUS_FAIL) && (chip->errstat))
+		status = chip->errstat(mtd, chip, FL_WRITING, status, page);
+
+	    if (status & NAND_STATUS_FAIL)
+		return -EIO;
+
+	} else if (!plane || !NAND_HAS_CACHEPROG(chip)) {
+
+		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+		status = chip->waitfunc(mtd, chip);
+		/*
+		 * See if operation failed and additional status checks are
+		 * available.
+		 */
+	    if ((status & NAND_STATUS_FAIL) && (chip->errstat))
+		status = chip->errstat(mtd, chip, FL_WRITING, status, page);
+
+	    if (status & NAND_STATUS_FAIL)
+		return -EIO;
+	}
+
+	return 0;
+}
 
 /**
  * nand_write_page - [REPLACEABLE] write one page
@@ -2373,6 +2442,277 @@ static uint8_t *nand_fill_oob(struct mtd_info *mtd, uint8_t *oob, size_t len,
 }
 
 #define NOTALIGNED(x)	((x & (chip->subpagesize - 1)) != 0)
+/**
+ * nand_do_dual_plane_write_ops - [INTERN] NAND write with ECC by dual plane
+ * @mtd: MTD device structure
+ * @to_plane0: offset of  write plane 0
+ * @ops_plane0: oob operations description structure for plane 0
+ * @to_plane1: offset of  write plane 1
+ * @ops_plane1: oob operations description structure for plane 1
+ *
+ * NAND write with ECC through dual plane program.
+ */
+static int nand_do_dual_plane_write_ops(struct mtd_info *mtd, loff_t to_plane0,
+			   struct mtd_oob_ops *ops_plane0, loff_t to_plane1,
+			   struct mtd_oob_ops *ops_plane1)
+{
+	int chipnr0, chipnr1, chipnr = 0, blockmask;
+	uint32_t oobwritelen = 0;
+	uint32_t oobmaxlen = 0;
+	int ret;
+	int column = 0, realpage = 0, page = 0;
+	uint32_t writelen = 0;
+	char flag = 0, cycle = 0;
+	int oob_required = 0;
+	uint8_t *oob = NULL;
+	uint8_t *buf = NULL;
+	uint32_t bak0_oobwritelen = 0, bak1_oobwritelen = 0;
+	int bak0_column = 0, bak1_column = 0;
+	int bak0_realpage = 0, bak1_realpage = 0;
+	int bak0_page = 0, bak1_page = 0;
+	int bak0_writelen = 0, bak1_writelen = 0;
+	uint8_t *bak0_buf = NULL, *bak1_buf = NULL;
+	uint8_t *bak0_oob = NULL, *bak1_oob = NULL;
+	uint8_t bak0_pagebuf = 0, bak1_pagebuf = 0;
+	int bytes = 0;
+	int cached = 0;
+	uint8_t *wbuf = NULL;
+	int use_bufpoi = 0;
+	int part_pagewr = 0;
+	struct nand_chip *chip = mtd->priv;
+	struct mtd_oob_ops *ops = NULL;
+
+	ops_plane0->retlen = 0;
+	ops_plane1->retlen = 0;
+
+	if ((!ops_plane0->len) || (!ops_plane1->len))
+		return 0;
+
+	/* Reject writes, which are not page aligned */
+	if (NOTALIGNED(to_plane0) || NOTALIGNED(ops_plane0->len) ||
+	    NOTALIGNED(to_plane1) || NOTALIGNED(ops_plane1->len)) {
+		pr_notice("%s: attempt to write non page aligned data\n",
+								__func__);
+		return -EINVAL;
+	}
+
+	chipnr0 = (int)(to_plane0 >> chip->chip_shift);
+	chipnr1 = (int)(to_plane1 >> chip->chip_shift);
+
+	if (unlikely(chipnr0 != chipnr1)) {
+		pr_notice("%s: attempt to write different nand chip\n",
+								__func__);
+		return -EINVAL;
+	}
+
+	chip->select_chip(mtd, chipnr0);
+
+	/* Check, if it is write protected */
+	if (nand_check_wp(mtd)) {
+		ret = -EIO;
+		goto err_out;
+	}
+
+	blockmask = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
+
+	/* Don't allow multipage oob writes with offset */
+	if ((ops_plane0->oobbuf && ops_plane0->ooboffs &&
+	(ops_plane0->ooboffs + ops_plane0->ooblen > oobmaxlen)) ||
+	(ops_plane1->oobbuf && ops_plane1->ooboffs &&
+	(ops_plane1->ooboffs + ops_plane1->ooblen > oobmaxlen))) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	while (1) {
+retry:
+		if (flag == 0) {
+			/* operate plane 0 */
+			ops = ops_plane0;
+			oobmaxlen = ops->mode == MTD_OPS_AUTO_OOB ?
+					mtd->oobavail : mtd->oobsize;
+			chipnr = chipnr0;
+			oob_required = ops->oobbuf ? 1 : 0;
+
+		   if (cycle == 0) {
+			/* plane 0 first write,backup programming infor */
+			bak0_oobwritelen = oobwritelen = ops->ooblen;
+			bak0_column = column = to_plane0 & (mtd->writesize - 1);
+			realpage = (int)(to_plane0 >> chip->page_shift);
+			bak0_realpage = realpage;
+			bak0_page = page = realpage & chip->pagemask;
+			bak0_writelen = writelen = ops->len;
+			bak0_buf = buf = ops->datbuf;
+			bak0_oob = oob = ops->oobbuf;
+
+		if (to_plane0 <= ((loff_t)chip->pagebuf << chip->page_shift) &&
+	   ((loff_t)chip->pagebuf << chip->page_shift) < (to_plane0 + ops->len))
+				chip->pagebuf = -1;
+
+			bak0_pagebuf = chip->pagebuf;
+
+		   } else {
+			oobwritelen = bak0_oobwritelen;
+			column = bak0_column;
+			realpage = bak0_realpage;
+			page = bak0_page;
+			writelen = bak0_writelen;
+			buf = bak0_buf;
+			oob = bak0_oob;
+			chip->pagebuf  = bak0_pagebuf;
+		   }
+		} else if (flag == 1) {
+			/* operate plane 1 */
+			ops = ops_plane1;
+			oobmaxlen = ops->mode == MTD_OPS_AUTO_OOB ?
+					mtd->oobavail : mtd->oobsize;
+			chipnr = chipnr1;
+			oob_required = ops->oobbuf ? 1 : 0;
+
+		   if (cycle == 0) {
+			/* plane 1 first write,backup programming infor */
+			bak1_oobwritelen = oobwritelen = ops->ooblen;
+			bak1_column = column = to_plane1 & (mtd->writesize - 1);
+			realpage = (int)(to_plane1 >> chip->page_shift);
+			bak1_realpage = realpage;
+			bak1_page = page = realpage & chip->pagemask;
+			bak1_writelen = writelen = ops->len;
+			bak1_buf = buf = ops->datbuf;
+			bak1_oob = oob = ops->oobbuf;
+
+	      if (to_plane1 <= ((loff_t)chip->pagebuf << chip->page_shift) &&
+	   ((loff_t)chip->pagebuf << chip->page_shift) < (to_plane1 + ops->len))
+				chip->pagebuf = -1;
+
+			bak1_pagebuf = chip->pagebuf;
+			} else {
+			oobwritelen = bak1_oobwritelen;
+			column = bak1_column;
+			realpage = bak1_realpage;
+			page = bak1_page;
+			writelen = bak1_writelen;
+			buf = bak1_buf;
+			oob = bak1_oob;
+			chip->pagebuf  = bak1_pagebuf;
+			}
+		}
+
+		/* Don't allow multipage oob writes with offset */
+		if (ops->oobbuf && ops->ooboffs &&
+			(ops->ooboffs + ops->ooblen > oobmaxlen)) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+
+		bytes = mtd->writesize;
+		cached = writelen > bytes && page != blockmask;
+		wbuf = buf;
+
+		part_pagewr = (column || writelen < (mtd->writesize - 1));
+
+		if (part_pagewr)
+			use_bufpoi = 1;
+		else if (chip->options & NAND_USE_BOUNCE_BUFFER)
+			use_bufpoi = !virt_addr_valid(buf);
+		else
+			use_bufpoi = 0;
+
+		/* Partial page write?, or need to use bounce buffer */
+		if (use_bufpoi) {
+			pr_debug("%s: using write bounce buffer for buf@%p\n",
+								__func__, buf);
+			cached = 0;
+			if (part_pagewr)
+				bytes = min_t(int, bytes - column, writelen);
+			chip->pagebuf = -1;
+			memset(chip->buffers->databuf, 0xff, mtd->writesize);
+			memcpy(&chip->buffers->databuf[column], buf, bytes);
+			wbuf = chip->buffers->databuf;
+		}
+
+		if (unlikely(oob)) {
+			size_t len = min(oobwritelen, oobmaxlen);
+
+			oob = nand_fill_oob(mtd, oob, len, ops);
+			oobwritelen -= len;
+		} else {
+			/* We still need to erase leftover OOB data */
+			memset(chip->oob_poi, 0xff, mtd->oobsize);
+		}
+
+		if (flag == 0) {
+			ret = chip->write_plane_page(mtd, chip, column, bytes,
+		      wbuf, oob_required, page, 1, (ops->mode == MTD_OPS_RAW));
+		} else if (flag == 1) {
+			ret = chip->write_page(mtd, chip, column, bytes, wbuf,
+			oob_required, page, cached, (ops->mode == MTD_OPS_RAW));
+		}
+
+		if (ret)
+			break;
+
+		writelen -= bytes;
+		column = 0;
+
+		if (flag == 0) {
+			bak0_writelen = writelen;
+			bak0_column = column;
+			bak0_oobwritelen = oobwritelen;
+		} else {
+			bak1_writelen = writelen;
+			bak1_column = column;
+			bak1_oobwritelen = oobwritelen;
+		}
+
+		if ((!writelen) && (flag == 1))
+			break;
+
+		buf += bytes;
+		realpage++;
+
+		if (flag == 0) {
+			bak0_buf = buf;
+			bak0_oob = oob;
+			bak0_realpage = realpage;
+		} else {
+			bak1_buf = buf;
+			bak1_oob = oob;
+			bak1_realpage = realpage;
+		}
+
+		if (flag == 0) {
+			flag = 1;
+		goto retry;
+		}
+
+		page = realpage & chip->pagemask;
+
+		/* Check, if we cross a chip boundary */
+		if (!page) {
+			chipnr++;
+			chip->select_chip(mtd, -1);
+			chip->select_chip(mtd, chipnr);
+		}
+
+		flag = 0;
+		cycle++;
+
+	}
+
+	ops_plane0->retlen = ops_plane0->len - bak0_writelen;
+	ops_plane1->retlen = ops_plane1->len - bak1_writelen;
+
+	if (unlikely(bak0_oob))
+		ops_plane0->oobretlen = ops_plane0->ooblen;
+	if (unlikely(bak1_oob))
+		ops_plane1->oobretlen = ops_plane1->ooblen;
+
+err_out:
+	flag = 0;
+	cycle = 0;
+	chip->select_chip(mtd, -1);
+	return ret;
+}
 
 /**
  * nand_do_write_ops - [INTERN] NAND write with ECC
@@ -2564,6 +2904,14 @@ static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return ret;
 }
 
+static int nand_do_dual_plane_write_oob(struct mtd_info *mtd, loff_t to_plane0,
+			      struct mtd_oob_ops *ops_plane0, loff_t to_plane1,
+			      struct mtd_oob_ops *ops_plane1)
+{
+	return 0;
+
+}
+
 /**
  * nand_do_write_oob - [MTD Interface] NAND write out-of-band
  * @mtd: MTD device structure
@@ -2692,6 +3040,52 @@ out:
 	return ret;
 }
 
+static int nand_dual_plane_write_oob(struct mtd_info *mtd, loff_t to_plane0,
+			   struct mtd_oob_ops *ops_plane0, loff_t to_plane1,
+			   struct mtd_oob_ops *ops_plane1)
+{
+	int ret = -ENOTSUPP;
+
+	/* Do not allow writes past end of device */
+	if ((ops_plane0->datbuf && (to_plane0 + ops_plane0->len) > mtd->size) ||
+	    (ops_plane1->datbuf && (to_plane1 + ops_plane1->len) > mtd->size)) {
+		pr_debug("%s: attempt to write beyond end of device\n",
+								__func__);
+		return -EINVAL;
+	}
+	nand_get_device(mtd, FL_WRITING);
+
+	switch (ops_plane0->mode) {
+	case MTD_OPS_PLACE_OOB:
+		if (ops_plane1->mode != MTD_OPS_PLACE_OOB)
+			goto out;
+		break;
+	case MTD_OPS_AUTO_OOB:
+		if (ops_plane1->mode != MTD_OPS_AUTO_OOB)
+			goto out;
+		break;
+	case MTD_OPS_RAW:
+		if (ops_plane1->mode != MTD_OPS_RAW)
+			goto out;
+		break;
+
+	default:
+		goto out;
+	}
+
+	if (!ops_plane0->datbuf && !ops_plane1->datbuf)
+		ret = nand_do_dual_plane_write_oob(mtd, to_plane0, ops_plane0,
+							to_plane1, ops_plane1);
+	else
+		ret = nand_do_dual_plane_write_ops(mtd, to_plane0, ops_plane0,
+							to_plane1, ops_plane1);
+
+out:
+	nand_release_device(mtd);
+	return ret;
+}
+EXPORT_SYMBOL(nand_dual_plane_write_oob);
+
 /**
  * single_erase - [GENERIC] NAND standard block erase command function
  * @mtd: MTD device structure
@@ -2764,6 +3158,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		goto erase_exit;
 	}
 
+
 	/* Loop through the pages */
 	len = instr->len;
 
@@ -2904,6 +3299,9 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
 		chip->write_byte(mtd, subfeature_param[i]);
 
+	if ((addr == ONFI_FEATURE_ADDR_TIMING_MODE) && ((subfeature_param[0]&0xF0) != 0))
+		return 0;
+
 	status = chip->waitfunc(mtd, chip);
 	if (status & NAND_STATUS_FAIL)
 		return -EIO;
@@ -3991,6 +4389,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 	if (!chip->write_page)
 		chip->write_page = nand_write_page;
+	if (!chip->write_plane_page)
+		chip->write_plane_page = nand_write_plane_page;
 
 	/*
 	 * Check ECC mode, default to software if 3byte/512byte hardware ECC is
@@ -4206,6 +4606,11 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->_panic_write = panic_nand_write;
 	mtd->_read_oob = nand_read_oob;
 	mtd->_write_oob = nand_write_oob;
+#ifdef CONFIG_MTD_UBI_MLC_NAND_BAKVOL
+	mtd->_dual_plane_write_oob = nand_dual_plane_write_oob;
+#else
+	mtd->_dual_plane_write_oob = NULL;
+#endif
 	mtd->_sync = nand_sync;
 	mtd->_lock = NULL;
 	mtd->_unlock = NULL;
-- 
1.9.1
