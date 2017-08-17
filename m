Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diJbj-0007HZ-3y
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 12:09:53 +0000
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
Subject: [PATCH v5 08/16] mtd: nand: qcom: QPIC data descriptors handling
Date: Thu, 17 Aug 2017 17:37:46 +0530
Message-Id: <1502971674-13810-9-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
References: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
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

1. Add the data descriptor preparation function which will be used
   only by BAM DMA for forming the data SGL’s
2. Add clear BAM transaction and call it before every new request
3. Check DMA mode for ADM or BAM and call the appropriate
   descriptor formation function.

Reviewed-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---

* Changes from v4: None

 drivers/mtd/nand/qcom_nandc.c | 76 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index fd77d59..1ff5daf 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -473,6 +473,27 @@ static void free_bam_transaction(struct qcom_nand_controller *nandc)
 	return bam_txn;
 }
 
+/* Clears the BAM transaction indexes */
+static void clear_bam_transaction(struct qcom_nand_controller *nandc)
+{
+	struct bam_transaction *bam_txn = nandc->bam_txn;
+
+	if (!nandc->props->is_bam)
+		return;
+
+	bam_txn->cmd_sgl_pos = 0;
+	bam_txn->cmd_sgl_start = 0;
+	bam_txn->tx_sgl_pos = 0;
+	bam_txn->tx_sgl_start = 0;
+	bam_txn->rx_sgl_pos = 0;
+	bam_txn->rx_sgl_start = 0;
+
+	sg_init_table(bam_txn->cmd_sgl, nandc->max_cwperpage *
+		      QPIC_PER_CW_CMD_SGL);
+	sg_init_table(bam_txn->data_sgl, nandc->max_cwperpage *
+		      QPIC_PER_CW_DATA_SGL);
+}
+
 static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
 {
 	return container_of(chip, struct qcom_nand_host, chip);
@@ -704,6 +725,41 @@ static int prepare_bam_async_desc(struct qcom_nand_controller *nandc,
 	return 0;
 }
 
+/*
+ * Prepares the data descriptor for BAM DMA which will be used for NAND
+ * data reads and writes.
+ */
+static int prep_bam_dma_desc_data(struct qcom_nand_controller *nandc, bool read,
+				  const void *vaddr,
+				  int size, unsigned int flags)
+{
+	int ret;
+	struct bam_transaction *bam_txn = nandc->bam_txn;
+
+	if (read) {
+		sg_set_buf(&bam_txn->data_sgl[bam_txn->rx_sgl_pos],
+			   vaddr, size);
+		bam_txn->rx_sgl_pos++;
+	} else {
+		sg_set_buf(&bam_txn->data_sgl[bam_txn->tx_sgl_pos],
+			   vaddr, size);
+		bam_txn->tx_sgl_pos++;
+
+		/*
+		 * BAM will only set EOT for DMA_PREP_INTERRUPT so if this flag
+		 * is not set, form the DMA descriptor
+		 */
+		if (!(flags & NAND_BAM_NO_EOT)) {
+			ret = prepare_bam_async_desc(nandc, nandc->tx_chan,
+						     DMA_PREP_INTERRUPT);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int prep_adm_dma_desc(struct qcom_nand_controller *nandc, bool read,
 			     int reg_off, const void *vaddr, int size,
 			     bool flow_control)
@@ -854,6 +910,9 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
 static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 			 const u8 *vaddr, int size, unsigned int flags)
 {
+	if (nandc->props->is_bam)
+		return prep_bam_dma_desc_data(nandc, true, vaddr, size, flags);
+
 	return prep_adm_dma_desc(nandc, true, reg_off, vaddr, size, false);
 }
 
@@ -869,6 +928,9 @@ static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
 			  const u8 *vaddr, int size, unsigned int flags)
 {
+	if (nandc->props->is_bam)
+		return prep_bam_dma_desc_data(nandc, false, vaddr, size, flags);
+
 	return prep_adm_dma_desc(nandc, false, reg_off, vaddr, size, false);
 }
 
@@ -1156,6 +1218,10 @@ static void pre_command(struct qcom_nand_host *host, int command)
 	host->last_command = command;
 
 	clear_read_regs(nandc);
+
+	if (command == NAND_CMD_RESET || command == NAND_CMD_READID ||
+	    command == NAND_CMD_PARAM || command == NAND_CMD_ERASE1)
+		clear_bam_transaction(nandc);
 }
 
 /*
@@ -1559,6 +1625,7 @@ static int qcom_nandc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	data_buf = buf;
 	oob_buf = oob_required ? chip->oob_poi : NULL;
 
+	clear_bam_transaction(nandc);
 	ret = read_page_ecc(host, data_buf, oob_buf);
 	if (ret) {
 		dev_err(nandc->dev, "failure to read page\n");
@@ -1584,6 +1651,8 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
 	oob_buf = chip->oob_poi;
 
 	host->use_ecc = false;
+
+	clear_bam_transaction(nandc);
 	update_rw_regs(host, ecc->steps, true);
 	config_nand_page_read(nandc);
 
@@ -1655,6 +1724,7 @@ static int qcom_nandc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	int ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	host->use_ecc = true;
 	set_address(host, 0, page);
@@ -1678,6 +1748,7 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	int i, ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	data_buf = (u8 *)buf;
 	oob_buf = chip->oob_poi;
@@ -1743,6 +1814,7 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
 	int i, ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	data_buf = (u8 *)buf;
 	oob_buf = chip->oob_poi;
@@ -1819,11 +1891,13 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 
 	host->use_ecc = true;
 
+	clear_bam_transaction(nandc);
 	ret = copy_last_cw(host, page);
 	if (ret)
 		return ret;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	/* calculate the data and oob size for the last codeword/step */
 	data_size = ecc->size - ((ecc->steps - 1) << 2);
@@ -1876,6 +1950,7 @@ static int qcom_nandc_block_bad(struct mtd_info *mtd, loff_t ofs)
 	 */
 	host->use_ecc = false;
 
+	clear_bam_transaction(nandc);
 	ret = copy_last_cw(host, page);
 	if (ret)
 		goto err;
@@ -1906,6 +1981,7 @@ static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	int page, ret, status = 0;
 
 	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
 
 	/*
 	 * to mark the BBM as bad, we flash the entire last codeword with 0s.
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
