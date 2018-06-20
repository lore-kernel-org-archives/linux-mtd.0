Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVXXk-0001Qh-9V
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 07:29:55 +0000
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
Subject: [PATCH v4 09/15] mtd: rawnand: qcom: parse read errors for read oob
 also
Date: Wed, 20 Jun 2018 12:57:36 +0530
Message-Id: <1529479662-4026-10-git-send-email-absahu@codeaurora.org>
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

read_page and read_oob both calls the read_page_ecc function.
The QCOM NAND controller protect the OOB available bytes with
ECC so read errors should be checked for read_oob also.
This patch moves the error checking code inside read_page_ecc
so caller does not have to check explicitly for read errors.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
* Changes from v3:
  NONE

* Changes from v2:
  NONE

* Changes from v1:
  1. Minor code change for return early in case of error

 drivers/mtd/nand/raw/qcom_nandc.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index a831f9c..285b2ad3 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1698,6 +1698,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 	int i, ret;
 
 	config_nand_page_read(nandc);
@@ -1758,12 +1759,14 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	}
 
 	ret = submit_descs(nandc);
-	if (ret)
+	free_descs(nandc);
+
+	if (ret) {
 		dev_err(nandc->dev, "failure to read page/oob\n");
+		return ret;
+	}
 
-	free_descs(nandc);
-
-	return ret;
+	return parse_read_errors(host, data_buf_start, oob_buf_start);
 }
 
 /*
@@ -1808,20 +1811,14 @@ static int qcom_nandc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	u8 *data_buf, *oob_buf = NULL;
-	int ret;
 
 	nand_read_page_op(chip, page, 0, NULL, 0);
 	data_buf = buf;
 	oob_buf = oob_required ? chip->oob_poi : NULL;
 
 	clear_bam_transaction(nandc);
-	ret = read_page_ecc(host, data_buf, oob_buf);
-	if (ret) {
-		dev_err(nandc->dev, "failure to read page\n");
-		return ret;
-	}
 
-	return parse_read_errors(host, data_buf, oob_buf);
+	return read_page_ecc(host, data_buf, oob_buf);
 }
 
 /* implements ecc->read_page_raw() */
@@ -1911,7 +1908,6 @@ static int qcom_nandc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
-	int ret;
 
 	clear_read_regs(nandc);
 	clear_bam_transaction(nandc);
@@ -1920,11 +1916,7 @@ static int qcom_nandc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	set_address(host, 0, page);
 	update_rw_regs(host, ecc->steps, true);
 
-	ret = read_page_ecc(host, NULL, chip->oob_poi);
-	if (ret)
-		dev_err(nandc->dev, "failure to read oob\n");
-
-	return ret;
+	return read_page_ecc(host, NULL, chip->oob_poi);
 }
 
 /* implements ecc->write_page() */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation
