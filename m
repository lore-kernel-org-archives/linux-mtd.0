Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47341C432BE
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 05:50:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF13610CD
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 05:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BF13610CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=feYwpaAqKalS3L+5hBzu5a+IRJEyCIXmvMUERqRzR3k=; b=yoVqwIdXL+9+oq
	8A3L9MuKORfQVd5T3l+ZMq8QAs0zrmYwVZ+uGIvfVCr1nEzIg1B4S2qKm2veAF/YWWxwJ0TkSwHlp
	P3sCvobMXuOhNwrRovBgQU5597Ss44oFP5PPibSiJ4O6VSFba4M5y9iQ/qKo75C+oa6/HM1dDjQft
	7rSCuff+4E2B03bOYT1UrGR8qApBeHlwDy0Rx3Z7dJ17mOhjGyLrlEUQAo5rRcTlNHa6m2zFWY2q5
	HHVBB5lwAYnhGpL7uq1zsA5cNI7foKCb7pXMW3wy/7pGDL5ry0aEvZQK0ortMPTyastotDQqDmxOy
	nI9HGpt3sO3GjFybNRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfbj-008aT4-Lr; Thu, 02 Sep 2021 05:49:51 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfbf-008aST-W6
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 05:49:49 +0000
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 01 Sep 2021 22:49:39 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 01 Sep 2021 22:49:38 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg01-blr.qualcomm.com with ESMTP; 02 Sep 2021 11:19:27 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id CA1A922372; Thu,  2 Sep 2021 11:19:25 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: mdalam@codeaurora.org,
	sricharan@codeaurora.org,
	stable@kernel.org
Subject: [PATCH V4] mtd: rawnand: qcom: Update code word value for raw read
Date: Thu,  2 Sep 2021 11:19:23 +0530
Message-Id: <1630561763-18486-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_224948_130619_C0482E4B 
X-CRM114-Status: GOOD (  11.94  )
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

From QPIC V2 onwards there is a separate register to read
last code word "QPIC_NAND_READ_LOCATION_LAST_CW_n".

qcom_nandc_read_cw_raw() is used to read only one code word
at a time. If we will configure number of code words to 1 in
in QPIC_NAND_DEV0_CFG0 register then QPIC controller thinks
its reading the last code word, since from QPIC V2 onwards
we are having separate register to read the last code word,
we have to configure "QPIC_NAND_READ_LOCATION_LAST_CW_n"
register to fetch data from controller buffer to system
memory.

Fixes: 503ee5aa ("mtd: rawnand: qcom: update last code word register")
Cc: stable@kernel.org
Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
[V4]
 * Added commit message
 * Added changelog

 In commit 503ee5aa added QPIC V2 support. Since QPIC V2 onwards there
 is separate register to get last CW data. If total number of CW configred is 1 
 then , QPIC controller treat this as last CW and software shhould copy data to memory
 via QPIC_NAND_READ_LOCATION_LAST_CW_n register instead of QPIC_NAND_READ_LOCATION_n.
 Since in raw read we are configuring total number of CW 1, this change fixes
 this if total number of CW 1 then make this as last CW.  raw_cw = ecc->steps - 1;
 since ecc->steps holds total number of CWs.

 drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index ef0bade..04e6f7b 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1676,13 +1676,17 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	int data_size1, data_size2, oob_size1, oob_size2;
 	int ret, reg_off = FLASH_BUF_ACC, read_loc = 0;
+	int raw_cw = cw;
 
 	nand_read_page_op(chip, page, 0, NULL, 0);
 	host->use_ecc = false;
 
+	if (nandc->props->qpic_v2)
+		raw_cw = ecc->steps - 1;
+
 	clear_bam_transaction(nandc);
 	set_address(host, host->cw_size * cw, page);
-	update_rw_regs(host, 1, true, cw);
+	update_rw_regs(host, 1, true, raw_cw);
 	config_nand_page_read(chip);
 
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
@@ -1711,7 +1715,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		nandc_set_read_loc(chip, cw, 3, read_loc, oob_size2, 1);
 	}
 
-	config_nand_cw_read(chip, false, cw);
+	config_nand_cw_read(chip, false, raw_cw);
 
 	read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
 	reg_off += data_size1;
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
