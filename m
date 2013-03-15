Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGUEx-0004zq-1D
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2013 13:00:08 +0000
Received: from dbdp20.itg.ti.com ([172.24.170.38])
 by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2FD03p3013365
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2013 08:00:04 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
 by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2FD02HD018343
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2013 18:30:03 +0530 (IST)
From: "Gupta, Pekon" <pekon@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: subpage write support for hardware based ECC
 schemes
Date: Fri, 15 Mar 2013 18:29:38 +0530
Message-ID: <1363352378-2825-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: "Gupta, Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Gupta, Pekon" <pekon@ti.com>

This patch adds support for subpage (partial-page) writes when using
hardware based ECC schemes.
Advantages:
(1) reduces storage overhead when using file-systems like UBIFS, which
store LEB header at page-size granularity.
(2) allows independent subpage writes, thereby increasing NAND storage
efficiency for non-page aligned data.

Signed-off-by: Gupta, Pekon <pekon@ti.com>
---
 drivers/mtd/nand/nand_base.c | 99 ++++++++++++++++++++++++++++++++++++++------
 include/linux/mtd/nand.h     |  8 +++-
 2 files changed, 92 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4321415..5138b6b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1127,7 +1127,7 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_read_subpage - [REPLACEABLE] software ECC based sub-page read function
+ * nand_read_subpage - [REPLACEABLE] ECC based sub-page read function
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @data_offs: offset of requested data within the page
@@ -1979,6 +1979,67 @@ static int nand_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
+
+/**
+ * nand_write_subpage_hwecc - [REPLACABLE] hardware ECC based subpage write
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @column:	column address of subpage within the page
+ * @data_len:	data length
+ * @oob_required: must write chip->oob_poi to OOB
+ */
+static int nand_write_subpage_hwecc(struct mtd_info *mtd,
+				struct nand_chip *chip, uint32_t offset,
+				uint32_t data_len, const uint8_t *data_buf,
+				int oob_required)
+{
+	uint8_t *oob_buf  = chip->oob_poi;
+	uint8_t *ecc_calc = chip->buffers->ecccalc;
+	int ecc_size      = chip->ecc.size;
+	int ecc_bytes     = chip->ecc.bytes;
+	int ecc_steps     = chip->ecc.steps;
+	uint32_t *eccpos  = chip->ecc.layout->eccpos;
+	uint32_t start_step = offset / ecc_size;
+	uint32_t end_step   = (offset + data_len - 1) / ecc_size;
+	int oob_bytes       = mtd->oobsize / ecc_steps;
+	int step, i;
+
+	for (step = 0; step < ecc_steps; step++) {
+		/* configure controller for WRITE access */
+		chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
+
+		/* write data (untouched subpages already masked by 0xFF) */
+		chip->write_buf(mtd, data_buf, ecc_size);
+
+		/* mask ECC of un-touched subpages by padding 0xFF */
+		if ((step < start_step) || (step > end_step))
+			memset(ecc_calc, 0xff, ecc_bytes);
+		else
+			chip->ecc.calculate(mtd, data_buf, ecc_calc);
+
+		/* mask OOB of un-touched subpages by padding 0xFF */
+		/* if oob_required, preserve OOB metadata of written subpage */
+		if (!oob_required || (step < start_step) || (step > end_step))
+			memset(oob_buf, 0xff, oob_bytes);
+
+		data_buf += ecc_size;
+		ecc_calc += ecc_bytes;
+		oob_buf  += oob_bytes;
+	}
+
+	/* copy calculated ECC for whole page to chip->buffer->oob */
+	/* this include masked-value(0xFF) for unwritten subpages */
+	ecc_calc = chip->buffers->ecccalc;
+	for (i = 0; i < chip->ecc.total; i++)
+		chip->oob_poi[eccpos[i]] = ecc_calc[i];
+
+	/* write OOB buffer to NAND device */
+	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+
+	return 0;
+}
+
+
 /**
  * nand_write_page_syndrome - [REPLACEABLE] hardware ECC syndrome based page write
  * @mtd: mtd info structure
@@ -2031,6 +2092,8 @@ static int nand_write_page_syndrome(struct mtd_info *mtd,
  * nand_write_page - [REPLACEABLE] write one page
  * @mtd: MTD device structure
  * @chip: NAND chip descriptor
+ * @offset: address offset within the page
+ * @data_len: length of actual data to be written
  * @buf: the data to write
  * @oob_required: must write chip->oob_poi to OOB
  * @page: page number to write
@@ -2038,15 +2101,25 @@ static int nand_write_page_syndrome(struct mtd_info *mtd,
  * @raw: use _raw version of write_page
  */
 static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-			   const uint8_t *buf, int oob_required, int page,
-			   int cached, int raw)
+		uint32_t offset, int data_len, const uint8_t *buf,
+		int oob_required, int page, int cached, int raw)
 {
-	int status;
+	int status, subpage;
+
+	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
+		chip->ecc.write_subpage)
+		subpage = offset || (data_len < mtd->writesize);
+	else
+		subpage = 0;
 
 	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
 
 	if (unlikely(raw))
-		status = chip->ecc.write_page_raw(mtd, chip, buf, oob_required);
+		status = chip->ecc.write_page_raw(mtd, chip, buf,
+							oob_required);
+	else if (subpage)
+		status = chip->ecc.write_subpage(mtd, chip, offset, data_len,
+							 buf, oob_required);
 	else
 		status = chip->ecc.write_page(mtd, chip, buf, oob_required);
 
@@ -2160,7 +2233,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 
 	uint8_t *oob = ops->oobbuf;
 	uint8_t *buf = ops->datbuf;
-	int ret, subpage;
+	int ret;
 	int oob_required = oob ? 1 : 0;
 
 	ops->retlen = 0;
@@ -2175,10 +2248,6 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	}
 
 	column = to & (mtd->writesize - 1);
-	subpage = column || (writelen & (mtd->writesize - 1));
-
-	if (subpage && oob)
-		return -EINVAL;
 
 	chipnr = (int)(to >> chip->chip_shift);
 	chip->select_chip(mtd, chipnr);
@@ -2227,9 +2296,9 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			/* We still need to erase leftover OOB data */
 			memset(chip->oob_poi, 0xff, mtd->oobsize);
 		}
-
-		ret = chip->write_page(mtd, chip, wbuf, oob_required, page,
-				       cached, (ops->mode == MTD_OPS_RAW));
+		ret = chip->write_page(mtd, chip, column, bytes, wbuf,
+					oob_required, page, cached,
+					(ops->mode == MTD_OPS_RAW));
 		if (ret)
 			break;
 
@@ -3458,6 +3527,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 			chip->ecc.read_oob = nand_read_oob_std;
 		if (!chip->ecc.write_oob)
 			chip->ecc.write_oob = nand_write_oob_std;
+		if (!chip->ecc.read_subpage)
+			chip->ecc.read_subpage = nand_read_subpage;
+		if (!chip->ecc.write_subpage)
+			chip->ecc.write_subpage = nand_write_subpage_hwecc;
 
 	case NAND_ECC_HW_SYNDROME:
 		if ((!chip->ecc.calculate || !chip->ecc.correct ||
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7ccb3c5..7d81403f 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -354,6 +354,7 @@ struct nand_hw_control {
  *		any single ECC step, 0 if bitflips uncorrectable, -EIO hw error
  * @read_subpage:	function to read parts of the page covered by ECC;
  *			returns same as read_page()
+ * @write_subpage:	function to write parts of the page covered by ECC.
  * @write_page:	function to write a page according to the ECC generator
  *		requirements.
  * @write_oob_raw:	function to write chip OOB data without ECC
@@ -385,6 +386,9 @@ struct nand_ecc_ctrl {
 			uint8_t *buf, int oob_required, int page);
 	int (*read_subpage)(struct mtd_info *mtd, struct nand_chip *chip,
 			uint32_t offs, uint32_t len, uint8_t *buf);
+	int (*write_subpage)(struct mtd_info *mtd, struct nand_chip *chip,
+			uint32_t offset, uint32_t data_len,
+			const uint8_t *data_buf, int oob_required);
 	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
 			const uint8_t *buf, int oob_required);
 	int (*write_oob_raw)(struct mtd_info *mtd, struct nand_chip *chip,
@@ -520,8 +524,8 @@ struct nand_chip {
 	int (*errstat)(struct mtd_info *mtd, struct nand_chip *this, int state,
 			int status, int page);
 	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
-			const uint8_t *buf, int oob_required, int page,
-			int cached, int raw);
+			uint32_t offset, int data_len, const uint8_t *buf,
+			int oob_required, int page, int cached, int raw);
 	int (*onfi_set_features)(struct mtd_info *mtd, struct nand_chip *chip,
 			int feature_addr, uint8_t *subfeature_para);
 	int (*onfi_get_features)(struct mtd_info *mtd, struct nand_chip *chip,
-- 
1.8.1
