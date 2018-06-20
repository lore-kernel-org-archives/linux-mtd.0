Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVXXM-0001HU-2e
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 07:28:24 +0000
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
Subject: [PATCH v4 05/15] mtd: rawnand: qcom: use the ecc strength from device
 parameter
Date: Wed, 20 Jun 2018 12:57:32 +0530
Message-Id: <1529479662-4026-6-git-send-email-absahu@codeaurora.org>
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

Currently the driver uses the ECC strength specified in DT.
The QPIC/EBI2 NAND supports 4 or 8-bit ECC correction. The same
kind of board can have different NAND parts so use the ECC
strength from device parameters if it is not specified in DT.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
* Changes from v3:
  1. Added parenthesis around (cwperpage * 4)

* Changes from v2:
  1. s/<< 2/* 4/
  2. Updated the cwperpage location
  3. The block handling the ecc-step-size property has been
     removed in a previous patch

* Changes from v1:

  1. Removed the custom logic and used the helper fuction.

 drivers/mtd/nand/raw/qcom_nandc.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index bf80a61..2375780 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2315,19 +2315,39 @@ static int qcom_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	.free = qcom_nand_ooblayout_free,
 };
 
+static int
+qcom_nandc_calc_ecc_bytes(int step_size, int strength)
+{
+	return strength == 4 ? 12 : 16;
+}
+NAND_ECC_CAPS_SINGLE(qcom_nandc_ecc_caps, qcom_nandc_calc_ecc_bytes,
+		     NANDC_STEP_SIZE, 4, 8);
+
 static int qcom_nand_host_setup(struct qcom_nand_host *host)
 {
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-	int cwperpage, bad_block_byte;
+	int cwperpage, bad_block_byte, ret;
 	bool wide_bus;
 	int ecc_mode = 1;
 
 	/* controller only supports 512 bytes data steps */
 	ecc->size = NANDC_STEP_SIZE;
 	wide_bus = chip->options & NAND_BUSWIDTH_16 ? true : false;
+	cwperpage = mtd->writesize / NANDC_STEP_SIZE;
+
+	/*
+	 * Each CW has 4 available OOB bytes which will be protected with ECC
+	 * so remaining bytes can be used for ECC.
+	 */
+	ret = nand_ecc_choose_conf(chip, &qcom_nandc_ecc_caps,
+				   mtd->oobsize - (cwperpage * 4));
+	if (ret) {
+		dev_err(nandc->dev, "No valid ECC settings possible\n");
+		return ret;
+	}
 
 	if (ecc->strength >= 8) {
 		/* 8 bit ECC defaults to BCH ECC on all platforms */
@@ -2396,7 +2416,6 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 
 	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
 
-	cwperpage = mtd->writesize / ecc->size;
 	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
 				     cwperpage);
 
@@ -2412,12 +2431,6 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 	 * for 8 bit ECC
 	 */
 	host->cw_size = host->cw_data + ecc->bytes;
-
-	if (ecc->bytes * (mtd->writesize / ecc->size) > mtd->oobsize) {
-		dev_err(nandc->dev, "ecc data doesn't fit in OOB area\n");
-		return -EINVAL;
-	}
-
 	bad_block_byte = mtd->writesize - host->cw_size * (cwperpage - 1) + 1;
 
 	host->cfg0 = (cwperpage - 1) << CW_PER_PAGE
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation
