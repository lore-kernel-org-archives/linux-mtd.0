Return-Path: <SRS0=cnOS=DR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B562AC433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 05:33:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DEBA207FB
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 05:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wjXOFlWX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DEBA207FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPKRGaiVBHHZujXcgmdDrxlcFJgdym05RijU7epPOxI=; b=wjXOFlWXkw+vI5x7xSL4qGzCns
	EisgWYkFBiDUzev6vuHMrL7OJccWBdw0QJgXW3rgpZ2SRx8SOEMl1lfWLU9Zt9oNrXbfDH1HD0Eq8
	5Kd5DRAkBaImtQ0rsHXTMb8aKZK867fHj2sF7DgT/1nFr7/MzNP7pIK8YkID70ExsFsW8uLWOjcjS
	r4uznecKiTsDQYcSooGFR4ekl4V9n+40rEMsMcX6P1yD5kQ5fIrAVaJQlOmKRIHGIeLXqGwz6eOfy
	DN4ceS0KejCaryfIr83h2HF7kkCV7VpsrYCM+oMxkiER5aDexcg+Qq5tvpX9/hseeM2Fd+zetVMmF
	QeO0xCWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kR7UQ-0003eY-64; Sat, 10 Oct 2020 05:32:18 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kR7UJ-0003c1-ME
 for linux-mtd@lists.infradead.org; Sat, 10 Oct 2020 05:32:12 +0000
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 09 Oct 2020 22:32:09 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 09 Oct 2020 22:32:07 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 10 Oct 2020 11:01:44 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 3A99621ADD; Sat, 10 Oct 2020 11:01:43 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] mtd: rawnand: qcom: Enable support for erase,
 read & write for serial nand.
Date: Sat, 10 Oct 2020 11:01:41 +0530
Message-Id: <1602307902-16761-5-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_013211_842488_F57BF44B 
X-CRM114-Status: GOOD (  15.28  )
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

This change will enable support for erase , read & write support for
QSPI serial nand. In QPIC V2.0 onwards, to read last code word new
regiater is introduced. So to read for first three code word we have to
use LOCATION_n register and for last code word we ahve to use LAST_CW_n.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 97 +++++++++++++++++++++++++++++++++------
 1 file changed, 83 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index eabb803..4e8e1dc 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -216,6 +216,7 @@
 #define SPI_HOLD	(1 << 27)
 #define SPI_TRANSFER_MODE_x1	(1 << 29)
 #define SPI_TRANSFER_MODE_x4	(3 << 29)
+#define QPIC_v2_0	0x2
 
 #define nandc_set_read_loc(nandc, reg, offset, size, is_last)	\
 nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
@@ -223,6 +224,12 @@ nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
 	      ((size) << READ_LOCATION_SIZE) |			\
 	      ((is_last) << READ_LOCATION_LAST))
 
+#define nandc_set_read_loc_last(nandc, reg, offset, size, is_last)	\
+nandc_set_reg(nandc, NAND_READ_LOCATION_LAST_CW_##reg,			\
+	      ((offset) << READ_LOCATION_OFFSET) |		\
+	      ((size) << READ_LOCATION_SIZE) |			\
+	      ((is_last) << READ_LOCATION_LAST))
+
 /*
  * Returns the actual register address for all NAND_DEV_ registers
  * (i.e. NAND_DEV_CMD0, NAND_DEV_CMD1, NAND_DEV_CMD2 and NAND_DEV_CMD_VLD)
@@ -352,6 +359,10 @@ struct nandc_regs {
 	__le32 read_location1;
 	__le32 read_location2;
 	__le32 read_location3;
+	__le32 read_location_last0;
+	__le32 read_location_last1;
+	__le32 read_location_last2;
+	__le32 read_location_last3;
 	__le32 spi_cfg;
 	__le32 num_addr_cycle;
 	__le32 busy_wait_cnt;
@@ -685,6 +696,14 @@ static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
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
 	case NAND_FLASH_SPI_CFG:
 		return &regs->spi_cfg;
 	case NAND_SPI_NUM_ADDR_CYCLES:
@@ -734,13 +753,18 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	u32 cmd, cfg0, cfg1, ecc_bch_cfg;
 
+	cmd = (PAGE_ACC | LAST_PAGE);
+
+	if (nandc->props->is_serial_nand)
+		cmd |= (SPI_TRANSFER_MODE_x1 | SPI_WP | SPI_HOLD);
+
 	if (read) {
 		if (host->use_ecc)
-			cmd = OP_PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
+			cmd |= OP_PAGE_READ_WITH_ECC;
 		else
-			cmd = OP_PAGE_READ | PAGE_ACC | LAST_PAGE;
+			cmd |= OP_PAGE_READ;
 	} else {
-		cmd = OP_PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
+		cmd |= OP_PROGRAM_PAGE;
 	}
 
 	if (host->use_ecc) {
@@ -766,9 +790,14 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
-	if (read)
+	if (read) {
+		if (nandc->hw_version >= QPIC_v2_0)
+			nandc_set_read_loc_last(nandc, 0, 0, host->use_ecc ?
+					host->cw_data : host->cw_size, 1);
+
 		nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
 				   host->cw_data : host->cw_size, 1);
+	}
 }
 
 /*
@@ -1143,9 +1172,13 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
 static void
 config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
 {
-	if (nandc->props->is_bam)
+	if (nandc->props->is_bam) {
+		if (nandc->hw_version >= QPIC_v2_0)
+			write_reg_dma(nandc, NAND_READ_LOCATION_LAST_CW_0,
+					4, NAND_BAM_NEXT_SGL);
 		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
 			      NAND_BAM_NEXT_SGL);
+	}
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
@@ -1266,9 +1299,13 @@ static int erase_block(struct qcom_nand_host *host, int page_addr)
 {
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	u32 ers_cmd = OP_BLOCK_ERASE | PAGE_ACC | LAST_PAGE;
 
-	nandc_set_reg(nandc, NAND_FLASH_CMD,
-		      OP_BLOCK_ERASE | PAGE_ACC | LAST_PAGE);
+	if (nandc->props->is_serial_nand) {
+		ers_cmd |= (SPI_WP | SPI_HOLD | SPI_TRANSFER_MODE_x1);
+		page_addr <<= 16;
+	}
+	nandc_set_reg(nandc, NAND_FLASH_CMD, ers_cmd);
 	nandc_set_reg(nandc, NAND_ADDR0, page_addr);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
 	nandc_set_reg(nandc, NAND_DEV0_CFG0,
@@ -1680,16 +1717,32 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (nandc->props->is_bam) {
-		nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
+		if ((nandc->hw_version >= QPIC_v2_0) &&
+			(cw == (ecc->steps - 1)))
+			nandc_set_read_loc_last(nandc, 0, read_loc, data_size1, 0);
+		else
+			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
 		read_loc += data_size1;
 
-		nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
+		if ((nandc->hw_version >= QPIC_v2_0) &&
+			(cw == (ecc->steps - 1)))
+			nandc_set_read_loc_last(nandc, 1, read_loc, oob_size1, 0);
+		else
+			nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
 		read_loc += oob_size1;
 
-		nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
+		if ((nandc->hw_version >= QPIC_v2_0) &&
+			(cw == (ecc->steps - 1)))
+			nandc_set_read_loc_last(nandc, 2, read_loc, data_size2, 0);
+		else
+			nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
 		read_loc += data_size2;
 
-		nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
+		if ((nandc->hw_version >= QPIC_v2_0) &&
+			(cw == (ecc->steps - 1)))
+			nandc_set_read_loc_last(nandc, 3, read_loc, oob_size2, 0);
+		else
+			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
 	}
 
 	config_nand_cw_read(nandc, false);
@@ -1924,10 +1977,26 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 				nandc_set_read_loc(nandc, 1, data_size,
 						   oob_size, 1);
 			} else if (data_buf) {
-				nandc_set_read_loc(nandc, 0, 0, data_size, 1);
+				if (nandc->hw_version >= QPIC_v2_0) {
+					if (i == (ecc->steps - 1))
+						nandc_set_read_loc_last(nandc, 0, 0,
+							data_size, 1);
+					else
+						nandc_set_read_loc(nandc, 0, 0,
+							data_size, 1);
+				} else
+					nandc_set_read_loc(nandc, 0, 0, data_size, 1);
 			} else {
-				nandc_set_read_loc(nandc, 0, data_size,
-						   oob_size, 1);
+				if (nandc->hw_version >= QPIC_v2_0) {
+					if (i == (ecc->steps - 1))
+						nandc_set_read_loc_last(nandc, 0, data_size,
+							oob_size, 1);
+					else
+						nandc_set_read_loc(nandc, 0, data_size,
+							oob_size, 1);
+				} else
+					nandc_set_read_loc(nandc, 0, data_size,
+							oob_size, 1);
 			}
 		}
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
