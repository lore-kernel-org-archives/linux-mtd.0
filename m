Return-Path: <SRS0=p7/t=JC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE45DC433B4
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 05:11:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8847661398
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 05:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8847661398
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mRn3TT1GolmeZoO4eMM40i4B0x3u8ys3AUcL+NQ2nrY=; b=V+iAZVHP7bDJFBd2D9n3CRvSWa
	wk0KvxmteUMItA115d4fZkbE84jdoeaHVgtQ2RUnXahmw5Wjp9aes4bSZb1SuE93AxU8cN5LA9XzG
	kZ3EyqFfDqr9xEBJVvY2nX3GnGRJDjrTNrTdHAol0xAsysr13/WlIIjTVTssm/avLpjN/E2GQdXfX
	MLQHekLmM4+z0wxUuu0JuKGp3he0fDkDhkDTSzUIQqkAPia3FSGZC9snOWplaUr7msiv50DEZoUNu
	0q/NvIfbPaKVTLsJd9Vcit3SGcDq3D4VGaEFOP61a6Aa2wVgg2JrA2y0wLGZX6mKF6qbZZzzGcs/c
	gHlVSyRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTHUu-00GhXJ-MM; Mon, 05 Apr 2021 05:10:00 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTHUp-00GhVf-KT
 for linux-mtd@lists.infradead.org; Mon, 05 Apr 2021 05:09:57 +0000
Received: by mail-pg1-x52e.google.com with SMTP id q10so7439410pgj.2
 for <linux-mtd@lists.infradead.org>; Sun, 04 Apr 2021 22:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EIOSM+Jlbj62eZAoiGqrvJyU1MmccRrVFUma1qyaw8A=;
 b=mt6OhMv8kLzSjri6/NAOyuml+dUtvpeBUmRGr115w3EiQwMPw1+rzvSZJa6vPj4Xuk
 Mft/uQJYZgeh4vkuBMUK2n/lFOYt1a/V1kD3Dm0H9jxGYl2nLPhqbMU2zWNKXLe6wzyf
 UmUN7c0tZeXRto4IwnPde/3baIm6PwOpSj9hK3FmlisOvGGM8orMdOg8cdOFkDucephT
 H+pei0x0PH7Vpyxvol6JZJMmLXj3P2Q72+AVxhoQ6DXZje4pXgGuquh5PjT1HA2geod1
 YhjtY56m3RLnPRJlvQlUFo2N9kXm86npNNes233Pe6wu5bQ5z1RQeUgPkIldEwm5LfhP
 RLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EIOSM+Jlbj62eZAoiGqrvJyU1MmccRrVFUma1qyaw8A=;
 b=AKUH5vkdY0eGEWFnWaijfy5nsTCDeYbbkADR6vzJSdEPIP9/LAJR/RS5fcLm42PrI6
 T0yNjX7mgDkeby/iIf4PT3rLfTjO06Tt7ZoE9FqhiOOdeJ+n9ougPQ1mne+OyjYbfBhJ
 o8U69EfzztCUtNCJlT91qTJWVfIgIQauaO1xgUaFm0lm71P7l0crFLCVRaQRYjcTRX3B
 30A6+559CEKoUDLUny1cnJhS5mOZnt6jKyslwUoZb16yztgV8QCmUZR6/5cM9fNeZ5HZ
 N5U6D4LYKqc9Y/QyShVn13geld92fau+AH2Y8UzpPBwiBjQuN9zDeu6tOrv5LZITon6b
 vHMg==
X-Gm-Message-State: AOAM5335ExYPSesjALtlxnpP8H8uTm06R4F+4E5mB0UDlgCmlP22rWok
 JLC1AOjrTXc1dGHPQXznzIgQ
X-Google-Smtp-Source: ABdhPJxeaADlQpaccaPVeXis0lo9Ae+uSvbkkQg5MNUgs8oZVs9FZ5AGZd9pbeIwcTkHYHpF8poEgw==
X-Received: by 2002:a63:1921:: with SMTP id z33mr21738430pgl.211.1617599392121; 
 Sun, 04 Apr 2021 22:09:52 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:98:8118:aa47:7491:f04a:71ea])
 by smtp.gmail.com with ESMTPSA id
 b126sm14177939pga.91.2021.04.04.22.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 22:09:51 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] mtd: rawnand: qcom: Use dma_mapping_error() for error check
Date: Mon,  5 Apr 2021 10:39:12 +0530
Message-Id: <20210405050912.115591-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_060956_206647_D7C8395B 
X-CRM114-Status: GOOD (  11.27  )
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

dma_mapping_error() should be used for checking the error value of
dma_map_resource() API.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index fe74cf3aece5..07b3c156a802 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2990,7 +2990,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	nandc->base_dma = dma_map_resource(dev, res->start,
 					   resource_size(res),
 					   DMA_BIDIRECTIONAL, 0);
-	if (!nandc->base_dma)
+	if (dma_mapping_error(dev, nandc->base_dma))
 		return -ENXIO;
 
 	ret = qcom_nandc_alloc(nandc);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
