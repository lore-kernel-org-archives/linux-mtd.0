Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVXXk-0001Rz-9W
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 07:29:43 +0000
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
Subject: [PATCH v4 10/15] mtd: rawnand: qcom: modify write_oob to remove read
 codeword part
Date: Wed, 20 Jun 2018 12:57:37 +0530
Message-Id: <1529479662-4026-11-git-send-email-absahu@codeaurora.org>
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

QCOM NAND controller layout protects available OOB data bytes with
ECC also so when ecc->write_oob() is being called then it
can't update just OOB bytes. Currently, it first reads the last
codeword which includes old OOB bytes. Then it updates the old OOB
bytes with new ones and then again writes the codeword back.
The reading codeword is unnecessary since user is responsible to
have these bytes cleared to 0xFF.

This patch removes the read part and updates the OOB bytes with
data area padded with OxFF.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
* Changes from v3:
  NONE

* Changes from v2:

  1. Changed commit message and comments slightly
  2. Changed host->use_ecc assignment place

* Changes from v1:
  NEW CHANGE

 drivers/mtd/nand/raw/qcom_nandc.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 285b2ad3..28361b5 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2064,11 +2064,9 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
 /*
  * implements ecc->write_oob()
  *
- * the NAND controller cannot write only data or only oob within a codeword,
- * since ecc is calculated for the combined codeword. we first copy the
- * entire contents for the last codeword(data + oob), replace the old oob
- * with the new one in chip->oob_poi, and then write the entire codeword.
- * this read-copy-write operation results in a slight performance loss.
+ * the NAND controller cannot write only data or only OOB within a codeword
+ * since ECC is calculated for the combined codeword. So update the OOB from
+ * chip->oob_poi, and pad the data area with OxFF before writing.
  */
 static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 				int page)
@@ -2081,19 +2079,13 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	int ret;
 
 	host->use_ecc = true;
-
-	clear_bam_transaction(nandc);
-	ret = copy_last_cw(host, page);
-	if (ret)
-		return ret;
-
-	clear_read_regs(nandc);
 	clear_bam_transaction(nandc);
 
 	/* calculate the data and oob size for the last codeword/step */
 	data_size = ecc->size - ((ecc->steps - 1) << 2);
 	oob_size = mtd->oobavail;
 
+	memset(nandc->data_buffer, 0xff, host->cw_data);
 	/* override new oob content to last codeword */
 	mtd_ooblayout_get_databytes(mtd, nandc->data_buffer + data_size, oob,
 				    0, mtd->oobavail);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation
