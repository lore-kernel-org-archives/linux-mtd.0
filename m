Return-Path: <SRS0=cnOS=DR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3033FC43457
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 05:33:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D37C4207FB
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 05:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K5T3/QC2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D37C4207FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QWxwL5rjj8oURhd/1huarI2kKD46d/9cGKMkEUr9v0=; b=K5T3/QC23iUjKOglV/6jPZ7Zd7
	qNI1P5cxcEgwSmNaOTRxxFpKuu3OvBUPfd8WO4zjc+Jq8lnsmhMbFzCYF3NZYCJg0z2wjMkYEC1+D
	wrcA0KDVqMydG7ydaJvgMF0xAB4RrRwDOSTBbviUhn+rv0P5PI/OYVNe9RQaRzNyHqQg3cUekf09N
	zdljqZl2bOIBhEffchUEdFm2BFcnfOxo3MhcglsFGyoOnkszZbFRxX2GP3aojiTdOv7ZiisP9r/Gm
	6B+wElN5dB1zJt5GXx7cDZ1Qu5QKyYyhTIW0eR8E139MwJIhSmEnxdv/dr3hzeH3QjE4j0BKCaqYV
	+cdX2wDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kR7UT-0003f0-Ce; Sat, 10 Oct 2020 05:32:21 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kR7UK-0003c2-CO
 for linux-mtd@lists.infradead.org; Sat, 10 Oct 2020 05:32:13 +0000
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 09 Oct 2020 22:32:10 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 09 Oct 2020 22:32:08 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 10 Oct 2020 11:01:44 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 19D3421ADC; Sat, 10 Oct 2020 11:01:43 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] mtd: rawnand: qcom: Read QPIC version
Date: Sat, 10 Oct 2020 11:01:40 +0530
Message-Id: <1602307902-16761-4-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_013212_534867_C689CB90 
X-CRM114-Status: GOOD (  12.29  )
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

This change will add support to read QPIC version.
QPIC version V2.0 onwards some new register introduced
in QPIC. So based on hw_version we will update those
register.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index f5064ab..eabb803 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -443,6 +443,7 @@ struct qcom_nand_controller {
 
 	u32 cmd1, vld;
 	const struct qcom_nandc_props *props;
+	u32 hw_version;
 };
 
 /*
@@ -2538,6 +2539,7 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	int ecc_mode = 1;
 	int num_addr_cycle = 5, dsbl_sts_aftr_write = 0;
 	int wr_rd_bsy_gap = 2, recovery_cycle = 7;
+	u32 version_reg;
 
 	/* controller only supports 512 bytes data steps */
 	ecc->size = NANDC_STEP_SIZE;
@@ -2545,6 +2547,26 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	cwperpage = mtd->writesize / NANDC_STEP_SIZE;
 
 	/*
+	 * Read the required ecc strength from NAND device and overwrite the
+	 * device tree ecc strength
+	 */
+	if (chip->base.eccreq.strength >= 8)
+		ecc->strength = 8;
+
+	/* Read QPIC version register */
+	if (nandc->props->is_serial_nand)
+		version_reg = (NAND_VERSION + 0x4000);
+	else
+		version_reg = NAND_VERSION;
+	nandc->hw_version = nandc_read(nandc, version_reg);
+	pr_debug("QPIC controller hw version Major:%d, Minor:%d\n",
+		((nandc->hw_version & NAND_VERSION_MAJOR_MASK)
+		 >> NAND_VERSION_MAJOR_SHIFT),
+		((nandc->hw_version & NAND_VERSION_MINOR_MASK)
+		 >> NAND_VERSION_MINOR_SHIFT));
+	nandc->hw_version = ((nandc->hw_version & NAND_VERSION_MAJOR_MASK)
+			>> NAND_VERSION_MAJOR_SHIFT);
+	/*
 	 * Each CW has 4 available OOB bytes which will be protected with ECC
 	 * so remaining bytes can be used for ECC.
 	 */
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
