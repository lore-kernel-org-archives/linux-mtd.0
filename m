Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB39C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 19:18:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8CCA64E13
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 19:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8CCA64E13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wH2kcdXSgRaG7rAaQJzJQ1A1mgq0LTW1S9wAwHvuMWg=; b=p57rLxrtVafvnMQvDrS2rqvz4E
	TUkChi204qdXGNsGQ055+yRnWD/D1i6p0kZw69rQi1o3meCV1Aj35NNEKxkFGngIeXjc8rjrvG/bu
	sTbDF1yJlxzKC8qSHClMeVz+XgC8zt9qVq2uj7YwngZQWUNJLmCegigMm6Tw9yFgBq5sZhCY8k79p
	dficBz9GZz/N/tKs98flnRKy6kRk1FBnCciCb2FGNdWG391UEXHsbIpkqCc8ZLfQ49LcXSZPNqvHC
	Obg/0aia8EGIF+7PyqGWkorFp6dhc92rm0qATUOXohKEy9pEcW7WdRk8t/R32lXtictskH6Z0Nhj8
	WvLwcyAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBjMw-0008O3-Mt; Mon, 15 Feb 2021 19:17:14 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBjMu-0008Nc-Av
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 19:17:13 +0000
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 15 Feb 2021 11:17:08 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 15 Feb 2021 11:17:06 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg01-blr.qualcomm.com with ESMTP; 16 Feb 2021 00:46:46 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id A368421D78; Tue, 16 Feb 2021 00:46:44 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, richard@nod.at, boris.brezillon@collabora.com,
 mani@kernel.org, krzk@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: qcom: update last code word register
Date: Tue, 16 Feb 2021 00:46:42 +0530
Message-Id: <1613416602-1175-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_141712_522855_41F32111 
X-CRM114-Status: GOOD (  16.14  )
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

From QPIC version 2.0 onwards new register got added to
read last codeword. This change will add the READ_LOCATION_LAST_CW_n
register.

For first three code word READ_LOCATION_n register will be
use.For last code word READ_LOCATION_LAST_CW_n register will be
use.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
[V6]
 * Updated write_reg_dma() function in "v6"
 * Removed extra indentation level in read_page_ecc() to read last code word in "v6"
 * Removed boolean check in config_nand_cw_read() in "v6"
 drivers/mtd/nand/raw/qcom_nandc.c | 118 ++++++++++++++++++++++++++++----------
 1 file changed, 87 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 667e4bf..bae352f 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -48,6 +48,10 @@
 #define	NAND_READ_LOCATION_1		0xf24
 #define	NAND_READ_LOCATION_2		0xf28
 #define	NAND_READ_LOCATION_3		0xf2c
+#define	NAND_READ_LOCATION_LAST_CW_0	0xf40
+#define	NAND_READ_LOCATION_LAST_CW_1	0xf44
+#define	NAND_READ_LOCATION_LAST_CW_2	0xf48
+#define	NAND_READ_LOCATION_LAST_CW_3	0xf4c
 
 /* dummy register offsets, used by write_reg_dma */
 #define	NAND_DEV_CMD1_RESTORE		0xdead
@@ -181,8 +185,14 @@
 #define	ECC_BCH_4BIT	BIT(2)
 #define	ECC_BCH_8BIT	BIT(3)
 
-#define nandc_set_read_loc(nandc, reg, offset, size, is_last)	\
-nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
+#define nandc_set_read_loc_first(nandc, reg, offset, size, is_last)	\
+nandc_set_reg(nandc, reg,					\
+	      ((offset) << READ_LOCATION_OFFSET) |		\
+	      ((size) << READ_LOCATION_SIZE) |			\
+	      ((is_last) << READ_LOCATION_LAST))
+
+#define nandc_set_read_loc_last(nandc, reg, offset, size, is_last)	\
+nandc_set_reg(nandc, reg,					\
 	      ((offset) << READ_LOCATION_OFFSET) |		\
 	      ((size) << READ_LOCATION_SIZE) |			\
 	      ((is_last) << READ_LOCATION_LAST))
@@ -316,6 +326,10 @@ struct nandc_regs {
 	__le32 read_location1;
 	__le32 read_location2;
 	__le32 read_location3;
+	__le32 read_location_last0;
+	__le32 read_location_last1;
+	__le32 read_location_last2;
+	__le32 read_location_last3;
 
 	__le32 erased_cw_detect_cfg_clr;
 	__le32 erased_cw_detect_cfg_set;
@@ -644,6 +658,14 @@ static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
 		return &regs->read_location2;
 	case NAND_READ_LOCATION_3:
 		return &regs->read_location3;
+	case NAND_READ_LOCATION_LAST_CW_0:
+		return &regs->read_location_last0;
+	case NAND_READ_LOCATION_LAST_CW_1:
+		return &regs->read_location_last1;
+	case NAND_READ_LOCATION_LAST_CW_2:
+		return &regs->read_location_last2;
+	case NAND_READ_LOCATION_LAST_CW_3:
+		return &regs->read_location_last3;
 	default:
 		return NULL;
 	}
@@ -661,6 +683,26 @@ static void nandc_set_reg(struct qcom_nand_controller *nandc, int offset,
 		*reg = cpu_to_le32(val);
 }
 
+/* helper to configure location register values */
+static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
+			       int offset, int size, int is_last)
+{
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	int loc = NAND_READ_LOCATION_0;
+
+	if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
+		loc = NAND_READ_LOCATION_LAST_CW_0;
+
+	loc += reg * 4;
+
+	if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
+		return nandc_set_read_loc_last(nandc, loc, offset, size, is_last);
+	else
+		return nandc_set_read_loc_first(nandc, loc, offset, size, is_last);
+}
+
 /* helper to configure address register values */
 static void set_address(struct qcom_nand_host *host, u16 column, int page)
 {
@@ -685,6 +727,7 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 {
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	u32 cmd, cfg0, cfg1, ecc_bch_cfg;
 
 	if (read) {
@@ -719,9 +762,14 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
-	if (read)
-		nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
-				   host->cw_data : host->cw_size, 1);
+	if (read) {
+		if (nandc->props->qpic_v2)
+			nandc_set_read_loc(chip, ecc->steps - 1, 0, 0, host->use_ecc ?
+					host->cw_data : host->cw_size, 1);
+		else
+			nandc_set_read_loc(chip, 0, 0, 0, host->use_ecc ?
+					host->cw_data : host->cw_size, 1);
+	}
 }
 
 /*
@@ -1079,8 +1127,10 @@ static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
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
@@ -1094,11 +1144,19 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
  * before reading each codeword in NAND page.
  */
 static void
-config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
+config_nand_cw_read(struct nand_chip *chip, bool use_ecc, int cw)
 {
-	if (nandc->props->is_bam)
-		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
-			      NAND_BAM_NEXT_SGL);
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (nandc->props->is_bam) {
+		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
+			write_reg_dma(nandc, NAND_READ_LOCATION_LAST_CW_0, 4,
+				      NAND_BAM_NEXT_SGL);
+		else
+			write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
+				      NAND_BAM_NEXT_SGL);
+	}
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
@@ -1117,11 +1175,11 @@ config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
  * single codeword in page
  */
 static void
-config_nand_single_cw_page_read(struct qcom_nand_controller *nandc,
-				bool use_ecc)
+config_nand_single_cw_page_read(struct nand_chip *chip,
+				bool use_ecc, int cw)
 {
-	config_nand_page_read(nandc);
-	config_nand_cw_read(nandc, use_ecc);
+	config_nand_page_read(chip);
+	config_nand_cw_read(chip, use_ecc, cw);
 }
 
 /*
@@ -1205,7 +1263,7 @@ static int nandc_param(struct qcom_nand_host *host)
 		nandc_set_reg(nandc, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
 	}
 
-	nandc_set_read_loc(nandc, 0, 0, 512, 1);
+	nandc_set_read_loc(chip, 0, 0, 0, 512, 1);
 
 	if (!nandc->props->qpic_v2) {
 		write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
@@ -1215,7 +1273,7 @@ static int nandc_param(struct qcom_nand_host *host)
 	nandc->buf_count = 512;
 	memset(nandc->data_buffer, 0xff, nandc->buf_count);
 
-	config_nand_single_cw_page_read(nandc, false);
+	config_nand_single_cw_page_read(chip, false, 0);
 
 	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
 		      nandc->buf_count, 0);
@@ -1617,7 +1675,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	clear_bam_transaction(nandc);
 	set_address(host, host->cw_size * cw, page);
 	update_rw_regs(host, 1, true);
-	config_nand_page_read(nandc);
+	config_nand_page_read(chip);
 
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 	oob_size1 = host->bbm_size;
@@ -1633,19 +1691,19 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (nandc->props->is_bam) {
-		nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
+		nandc_set_read_loc(chip, cw, 0, read_loc, data_size1, 0);
 		read_loc += data_size1;
 
-		nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
+		nandc_set_read_loc(chip, cw, 1, read_loc, oob_size1, 0);
 		read_loc += oob_size1;
 
-		nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
+		nandc_set_read_loc(chip, cw, 2, read_loc, data_size2, 0);
 		read_loc += data_size2;
 
-		nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
+		nandc_set_read_loc(chip, cw, 3, read_loc, oob_size2, 1);
 	}
 
-	config_nand_cw_read(nandc, false);
+	config_nand_cw_read(chip, false, cw);
 
 	read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
 	reg_off += data_size1;
@@ -1856,7 +1914,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 	int i, ret;
 
-	config_nand_page_read(nandc);
+	config_nand_page_read(chip);
 
 	/* queue cmd descs for each codeword */
 	for (i = 0; i < ecc->steps; i++) {
@@ -1873,18 +1931,16 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 
 		if (nandc->props->is_bam) {
 			if (data_buf && oob_buf) {
-				nandc_set_read_loc(nandc, 0, 0, data_size, 0);
-				nandc_set_read_loc(nandc, 1, data_size,
-						   oob_size, 1);
+				nandc_set_read_loc(chip, i, 0, 0, data_size, 0);
+				nandc_set_read_loc(chip, i, 1, data_size, oob_size, 1);
 			} else if (data_buf) {
-				nandc_set_read_loc(nandc, 0, 0, data_size, 1);
+				nandc_set_read_loc(chip, i, 0, 0, data_size, 1);
 			} else {
-				nandc_set_read_loc(nandc, 0, data_size,
-						   oob_size, 1);
+				nandc_set_read_loc(chip, i, 0, data_size, oob_size, 1);
 			}
 		}
 
-		config_nand_cw_read(nandc, true);
+		config_nand_cw_read(chip, true, i);
 
 		if (data_buf)
 			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
@@ -1946,7 +2002,7 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, true);
 
-	config_nand_single_cw_page_read(nandc, host->use_ecc);
+	config_nand_single_cw_page_read(chip, host->use_ecc, ecc->steps - 1);
 
 	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
