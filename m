Return-Path: <SRS0=cnOS=DR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4637C433E7
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 05:33:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C27C207FB
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 05:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JaZPZXiH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C27C207FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0jMGXWelAHSq2U5rt8wPFIhocjRYJBlzqL90IMebv4=; b=JaZPZXiHkI9bzYKB0AZM0AAltD
	YpdGrtEqoTkCXLrA50Fw+nK7/rQyxhLEQW0lCEOW53afMqZSoWnQrOs8yLe/2Zj2Sg+CoD9DxIceV
	6XjYQVfeAnbyp2SPQy21Ijr5+dayjIIyh4+3tRqC22aqLB1vQORxsnmeQ1usasYpFwMP+C+ERD8+C
	mI43ljgqiMl1meWMBVBe2Crg81B/DG0MorobOQFMuyMiV+P8VNS92wcI3mkJkbKvRBB4V3srpc/zF
	imxp7tvccSS0b/3aMI8Cj9X3pts+zTsR0mbVGMU73j5bJM0PmHwzXnw7I5bZXtlSTYvInx10apqBV
	bYO2xdeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kR7UU-0003fY-JU; Sat, 10 Oct 2020 05:32:22 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kR7UK-0003c1-QG
 for linux-mtd@lists.infradead.org; Sat, 10 Oct 2020 05:32:14 +0000
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 09 Oct 2020 22:32:10 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 09 Oct 2020 22:32:09 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 10 Oct 2020 11:01:45 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 5B2CF21ADE; Sat, 10 Oct 2020 11:01:43 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] mtd: rawnand: qcom: Add support for serial training.
Date: Sat, 10 Oct 2020 11:01:42 +0530
Message-Id: <1602307902-16761-6-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_013212_989758_5345E27E 
X-CRM114-Status: GOOD (  26.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mdalam@codeaurora.org, sricharan@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This change will add support for serial training for
QSPI nand in QPIC.

Due to different PNR and PCB delays, serial read data
can come with different delays to QPIC. At high frequency
operations Rx clock should be adjusted according to delays
so that Rx Data can be captured correctly.CLK_CNTR_INIT_VAL_VEC
in NAND_FLASH_SPI_CFG register is a 12-bit vector which is divided
in 4 parts of 3 bits each representing delay of 4 serial input data
lines. Bit [2:0] corresponds to qspi_miso[0], bit [5:3] corresponds
to qspi_miso[1], bit [8:6] corresponds to qspi_miso[2] and bit [11:9]
corresponds to qspi_miso[3]. Delay of each qspi_miso line can be set
from 0 to 7.

For serial training the following rule should be followd.

1. SW should write a page with any known pattern in flash at lower
   frequency.
2. Set the CLK_CNTR_INIT_VAL_VEC for qspi_miso[0] line.
3. Read that page repetitively in high frequency mode until it
   gets data accurately.
4. Repeat above steps for other qspi_miso lines.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 219 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 217 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4e8e1dc..fc5e32c 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -217,6 +217,10 @@
 #define SPI_TRANSFER_MODE_x1	(1 << 29)
 #define SPI_TRANSFER_MODE_x4	(3 << 29)
 #define QPIC_v2_0	0x2
+#define FEEDBACK_CLK_EN	(1 << 4)
+#define MAX_TRAINING_BLK	8
+#define TRAINING_OFFSET	0x0
+#define TOTAL_NUM_PHASE	7
 
 #define nandc_set_read_loc(nandc, reg, offset, size, is_last)	\
 nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
@@ -267,6 +271,16 @@ nandc_set_reg(nandc, NAND_READ_LOCATION_LAST_CW_##reg,			\
 #define NAND_ERASED_CW_SET		BIT(4)
 
 /*
+ * An array holding the fixed pattern
+ */
+static const u32 qspi_training_block_64[] = {
+	0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F,
+	0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F,
+	0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F,
+	0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F,
+};
+
+/*
  * This data type corresponds to the BAM transaction which will be used for all
  * NAND transfers.
  * @bam_ce - the array of BAM command elements
@@ -366,6 +380,7 @@ struct nandc_regs {
 	__le32 spi_cfg;
 	__le32 num_addr_cycle;
 	__le32 busy_wait_cnt;
+	__le32 mstr_cfg;
 
 	__le32 erased_cw_detect_cfg_clr;
 	__le32 erased_cw_detect_cfg_set;
@@ -710,6 +725,8 @@ static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
 		return &regs->num_addr_cycle;
 	case NAND_SPI_BUSY_CHECK_WAIT_CNT:
 		return &regs->busy_wait_cnt;
+	case NAND_QSPI_MSTR_CONFIG:
+		return &regs->mstr_cfg;
 	default:
 		return NULL;
 	}
@@ -2978,14 +2995,13 @@ static void qspi_write_reg_bam(struct qcom_nand_controller *nandc,
 		unsigned int val, unsigned int reg)
 {
 	int ret;
-
 	clear_bam_transaction(nandc);
 	nandc_set_reg(nandc, reg, val);
 	write_reg_dma(nandc, reg, 1, NAND_BAM_NEXT_SGL);
 
 	ret = submit_descs(nandc);
 	if (ret)
-		dev_err(nandc->dev, "Error in submitting descriptor to write config reg\n");
+		dev_err(nandc->dev, "Error in submitting descriptor to write reg %x\n", reg);
 	free_descs(nandc);
 }
 
@@ -3015,6 +3031,192 @@ static void qspi_nand_init(struct qcom_nand_controller *nandc)
 	qspi_write_reg_bam(nandc, WAIT_CNT, NAND_SPI_BUSY_CHECK_WAIT_CNT);
 }
 
+static void qspi_set_phase(struct qcom_nand_controller *nandc, int phase)
+{
+	u32 qspi_cfg_val = 0x0;
+	int reg = dev_cmd_reg_addr(nandc, NAND_FLASH_SPI_CFG);
+
+	qspi_cfg_val = nandc_read(nandc, reg);
+	qspi_cfg_val |= LOAD_CLK_CNTR_INIT_EN;
+
+	qspi_write_reg_bam(nandc, qspi_cfg_val, NAND_FLASH_SPI_CFG);
+	qspi_cfg_val &= 0xf000ffff;
+
+	/* Write phase value for all the lines */
+	qspi_cfg_val |= ((phase << 16) | (phase << 19) | (phase << 22)
+			| (phase << 25));
+	qspi_write_reg_bam(nandc, qspi_cfg_val, NAND_FLASH_SPI_CFG);
+
+	/* Clear LOAD_CLK_CNTR_INIT_EN bit to load phase value */
+	qspi_cfg_val &= ~LOAD_CLK_CNTR_INIT_EN;
+	qspi_write_reg_bam(nandc, qspi_cfg_val, NAND_FLASH_SPI_CFG);
+}
+
+static int qspi_get_appropriate_phase(struct qcom_nand_controller *nandc, u8 *phase_table,
+		int phase_count)
+{
+	int i, cnt = 0, phase = 0x0;
+	u8 phase_ranges[TOTAL_NUM_PHASE] = {'\0'};
+
+	for (i = 0; i < phase_count; i++) {
+		if ((phase_table[i] + 1 == phase_table[i + 1]) &&
+		(phase_table[i + 1] + 1 == phase_table[i + 2]))
+			phase_ranges[cnt++] = phase_table[i + 1];
+	}
+
+	/* Filter out middle phase */
+	if (!(cnt & 1))
+		phase = phase_ranges[cnt/2 - 1];
+	else
+		phase = phase_ranges[cnt/2];
+
+	return phase;
+}
+
+static int qspi_execute_training(struct qcom_nand_controller *nandc,
+		struct qcom_nand_host *host, struct mtd_info *mtd)
+{
+	u32 pages_per_block = 0, page = 0;
+	int ret = 0, bb_cnt = 0, i, phase_failed = 0;
+	int phase_cnt, phase;
+	u32 training_offset = TRAINING_OFFSET;
+	u8 *training_data = NULL, trained_phase[TOTAL_NUM_PHASE] = {'\0'};
+	struct nand_chip *chip = &host->chip;
+
+	pages_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
+	page = (training_offset >> chip->page_shift) & chip->pagemask;
+
+	/* Set feedback clk enable bit to do auto adjustment of phase
+	 * at lower frequency
+	 */
+	qspi_write_reg_bam(nandc, (nandc_read(nandc,
+			NAND_QSPI_MSTR_CONFIG) | FEEDBACK_CLK_EN),
+			NAND_QSPI_MSTR_CONFIG);
+
+	/* check for bad block in allocated training blocks
+	 * The training blocks should be continuous good block or
+	 * continuous bad block, it should be not like good,bad,good etc.
+	 * avoid to use this type of block for serial training
+	 */
+	while (qcom_nandc_block_bad(chip, training_offset)) {
+		training_offset += mtd->erasesize;
+		page += pages_per_block;
+		bb_cnt++;
+	}
+
+	if (bb_cnt == MAX_TRAINING_BLK) {
+		dev_dbg(nandc->dev, "All training blocks are bad, skipping serial training");
+		dev_dbg(nandc->dev, "Operatig at lower frequency");
+		ret = -EINVAL;
+		goto trng_err;
+	}
+
+	qcom_nandc_command(chip, NAND_CMD_ERASE1, 0, page);
+
+	/* Allocate memory to hold one NAND page */
+	training_data = kzalloc(mtd->writesize, GFP_KERNEL);
+	if (!training_data) {
+		ret = -ENOMEM;
+		goto trng_err;
+	}
+	memset(training_data, '\0', mtd->writesize);
+
+	for (i = 0; i < mtd->writesize; i += sizeof(qspi_training_block_64))
+		memcpy(training_data + i, qspi_training_block_64,
+			sizeof(qspi_training_block_64));
+
+	/* Write qspi training data to flash */
+	ret = qcom_nandc_write_page(chip, training_data, 0, page);
+	if (ret) {
+		dev_err(nandc->dev, "Error in writing training data");
+		ret = -EINVAL;
+		goto mem_err;
+	}
+
+	/* Read qspi training data @ low freq */
+	memset(training_data, 0xff, mtd->writesize);
+	ret = qcom_nandc_read_page(chip, training_data, 0, page);
+	if (ret) {
+		dev_err(nandc->dev, "Error in reading training data @ low freq");
+		ret = -EINVAL;
+		goto mem_err;
+	}
+
+	/* compare read training data with known pattern */
+	for (i = 0; i <  mtd->writesize; i += sizeof(qspi_training_block_64)) {
+		if (memcmp(training_data + i, qspi_training_block_64,
+				sizeof(qspi_training_block_64))) {
+			dev_err(nandc->dev, "Training data mismatch @ low freq");
+			ret = -EINVAL;
+			goto mem_err;
+		}
+	}
+
+	/* clear feedback clock bit and start training here */
+	qspi_write_reg_bam(nandc, (nandc_read(nandc,
+			NAND_QSPI_MSTR_CONFIG) & ~FEEDBACK_CLK_EN),
+			NAND_QSPI_MSTR_CONFIG);
+	phase = 1;
+	phase_cnt = 0;
+
+	/* set higest clock frequecy for io_macro i.e 320MHz so
+	 * on bus it will be 320/4 = 80MHz.
+	 */
+
+	ret =  clk_set_rate(nandc->iomacro_clk, 320000000);
+	if (ret) {
+		dev_err(nandc->dev, "Setting clk rate to 320000000 MHz failed");
+		goto mem_err;
+	}
+
+	do {
+		qspi_set_phase(nandc, phase);
+
+		/* Prepare clean buffer to read */
+		memset(training_data, 0xff, mtd->writesize);
+		ret = qcom_nandc_read_page(chip, training_data, 0, page);
+		if (ret) {
+			dev_err(nandc->dev, "Error in reading training data @ high freq");
+			ret = -EINVAL;
+			goto mem_err;
+		}
+		/* compare read training data with known pattern */
+		for (i = 0; i <  mtd->writesize; i += sizeof(qspi_training_block_64)) {
+			if (memcmp(training_data + i, qspi_training_block_64,
+					sizeof(qspi_training_block_64))) {
+				phase_failed++;
+				break;
+			}
+		}
+
+		if (i == mtd->writesize)
+			trained_phase[phase_cnt++] = phase;
+
+	} while (phase++ < TOTAL_NUM_PHASE);
+
+	if (phase_cnt) {
+		phase = qspi_get_appropriate_phase(nandc, trained_phase, phase_cnt);
+		qspi_set_phase(nandc, phase);
+	} else {
+		dev_err(nandc->dev, "Serial training failed");
+		dev_err(nandc->dev, "Running @ low freq 50MHz");
+		/* Run @ lower frequency 50Mhz with feedback clk bit enabled  */
+		qspi_write_reg_bam(nandc, (nandc_read(nandc,
+			NAND_QSPI_MSTR_CONFIG) | FEEDBACK_CLK_EN),
+			NAND_QSPI_MSTR_CONFIG);
+		ret =  clk_set_rate(nandc->iomacro_clk, 200000000);
+		if (ret) {
+			dev_err(nandc->dev, "Setting clk rate to 50000000 MHz failed");
+			goto mem_err;
+		}
+	}
+
+mem_err:
+	kfree(training_data);
+trng_err:
+	return ret;
+}
+
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
 					    struct device_node *dn)
@@ -3081,6 +3283,15 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 		}
 	}
 
+	/* QSPI serial training is required if io_macro clk frequency
+	 * is more than 50MHz. This is due to different PNR and PCB delays,
+	 * serial read data can come with different delays to QPIC. So
+	 * Rx clock should be adjusted according to delays so that Rx Data
+	 * can be captured correctly.
+	 */
+	if (nandc->props->is_serial_nand)
+		qspi_execute_training(nandc, host, mtd);
+
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
 		nand_cleanup(chip);
@@ -3178,6 +3389,10 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 		nandc->iomacro_clk = devm_clk_get(dev, "io_macro");
 		if (IS_ERR(nandc->iomacro_clk))
 			return PTR_ERR(nandc->iomacro_clk);
+
+		ret =  clk_set_rate(nandc->iomacro_clk, 200000000);
+		if (ret)
+			return ret;
 	}
 
 	ret = qcom_nandc_parse_dt(pdev);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
