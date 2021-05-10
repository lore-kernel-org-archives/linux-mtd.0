Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4060AC4363C
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:31:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF37560E0B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF37560E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yqGNpypQflJryElz/BH9gADgiA4Xt7erZqUv2doKljg=; b=g3iu2W0NeLjOh5CpfoAHxtuxGE
	d6u5mhAfeTK++5z++0zeQNIYt/GHr8gTfzG3b6PH+qFV7F+f2OSHLXaHmiUfQsJvi7Sv2BH67HxnD
	0wFUwHpqOueqUKBqNwByv9ms8jv+b4SM4peloxQ5nc8j3eXLuDVO1Hxk/blsZR4IEPaogiozgnrz1
	Jhri8LBBrquGH70GAYwQ2tQ8eB/TVGCzotJSDOeEWGZVfP7HOd7ifUhyEWybkEZHX9vtx5rEb0ahL
	f5WwN7ZWbXYMMotkEWOONXRPZxmDTqcfK5R5TZGNjXY8cCINv2NMpUFBcLiYoAh9uR5sFgFtEbYQh
	/9MCJPFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg46l-00E5aS-RV; Mon, 10 May 2021 11:29:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3b9-00E1EF-Fb
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=4xOMdtMSdK3EDu/vRJPSmTvG+5YJFJ5EnBaroEbp4/I=; b=VAHqAwUGuJ9XQhnjybjETwwzaj
 Dk7ti+D9AKp6N+uOTq1ztaYzzCGeP4HOPLab/tEjdR1skWu91nRxcDlsAN4b/aRAUPvdA+TWbuSLn
 YN6BTFaOjCFBAIDffVwvDWjTHKnoSSf6kJRLinEVe+c18yvGF2W+NvYfynJY+TSES4I2BW20mOUAg
 NBDHCW0DYZMD6CZRW4RfoBxXUWlmCDBgAvgSKWei09qREeKHE86rMRYZSq3Qd3YLEmAQ+BO7ijZ4U
 B7SPzsrZRtEKAyGaXJycm0xeGJIzq6N3zoGyIXL+2p1jaiAtnsNtv9GFeQpKmwCaGehJ5oLbuIJjp
 uSOrYkLw==;
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3b6-008aB5-NY
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:57:14 +0000
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 10 May 2021 03:57:09 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 10 May 2021 03:57:09 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 10 May 2021 16:26:50 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id D0E6120DF0; Mon, 10 May 2021 16:26:48 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: mdalam@codeaurora.org,
	sricharan@codeaurora.org
Subject: [PATCH V2] mtd: rawnand: qcom: avoid writing to obsolete register
Date: Mon, 10 May 2021 16:26:46 +0530
Message-Id: <1620644206-2250-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_035712_866569_B7FA1DF6 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QPIC_EBI2_ECC_BUF_CFG register got obsolete from QPIC V2.0 onwards.
Avoid writing this register if QPIC version is V2.0 or newer.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
[V2]
 * Updated commit message
 drivers/mtd/nand/raw/qcom_nandc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index a64fb6c..32f4641 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -762,7 +762,8 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
 	nandc_set_reg(chip, NAND_DEV0_CFG0, cfg0);
 	nandc_set_reg(chip, NAND_DEV0_CFG1, cfg1);
 	nandc_set_reg(chip, NAND_DEV0_ECC_CFG, ecc_bch_cfg);
-	nandc_set_reg(chip, NAND_EBI2_ECC_BUF_CFG, host->ecc_buf_cfg);
+	if (!nandc->props->qpic_v2)
+		nandc_set_reg(chip, NAND_EBI2_ECC_BUF_CFG, host->ecc_buf_cfg);
 	nandc_set_reg(chip, NAND_FLASH_STATUS, host->clrflashstatus);
 	nandc_set_reg(chip, NAND_READ_STATUS, host->clrreadstatus);
 	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
@@ -1133,7 +1134,8 @@ static void config_nand_page_read(struct nand_chip *chip)
 
 	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
 	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
-	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
+	if (!nandc->props->qpic_v2)
+		write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
 	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
 	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1,
 		      NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
@@ -1191,8 +1193,9 @@ static void config_nand_page_write(struct nand_chip *chip)
 
 	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
 	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
-	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
-		      NAND_BAM_NEXT_SGL);
+	if (!nandc->props->qpic_v2)
+		write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
+			      NAND_BAM_NEXT_SGL);
 }
 
 /*
@@ -1248,7 +1251,8 @@ static int nandc_param(struct qcom_nand_host *host)
 					| 2 << WR_RD_BSY_GAP
 					| 0 << WIDE_FLASH
 					| 1 << DEV0_CFG1_ECC_DISABLE);
-	nandc_set_reg(chip, NAND_EBI2_ECC_BUF_CFG, 1 << ECC_CFG_ECC_DISABLE);
+	if (!nandc->props->qpic_v2)
+		nandc_set_reg(chip, NAND_EBI2_ECC_BUF_CFG, 1 << ECC_CFG_ECC_DISABLE);
 
 	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
 	if (!nandc->props->qpic_v2) {
@@ -2689,7 +2693,8 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 				| ecc_mode << ECC_MODE
 				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_BCH;
 
-	host->ecc_buf_cfg = 0x203 << NUM_STEPS;
+	if (!nandc->props->qpic_v2)
+		host->ecc_buf_cfg = 0x203 << NUM_STEPS;
 
 	host->clrflashstatus = FS_READY_BSY_N;
 	host->clrreadstatus = 0xc0;
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
