Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEDF4-0007q1-Gr
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 12:21:57 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andy Gross <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 09/14] mtd: rawnand: qcom: modify write_oob to remove read
 codeword part
Date: Thu,  3 May 2018 17:50:36 +0530
Message-Id: <1525350041-22995-10-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

QCOM NAND layout protect available OOB data bytes with ECC also so
when ecc->write_oob (qcom_nandc_write_oob) is being called then it
can't update just OOB bytes. Currently, it first reads the last
codeword which includes old OOB bytes. Then it updates the old OOB
bytes with new one and then again writes the codeword back.
The reading codeword is unnecessary since all the other bytes
should be 0xff only.

This patch removes the read part and updates the oob bytes with
all other data bytes as 0xff.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
* Changes from v1:

 NEW CHANGE

 drivers/mtd/nand/raw/qcom_nandc.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 61d0e7d..f85d8ab 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2067,10 +2067,9 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
  * implements ecc->write_oob()
  *
  * the NAND controller cannot write only data or only oob within a codeword,
- * since ecc is calculated for the combined codeword. we first copy the
- * entire contents for the last codeword(data + oob), replace the old oob
- * with the new one in chip->oob_poi, and then write the entire codeword.
- * this read-copy-write operation results in a slight performance loss.
+ * since ecc is calculated for the combined codeword. So make all the data
+ * bytes as 0xff and update the oob from chip->oob_poi, and then write
+ * the entire codeword again.
  */
 static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 				int page)
@@ -2082,20 +2081,14 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	int data_size, oob_size;
 	int ret;
 
-	host->use_ecc = true;
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
+	host->use_ecc = true;
 
+	memset(nandc->data_buffer, 0xff, host->cw_data);
 	/* override new oob content to last codeword */
 	mtd_ooblayout_get_databytes(mtd, nandc->data_buffer + data_size, oob,
 				    0, mtd->oobavail);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation
