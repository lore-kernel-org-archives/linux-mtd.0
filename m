Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29560C43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:35:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE4782075B
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:35:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dkUY1so3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HAjR/a3E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE4782075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dqaZ5H3SeJP6ReX5+irt79D8fEkg0EpJSG1lS2vZmcQ=; b=dkUY1so3SsVcqQd6nTdGvDElB
	lFCZcnxq6FAlEwEHs5wX0tLsm61FAx/UOWfjriWQlu3bqLyp8Jjy1X3bMF4fnKQxabL4dzipAKeP/
	O17m4PR/dCjFA1uCH7G/XFgKsxk5W9XXUOH9hBKVHNWjaKFMa0x9Qgssi67IyBku5u3XFT7TPn0lJ
	4uMg9zoIHcFqUJvMHqOvKTQYHavBqWjzW8HGIt3dWL9mnrZABmgkRDab2QVhffmHG5/UBjOQPjO1k
	dN+K+BKI9Hw77DecyXjXl59j4ZmDD+oJJvJEBMKjI6V1QePuDmtEZbr3ZPWAN8Mk1nGmH0pI7PeTc
	IuWQr9b3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBph-0000ev-QM; Fri, 18 Sep 2020 08:33:29 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBo1-0008Hz-6I
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 08:31:55 +0000
Received: by mail-pj1-x1041.google.com with SMTP id fa1so2786763pjb.0
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2020 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WhcfZzUawu7IGCGdEVtnYYchZjnf9bfpM7EHLtCGyWY=;
 b=HAjR/a3E0C2jC7NrUpZ9xj59sZPMOz27K/Kdvjiz9t8WwPWDenQ6XauQVUNFx3kO8I
 K8PXTTV4jNU/f5mPOWsbWK7WzxICQ8rC1X1iUKDFeVQYFi6YjDY9rgiVZpL9C82Iy5Ae
 N+5JHwtH/iZu5U4jmeEHe1Kwwu+EkYTmW7DDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhcfZzUawu7IGCGdEVtnYYchZjnf9bfpM7EHLtCGyWY=;
 b=VdPT5v34lyARXZ/JQ25+3V87DC6LQU0jDiDsSZDpcfDTe4jp6ItB5wGNRTuvhorZXF
 +0spW5va+7WITr+xEwYjpcBCWu7GZQeGqtHJCLMxFIW2k1PwykCgtKwGc2FlTtANAUQk
 wWIyxIu/vawpU+9N/nZCm2cDkDb7wB0TdADwv7HQOa11YbKqAF2hGpVY1p3OcK985gss
 ckIuB2iQZc7UqzZmMNd6y/ALCU9MFYnvTbqqXbxhCZwMu+62G1Za9WD4coQU8v/IE5Mz
 t2oPLxujRdZqkTYsSju77KoRPWwzjtHdykckHgJhF4/Ah/GHPLP3/+6mVU9z0XrSFTdr
 Q3gg==
X-Gm-Message-State: AOAM533K7Duv5uPw3QjqqgAGFjazagzg5uzaxFHv8COZER/7ShACRR23
 i7lm+53mJczh/sEoCfxY9imgjQ==
X-Google-Smtp-Source: ABdhPJx762UucxyaZ+w3YSAoNix0FtNYzia6auJ1wmsqxmDPSBJ1DH8Rvp53SOa+u1Mdzj1EiZyJDg==
X-Received: by 2002:a17:902:9343:b029:d1:f3e1:c190 with SMTP id
 g3-20020a1709029343b02900d1f3e1c190mr9661647plp.2.1600417903054; 
 Fri, 18 Sep 2020 01:31:43 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id g206sm2193172pfb.178.2020.09.18.01.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 01:31:42 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 5/5] spi: spi-mtk-nor: Add power management support
Date: Fri, 18 Sep 2020 16:31:23 +0800
Message-Id: <20200918162834.v2.5.I68983b582d949a91866163bab588ff3c2a0d0275@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200918083124.3921207-1-ikjn@chromium.org>
References: <20200918083124.3921207-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_043145_350438_67A1281C 
X-CRM114-Status: GOOD (  20.25  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch adds dev_pm_ops to mtk-nor to support suspend/resume,
auto suspend delay is set to -1 by default.

Accessing registers are delayed after enabling clocks
to deal with unknown state of clocks at probe time,

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 drivers/spi/spi-mtk-nor.c | 105 +++++++++++++++++++++++++++++---------
 1 file changed, 80 insertions(+), 25 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 99dd5dca744e..5dcd575998d9 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 #include <linux/string.h>
@@ -551,22 +552,15 @@ static int mtk_nor_enable_clk(struct mtk_nor *sp)
 	return 0;
 }
 
-static int mtk_nor_init(struct mtk_nor *sp)
+static void mtk_nor_init(struct mtk_nor *sp)
 {
-	int ret;
-
-	ret = mtk_nor_enable_clk(sp);
-	if (ret)
-		return ret;
-
-	sp->spi_freq = clk_get_rate(sp->spi_clk);
+	writel(0, sp->base + MTK_NOR_REG_IRQ_EN);
+	writel(MTK_NOR_IRQ_MASK, sp->base + MTK_NOR_REG_IRQ_STAT);
 
 	writel(MTK_NOR_ENABLE_SF_CMD, sp->base + MTK_NOR_REG_WP);
 	mtk_nor_rmw(sp, MTK_NOR_REG_CFG2, MTK_NOR_WR_CUSTOM_OP_EN, 0);
 	mtk_nor_rmw(sp, MTK_NOR_REG_CFG3,
 		    MTK_NOR_DISABLE_WREN | MTK_NOR_DISABLE_SR_POLL, 0);
-
-	return ret;
 }
 
 static irqreturn_t mtk_nor_irq_handler(int irq, void *data)
@@ -630,6 +624,11 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	if (IS_ERR(ctlr_clk))
 		return PTR_ERR(ctlr_clk);
 
+	irq = platform_get_irq_optional(pdev, 0);
+
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36)))
+		dev_warn(&pdev->dev, "failed to set dma mask(36)\n");
+
 	buffer = devm_kmalloc(&pdev->dev,
 			      MTK_NOR_BOUNCE_BUF_SIZE + MTK_NOR_DMA_ALIGN,
 			      GFP_KERNEL);
@@ -661,6 +660,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	ctlr->num_chipselect = 1;
 	ctlr->setup = mtk_nor_setup;
 	ctlr->transfer_one_message = mtk_nor_transfer_one_message;
+	ctlr->auto_runtime_pm = true;
 
 	dev_set_drvdata(&pdev->dev, ctlr);
 
@@ -678,12 +678,17 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	if (!sp->buffer)
 		return -ENOMEM;
 
-	irq = platform_get_irq_optional(pdev, 0);
+	ret = mtk_nor_enable_clk(sp);
+	if (ret < 0)
+		return ret;
+
+	sp->spi_freq = clk_get_rate(sp->spi_clk);
+
+	mtk_nor_init(sp);
+
 	if (irq < 0) {
 		dev_warn(sp->dev, "IRQ not available.");
 	} else {
-		writel(MTK_NOR_IRQ_MASK, base + MTK_NOR_REG_IRQ_STAT);
-		writel(0, base + MTK_NOR_REG_IRQ_EN);
 		ret = devm_request_irq(sp->dev, irq, mtk_nor_irq_handler, 0,
 				       pdev->name, sp);
 		if (ret < 0) {
@@ -694,26 +699,41 @@ static int mtk_nor_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = mtk_nor_init(sp);
-	if (ret < 0) {
-		kfree(ctlr);
-		dma_free_coherent(&pdev->dev, MTK_NOR_BOUNCE_BUF_SIZE,
-				  sp->buffer, sp->buffer_dma);
-		return ret;
-	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
+
+	ret = devm_spi_register_controller(&pdev->dev, ctlr);
+	if (ret < 0)
+		goto err_probe;
+
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
 
 	dev_info(&pdev->dev, "spi frequency: %d Hz\n", sp->spi_freq);
 
-	return devm_spi_register_controller(&pdev->dev, ctlr);
+	return 0;
+
+err_probe:
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
+	mtk_nor_disable_clk(sp);
+
+	return ret;
 }
 
 static int mtk_nor_remove(struct platform_device *pdev)
 {
-	struct spi_controller *ctlr;
-	struct mtk_nor *sp;
+	struct spi_controller *ctlr = dev_get_drvdata(&pdev->dev);
+	struct mtk_nor *sp = spi_controller_get_devdata(ctlr);
 
-	ctlr = dev_get_drvdata(&pdev->dev);
-	sp = spi_controller_get_devdata(ctlr);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	mtk_nor_disable_clk(sp);
 
@@ -722,10 +742,45 @@ static int mtk_nor_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused mtk_nor_runtime_suspend(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct mtk_nor *sp = spi_controller_get_devdata(ctlr);
+
+	mtk_nor_disable_clk(sp);
+
+	return 0;
+}
+
+static int __maybe_unused mtk_nor_runtime_resume(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct mtk_nor *sp = spi_controller_get_devdata(ctlr);
+
+	return mtk_nor_enable_clk(sp);
+}
+
+static int __maybe_unused mtk_nor_suspend(struct device *dev)
+{
+	return pm_runtime_force_suspend(dev);
+}
+
+static int __maybe_unused mtk_nor_resume(struct device *dev)
+{
+	return pm_runtime_force_resume(dev);
+}
+
+static const struct dev_pm_ops mtk_nor_pm_ops = {
+	SET_RUNTIME_PM_OPS(mtk_nor_runtime_suspend,
+			   mtk_nor_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_nor_suspend, mtk_nor_resume)
+};
+
 static struct platform_driver mtk_nor_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = mtk_nor_match,
+		.pm = &mtk_nor_pm_ops,
 	},
 	.probe = mtk_nor_probe,
 	.remove = mtk_nor_remove,
-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
