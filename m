Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faK4n-0002SE-FZ
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2018 12:06:35 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v5] mtd: rawnand: qcom: erased page bitflips detection
Date: Tue,  3 Jul 2018 17:36:03 +0530
Message-Id: <1530619563-24712-1-git-send-email-absahu@codeaurora.org>
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

NAND parts can have bitflips in an erased page due to the
process technology used. In this case, QCOM NAND controller
is not able to identify that page as an erased page.
Currently the driver calls nand_check_erased_ecc_chunk() for
identifying the erased pages but this won’t work always since the
checking is being with ECC engine returned data. In case of
bitflips, the ECC engine tries to correct the data and then it
generates the uncorrectable error. Now, this data is not equal to
original raw data. For erased CW identification, the raw data
should be read again from NAND device and this
nand_check_erased_ecc_chunk function() should be called for raw
data only.

Now following logic is being added to identify the erased
codeword bitflips.

1. In most of the cases, not all the codewords will have bitflips
   and only single CW will have bitflips. So, there is no need to
   read the complete raw page data. The NAND raw read can be
   scheduled for any CW in page. The NAND controller works on CW
   basis and it will update the status register after each CW read.
   Maintain the bitmask for the CW which generated the uncorrectable
   error.
2. Do raw read for all the CW's which generated the uncorrectable
   error.
3. Both DATA and OOB need to be checked for number of 0. The
   top-level API can be called with only data buf or OOB buf so use
   chip->databuf if data buf is null and chip->oob_poi if
   OOB buf is null for copying the raw bytes temporarily.
4. For each CW, check the number of 0 in cw_data and usable
   oob bytes, The bbm and spare (unused) bytes bit flip won’t
   affect the ECC so don’t check the number of bitflips in this area.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
* Changes from v4:

 1. Used for_each_set_bit for determining CW’s which generated
    uncorrectable errors.
 2. Introduced cw_data_buf and cw_oob_buf which will have starting
    buffer address for current codeword and used the same in helper
    functions.
 3. Added new line before calling of nand_check_erased_ecc_chunk for
    better code readability.

* Changes from v3:

 1. Major changes in erased codeword detection for
    raw read function

* Changes from v2:
  NONE

* Changes from v1:
 1. Minor change in commit message
 2. invalidate pagebuf if databuf or oob_poi is used

 drivers/mtd/nand/raw/qcom_nandc.c | 126 +++++++++++++++++++++++++++-----------
 1 file changed, 89 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 160acdf..994f980 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1656,20 +1656,94 @@ static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
 }
 
 /*
+ * Bitflips can happen in erased codewords also so this function counts the
+ * number of 0 in each CW for which ECC engine returns the uncorrectable
+ * error. The page will be assumed as erased if this count is less than or
+ * equal to the ecc->strength for each CW.
+ *
+ * 1. Both DATA and OOB need to be checked for number of 0. The
+ *    top-level API can be called with only data buf or OOB buf so use
+ *    chip->data_buf if data buf is null and chip->oob_poi if oob buf
+ *    is null for copying the raw bytes.
+ * 2. Perform raw read for all the CW which has uncorrectable errors.
+ * 3. For each CW, check the number of 0 in cw_data and usable OOB bytes.
+ *    The BBM and spare bytes bit flip won’t affect the ECC so don’t check
+ *    the number of bitflips in this area.
+ */
+static int
+check_for_erased_page(struct qcom_nand_host *host, u8 *data_buf,
+		      u8 *oob_buf, unsigned long uncorrectable_cws,
+		      int page, unsigned int max_bitflips)
+{
+	struct nand_chip *chip = &host->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	u8 *cw_data_buf, *cw_oob_buf;
+	int cw, data_size, oob_size, ret = 0;
+
+	if (!data_buf) {
+		data_buf = chip->data_buf;
+		chip->pagebuf = -1;
+	}
+
+	if (!oob_buf) {
+		oob_buf = chip->oob_poi;
+		chip->pagebuf = -1;
+	}
+
+	for_each_set_bit(cw, &uncorrectable_cws, ecc->steps) {
+		if (cw == (ecc->steps - 1)) {
+			data_size = ecc->size - ((ecc->steps - 1) * 4);
+			oob_size = (ecc->steps * 4) + host->ecc_bytes_hw;
+		} else {
+			data_size = host->cw_data;
+			oob_size = host->ecc_bytes_hw;
+		}
+
+		/* determine starting buffer address for current CW */
+		cw_data_buf = data_buf + (cw * host->cw_data);
+		cw_oob_buf = oob_buf + (cw * ecc->bytes);
+
+		ret = qcom_nandc_read_cw_raw(mtd, chip, cw_data_buf,
+					     cw_oob_buf, page, cw);
+		if (ret)
+			return ret;
+
+		/*
+		 * make sure it isn't an erased page reported
+		 * as not-erased by HW because of a few bitflips
+		 */
+		ret = nand_check_erased_ecc_chunk(cw_data_buf, data_size,
+						  cw_oob_buf + host->bbm_size,
+						  oob_size, NULL,
+						  0, ecc->strength);
+		if (ret < 0) {
+			mtd->ecc_stats.failed++;
+		} else {
+			mtd->ecc_stats.corrected += ret;
+			max_bitflips = max_t(unsigned int, max_bitflips, ret);
+		}
+	}
+
+	return max_bitflips;
+}
+
+/*
  * reads back status registers set by the controller to notify page read
  * errors. this is equivalent to what 'ecc->correct()' would do.
  */
 static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
-			     u8 *oob_buf)
+			     u8 *oob_buf, int page)
 {
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
-	unsigned int max_bitflips = 0;
+	unsigned int max_bitflips = 0, uncorrectable_cws = 0;
 	struct read_stats *buf;
-	bool flash_op_err = false;
+	bool flash_op_err = false, erased;
 	int i;
+	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 
 	buf = (struct read_stats *)nandc->reg_read_buf;
 	nandc_read_buffer_sync(nandc, true);
@@ -1699,10 +1773,6 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 		 *    codeword detection check will be done.
 		 */
 		if ((flash & FS_OP_ERR) && (buffer & BS_UNCORRECTABLE_BIT)) {
-			bool erased;
-			int ret, ecclen, extraooblen;
-			void *eccbuf;
-
 			/*
 			 * For BCH ECC, ignore erased codeword errors, if
 			 * ERASED_CW bits are set.
@@ -1723,31 +1793,8 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 				erased = false;
 			}
 
-			if (erased) {
-				data_buf += data_len;
-				if (oob_buf)
-					oob_buf += oob_len + ecc->bytes;
-				continue;
-			}
-
-			eccbuf = oob_buf ? oob_buf + oob_len : NULL;
-			ecclen = oob_buf ? host->ecc_bytes_hw : 0;
-			extraooblen = oob_buf ? oob_len : 0;
-
-			/*
-			 * make sure it isn't an erased page reported
-			 * as not-erased by HW because of a few bitflips
-			 */
-			ret = nand_check_erased_ecc_chunk(data_buf,
-				data_len, eccbuf, ecclen, oob_buf,
-				extraooblen, ecc->strength);
-			if (ret < 0) {
-				mtd->ecc_stats.failed++;
-			} else {
-				mtd->ecc_stats.corrected += ret;
-				max_bitflips =
-					max_t(unsigned int, max_bitflips, ret);
-			}
+			if (!erased)
+				uncorrectable_cws |= BIT(i);
 		/*
 		 * Check if MPU or any other operational error (timeout,
 		 * device failure, etc.) happened for this codeword and
@@ -1777,7 +1824,12 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 	if (flash_op_err)
 		return -EIO;
 
-	return max_bitflips;
+	if (!uncorrectable_cws)
+		return max_bitflips;
+
+	return check_for_erased_page(host, data_buf_start, oob_buf_start,
+				     uncorrectable_cws, page,
+				     max_bitflips);
 }
 
 /*
@@ -1785,7 +1837,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
  * ecc->read_oob()
  */
 static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
-			 u8 *oob_buf)
+			 u8 *oob_buf, int page)
 {
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
@@ -1858,7 +1910,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 		return ret;
 	}
 
-	return parse_read_errors(host, data_buf_start, oob_buf_start);
+	return parse_read_errors(host, data_buf_start, oob_buf_start, page);
 }
 
 /*
@@ -1910,7 +1962,7 @@ static int qcom_nandc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	clear_bam_transaction(nandc);
 
-	return read_page_ecc(host, data_buf, oob_buf);
+	return read_page_ecc(host, data_buf, oob_buf, page);
 }
 
 /* implements ecc->read_page_raw() */
@@ -1951,7 +2003,7 @@ static int qcom_nandc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	set_address(host, 0, page);
 	update_rw_regs(host, ecc->steps, true);
 
-	return read_page_ecc(host, NULL, chip->oob_poi);
+	return read_page_ecc(host, NULL, chip->oob_poi, page);
 }
 
 /* implements ecc->write_page() */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation
