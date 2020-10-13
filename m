Return-Path: <SRS0=Emx/=DU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C8CC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 05:16:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FC1C20872
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 05:16:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jgi1mCRY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="ER8HWGlY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FC1C20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScBY1uScDYJRb5JbWrEX/CHBXgVf2D9mVWdTCk658pM=; b=jgi1mCRYAJLKkWm2cGdjEfvco0
	lXkXh4hojZOX0EZ8nJTdN17vXnfB16CegSYbb0hdZICG+Fvav4uLrj/Tu+BmMpUzVVu+de/nOXdfJ
	j1F5w4to9hiYD3eA8eMf/GEN0mQGiZ/YFNanmnALDz5vs341TxZrLMV+HCMZzp/pTlHD4brV0dWEn
	YQ3BeHm1l8Z09pVbDMUtFTr7GpgO30NeIDyHJMYByddEeujqcgA8tBNMzTs5rFoIIUxXZ5m4/7i+n
	9wx0rMhC8o5dKRqisSHQ3De0VIlgy8rnltmblrwJg4TGVAO/p5UBo263D8CSMKnp1mDl1HhU4zigg
	Wh+6hAAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSCfD-0001nA-NT; Tue, 13 Oct 2020 05:15:55 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSCfB-0001lv-4P
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2020 05:15:53 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602566152; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=g7yty4wQiGADs6xhHAEgb+D0eFjqF2ZONSyPeN59n9U=;
 b=ER8HWGlYZChcVkMt6yatzjuUgk2qReWk1anuANkQjGmwt6Zvey4ADCI/OhQ6KkmhkZW1a7A3
 jQBxZbq019GdRtuYJYL6uBFdCjZ68VQ1SzGzJiSI89RRt2guJrA41qSBIet7UscTeT6BE2Ja
 IckwEFuWZ2nMnpybVy2kWg7CbxE=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f85380642f9861fb124d5de (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 05:15:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 326DEC43382; Tue, 13 Oct 2020 05:15:50 +0000 (UTC)
Received: from kathirav-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kathirav)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A687CC433FE;
 Tue, 13 Oct 2020 05:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A687CC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kathirav@codeaurora.org
From: Kathiravan T <kathirav@codeaurora.org>
To: agross@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org, sivaprak@codeaurora.org,
 peter.ujfalusi@ti.com, boris.brezillon@collabora.com,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] mtd: rawnand: qcom: Support for IPQ6018 QPIC NAND
 controller
Date: Tue, 13 Oct 2020 10:45:23 +0530
Message-Id: <1602566124-13456-3-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602566124-13456-1-git-send-email-kathirav@codeaurora.org>
References: <1602566124-13456-1-git-send-email-kathirav@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_011553_200412_29D2AD86 
X-CRM114-Status: GOOD (  14.31  )
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
Cc: kathirav@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add the compatible string for IPQ6018 QPIC NAND controller
version 1.5.0. It's properties are same as IPQ8074, so reuse
the same.

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index bd7a7251429b..e7480b53ad40 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3071,6 +3071,10 @@ static const struct of_device_id qcom_nandc_of_match[] = {
 		.compatible = "qcom,ipq4019-nand",
 		.data = &ipq4019_nandc_props,
 	},
+	{
+		.compatible = "qcom,ipq6018-nand",
+		.data = &ipq8074_nandc_props,
+	},
 	{
 		.compatible = "qcom,ipq8074-nand",
 		.data = &ipq8074_nandc_props,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
