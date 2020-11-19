Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AF8C388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 07:14:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E97E7246B8
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 07:14:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xWdgKho5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G/p2/8Tg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E97E7246B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkF2v/dgvVgwxcdljHkdzy+a5LOvXUP/aOz8PPRkrjw=; b=xWdgKho5LwGT9rMrW6r7wSsFTm
	puIaDQyZe2/IHBJOiFUtNt42Ct7bcP55dBOgOuojooqpyvp+EMPV17fgJsufxlS5tW5oC1MTJyq7n
	m3f13m9kOhCOFpP/bYmH6OnZD3D76Cw7XM6oms6T6rurqJqsN27GCJRHfmgQ0mo7y+ldq8KGs/mCo
	oELw0IJB843vJ3REHtImXcN6ICGJk9HvvdXARuK7zEMfVF1OpuYaDKYbffjo618mWe44IwTWEH5O0
	/4GWhzDRx5wgLKyNDvsJhPzJtpaing6TyPZ997EfDKClwhW2d8YGRgDBJE3MivoOopN8V8Mbw9gOB
	n0FTCWWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfe8Y-0005p7-W6; Thu, 19 Nov 2020 07:13:47 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfe8V-0005o2-8M
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 07:13:45 +0000
Received: by mail-pf1-x443.google.com with SMTP id i8so3565958pfk.10
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2020 23:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=268k75iGgPwajGOaY5d0Of03PhQtD6bYvRMlc9HmW4g=;
 b=G/p2/8TgOM+86w/05s8sQwFulz0SPcg1s110p4Y5VrMY53CxA7P1YrGyKhG8Hcevmo
 x9+HHdxGxVPrZLI4GxC6iCh0/mFSGTuBemeeyhMyrNbER+aYPclv7+p6GCoqJG78exmw
 PDFtAvEB39hnhS5L93Qcpd8rN78NDXuOfrhqiZ35SwzNfVlggchfM0dU32bXJqPBZ1xw
 xBBNh2DoMA7Jz/nIDF/yTCjNVpeHN1GFVV27NasRvn74NQPSUhEYLd3RHqT25M5m/5qY
 IxxklrtsQOjw5puK4oiO+NlbTzo53b/XQfORfU3bN4vppwxzT4M4uKMy6TTVLPeFzx0i
 hYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=268k75iGgPwajGOaY5d0Of03PhQtD6bYvRMlc9HmW4g=;
 b=mR8cb9585fa/HSB/SiCIJsyc9duD8ZE1aHbrH1BR5GntsTQQ0VlXo/wyXkWpv/7NV4
 GlE42DHd1R9mrdIQEzvkhwWEV4JC/kFwnbqt2JohOY9uekG7eo0qVM4wava0xyD8ZclH
 ORLhJ9WkbZSLhyUM3CqjC4fKUMGeHUwzYL7i+hwUFRxdv7i17FLnxW9TBH+EbjivmC3e
 SWr+2isWOB+c7jqdqXCPABr4V4i/cYG+w9FUBrlGn49shYjjnvsIfYJB4CDlrW0wmhms
 lhfLQnoeFM3BF1myRmBENnsd62TOKyQgc66aDbnu9oAVCoq3sjN0rRzjH54reDpj29LY
 GU0A==
X-Gm-Message-State: AOAM5319xwzPL3gcwU90NTyf/Ra8P6ps45Y9DgSfbTBOOQbjkMuxAoiZ
 wg1rxlNFpZZ+tLsS9KHHgiMtNM8vwiTX
X-Google-Smtp-Source: ABdhPJy8oDTW4wlGS6Td9PK4FFriSN4iIuF7GsjvFAltMxzfxpFZExZ3OT4DANy17qtHPVOAgF/lxg==
X-Received: by 2002:aa7:9af7:0:b029:197:bfa8:abaa with SMTP id
 y23-20020aa79af70000b0290197bfa8abaamr646747pfp.26.1605770017530; 
 Wed, 18 Nov 2020 23:13:37 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.googlemail.com with ESMTPSA id 12sm5491577pjt.25.2020.11.18.23.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 23:13:36 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v3 3/4] mtd: rawnand: qcom: Add support for Qcom SMEM parser
Date: Thu, 19 Nov 2020 12:43:07 +0530
Message-Id: <20201119071308.9292-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_021344_188159_3177E5A1 
X-CRM114-Status: GOOD (  14.05  )
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for using Qualcomm SMEM based flash partition parser in
Qualcomm NAND controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 777fb0de0680..1b031aeac18b 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2797,6 +2797,8 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	return 0;
 }
 
+static const char * const probes[] = { "qcomsmem", NULL };
+
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
 					    struct device_node *dn)
@@ -2860,7 +2862,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 		}
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (ret)
 		nand_cleanup(chip);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
