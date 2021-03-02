Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8B6C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:19:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A590064F04
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A590064F04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f1zMk1ORK7/aptHSIJh28U4gMuioMtGXo4KiVGTcF3I=; b=b6OA52Ictdq6FhsyZ/PDWsZAR
	87UKs7dch5gEp/8lN+PKqSrMSb93QsOVGtCY9U0yns+mkA8xFCUp55IUt5z2fuNLTRdxPCmSM+A72
	wLzzj04bqZOoq3zzSfJvQnUP0aS8QqDG9Yj3KDgOarCjtvstuvwElzQ9jYV0EyjD+LJi2KMEqiLS/
	8sSDb3I5zfAbb/KHO2ELeFCtFHpDy7yU5zjqeHjrWjqJr2jaV6vcevREueIYJWq/2WY/Sje4aHvRa
	QN6OBo1bra/n3oxTqST6bYih6Y1yLsrGT5ABH5Te+Q5fP6ORdswOyPNgZ19G/gpX5E0eyEHDpSU27
	3pelMuoTQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHUDM-005ZYY-Vj; Wed, 03 Mar 2021 16:19:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSpZ-005Dyz-2I
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=PqPgRtzVantKyRNR1zZk8EcuOOdksOMCXe9nMbpmH0o=; b=wIcOT/x4mukjfN8wOe01eDN6KW
 Q20MsF4cyutztFkLzOgKmcUli7ZgnJsuenroZEU+C7BNQQ+Dvy1XohXUsI97fWMHksUW+pmtuPIDS
 LEtpQw/GmiVCyxQ4xyKltQqXHaQ4rfeyb006Py3VzCvnbA5RuK8k7Bgi//4M3WZyrcF31/iXLi5Qg
 a2ApUf99nHxdA60asQGequFXDPRtTJqA1x+Ktc92afZROJjc7zNeN2GxrCj4f37JJl1L1yOzvcF1a
 84RGNWf7ODeN8FVmrO/msW9YxZGyzUQWvCx3dQp7rIkKLS2wJj9xDY8A69mvMm5DBoDcvhdHAipYb
 EQJmwvRg==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH55X-00HBJc-9e
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 13:29:25 +0000
Received: by mail-pl1-x62a.google.com with SMTP id s16so12023625plr.9
 for <linux-mtd@lists.infradead.org>; Tue, 02 Mar 2021 05:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PqPgRtzVantKyRNR1zZk8EcuOOdksOMCXe9nMbpmH0o=;
 b=KhrvHfmW54YOdVY/n36ESd9/pdRvnND7vy94ZX7v6gkP5vQBdXGN/2dndp3CXxob3O
 0xMeF80owgoInE0hQvw9eGl03YK8+P0PKUT2rXNJ3ONhuXnfOSMmTf3VtvCO/ptCPAqb
 DXKMCse35CkVmQeA78HmSuIAQyPaFWs2nNBIa9NbaKLdp4jgWp5zpPvrVYoBl7C5Vk6w
 j2pEp/wBwj6eTOtiFQEqb6jkJ/lxD2E5PA884lKxkGRlbTegtYSV4Ui6eCJOCyMFbsEp
 2VYrcxUAv3oRz+zpM1sbFxRvZnaXWtaDXrr5JyKx5Jh+CDdC61bYY6SslLIX8dgWxt8H
 2BhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PqPgRtzVantKyRNR1zZk8EcuOOdksOMCXe9nMbpmH0o=;
 b=LaiKqxJnmSMnTcouS/Nl0G8aNLZACzW9kRyBkl1539mcsLiacqhxeFI56owWfFFm+W
 NWM2ihr9AcRIrbprltgmmYjXrMPQcsV72e4vz3iml+VTDY/9JOQa3GCelZD/ZtB/sLLh
 6QIbICr3cPKOT4JHtMdurfWoxevMR+ySoggYphEA9Y9jL9tU3RkovZYuvYH21zGG9/xS
 Xh+nKxA/EdWl4SyuTwItUt2ZmG4kwMUFSJy5dve++Sc2zHWETQXEDbYo210npswNwMLo
 OtvpwQzR8sTPKIiEyrJNKnTOAIVI/mRQyWcxOHBtJltRWrugq+TuWwOFIpMujKtbV38T
 FbNA==
X-Gm-Message-State: AOAM531mCOR6Q9p9kl8bRvdnBWKdvnjvJzRq87Zslc6LhU1NTi4gjgVQ
 yrEjAahRN5OAhAFrYTCWOUhB
X-Google-Smtp-Source: ABdhPJzNqdjp6LlEtRCSQEo3DvznilMTpm/AJqjpAuo55QQR78RWQNlHDHM1hfTHqDgBvPVLQF71kg==
X-Received: by 2002:a17:90a:e2ca:: with SMTP id
 fr10mr4533637pjb.18.1614691700590; 
 Tue, 02 Mar 2021 05:28:20 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.74])
 by smtp.gmail.com with ESMTPSA id w1sm13027454pgs.15.2021.03.02.05.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:28:20 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 Daniele.Palmas@telit.com, bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] mtd: rawnand: qcom: Return actual error code instead of
 -ENODEV
Date: Tue,  2 Mar 2021 18:57:57 +0530
Message-Id: <20210302132757.225395-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
References: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_132925_692337_A2CEBD96 
X-CRM114-Status: GOOD (  13.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In qcom_probe_nand_devices() function, the error code returned by
qcom_nand_host_init_and_register() is converted to -ENODEV in the case
of failure. This poses issue if -EPROBE_DEFER is returned when the
dependency is not available for a component like parser.

So let's restructure the error handling logic a bit and return the
actual error code in case of qcom_nand_host_init_and_register() failure.

Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index c2dc99c1b2f1..54230f2c1a3f 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2952,7 +2952,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	struct device *dev = nandc->dev;
 	struct device_node *dn = dev->of_node, *child;
 	struct qcom_nand_host *host;
-	int ret;
+	int ret = -ENODEV;
 
 	for_each_available_child_of_node(dn, child) {
 		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
@@ -2970,10 +2970,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		list_add_tail(&host->node, &nandc->host_list);
 	}
 
-	if (list_empty(&nandc->host_list))
-		return -ENODEV;
-
-	return 0;
+	return ret;
 }
 
 /* parse custom DT properties here */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
