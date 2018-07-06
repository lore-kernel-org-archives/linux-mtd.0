Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbLXT-000412-An
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 07:52:26 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 1/5] mtd: rawnand: qcom: remove driver specific bad block
 check function
Date: Fri,  6 Jul 2018 13:21:55 +0530
Message-Id: <1530863519-5564-2-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1530863519-5564-1-git-send-email-absahu@codeaurora.org>
References: <1530863519-5564-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The QCOM NAND controller skips the bad block bytes when reading
with ECC enabled. The NAND base layer invokes ->read_oob() function
for bad block check which expects the BBM bytes to be copied at
badblockpos offset in OOB buffer. When initial support for this
driver was added, the driver specific function was added
temporarily for bad block check with assumption to change
for raw read in NAND base layer. Moving to raw read for bad block
check seems to take more time so this patch removes driver specific
bad block check function and uses following logic.

The QCOM NAND controller updates the BAD_BLOCK_STATUS bits value in
NAND_BUFFER_STATUS register with every page read operation. The OOB
buffer can be updated with this value while checking the status for
last codeword.

QCOM NAND controller layout does not support BBM byte at offset
other than zero so check the chip’s badblockpos and return probe
failure for all these chips.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 118 ++++++++++----------------------------
 1 file changed, 31 insertions(+), 87 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 994f980..ea253ac 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -80,6 +80,8 @@
 /* NAND_BUFFER_STATUS bits */
 #define	BS_UNCORRECTABLE_BIT		BIT(8)
 #define	BS_CORRECTABLE_ERR_MSK		0x1f
+#define BAD_BLK_STATUS			16
+#define BAD_BLK_STATUS_2		24
 
 /* NAND_DEVn_CFG0 bits */
 #define	DISABLE_STATUS_AFTER_WRITE	4
@@ -1742,16 +1744,14 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 	unsigned int max_bitflips = 0, uncorrectable_cws = 0;
 	struct read_stats *buf;
 	bool flash_op_err = false, erased;
-	int i;
+	int i, data_len, oob_len;
+	u32 flash, erased_cw, buffer = 0;
 	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 
 	buf = (struct read_stats *)nandc->reg_read_buf;
 	nandc_read_buffer_sync(nandc, true);
 
 	for (i = 0; i < ecc->steps; i++, buf++) {
-		u32 flash, buffer, erased_cw;
-		int data_len, oob_len;
-
 		if (i == (ecc->steps - 1)) {
 			data_len = ecc->size - ((ecc->steps - 1) << 2);
 			oob_len = ecc->steps << 2;
@@ -1824,12 +1824,24 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 	if (flash_op_err)
 		return -EIO;
 
-	if (!uncorrectable_cws)
-		return max_bitflips;
+	if (uncorrectable_cws) {
+		max_bitflips = check_for_erased_page(host, data_buf_start,
+					oob_buf_start, uncorrectable_cws,
+					page, max_bitflips);
+	}
 
-	return check_for_erased_page(host, data_buf_start, oob_buf_start,
-				     uncorrectable_cws, page,
-				     max_bitflips);
+	/*
+	 * Updates the BBM bytes in OOB buffer with BAD_BLK_STATUS bits value
+	 * of NAND_BUFFER_STATUS register. With every page read operation,
+	 * controller updates the bad block status data into this register.
+	 */
+	if (oob_buf_start) {
+		oob_buf_start[0] = (buffer >> BAD_BLK_STATUS) & 0xff;
+		if (chip->options & NAND_BUSWIDTH_16)
+			oob_buf_start[1] = (buffer >> BAD_BLK_STATUS_2) & 0xff;
+	}
+
+	return max_bitflips;
 }
 
 /*
@@ -1913,41 +1925,6 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	return parse_read_errors(host, data_buf_start, oob_buf_start, page);
 }
 
-/*
- * a helper that copies the last step/codeword of a page (containing free oob)
- * into our local buffer
- */
-static int copy_last_cw(struct qcom_nand_host *host, int page)
-{
-	struct nand_chip *chip = &host->chip;
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
-	int size;
-	int ret;
-
-	clear_read_regs(nandc);
-
-	size = host->use_ecc ? host->cw_data : host->cw_size;
-
-	/* prepare a clean read buffer */
-	memset(nandc->data_buffer, 0xff, size);
-
-	set_address(host, host->cw_size * (ecc->steps - 1), page);
-	update_rw_regs(host, 1, true);
-
-	config_nand_single_cw_page_read(nandc, host->use_ecc);
-
-	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
-
-	ret = submit_descs(nandc);
-	if (ret)
-		dev_err(nandc->dev, "failed to copy last codeword\n");
-
-	free_descs(nandc);
-
-	return ret;
-}
-
 /* implements ecc->read_page() */
 static int qcom_nandc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int oob_required, int page)
@@ -2197,44 +2174,6 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	return nand_prog_page_end_op(chip);
 }
 
-static int qcom_nandc_block_bad(struct mtd_info *mtd, loff_t ofs)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct qcom_nand_host *host = to_qcom_nand_host(chip);
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
-	int page, ret, bbpos, bad = 0;
-
-	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
-
-	/*
-	 * configure registers for a raw sub page read, the address is set to
-	 * the beginning of the last codeword, we don't care about reading ecc
-	 * portion of oob. we just want the first few bytes from this codeword
-	 * that contains the BBM
-	 */
-	host->use_ecc = false;
-
-	clear_bam_transaction(nandc);
-	ret = copy_last_cw(host, page);
-	if (ret)
-		goto err;
-
-	if (check_flash_errors(host, 1)) {
-		dev_warn(nandc->dev, "error when trying to read BBM\n");
-		goto err;
-	}
-
-	bbpos = mtd->writesize - host->cw_size * (ecc->steps - 1);
-
-	bad = nandc->data_buffer[bbpos] != 0xff;
-
-	if (chip->options & NAND_BUSWIDTH_16)
-		bad = bad || (nandc->data_buffer[bbpos + 1] != 0xff);
-err:
-	return bad;
-}
-
 static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
@@ -2501,6 +2440,12 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 		return ret;
 	}
 
+	if (chip->badblockpos != 0) {
+		dev_err(nandc->dev, "BBM at %d offset is not supported\n",
+			chip->badblockpos);
+		return -ENOTSUPP;
+	}
+
 	if (ecc->strength >= 8) {
 		/* 8 bit ECC defaults to BCH ECC on all platforms */
 		host->bch_enabled = true;
@@ -2813,14 +2758,13 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 	chip->get_features	= nand_get_set_features_notsupp;
 
 	/*
-	 * the bad block marker is readable only when we read the last codeword
+	 * the bad block marker is writable only when we write the last codeword
 	 * of a page with ECC disabled. currently, the nand_base and nand_bbt
-	 * helpers don't allow us to read BB from a nand chip with ECC
-	 * disabled (MTD_OPS_PLACE_OOB is set by default). use the block_bad
-	 * and block_markbad helpers until we permanently switch to using
+	 * helpers don't allow us to write BB from a nand chip with ECC
+	 * disabled (MTD_OPS_PLACE_OOB is set by default). use the block_markbad
+	 * helpers until we permanently switch to using
 	 * MTD_OPS_RAW for all drivers (with the help of badblockbits)
 	 */
-	chip->block_bad		= qcom_nandc_block_bad;
 	chip->block_markbad	= qcom_nandc_block_markbad;
 
 	chip->controller = &nandc->controller;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation
