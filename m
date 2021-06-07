Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5284EC47082
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 09:57:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 115626023B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 09:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 115626023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1kbPuLp33SHGWN1xfzRCTjyvFs7vM8AxeyiepTgWviw=; b=D+Y6VmkIastQd8
	PzTgsZO0g5d/6hB4EKgEEzft8QqC5FCFs8AdiUqNqkegM8jRnq5sYTPiUUc2dl0BNQDXgqsiWsQsp
	EwZ2a9u01hKKkdx0AClmu8y6rgtK73/RcAtIRPwdw0PpZouQUxRC4qeQKzK4JZSB0q6i1tuLv6ia+
	P6DBEJuwSA7ZErzdBIUTL7HwH4iws54P36imGQM/cZIzwPGVpvbPvEHBplniCapsdXNVnVhBI3sTA
	F2kMrAfjJZzCtR2BqVkGq6cxv7wAlrsEJWn9TF5A08HYQm1JN3+s0vY29m5iTUd2D4d72Z+H2Jnju
	Bvp6xxfE0ygQs+LLgO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqBzf-002kLy-AE; Mon, 07 Jun 2021 09:56:27 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqBne-002gLl-1I
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 09:44:03 +0000
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 07 Jun 2021 02:43:57 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 07 Jun 2021 02:43:55 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 07 Jun 2021 15:13:41 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 93E78220D9; Mon,  7 Jun 2021 15:13:39 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: mdalam@codeaurora.org,
	sricharan@codeaurora.org
Subject: [PATCH V3] mtd: rawnand: qcom: avoid writing to obsolete register
Date: Mon,  7 Jun 2021 15:13:37 +0530
Message-Id: <1623059017-5058-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_024402_177728_9DD2E5B8 
X-CRM114-Status: UNSURE (   9.41  )
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

Also fixed nandc undeclared issue reported by,

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
[V3]
 * Fixed nandc undeclared issue.
 drivers/mtd/nand/raw/qcom_nandc.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index a64fb6c..ee5985d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -734,6 +734,7 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
 {
 	struct nand_chip *chip = &host->chip;
 	u32 cmd, cfg0, cfg1, ecc_bch_cfg;
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 
 	if (read) {
 		if (host->use_ecc)
@@ -762,7 +763,8 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
 	nandc_set_reg(chip, NAND_DEV0_CFG0, cfg0);
 	nandc_set_reg(chip, NAND_DEV0_CFG1, cfg1);
 	nandc_set_reg(chip, NAND_DEV0_ECC_CFG, ecc_bch_cfg);
-	nandc_set_reg(chip, NAND_EBI2_ECC_BUF_CFG, host->ecc_buf_cfg);
+	if (!nandc->props->qpic_v2)
+		nandc_set_reg(chip, NAND_EBI2_ECC_BUF_CFG, host->ecc_buf_cfg);
 	nandc_set_reg(chip, NAND_FLASH_STATUS, host->clrflashstatus);
 	nandc_set_reg(chip, NAND_READ_STATUS, host->clrreadstatus);
 	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
@@ -1133,7 +1135,8 @@ static void config_nand_page_read(struct nand_chip *chip)
 
 	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
 	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
-	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
+	if (!nandc->props->qpic_v2)
+		write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
 	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
 	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1,
 		      NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
@@ -1191,8 +1194,9 @@ static void config_nand_page_write(struct nand_chip *chip)
 
 	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
 	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
-	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
-		      NAND_BAM_NEXT_SGL);
+	if (!nandc->props->qpic_v2)
+		write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
+			      NAND_BAM_NEXT_SGL);
 }
 
 /*
@@ -1248,7 +1252,8 @@ static int nandc_param(struct qcom_nand_host *host)
 					| 2 << WR_RD_BSY_GAP
 					| 0 << WIDE_FLASH
 					| 1 << DEV0_CFG1_ECC_DISABLE);
-	nandc_set_reg(chip, NAND_EBI2_ECC_BUF_CFG, 1 << ECC_CFG_ECC_DISABLE);
+	if (!nandc->props->qpic_v2)
+		nandc_set_reg(chip, NAND_EBI2_ECC_BUF_CFG, 1 << ECC_CFG_ECC_DISABLE);
 
 	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
 	if (!nandc->props->qpic_v2) {
@@ -2689,7 +2694,8 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
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
