Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48E0C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:25:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4727661365
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4727661365
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5Ib6tvKLVT5OFYvHdMzx5cdtwfAJTJzvfy+jH0blGuA=; b=HQjdk83noGqP1J7L60jUKyNQL
	ANEKyfbjUIgRWHpoPfbgjvUA/clg9nyRLVlSu8kx8wcUoNzSgKoc0DmM8TjCL8s6otTW44FWt+yOS
	I1dzSGGpbZO9p3peHRBfZsGAVl7gKX/JcGROgUnhsuERvyaJIzemqp/nDsZH0wZ9FxQGBH56e/ekO
	k1u/Df08BoLpLy/5YqqGj5AThX9ZmEphNi7qT+BXKzHfnoCGq0RW4u68UcmsrRoPBdneSXIlSLgZA
	K3neIm2iBZpXO2SnO1Wlnu3RCfHrlvaFnr18dzcMzW3xIo4KWJaYOr6cwMeoyipuG9brZyzK1ooJW
	FwW051Tzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRzBa-00A0QS-IC; Thu, 01 Apr 2021 15:24:42 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRz7T-009zYJ-Ug
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 15:20:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id v8so1173068plz.10
 for <linux-mtd@lists.infradead.org>; Thu, 01 Apr 2021 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ww076wtEw/l52B1eQC1HZmnMQQ8Ebtr9JfK+3ViX3so=;
 b=KiGvVnSH66DmF8HdRytw6CJzuJoS03Rgw4NS/QOUBG/qyDfowjfjPJb4Uk9rl3tzSl
 FrtcqDfXNAt03yv2ZbMWSkUtZVxgRqCp/FxjadzOmk0LdPRI0xK8SS0cmsm50tBLUV8D
 LT2bSRIZNrc7c9mY8GZxdhUIy6Sv/F6+JsIxaTreMmGzoIVgcnJMnqibzvnhl7vEeCSS
 l+h74kxjQjZ+K2aItGMz6rzYzSTuvOU31WEx5Tonk1xxdAIDZpUuj/fNFiz29q66gypd
 vbgOy/k/jbxvAJwSS59FAbQ0k7tPzSO6eZoOEiGcRgHuJj++WFr95/LbkGkaTmvTBXB+
 F9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ww076wtEw/l52B1eQC1HZmnMQQ8Ebtr9JfK+3ViX3so=;
 b=IgV4EFSjncSptPT/oQD0kv8s2NMk8bwhESD+pwcSb+lrlhYNdaqQGoVHho18k+mgDf
 srq8wQ0YZ3lkbMqG8pKODW0hVnYqf2qvGEv+tPSrLaJIFCtk6378CcjeTaBTwmtggSKY
 WtXgYaVyqQQNSQJlfS6kAU1xsEKzIp4LPuZ60guOW/OhhBs+WEJyjBISy+Purf58cHT3
 i7YP+ldiSq9B1ZaU1CYSHW7g4cq8/YrT7nw4OXALTHXT7cLawaE/LIpC9SBmyLQkp2fe
 qT+JygveQSiAEylReFz1DJ7IIW6kLo1Q07q710cbEDTzrltaWFDuYmUJCWdWS78SMB5/
 Io4Q==
X-Gm-Message-State: AOAM531Lvwnb4tzO5Yg499Wo+FtNd43s3sUytWRK2NbGwYvVvC/qrUmw
 LoRIlZbzOUUvbTSSYOLA/AZHdKwZEKYv
X-Google-Smtp-Source: ABdhPJxAqh+RohpPAzLbk35v/zOJ3CC1I1F2tWRwN3E0X6lfjAeYaDbNp7Smee2wXabf5ZYkF4rWoQ==
X-Received: by 2002:a17:902:c14c:b029:e5:cd82:a0b with SMTP id
 12-20020a170902c14cb02900e5cd820a0bmr8410255plj.34.1617290426225; 
 Thu, 01 Apr 2021 08:20:26 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.138])
 by smtp.gmail.com with ESMTPSA id l22sm6500919pjl.14.2021.04.01.08.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:20:25 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v10 4/4] mtd: rawnand: qcom: Add missing nand_cleanup() in
 error path
Date: Thu,  1 Apr 2021 20:49:55 +0530
Message-Id: <20210401151955.143817-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
References: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_162028_323140_4D4B86CA 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add missing nand_cleanup() in the alloc_bam_transaction() error path
to cleanup the resources properly.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 87c23bb320bf..fe74cf3aece5 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2882,6 +2882,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 		if (!nandc->bam_txn) {
 			dev_err(nandc->dev,
 				"failed to allocate bam transaction\n");
+			nand_cleanup(chip);
 			return -ENOMEM;
 		}
 	}
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
