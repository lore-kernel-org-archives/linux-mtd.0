Return-Path: <SRS0=BfTn=HX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D186AC433DB
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Feb 2021 20:26:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E1064E86
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Feb 2021 20:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79E1064E86
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DQ0uF6q4IoT2phjXr77SsNZ3AJJUOXldeY21A2fl59E=; b=h2j8iSKdpQMGd2lHUtR9LFyOzq
	EJveHlTFYLnlFICJ1KAtHS8/a88NwdCPlb8plihLPXQn2z8iyIQXz4OIWZN9mAXZcKFvVlsYn0+Q6
	z270ghBek4JpYBrBl/6TrQLnAy9MlPSFiDSWtQRmmdDS4wAM9KImQ1A+GQnz6ckmi2S5slixfqCeE
	9gfHsW/50p3Yn2i7YjA4rYol3LQpU4iuFdSLCkh6NxOKysPVIqx881Nnn/FyEcyXZ4q5X6dpRj5G1
	ZfUy62/NyVn9KXxItVJZtf2TyRF//AYdNPa4Ph9S53MuH77cbnkmHL5Jy4JnsbPQYlhI5bT7kte+h
	P6rdkIvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDvIM-00082C-RW; Sun, 21 Feb 2021 20:25:34 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDvIJ-00081b-RM
 for linux-mtd@lists.infradead.org; Sun, 21 Feb 2021 20:25:33 +0000
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 21 Feb 2021 12:25:27 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Feb 2021 12:25:26 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 22 Feb 2021 01:55:03 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 410FA21DAA; Mon, 22 Feb 2021 01:55:03 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, richard@nod.at,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: qcom: Convert nandc to chip in Read/Write helper
Date: Mon, 22 Feb 2021 01:55:01 +0530
Message-Id: <1613939101-23001-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_152532_056939_F76D86F6 
X-CRM114-Status: GOOD (  11.83  )
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

This change will convert nandc to chip in Read/Write helper, this
change is needed because if we wnated to access number of steps
in Read/Write helper then we need to get the chip->ecc.steps,
currentlly its not possible.After this change we can directly
acces chip->ecc.steps in Read/Write helper.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 52 +++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 667e4bf..ae8870ec 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1079,8 +1079,10 @@ static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
  * Helper to prepare DMA descriptors for configuring registers
  * before reading a NAND page.
  */
-static void config_nand_page_read(struct qcom_nand_controller *nandc)
+static void config_nand_page_read(struct nand_chip *chip)
 {
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+
 	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
 	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
 	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
@@ -1094,8 +1096,10 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
  * before reading each codeword in NAND page.
  */
 static void
-config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
+config_nand_cw_read(struct nand_chip *chip, bool use_ecc)
 {
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+
 	if (nandc->props->is_bam)
 		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
 			      NAND_BAM_NEXT_SGL);
@@ -1117,19 +1121,23 @@ config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
  * single codeword in page
  */
 static void
-config_nand_single_cw_page_read(struct qcom_nand_controller *nandc,
+config_nand_single_cw_page_read(struct nand_chip *chip,
 				bool use_ecc)
 {
-	config_nand_page_read(nandc);
-	config_nand_cw_read(nandc, use_ecc);
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+
+	config_nand_page_read(chip);
+	config_nand_cw_read(chip, use_ecc);
 }
 
 /*
  * Helper to prepare DMA descriptors used to configure registers needed for
  * before writing a NAND page.
  */
-static void config_nand_page_write(struct qcom_nand_controller *nandc)
+static void config_nand_page_write(struct nand_chip *chip)
 {
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+
 	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
 	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
 	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
@@ -1140,8 +1148,10 @@ static void config_nand_page_write(struct qcom_nand_controller *nandc)
  * Helper to prepare DMA descriptors for configuring registers
  * before writing each codeword in NAND page.
  */
-static void config_nand_cw_write(struct qcom_nand_controller *nandc)
+static void config_nand_cw_write(struct nand_chip *chip)
 {
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
@@ -1215,7 +1225,7 @@ static int nandc_param(struct qcom_nand_host *host)
 	nandc->buf_count = 512;
 	memset(nandc->data_buffer, 0xff, nandc->buf_count);
 
-	config_nand_single_cw_page_read(nandc, false);
+	config_nand_single_cw_page_read(chip, false);
 
 	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
 		      nandc->buf_count, 0);
@@ -1617,7 +1627,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	clear_bam_transaction(nandc);
 	set_address(host, host->cw_size * cw, page);
 	update_rw_regs(host, 1, true);
-	config_nand_page_read(nandc);
+	config_nand_page_read(chip);
 
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 	oob_size1 = host->bbm_size;
@@ -1645,7 +1655,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
 	}
 
-	config_nand_cw_read(nandc, false);
+	config_nand_cw_read(chip, false);
 
 	read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
 	reg_off += data_size1;
@@ -1856,7 +1866,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 	int i, ret;
 
-	config_nand_page_read(nandc);
+	config_nand_page_read(chip);
 
 	/* queue cmd descs for each codeword */
 	for (i = 0; i < ecc->steps; i++) {
@@ -1884,7 +1894,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 			}
 		}
 
-		config_nand_cw_read(nandc, true);
+		config_nand_cw_read(chip, true);
 
 		if (data_buf)
 			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
@@ -1946,7 +1956,7 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, true);
 
-	config_nand_single_cw_page_read(nandc, host->use_ecc);
+	config_nand_single_cw_page_read(chip, host->use_ecc);
 
 	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
 
@@ -2036,7 +2046,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 
 	host->use_ecc = true;
 	update_rw_regs(host, ecc->steps, false);
-	config_nand_page_write(nandc);
+	config_nand_page_write(chip);
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
@@ -2068,7 +2078,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 				       oob_buf, oob_size, 0);
 		}
 
-		config_nand_cw_write(nandc);
+		config_nand_cw_write(chip);
 
 		data_buf += data_size;
 		oob_buf += oob_size;
@@ -2107,7 +2117,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 
 	host->use_ecc = false;
 	update_rw_regs(host, ecc->steps, false);
-	config_nand_page_write(nandc);
+	config_nand_page_write(chip);
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size1, data_size2, oob_size1, oob_size2;
@@ -2144,7 +2154,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 		write_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
 		oob_buf += oob_size2;
 
-		config_nand_cw_write(nandc);
+		config_nand_cw_write(chip);
 	}
 
 	ret = submit_descs(nandc);
@@ -2191,10 +2201,10 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, false);
 
-	config_nand_page_write(nandc);
+	config_nand_page_write(chip);
 	write_data_dma(nandc, FLASH_BUF_ACC,
 		       nandc->data_buffer, data_size + oob_size, 0);
-	config_nand_cw_write(nandc);
+	config_nand_cw_write(chip);
 
 	ret = submit_descs(nandc);
 
@@ -2270,10 +2280,10 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, false);
 
-	config_nand_page_write(nandc);
+	config_nand_page_write(chip);
 	write_data_dma(nandc, FLASH_BUF_ACC,
 		       nandc->data_buffer, host->cw_size, 0);
-	config_nand_cw_write(nandc);
+	config_nand_cw_write(chip);
 
 	ret = submit_descs(nandc);
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
