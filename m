Return-Path: <SRS0=UKyU=GN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777AEC433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Jan 2021 04:03:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30B4923119
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Jan 2021 04:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30B4923119
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AL5V9UAsdbUf6/gJG0ImDynoZk+9FV33iE88BPl+21A=; b=ZfoY8gKaBujoByruZgRtLtdkT2
	s8dhJrTGITs1xQQb1BU3FPXeg/9faMk7sYTwIxsanMcVhgHpaz3aWWFEcQ/Rysr18x10B1ikV6Fps
	c17paDnZyoyPBvgcNcW2aD+JwbshkzQoDHPIvFPJOV0fiOUq5YSB195b5Ns6g2X9fMGHfN9VbBj2o
	60nP0bmvBSaKEbqNSGHnYLAeGBBZ1ng/EkNSHBw8p9heP+ar6Adn1zQ5Hk/f9SpsLTMnrJbm8fxte
	dUYfsgjmlWx8hOs4UmbrewIHgH2CXPXtSpqBJWxKTEguncem8hakjdERiBzSA9qrPN3rcz5i63y/6
	ASXdjIqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyRvo-0002ij-CE; Sun, 10 Jan 2021 04:02:20 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyRvg-0002fD-GW
 for linux-mtd@lists.infradead.org; Sun, 10 Jan 2021 04:02:14 +0000
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com)
 ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 09 Jan 2021 20:02:08 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA;
 09 Jan 2021 20:02:07 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 10 Jan 2021 09:31:48 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 654E321BF0; Sun, 10 Jan 2021 09:31:48 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, manivannan.sadhasivam@linaro.org,
 richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3] mtd: rawnand: qcom: update last code word register
Date: Sun, 10 Jan 2021 09:31:45 +0530
Message-Id: <1610251305-20792-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_230212_727325_CDB40766 
X-CRM114-Status: GOOD (  12.18  )
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
read last codeword. This change will update the same.

For first three code word READ_LOCATION_n register will be
use.For last code word READ_LOCATION_LAST_CW_n register will be
use.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
[V3]
 * Added else condition for last code word in update_rw_regs().
 drivers/mtd/nand/raw/qcom_nandc.c | 84 ++++++++++++++++++++++++++++++++-------
 1 file changed, 70 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 667e4bf..50ff6e3 100644
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
@@ -187,6 +191,12 @@ nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
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
@@ -719,9 +741,14 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
-	if (read)
-		nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
-				   host->cw_data : host->cw_size, 1);
+	if (read) {
+		if (nandc->props->qpic_v2)
+			nandc_set_read_loc_last(nandc, 0, 0, host->use_ecc ?
+					host->cw_data : host->cw_size, 1);
+		else
+			nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
+					host->cw_data : host->cw_size, 1);
+	}
 }
 
 /*
@@ -1096,9 +1123,13 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
 static void
 config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
 {
-	if (nandc->props->is_bam)
+	if (nandc->props->is_bam) {
+		if (nandc->props->qpic_v2)
+			write_reg_dma(nandc, NAND_READ_LOCATION_LAST_CW_0,
+				      1, NAND_BAM_NEXT_SGL);
 		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
 			      NAND_BAM_NEXT_SGL);
+	}
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
@@ -1633,16 +1664,28 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (nandc->props->is_bam) {
-		nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
+		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
+			nandc_set_read_loc_last(nandc, 0, read_loc, data_size1, 0);
+		else
+			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
 		read_loc += data_size1;
 
-		nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
+		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
+			nandc_set_read_loc_last(nandc, 1, read_loc, oob_size1, 0);
+		else
+			nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
 		read_loc += oob_size1;
 
-		nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
+		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
+			nandc_set_read_loc_last(nandc, 2, read_loc, data_size2, 0);
+		else
+			nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
 		read_loc += data_size2;
 
-		nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
+		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
+			nandc_set_read_loc_last(nandc, 3, read_loc, oob_size2, 0);
+		else
+			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
 	}
 
 	config_nand_cw_read(nandc, false);
@@ -1873,14 +1916,27 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 
 		if (nandc->props->is_bam) {
 			if (data_buf && oob_buf) {
-				nandc_set_read_loc(nandc, 0, 0, data_size, 0);
-				nandc_set_read_loc(nandc, 1, data_size,
-						   oob_size, 1);
+				if (nandc->props->qpic_v2 && i == (ecc->steps - 1)) {
+					nandc_set_read_loc_last(nandc, 0, 0, data_size, 0);
+					nandc_set_read_loc_last(nandc, 1, data_size,
+								oob_size, 1);
+				} else {
+					nandc_set_read_loc(nandc, 0, 0, data_size, 0);
+					nandc_set_read_loc(nandc, 1, data_size,
+							   oob_size, 1);
+				}
 			} else if (data_buf) {
-				nandc_set_read_loc(nandc, 0, 0, data_size, 1);
+				if (nandc->props->qpic_v2 && i == (ecc->steps - 1))
+					nandc_set_read_loc_last(nandc, 0, 0, data_size, 1);
+				else
+					nandc_set_read_loc(nandc, 0, 0, data_size, 1);
 			} else {
-				nandc_set_read_loc(nandc, 0, data_size,
-						   oob_size, 1);
+				if (nandc->props->qpic_v2 && i == (ecc->steps - 1))
+					nandc_set_read_loc_last(nandc, 0, data_size,
+								oob_size, 1);
+				else
+					nandc_set_read_loc(nandc, 0, data_size,
+							   oob_size, 1);
 			}
 		}
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
