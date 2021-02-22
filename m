Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59001C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 20:06:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F3E64DF2
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 20:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5F3E64DF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EyOxsjo5utO8xSmzqpi9c3ggLymZT0c3by0j3irOEGQ=; b=E9ReXuUqYwItJhx9i4N3Y+GGiM
	EMJhL1QvWAg4IUvP3Sl3EjdiR9PXeAee96QBMXEubepFP55wkDBfH73chF4QLRiF1TRg0eW1sRe4f
	TgEn9mF4RsGghFf1Z5HwNMLgoZoLIh2iNtZRAlUQVUXmg1BlbU8rsVB8spfwB1LUzdU8ku5XWVJi/
	nOAhNFuMjZ94vEnUlq+/gOdMC9Fhqyo6eW6IoiWg1yqSkLF/PIzEzrwTdVpThBhkqFWd3v1hAbLrO
	SCUU7ayEoMhoZTg/ntJYTggWUEGWPFS+suNf+9WeoIzPZAbWlItw2fSPTCWb33szNQyLCNZr2U9G0
	/uNWr/rQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEHS1-0005tU-Io; Mon, 22 Feb 2021 20:05:01 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEHRu-0005sz-AC
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2021 20:04:55 +0000
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 22 Feb 2021 12:04:50 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 22 Feb 2021 12:04:49 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 23 Feb 2021 01:34:29 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id B28FB21DAD; Tue, 23 Feb 2021 01:34:29 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: qcom: update last code word register
Date: Tue, 23 Feb 2021 01:34:27 +0530
Message-Id: <1614024267-12529-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_150454_483709_68FC90A4 
X-CRM114-Status: GOOD (  16.45  )
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

From QPIC version 2.0 onwards new register got added to read last
codeword. This change will add the READ_LOCATION_LAST_CW_n register.

For first three code word READ_LOCATION_n register will be
use.For last code word READ_LOCATION_LAST_CW_n register will be
use.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 90 +++++++++++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 82d083ad..50fdf55 100644
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
@@ -187,6 +191,11 @@ nandc_set_reg(nandc, reg,			\
 	      ((read_size) << READ_LOCATION_SIZE) |			\
 	      ((is_last_read_loc) << READ_LOCATION_LAST))
 
+#define nandc_set_read_loc_last(nandc, reg, cw_offset, read_size, is_last_read_loc)	\
+nandc_set_reg(nandc, reg,			\
+	      ((cw_offset) << READ_LOCATION_OFFSET) |		\
+	      ((read_size) << READ_LOCATION_SIZE) |			\
+	      ((is_last_read_loc) << READ_LOCATION_LAST))
 /*
  * Returns the actual register address for all NAND_DEV_ registers
  * (i.e. NAND_DEV_CMD0, NAND_DEV_CMD1, NAND_DEV_CMD2 and NAND_DEV_CMD_VLD)
@@ -316,6 +325,10 @@ struct nandc_regs {
 	__le32 read_location1;
 	__le32 read_location2;
 	__le32 read_location3;
+	__le32 read_location_last0;
+	__le32 read_location_last1;
+	__le32 read_location_last2;
+	__le32 read_location_last3;
 
 	__le32 erased_cw_detect_cfg_clr;
 	__le32 erased_cw_detect_cfg_set;
@@ -644,6 +657,14 @@ static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
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
@@ -672,13 +693,19 @@ static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
 			       int cw_offset, int read_size, int is_last_read_loc)
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	int reg_base = NAND_READ_LOCATION_0;
 
-	reg_base += reg * 4;
+	if (nandc->props->qpic_v2 && qcom_nandc_is_last_cw(ecc, cw))
+		reg_base = NAND_READ_LOCATION_LAST_CW_0;
 
-	return nandc_set_read_loc_first(nandc, reg_base, cw_offset,
-			read_size, is_last_read_loc);
+	reg_base += reg * 4;
+	if (nandc->props->qpic_v2 && qcom_nandc_is_last_cw(ecc, cw))
+		return nandc_set_read_loc_last(nandc, reg_base, cw_offset,
+				read_size, is_last_read_loc);
+	else
+		return nandc_set_read_loc_first(nandc, reg_base, cw_offset,
+				read_size, is_last_read_loc);
 }
 
 /* helper to configure address register values */
@@ -700,8 +727,9 @@ static void set_address(struct qcom_nand_host *host, u16 column, int page)
  *
  * @num_cw:		number of steps for the read/write operation
  * @read:		read or write operation
+ * @cw	:		which code word
  */
-static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
+static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, int cw)
 {
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
@@ -740,7 +768,7 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
 	if (read)
-		nandc_set_read_loc(chip, 0, 0, 0, host->use_ecc ?
+		nandc_set_read_loc(chip, cw, 0, 0, host->use_ecc ?
 				   host->cw_data : host->cw_size, 1);
 }
 
@@ -1111,18 +1139,34 @@ static void config_nand_page_read(struct nand_chip *chip)
 		      NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
 }
 
+/* helper to check which location register should be use for this
+ * code word. NAND_READ_LOCATION or NAND_READ_LOCATION_LAST_CW
+ */
+static bool config_loc_last_reg(struct nand_chip *chip, int cw)
+{
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (nandc->props->qpic_v2 && qcom_nandc_is_last_cw(ecc, cw))
+		return true;
+
+	return false;
+}
 /*
  * Helper to prepare DMA descriptors for configuring registers
  * before reading each codeword in NAND page.
  */
 static void
-config_nand_cw_read(struct nand_chip *chip, bool use_ecc)
+config_nand_cw_read(struct nand_chip *chip, bool use_ecc, int cw)
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	int reg = NAND_READ_LOCATION_0;
+
+	if (config_loc_last_reg(chip, cw))
+		reg = NAND_READ_LOCATION_LAST_CW_0;
 
 	if (nandc->props->is_bam)
-		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
-			      NAND_BAM_NEXT_SGL);
+		write_reg_dma(nandc, reg, 4, NAND_BAM_NEXT_SGL);
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
@@ -1142,12 +1186,12 @@ config_nand_cw_read(struct nand_chip *chip, bool use_ecc)
  */
 static void
 config_nand_single_cw_page_read(struct nand_chip *chip,
-				bool use_ecc)
+				bool use_ecc, int cw)
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 
 	config_nand_page_read(chip);
-	config_nand_cw_read(chip, use_ecc);
+	config_nand_cw_read(chip, use_ecc, cw);
 }
 
 /*
@@ -1245,7 +1289,7 @@ static int nandc_param(struct qcom_nand_host *host)
 	nandc->buf_count = 512;
 	memset(nandc->data_buffer, 0xff, nandc->buf_count);
 
-	config_nand_single_cw_page_read(chip, false);
+	config_nand_single_cw_page_read(chip, false, 0);
 
 	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
 		      nandc->buf_count, 0);
@@ -1522,7 +1566,7 @@ static void qcom_nandc_command(struct nand_chip *chip, unsigned int command,
 
 		host->use_ecc = true;
 		set_address(host, 0, page_addr);
-		update_rw_regs(host, ecc->steps, true);
+		update_rw_regs(host, ecc->steps, true, 0);
 		break;
 
 	case NAND_CMD_SEQIN:
@@ -1646,7 +1690,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 
 	clear_bam_transaction(nandc);
 	set_address(host, host->cw_size * cw, page);
-	update_rw_regs(host, 1, true);
+	update_rw_regs(host, 1, true, cw);
 	config_nand_page_read(chip);
 
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
@@ -1675,7 +1719,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		nandc_set_read_loc(chip, cw, 3, read_loc, oob_size2, 1);
 	}
 
-	config_nand_cw_read(chip, false);
+	config_nand_cw_read(chip, false, cw);
 
 	read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
 	reg_off += data_size1;
@@ -1914,7 +1958,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 			}
 		}
 
-		config_nand_cw_read(chip, true);
+		config_nand_cw_read(chip, true, i);
 
 		if (data_buf)
 			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
@@ -1974,9 +2018,9 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 	memset(nandc->data_buffer, 0xff, size);
 
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
-	update_rw_regs(host, 1, true);
+	update_rw_regs(host, 1, true, ecc->steps - 1);
 
-	config_nand_single_cw_page_read(chip, host->use_ecc);
+	config_nand_single_cw_page_read(chip, host->use_ecc, ecc->steps - 1);
 
 	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
 
@@ -2041,7 +2085,7 @@ static int qcom_nandc_read_oob(struct nand_chip *chip, int page)
 
 	host->use_ecc = true;
 	set_address(host, 0, page);
-	update_rw_regs(host, ecc->steps, true);
+	update_rw_regs(host, ecc->steps, true, 0);
 
 	return read_page_ecc(host, NULL, chip->oob_poi, page);
 }
@@ -2065,7 +2109,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	oob_buf = chip->oob_poi;
 
 	host->use_ecc = true;
-	update_rw_regs(host, ecc->steps, false);
+	update_rw_regs(host, ecc->steps, false, 0);
 	config_nand_page_write(chip);
 
 	for (i = 0; i < ecc->steps; i++) {
@@ -2136,7 +2180,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 	oob_buf = chip->oob_poi;
 
 	host->use_ecc = false;
-	update_rw_regs(host, ecc->steps, false);
+	update_rw_regs(host, ecc->steps, false, 0);
 	config_nand_page_write(chip);
 
 	for (i = 0; i < ecc->steps; i++) {
@@ -2219,7 +2263,7 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 				    0, mtd->oobavail);
 
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
-	update_rw_regs(host, 1, false);
+	update_rw_regs(host, 1, false, 0);
 
 	config_nand_page_write(chip);
 	write_data_dma(nandc, FLASH_BUF_ACC,
@@ -2298,7 +2342,7 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 	/* prepare write */
 	host->use_ecc = false;
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
-	update_rw_regs(host, 1, false);
+	update_rw_regs(host, 1, false, ecc->steps - 1);
 
 	config_nand_page_write(chip);
 	write_data_dma(nandc, FLASH_BUF_ACC,
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
