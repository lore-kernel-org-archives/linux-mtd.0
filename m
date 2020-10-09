Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3ABEC433E7
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 08:19:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D4F822245
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 08:19:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D6ezEyma";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="TLrH4vVj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D4F822245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w1+B88A2L7X0YcDIF+fji+woYTDW8G8+PEb1hhronzc=; b=D6ezEymabXhVZxzYEtS1n0OxiC
	xaHxUB97SN9/D6NawbmiComsxoko+d9skVNksSD8DvvDA4Ffp1mUTP+SxsjObOkKiHcHXtPWUU9CK
	yrY7hrk8Wm9niQ5MbFZ7dOGltX6soTRdV0b4BVGNz9EAy1QqCKhot2xWDPmIa1Lt96S55f85qAY4w
	SrzNUaozyx+WSiWQvDskY3qnfSxc7onizrB12BcnJUzbzySdGZD+3U4KtBQbJpbehsGqxlQ4aOfA/
	/Ca4XKJ5lMrV2qrispKmoiSYFIrjvY0Qh676s1lFxoxR6eGmkdLxLxAfMxD/vYwSKSxE2F9DInnmn
	ieJh3WEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQnbY-0001q9-LC; Fri, 09 Oct 2020 08:18:20 +0000
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQnbT-0001p2-6h
 for linux-mtd@lists.infradead.org; Fri, 09 Oct 2020 08:18:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602231494; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=75E1HKPsei40eEw+eHRkIo0miSo6IqCWxY6d9GK39LU=;
 b=TLrH4vVjVNTr8awI/D09GXyzisQkU7brK8Jmq2mGe6n8XEb36IEQAjL1VqZ/aXeSM3hfn5Na
 /Frxd74bZ8SfUnAyDJdQ5o0eL4d2rJyUR3kaIReS6k3zZZi90bNwpSoJZCvbswUTJy6Mv9+x
 xIzGBn10boiiJf9zxe4aWbh8EYA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f801a6c52f4fccef03e2ce0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 08:08:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3E7EAC433F1; Fri,  9 Oct 2020 08:08:11 +0000 (UTC)
Received: from ipkumar-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ipkumar)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FF1BC43382;
 Fri,  9 Oct 2020 08:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8FF1BC43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=ipkumar@codeaurora.org
From: Praveenkumar I <ipkumar@codeaurora.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sivaprak@codeaurora.org, peter.ujfalusi@ti.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: qcom: Fix DMA sync on FLASH_STATUS register read
Date: Fri,  9 Oct 2020 13:37:52 +0530
Message-Id: <1602230872-25616-1-git-send-email-ipkumar@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_041815_268225_A6525006 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: kathirav@codeaurora.org, Praveenkumar I <ipkumar@codeaurora.org>,
 stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

After each codeword NAND_FLASH_STATUS is read for possible operational
failures. But there is no DMA sync for CPU operation before reading it
and this leads to incorrect or older copy of DMA buffer in reg_read_buf.

This patch adds the DMA sync on reg_read_buf for CPU before reading it.

Fixes: 5bc36b2bf6e2 ("mtd: rawnand: qcom: check for operation errors in case of raw read")
Signed-off-by: Praveenkumar I <ipkumar@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index bd7a7251429b..5bb85f1ba84c 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1570,6 +1570,8 @@ static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	int i;
 
+	nandc_read_buffer_sync(nandc, true);
+
 	for (i = 0; i < cw_cnt; i++) {
 		u32 flash = le32_to_cpu(nandc->reg_read_buf[i]);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
