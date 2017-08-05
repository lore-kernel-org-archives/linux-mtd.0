Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1de1px-0006VK-JW
 for linux-mtd@lists.infradead.org; Sat, 05 Aug 2017 16:22:02 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 14/20] mtd: nand: qcom: add command elements in BAM
 transaction
Date: Sat,  5 Aug 2017 21:49:52 +0530
Message-Id: <1501949998-29859-15-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All the QPIC register read/write through BAM DMA requires
command descriptor which contains the array of command elements.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index c940a20..9c12404 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -22,6 +22,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/delay.h>
+#include <linux/dma/qcom_bam_dma.h>
 
 /* NANDc reg offsets */
 #define	NAND_FLASH_CMD			0x00
@@ -198,6 +199,7 @@
 /* Returns the actual register address for NAND_FLASH_DEV_* */
 #define nandc_dev_addr(nandc, reg) ((nandc)->props->flash_dev_offset + (reg))
 
+#define QPIC_PER_CW_CMD_ELEMENTS	32
 #define QPIC_PER_CW_CMD_SGL		32
 #define QPIC_PER_CW_DATA_SGL		8
 
@@ -217,8 +219,13 @@
 /*
  * This data type corresponds to the BAM transaction which will be used for all
  * NAND transfers.
+ * @bam_ce - the array of BAM command elements
  * @cmd_sgl - sgl for NAND BAM command pipe
  * @data_sgl - sgl for NAND BAM consumer/producer pipe
+ * @bam_ce_pos - the index in bam_ce which is available for next sgl
+ * @bam_ce_start - the index in bam_ce which marks the start position ce
+ *		   for current sgl. It will be used for size calculation
+ *		   for current sgl
  * @cmd_sgl_pos - current index in command sgl.
  * @cmd_sgl_start - start index in command sgl.
  * @tx_sgl_pos - current index in data sgl for tx.
@@ -227,8 +234,11 @@
  * @rx_sgl_start - start index in data sgl for rx.
  */
 struct bam_transaction {
+	struct bam_cmd_element *bam_ce;
 	struct scatterlist *cmd_sgl;
 	struct scatterlist *data_sgl;
+	u32 bam_ce_pos;
+	u32 bam_ce_start;
 	u32 cmd_sgl_pos;
 	u32 cmd_sgl_start;
 	u32 tx_sgl_pos;
@@ -458,7 +468,8 @@ static void free_bam_transaction(struct qcom_nand_controller *nandc)
 
 	bam_txn_size =
 		sizeof(*bam_txn) + num_cw *
-		((sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL) +
+		((sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS) +
+		(sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL) +
 		(sizeof(*bam_txn->data_sgl) * QPIC_PER_CW_DATA_SGL));
 
 	bam_txn_buf = devm_kzalloc(nandc->dev, bam_txn_size, GFP_KERNEL);
@@ -468,6 +479,10 @@ static void free_bam_transaction(struct qcom_nand_controller *nandc)
 	bam_txn = bam_txn_buf;
 	bam_txn_buf += sizeof(*bam_txn);
 
+	bam_txn->bam_ce = bam_txn_buf;
+	bam_txn_buf +=
+		sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS * num_cw;
+
 	bam_txn->cmd_sgl = bam_txn_buf;
 	bam_txn_buf +=
 		sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL * num_cw;
@@ -485,6 +500,8 @@ static void clear_bam_transaction(struct qcom_nand_controller *nandc)
 	if (!nandc->props->is_bam)
 		return;
 
+	bam_txn->bam_ce_pos = 0;
+	bam_txn->bam_ce_start = 0;
 	bam_txn->cmd_sgl_pos = 0;
 	bam_txn->cmd_sgl_start = 0;
 	bam_txn->tx_sgl_pos = 0;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
