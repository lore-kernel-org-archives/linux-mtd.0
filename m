Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3hlD-00026S-0F
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 12:43:35 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 6/9] mtd: nand: qcom: support for checking read errors for
 last codeword
Date: Wed,  4 Apr 2018 18:12:22 +0530
Message-Id: <1522845745-6624-7-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add boolean function argument in parse_read_errors to identify
whether the read error has been called for complete page read or
only last codeword read. This will help in subsequent patches to
detect ECC errors in case of last codeword read.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index ba43752..dce97e8 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -1570,7 +1570,7 @@ struct read_stats {
  * errors. this is equivalent to what 'ecc->correct()' would do.
  */
 static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
-			     u8 *oob_buf)
+			     u8 *oob_buf, bool last_cw)
 {
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
@@ -1579,12 +1579,12 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 	unsigned int max_bitflips = 0;
 	struct read_stats *buf;
 	bool flash_op_err = false;
-	int i;
+	int i, cw_cnt = last_cw ? 1 : ecc->steps;
 
 	buf = (struct read_stats *)nandc->reg_read_buf;
 	nandc_read_buffer_sync(nandc, true);
 
-	for (i = 0; i < ecc->steps; i++, buf++) {
+	for (i = 0; i < cw_cnt; i++, buf++) {
 		u32 flash, buffer, erased_cw;
 		int data_len, oob_len;
 
@@ -1743,7 +1743,8 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	free_descs(nandc);
 
 	if (!ret)
-		ret = parse_read_errors(host, data_buf_start, oob_buf_start);
+		ret = parse_read_errors(host, data_buf_start, oob_buf_start,
+					false);
 
 	return ret;
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
