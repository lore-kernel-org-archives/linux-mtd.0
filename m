Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3hkl-0001sf-Pp
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 12:43:06 +0000
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
Subject: [PATCH 3/9] mtd: nand: qcom: erased page detection for uncorrectable
 errors only
Date: Wed,  4 Apr 2018 18:12:19 +0530
Message-Id: <1522845745-6624-4-git-send-email-absahu@codeaurora.org>
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

The NAND flash controller generates ECC uncorrectable error
first in case of completely erased page. Currently driver
applies the erased page detection logic for other operation
errors also so fix this and return EIO for other operational
errors.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 17321fc..57c16a6 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -1578,6 +1578,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	unsigned int max_bitflips = 0;
 	struct read_stats *buf;
+	bool flash_op_err = false;
 	int i;
 
 	buf = (struct read_stats *)nandc->reg_read_buf;
@@ -1599,7 +1600,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 		buffer = le32_to_cpu(buf->buffer);
 		erased_cw = le32_to_cpu(buf->erased_cw);
 
-		if (flash & (FS_OP_ERR | FS_MPU_ERR)) {
+		if ((flash & FS_OP_ERR) && (buffer & BS_UNCORRECTABLE_BIT)) {
 			bool erased;
 
 			/* ignore erased codeword errors */
@@ -1641,6 +1642,8 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 						max_t(unsigned int, max_bitflips, ret);
 				}
 			}
+		} else if (flash & (FS_OP_ERR | FS_MPU_ERR)) {
+			flash_op_err = true;
 		} else {
 			unsigned int stat;
 
@@ -1654,6 +1657,9 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 			oob_buf += oob_len + ecc->bytes;
 	}
 
+	if (flash_op_err)
+		return -EIO;
+
 	return max_bitflips;
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
