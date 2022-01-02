Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B7EC433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Jan 2022 17:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CNvdCDRwZ436i+AZ03dlnNHkzoeXZWJYdZnpIQDMN3w=; b=ekwkzqtBaH4y3y
	raHBjm0eLKpgTmfuQJcIG6t/66KVTz9y7dGadC9+5yKdDHugZ38a9XA5G00KXUJ8g5qj3yEECRS7J
	JpDte0F5GP4So6pnAx3984AcWqt1+0AINdYui6OwGiMdQH1t2gmEnux4LipjY0OMQF8Vl2508Gn+X
	rT1xBZfK5yfbnK45vv7CUotIaoEzIKnwdHwMj2T8i+CZRkF0yM7Jg1vTdMSdK+koFJrKUV77uiR+E
	f/hY7yLiA/tE660cB1DehLTocNYfoqA08zlhCBQFusScUUZDsVutz8pIVRln9P8hr7BUiG4iv6unO
	1AwIAXSSpON63Pi6wWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n44zg-0083hz-3J; Sun, 02 Jan 2022 17:50:08 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n44zd-0083hP-2Q
 for linux-mtd@lists.infradead.org; Sun, 02 Jan 2022 17:50:06 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r17so65832306wrc.3
 for <linux-mtd@lists.infradead.org>; Sun, 02 Jan 2022 09:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f/23sp1iBvoUiVjjVi++1/pRdYTmKhtlANlkSerXd08=;
 b=tYKARDaQ5u5adV9zC7q44A7IL73nAsobcLzJ8JMaKVcNyLtyjGibbCRSWpujUXqThw
 +VcCvaMo0jZ/h5spYLzvrnhQO+UXFaPckLhBp0whjINWIaUOWLfHi+89jz73xg07UJxn
 vPNryvEOAQCaJdkNNGe1RFLFLT0ReeDzhcDJ3tuSlG2eKYDeQUgukqhqa7gtMMuFZiwz
 NV1IWdtiCdty6X3nUjThkzLK+Of2EGEnePa07rGol/l0Fr0/+TyqxxPC6jZfF1TJfZ4U
 eJ1PlGctGSpSD3k8tsJyDxgg2WalOJ48ueqrTo7P5jQ3az+/jC1sCK6oyhIJtdbxeaxD
 rH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f/23sp1iBvoUiVjjVi++1/pRdYTmKhtlANlkSerXd08=;
 b=jwRjAfObMhhKlcdvzLPcEF188rSPDZEuBXnkTsYilb8CE++dleR5Lm9rfi6ot+6kZ+
 tOziac8t+7mXux4VgiMQBJMefsrKPRoJc3dbqrN7McWXF6s7UG6m6KNAg1bfQ+QVjlyg
 usRRvCWCxbd95qEwOKqt23zGyHH3UMe28tOZogyBcYO2SYBeR2aT4XAmFBkZakRvGt73
 gBkhNQwZueNAxUJwfDMC+Jjb02oXPu4T/bXKwMZi66SA3xl81//DuqUfmv3oJAXDQMvY
 zMPhX6qnPi0wGqmH9P0IoV8tKp5kEhHbe+GEIvBVUnHEiDoy6Av3UcHJLlxDBuam936m
 FpFg==
X-Gm-Message-State: AOAM532P+oiAtnoXhvgBAm2SW/H+/OTAj5PCNgv205qi8Na1DjQKlGMb
 i/MCGFrRT/psYXZciswTufpruN4K67N7mg==
X-Google-Smtp-Source: ABdhPJyDfDza2tpMfD0SPFAiUn84iJf8jMGv78xiZPbuRdqDLQnnBAgVWBkAQSuxqp5jIfrq77yFrg==
X-Received: by 2002:a5d:5255:: with SMTP id k21mr37623129wrc.381.1641145802034; 
 Sun, 02 Jan 2022 09:50:02 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id o10sm23539488wmq.31.2022.01.02.09.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 09:50:01 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
 bbrezillon@kernel.org, absahu@codeaurora.org
Cc: baruch@tkos.co.il,
	bryan.odonoghue@linaro.org
Subject: [PATCH] mtd: rawnand: qcom: Fix clock sequencing in qcom_nandc_probe()
Date: Sun,  2 Jan 2022 17:52:06 +0000
Message-Id: <20220102175206.3960-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_095005_192697_B57BE078 
X-CRM114-Status: GOOD (  14.52  )
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

Interacting with a NAND chip on an IPQ6018 I found that the qcomsmem NAND
partition parser was returning -EPROBE_DEFER waiting for the main smem
driver to load.

This caused the board to reset. Playing about with the probe() function
shows that the problem lies in the core clock being switched off before the
nandc_unalloc() routine has completed.

If we look at how qcom_nandc_remove() tears down allocated resources we see
the expected order is

qcom_nandc_unalloc(nandc);

clk_disable_unprepare(nandc->aon_clk);
clk_disable_unprepare(nandc->core_clk);

dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
		   DMA_BIDIRECTIONAL, 0);

Tweaking probe() to both bring up and tear-down in that order removes the
reset if we end up deferring elsewhere.

Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 04e6f7b267064..0f41a9a421575 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  */
-
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/bitops.h>
@@ -3063,10 +3062,6 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (dma_mapping_error(dev, nandc->base_dma))
 		return -ENXIO;
 
-	ret = qcom_nandc_alloc(nandc);
-	if (ret)
-		goto err_nandc_alloc;
-
 	ret = clk_prepare_enable(nandc->core_clk);
 	if (ret)
 		goto err_core_clk;
@@ -3075,6 +3070,10 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_aon_clk;
 
+	ret = qcom_nandc_alloc(nandc);
+	if (ret)
+		goto err_nandc_alloc;
+
 	ret = qcom_nandc_setup(nandc);
 	if (ret)
 		goto err_setup;
@@ -3086,15 +3085,14 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	return 0;
 
 err_setup:
+	qcom_nandc_unalloc(nandc);
+err_nandc_alloc:
 	clk_disable_unprepare(nandc->aon_clk);
 err_aon_clk:
 	clk_disable_unprepare(nandc->core_clk);
 err_core_clk:
-	qcom_nandc_unalloc(nandc);
-err_nandc_alloc:
 	dma_unmap_resource(dev, res->start, resource_size(res),
 			   DMA_BIDIRECTIONAL, 0);
-
 	return ret;
 }
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
