Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WRD9p-0000V4-Cu
 for linux-mtd@lists.infradead.org; Sat, 22 Mar 2014 04:03:42 +0000
From: David Mosberger <davidm@egauge.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: Add support for Micron on-die ECC controller.
Date: Fri, 21 Mar 2014 22:03:09 -0600
Message-Id: <1395460989-21049-1-git-send-email-davidm@egauge.net>
Cc: David Mosberger <davidm@egauge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Micron has some chips with an on-die ECC controller.  This controller
is useful on platforms where there is no hardware-support for
multi-bit ECC.  The patch is safe to apply because it never turns on
on-die ECC on its own (that job is left to the bootloader).  Instead,
this code simply checks whether the on-die ECC controller is enabled
and, if so, uses it.

Signed-of-by: David Mosberger <davidm@egauge.net>
---
 drivers/mtd/nand/nand_base.c |  256 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/nand.h     |    4 +
 2 files changed, 257 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5826da3..a145406 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -78,6 +78,20 @@ static struct nand_ecclayout nand_oob_64 = {
 		 .length = 38} }
 };
 
+static struct nand_ecclayout nand_oob_64_on_die = {
+	.eccbytes = 32,
+	.eccpos = {
+		    8,  9, 10, 11, 12, 13, 14, 15,
+		   24, 25, 26, 27, 28, 29, 30, 31,
+		   40, 41, 42, 43, 44, 45, 46, 47,
+		   56, 57, 58, 59, 60, 61, 62, 63},
+	.oobfree = {
+		{.offset =  4,	 .length = 4},
+		{.offset = 20,	 .length = 4},
+		{.offset = 36,	 .length = 4},
+		{.offset = 52,	 .length = 4}}
+};
+
 static struct nand_ecclayout nand_oob_128 = {
 	.eccbytes = 48,
 	.eccpos = {
@@ -1250,6 +1264,195 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	return max_bitflips;
 }
 
+static int
+set_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip, int on)
+{
+	u8 data[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
+
+	if (chip->ecc.mode != NAND_ECC_HW_ON_DIE)
+		return 0;
+
+	if (on)
+		data[0] = 0x8;
+
+	return (*chip->onfi_set_features)(mtd, chip, 0x90, data);
+}
+
+/*
+ * Return the number of bits that differ between buffers SRC1 and
+ * SRC2, both of which are LEN bytes long.
+ *
+ * This code could be optimized for, but it only gets called on pages
+ * with bitflips and compared to the cost of migrating an eraseblock,
+ * the execution time here is trivial...
+ */
+static int
+bitdiff(const void *s1, const void *s2, size_t len)
+{
+	const uint8_t *src1 = s1, *src2 = s2;
+	int count = 0, i;
+
+	for (i = 0; i < len; ++i)
+		count += hweight8(*src1++ ^ *src2++);
+	return count;
+}
+
+static int
+check_for_bitflips(struct mtd_info *mtd, struct nand_chip *chip, int page)
+{
+	int flips = 0, max_bitflips = 0, i, j, read_size;
+	uint8_t *chkbuf, *rawbuf, *chkoob, *rawoob;
+	uint32_t *eccpos;
+
+	chkbuf = chip->buffers->chkbuf;
+	rawbuf = chip->buffers->rawbuf;
+	read_size = mtd->writesize + mtd->oobsize;
+
+	/* Read entire page w/OOB area with on-die ECC on: */
+	chip->read_buf(mtd, chkbuf, read_size);
+
+	/* Re-read page with on-die ECC off: */
+	set_on_die_ecc(mtd, chip, 0);
+	{
+		chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+		chip->read_buf(mtd, rawbuf, read_size);
+	}
+	set_on_die_ecc(mtd, chip, 1);
+
+	chkoob = chkbuf + mtd->writesize;
+	rawoob = rawbuf + mtd->writesize;
+	eccpos = chip->ecc.layout->eccpos;
+	for (i = 0; i < chip->ecc.steps; ++i) {
+		/* Count bit flips in the actual data area: */
+		flips = bitdiff(chkbuf, rawbuf, chip->ecc.size);
+		/* Count bit flips in the ECC bytes: */
+		for (j = 0; j < chip->ecc.bytes; ++j) {
+			flips += hweight8(chkoob[*eccpos] ^ rawoob[*eccpos]);
+			++eccpos;
+		}
+		if (flips > 0)
+			mtd->ecc_stats.corrected += flips;
+		max_bitflips = max_t(int, max_bitflips, flips);
+		chkbuf += chip->ecc.size;
+		rawbuf += chip->ecc.size;
+	}
+
+	/* Re-issue the READ command for the actual data read that follows.  */
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+
+	return max_bitflips;
+}
+
+static int check_read_status_on_die(struct mtd_info *mtd,
+				    struct nand_chip *chip, int page)
+{
+	int max_bitflips = 0;
+	uint8_t status;
+
+	/* Check ECC status of page just transferred into NAND's page buffer: */
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+	status = chip->read_byte(mtd);
+
+	/* Switch back to data reading: */
+	chip->cmd_ctrl(mtd, NAND_CMD_READ0,
+		       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+	chip->cmd_ctrl(mtd, NAND_CMD_NONE,
+		       NAND_NCE | NAND_CTRL_CHANGE);
+
+	if (status & NAND_STATUS_FAIL)
+		/* Page has invalid ECC. */
+		mtd->ecc_stats.failed++;
+	else if (status & NAND_STATUS_REWRITE) {
+		/*
+		 * The Micron chips turn on the REWRITE status bit for
+		 * ANY bit flips.  Some pages have stuck bits, so we
+		 * don't want to migrate a block just because of
+		 * single bit errors because otherwise, that block
+		 * would effectively become unusable.  So, work out in
+		 * software what the max number of flipped bits is for
+		 * all subpages in a page:
+		 */
+		max_bitflips = check_for_bitflips(mtd, chip, page);
+	}
+	return max_bitflips;
+}
+
+/**
+ * nand_read_subpage_on_die - [REPLACEABLE] raw sub-page read function
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @data_offs: offset of requested data within the page
+ * @readlen: data length
+ * @bufpoi: buffer to store read data
+ */
+static int nand_read_subpage_on_die(struct mtd_info *mtd,
+				    struct nand_chip *chip,
+				    uint32_t data_offs, uint32_t readlen,
+				    uint8_t *bufpoi, int page)
+{
+	int start_step, end_step, num_steps, ret;
+	int data_col_addr;
+	int datafrag_len;
+	uint32_t failed;
+	uint8_t *p;
+
+	/* Column address within the page aligned to ECC size */
+	start_step = data_offs / chip->ecc.size;
+	end_step = (data_offs + readlen - 1) / chip->ecc.size;
+	num_steps = end_step - start_step + 1;
+
+	/* Data size aligned to ECC ecc.size */
+	datafrag_len = num_steps * chip->ecc.size;
+	data_col_addr = start_step * chip->ecc.size;
+	p = bufpoi + data_col_addr;
+
+	failed = mtd->ecc_stats.failed;
+
+	ret = check_read_status_on_die(mtd, chip, page);
+	if (ret < 0 || mtd->ecc_stats.failed != failed) {
+		memset(p, 0, datafrag_len);
+		return ret;
+	}
+
+	/* If we read not a page aligned data */
+	if (data_col_addr != 0)
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_col_addr, -1);
+
+	chip->read_buf(mtd, p, datafrag_len);
+
+	return ret;
+}
+
+/**
+ * nand_read_page_on_die - [INTERN] read raw page data without ecc
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
+ * @page: page number to read
+ */
+static int nand_read_page_on_die(struct mtd_info *mtd, struct nand_chip *chip,
+				 uint8_t *buf, int oob_required, int page)
+{
+	uint32_t failed;
+	int ret;
+
+	failed = mtd->ecc_stats.failed;
+
+	ret = check_read_status_on_die(mtd, chip, page);
+	if (ret < 0 || mtd->ecc_stats.failed != failed) {
+		memset(buf, 0, mtd->writesize);
+		if (oob_required)
+			memset(chip->oob_poi, 0, mtd->oobsize);
+		return ret;
+	}
+
+	chip->read_buf(mtd, buf, mtd->writesize);
+	if (oob_required)
+		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	return ret;
+}
+
 /**
  * nand_read_page_hwecc - [REPLACEABLE] hardware ECC based page read function
  * @mtd: mtd info structure
@@ -3783,22 +3986,45 @@ EXPORT_SYMBOL(nand_scan_ident);
 int nand_scan_tail(struct mtd_info *mtd)
 {
 	int i;
+	u8 features[ONFI_SUBFEATURE_PARAM_LEN];
 	struct nand_chip *chip = mtd->priv;
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	struct nand_buffers *nbuf;
 
+	if ((*chip->onfi_get_features)(mtd, chip, 0x90, features) >= 0) {
+		if (features[0] & 0x08) {
+			/*
+			 * If the chip has on-die ECC enabled, we kind
+			 * of have to do the same...
+			 */
+			chip->ecc.mode = NAND_ECC_HW_ON_DIE;
+			pr_info("Using on-die ECC\n");
+		}
+	}
+
 	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
 	BUG_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
 			!(chip->bbt_options & NAND_BBT_USE_FLASH));
 
 	if (!(chip->options & NAND_OWN_BUFFERS)) {
+		size_t on_die_bufsz = 0;
+
+		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE)
+			on_die_bufsz = 2*(mtd->writesize + mtd->oobsize);
+
 		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
-				+ mtd->oobsize * 3, GFP_KERNEL);
+				+ mtd->oobsize * 3 + on_die_bufsz, GFP_KERNEL);
 		if (!nbuf)
 			return -ENOMEM;
 		nbuf->ecccalc = (uint8_t *)(nbuf + 1);
 		nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
 		nbuf->databuf = nbuf->ecccode + mtd->oobsize;
+		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE) {
+			nbuf->chkbuf = (nbuf->databuf + mtd->writesize
+					+ mtd->oobsize);
+			nbuf->rawbuf = (nbuf->chkbuf + mtd->writesize
+					+ mtd->oobsize);
+		}
 
 		chip->buffers = nbuf;
 	} else {
@@ -3956,6 +4182,25 @@ int nand_scan_tail(struct mtd_info *mtd)
 		ecc->strength = ecc->bytes * 8 / fls(8 * ecc->size);
 		break;
 
+	case NAND_ECC_HW_ON_DIE:
+		/* nand_bbt attempts to put Bbt marker at offset 8 in
+		   oob, which is used for ECC by Micron
+		   MT29F4G16ABADAWP, for example.  Fixed by not using
+		   OOB for BBT marker.  */
+		chip->bbt_options |= NAND_BBT_NO_OOB;
+		chip->ecc.layout = &nand_oob_64_on_die;
+		chip->ecc.read_page = nand_read_page_on_die;
+		chip->ecc.read_subpage = nand_read_subpage_on_die;
+		chip->ecc.write_page = nand_write_page_raw;
+		chip->ecc.read_oob = nand_read_oob_std;
+		chip->ecc.read_page_raw = nand_read_page_raw;
+		chip->ecc.write_page_raw = nand_write_page_raw;
+		chip->ecc.write_oob = nand_write_oob_std;
+		chip->ecc.size = 512;
+		chip->ecc.bytes = 8;
+		chip->ecc.strength = 4;
+		break;
+
 	case NAND_ECC_NONE:
 		pr_warn("NAND_ECC_NONE selected by board driver. "
 			   "This is not recommended!\n");
@@ -4023,8 +4268,13 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Invalidate the pagebuffer reference */
 	chip->pagebuf = -1;
 
-	/* Large page NAND with SOFT_ECC should support subpage reads */
-	if ((ecc->mode == NAND_ECC_SOFT) && (chip->page_shift > 9))
+	/*
+	 * Large page NAND with SOFT_ECC or on-die ECC should support
+	 * subpage reads.
+	 */
+	if (((ecc->mode == NAND_ECC_SOFT)
+	     || (chip->ecc.mode == NAND_ECC_HW_ON_DIE))
+	    && (chip->page_shift > 9))
 		chip->options |= NAND_SUBPAGE_READ;
 
 	/* Fill in remaining MTD driver data */
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 450d61e..29a23bb 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -101,6 +101,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 /* Status bits */
 #define NAND_STATUS_FAIL	0x01
 #define NAND_STATUS_FAIL_N1	0x02
+#define NAND_STATUS_REWRITE	0x08
 #define NAND_STATUS_TRUE_READY	0x20
 #define NAND_STATUS_READY	0x40
 #define NAND_STATUS_WP		0x80
@@ -115,6 +116,7 @@ typedef enum {
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
 	NAND_ECC_SOFT_BCH,
+	NAND_ECC_HW_ON_DIE,
 } nand_ecc_modes_t;
 
 /*
@@ -516,6 +518,8 @@ struct nand_buffers {
 	uint8_t	*ecccalc;
 	uint8_t	*ecccode;
 	uint8_t *databuf;
+	uint8_t *chkbuf;
+	uint8_t *rawbuf;
 };
 
 /**
-- 
1.7.9.5
