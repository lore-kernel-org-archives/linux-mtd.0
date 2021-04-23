Return-Path: <SRS0=ovMs=JU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A34BC433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 19:22:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9142E6115C
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 19:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9142E6115C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1RUhJjBdbsSHvNMHUKNUMrO+pP6d6lm4MpMkyZ6MTW8=; b=rJieMe4Q/ixYv0ahKPo6xwYJG9
	9jUBDDjxN2TSZs7KF1xu8AG5ispI8Ni+wu3UZtN5TiMTA1TF5DRaPmpn8q0PjLkW7FZtcGXY2IYSV
	E+lr0bDoNiat/Q9lXPkiuAcG724LvaGBIbPeH++TOD2wFIZMVuxdZzVvGy6O1WUNHi3iY/NMzk3X7
	a0opA5QFy77lLHM91hxDUFHiX4Z0GYiVhiVVLy3ebq8GqlFM0A1FW9A65efhcgbeMPdA6fplUj7uo
	8l/Boclb4g34eN9kfwLccxiQzEv0xTkKndwwvSw+/vx327uqOWVcLDHl6LdRkZJRP/VMvhIHicAZ7
	jt3711QA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la1NQ-002DgQ-Uq; Fri, 23 Apr 2021 19:22:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la1NN-002DgF-Pi
 for linux-mtd@desiato.infradead.org; Fri, 23 Apr 2021 19:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=84NqPdXLzsyx+KTNzYncw6ZYiE15LcwawWh5N8HNYkg=; b=b/sZDWzIA/cUiecIeCjoeTRgmf
 PQSjzI0O0LB02bIDcr0LLNQaF9veEweZ3kGBL4L4j42puUbRrfg1HZK/HB5BjAd21IHGkcgUwTjj2
 7rEQUi7JUERCj6R3rBA1WZQ8PrXMmCNSxgehDhrCfG12nZUx21IptnRzyib1PHTWipQdqTx6OmKrF
 iFugOP6U+ZObMzTBiiJfIitjvfov1Y3iPFnKiNDXqcl0uehE2KG34axca6m0uSXsLijYiS3frA3pX
 QmSSdOe0JJoaQFTxBew6m1o2ON5WCI0ews2j22jlAzVnjr/iXfy/kKTHrK16Vw8bMeR1PLyV01Pk1
 EB4nfL8A==;
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la1NL-00EexR-5c
 for linux-mtd@lists.infradead.org; Fri, 23 Apr 2021 19:22:04 +0000
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 23 Apr 2021 12:21:58 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Apr 2021 12:21:57 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 24 Apr 2021 00:51:38 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id E7CBB21D5F; Sat, 24 Apr 2021 00:51:37 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: mdalam@codeaurora.org,
	sricharan@codeaurora.org
Subject: [PATCH] mtd: rawnand: qcom: avoid write to obsolete register
Date: Sat, 24 Apr 2021 00:51:34 +0530
Message-Id: <1619205694-25645-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_122203_293173_A5EFFB35 
X-CRM114-Status: UNSURE (   7.87  )
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
 drivers/mtd/nand/raw/qcom_nandc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index fd4c318..8c5205c 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -714,7 +714,8 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	nandc_set_reg(nandc, NAND_DEV0_CFG0, cfg0);
 	nandc_set_reg(nandc, NAND_DEV0_CFG1, cfg1);
 	nandc_set_reg(nandc, NAND_DEV0_ECC_CFG, ecc_bch_cfg);
-	nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, host->ecc_buf_cfg);
+	if (!nandc->props->qpic_v2)
+		nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, host->ecc_buf_cfg);
 	nandc_set_reg(nandc, NAND_FLASH_STATUS, host->clrflashstatus);
 	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
@@ -1083,7 +1084,8 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
 {
 	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
 	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
-	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
+	if (!nandc->props->qpic_v2)
+		write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
 	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
 	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1,
 		      NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
@@ -1132,8 +1134,9 @@ static void config_nand_page_write(struct qcom_nand_controller *nandc)
 {
 	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
 	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
-	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
-		      NAND_BAM_NEXT_SGL);
+	if (!nandc->props->qpic_v2)
+		write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
+			      NAND_BAM_NEXT_SGL);
 }
 
 /*
@@ -1187,7 +1190,8 @@ static int nandc_param(struct qcom_nand_host *host)
 					| 2 << WR_RD_BSY_GAP
 					| 0 << WIDE_FLASH
 					| 1 << DEV0_CFG1_ECC_DISABLE);
-	nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, 1 << ECC_CFG_ECC_DISABLE);
+	if (!nandc->props->qpic_v2)
+		nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, 1 << ECC_CFG_ECC_DISABLE);
 
 	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
 	if (!nandc->props->qpic_v2) {
@@ -2628,7 +2632,8 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
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
