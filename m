Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8946C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 03:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNvdCDRwZ436i+AZ03dlnNHkzoeXZWJYdZnpIQDMN3w=; b=b6izMUFfPCRG1B
	oMgk2xXACAGJB+926bMMbmCb/CwsYAunfnWZM4p9x7/EfK9L8a5V0JI40YAVw9mjC+NdqqH6i8k+T
	sv4tQD6ZPHv6ZixDP8o2jL1tvedT81gqWHI8L1933Zpc4ojs+LIuU2TeYmlo2r0xEDLLxw87k7liJ
	tDun1PgH7QwK9xsAhqeHRit8raQVgxS2ZDjyZKuZn+Revc8xLb6tY3RhTM3wdxgFtSN4kaaweVCr0
	dZODxRZfGAmyO8Z+1e9UvISeohogyqdIpCuBYqabmI+fPF5cIMRfhjbxFIej17Z1hJ6r0e4GFPKO5
	oXQIwaGAQnTSxkFhOt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4DbA-008JxG-Tz; Mon, 03 Jan 2022 03:01:24 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Daw-008Jvj-93
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 03:01:11 +0000
Received: by mail-wr1-x42a.google.com with SMTP id q16so67350423wrg.7
 for <linux-mtd@lists.infradead.org>; Sun, 02 Jan 2022 19:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f/23sp1iBvoUiVjjVi++1/pRdYTmKhtlANlkSerXd08=;
 b=DerPVSiRTyAmcw+c3wNyWOUveWjaeSeWQbISCGTOmlLtnHgSZ6dPLTl4tjHPVh46x8
 lXxww8s9V2qHt3e+UGTGACJFjapchh17MBcLWV810s8qaavG5a7a7a4cbc+VkcT8GjYy
 1XhLfiGnOU9Wx/ahden2LvW0GGh7uAWCapqWM7OrPauoyqPEHuKboG+NcYqjEdh/oC7g
 5ocDTgATAybN7Ya2YxVtI88y+I6X0xAQK8CjEYAnDh5CqBu0HuC9S5fKjpJzoXQd56JT
 XcG0EvkZpyjDQYQ8xxlZzA8ZyukWXgrcHUnjNbZ1uT4k2LD4DHFvX7hcpE0Vyb6i0ebR
 iI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f/23sp1iBvoUiVjjVi++1/pRdYTmKhtlANlkSerXd08=;
 b=qazU7xOedJ3/lV5kWwy5hkdwlDfsqjvbqbxhXzx7eA8lfR16Jefvz/e7yYqB96rwgY
 iV8ZiwYxAhAvGVt9IX9X8mRvvgeJXeyCJ3ls7Rgus2Q+YLm8xSbc7pkX45jwNlmVvH74
 TDqQXGKiSK7Q5N1La+/qZcjjTgU7rENRXOyIEuCAj1aZ45mR6o5h5Y37y7dzTKDQJwOm
 NCqPCsCIfeDeB8CIcDleRxfYav3UN0PUdNxd3tWVfEm2W7X8MSQ/sE30QhwuODKui72u
 V55wrTIfglbg/6s3SAq+LKe4JzQXMA1mvPS6YbuPrgw7iMaKMLDhhWaX/ijrmpY35TFd
 HI8w==
X-Gm-Message-State: AOAM533sL5IA8ZUP3jYwO5cTYL3hoaBxjSjpIH+I2Z72rXZZ1fv2c9Ew
 BohXaho/WU+opHJeL4/1vvyk6Q==
X-Google-Smtp-Source: ABdhPJxrnsqjm+lHytj9AGsJzo4p0rOgX1tPIYgePIAHUdICjerX9+4ADRb6XODxmI5k/0bHpQuynQ==
X-Received: by 2002:adf:9d8c:: with SMTP id p12mr36533639wre.622.1641178868914; 
 Sun, 02 Jan 2022 19:01:08 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id p11sm38095667wru.99.2022.01.02.19.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 19:01:08 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
 bbrezillon@kernel.org, absahu@codeaurora.org
Cc: baruch@tkos.co.il,
	bryan.odonoghue@linaro.org
Subject: [PATCH v2 1/2] mtd: rawnand: qcom: Fix clock sequencing in
 qcom_nandc_probe()
Date: Mon,  3 Jan 2022 03:03:15 +0000
Message-Id: <20220103030316.58301-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
References: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_190110_328254_0BB6075B 
X-CRM114-Status: GOOD (  15.59  )
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
