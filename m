Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVXXw-0003fA-Cv
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 07:28:57 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 13/15] mtd: rawnand: qcom: code reorganization for raw read
Date: Wed, 20 Jun 2018 12:57:40 +0530
Message-Id: <1529479662-4026-14-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
References: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make separate function to perform raw read for one codeword and
call this function multiple times for each codeword in case of
raw page read. This separate function will help in subsequent
patches related with erased codeword bitflip detection.

It will decrease throughput for raw page read. Raw page read
is used for debug purpose so it won't affect normal flash
operations.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
* Changes from v3:
  1. Major code changes for making separate function for raw_read
  2. Changed commit message

* Changes from v2:
  NONE

* Changes from v1:
 1. Included more detail in function comment

 drivers/mtd/nand/raw/qcom_nandc.c | 146 ++++++++++++++++++++------------------
 1 file changed, 78 insertions(+), 68 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 5999c39..160acdf 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1587,6 +1587,74 @@ static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
 	return 0;
 }
 
+/* performs raw read for one codeword */
+static int
+qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
+		       u8 *data_buf, u8 *oob_buf, int page, int cw)
+{
+	struct qcom_nand_host *host = to_qcom_nand_host(chip);
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	int data_size1, data_size2, oob_size1, oob_size2;
+	int ret, reg_off = FLASH_BUF_ACC, read_loc = 0;
+
+	nand_read_page_op(chip, page, 0, NULL, 0);
+	host->use_ecc = false;
+
+	clear_bam_transaction(nandc);
+	set_address(host, host->cw_size * cw, page);
+	update_rw_regs(host, 1, true);
+	config_nand_page_read(nandc);
+
+	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
+	oob_size1 = host->bbm_size;
+
+	if (cw == (ecc->steps - 1)) {
+		data_size2 = ecc->size - data_size1 -
+			     ((ecc->steps - 1) * 4);
+		oob_size2 = (ecc->steps * 4) + host->ecc_bytes_hw +
+			    host->spare_bytes;
+	} else {
+		data_size2 = host->cw_data - data_size1;
+		oob_size2 = host->ecc_bytes_hw + host->spare_bytes;
+	}
+
+	if (nandc->props->is_bam) {
+		nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
+		read_loc += data_size1;
+
+		nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
+		read_loc += oob_size1;
+
+		nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
+		read_loc += data_size2;
+
+		nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
+	}
+
+	config_nand_cw_read(nandc, false);
+
+	read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
+	reg_off += data_size1;
+
+	read_data_dma(nandc, reg_off, oob_buf, oob_size1, 0);
+	reg_off += oob_size1;
+
+	read_data_dma(nandc, reg_off, data_buf + data_size1, data_size2, 0);
+	reg_off += data_size2;
+
+	read_data_dma(nandc, reg_off, oob_buf + oob_size1, oob_size2, 0);
+
+	ret = submit_descs(nandc);
+	free_descs(nandc);
+	if (ret) {
+		dev_err(nandc->dev, "failure to read raw cw %d\n", cw);
+		return ret;
+	}
+
+	return check_flash_errors(host, 1);
+}
+
 /*
  * reads back status registers set by the controller to notify page read
  * errors. this is equivalent to what 'ecc->correct()' would do.
@@ -1851,79 +1919,21 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 				    int oob_required, int page)
 {
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-	u8 *data_buf, *oob_buf;
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
-	int i, ret;
-	int read_loc;
+	int cw, ret;
+	u8 *data_buf = buf, *oob_buf = chip->oob_poi;
 
-	nand_read_page_op(chip, page, 0, NULL, 0);
-	data_buf = buf;
-	oob_buf = chip->oob_poi;
+	for (cw = 0; cw < ecc->steps; cw++) {
+		ret = qcom_nandc_read_cw_raw(mtd, chip, data_buf, oob_buf,
+					     page, cw);
+		if (ret)
+			return ret;
 
-	host->use_ecc = false;
-
-	clear_bam_transaction(nandc);
-	update_rw_regs(host, ecc->steps, true);
-	config_nand_page_read(nandc);
-
-	for (i = 0; i < ecc->steps; i++) {
-		int data_size1, data_size2, oob_size1, oob_size2;
-		int reg_off = FLASH_BUF_ACC;
-
-		data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
-		oob_size1 = host->bbm_size;
-
-		if (i == (ecc->steps - 1)) {
-			data_size2 = ecc->size - data_size1 -
-				     ((ecc->steps - 1) << 2);
-			oob_size2 = (ecc->steps << 2) + host->ecc_bytes_hw +
-				    host->spare_bytes;
-		} else {
-			data_size2 = host->cw_data - data_size1;
-			oob_size2 = host->ecc_bytes_hw + host->spare_bytes;
-		}
-
-		if (nandc->props->is_bam) {
-			read_loc = 0;
-			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
-			read_loc += data_size1;
-
-			nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
-			read_loc += oob_size1;
-
-			nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
-			read_loc += data_size2;
-
-			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
-		}
-
-		config_nand_cw_read(nandc, false);
-
-		read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
-		reg_off += data_size1;
-		data_buf += data_size1;
-
-		read_data_dma(nandc, reg_off, oob_buf, oob_size1, 0);
-		reg_off += oob_size1;
-		oob_buf += oob_size1;
-
-		read_data_dma(nandc, reg_off, data_buf, data_size2, 0);
-		reg_off += data_size2;
-		data_buf += data_size2;
-
-		read_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
-		oob_buf += oob_size2;
-	}
-
-	ret = submit_descs(nandc);
-	free_descs(nandc);
-	if (ret) {
-		dev_err(nandc->dev, "failure to read raw page\n");
-		return ret;
+		data_buf += host->cw_data;
+		oob_buf += ecc->bytes;
 	}
 
-	return check_flash_errors(host, ecc->steps);
+	return 0;
 }
 
 /* implements ecc->read_oob() */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation
