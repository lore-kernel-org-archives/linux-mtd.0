Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diJbZ-0007Eu-43
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 12:09:33 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Sricharan R <sricharan@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v5 06/16] mtd: nand: qcom: erased codeword detection
 configuration
Date: Thu, 17 Aug 2017 17:37:44 +0530
Message-Id: <1502971674-13810-7-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
References: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND controller returns ECC failure during read of completely
erased codeword. The NAND controller has hardware functionality
to detect erased codeword in case of BCH ECC algorithm. The
NAND_ERASED_CW_DETECT_CFG register controls the erased
codeword/page detection controller. This register should be reset
before every page read by setting and clearing bit 0 of
NAND_ERASED_CW_DETECT_CFG.

Reviewed-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---

* Changes from v4: None

 drivers/mtd/nand/qcom_nandc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 9d55e8e..81cfce7 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -203,6 +203,11 @@
 #define NAND_BAM_NWD			BIT(1)
 /* Finish writing in the current BAM sgl and start writing in another BAM sgl */
 #define NAND_BAM_NEXT_SGL		BIT(2)
+/*
+ * Erased codeword status is being used two times in single transfer so this
+ * flag will determine the current value of erased codeword status register
+ */
+#define NAND_ERASED_CW_SET		BIT(4)
 
 /*
  * This data type corresponds to the BAM transaction which will be used for all
@@ -281,6 +286,8 @@ struct nandc_regs {
 	__le32 read_location2;
 	__le32 read_location3;
 
+	__le32 erased_cw_detect_cfg_clr;
+	__le32 erased_cw_detect_cfg_set;
 };
 
 /*
@@ -810,6 +817,13 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 	if (first == NAND_FLASH_CMD)
 		flow_control = true;
 
+	if (first == NAND_ERASED_CW_DETECT_CFG) {
+		if (flags & NAND_ERASED_CW_SET)
+			vaddr = &regs->erased_cw_detect_cfg_set;
+		else
+			vaddr = &regs->erased_cw_detect_cfg_clr;
+	}
+
 	if (first == NAND_EXEC_CMD)
 		flags |= NAND_BAM_NWD;
 
@@ -864,6 +878,9 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
 	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
 	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
 	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
+	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
+	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1,
+		      NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
 }
 
 /*
@@ -2264,6 +2281,10 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 
 	host->clrflashstatus = FS_READY_BSY_N;
 	host->clrreadstatus = 0xc0;
+	nandc->regs->erased_cw_detect_cfg_clr =
+		cpu_to_le32(CLR_ERASED_PAGE_DET);
+	nandc->regs->erased_cw_detect_cfg_set =
+		cpu_to_le32(SET_ERASED_PAGE_DET);
 
 	dev_dbg(nandc->dev,
 		"cfg0 %x cfg1 %x ecc_buf_cfg %x ecc_bch cfg %x cw_size %d cw_data %d strength %d parity_bytes %d steps %d\n",
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
