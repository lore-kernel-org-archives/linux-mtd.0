Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE97C4346E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 07:40:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C4AD2083B
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 07:40:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uyAtYvc1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QNnAm1um"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C4AD2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BbIlv4FwcM1oGqUdSBVxFyswwRjDYrAI0oqMJyN7EVQ=; b=uyAtYvc1LuYNzpWy9Hh77DPZJ
	c1wufCaMto4s6K2ialjdfvB8FL/CIh/YVfhGveSzDwxxv+/v1tbH5mOE6KfBb1AnKNnUxgRB1vy0I
	SmT2ycGHubZPqWrBrArJsr2//k/Tby6j2/wykEOPJ3X/gCvk79kHObcFyEWjL/zz2aMuIUjQsO2rH
	AKlxUt3563oMu9cjrrtilbrLam2O94zONcjccVKHZcWXOnjZvtuy6mvU5/yMkxQmpGOexNgDuHg+0
	3YdR30hpbVPaDTmax2Vcj2cWUJCH1HLhqf+pbMaM7/ViGmmiULtNbkoUnkVoS2d3jCp9iN+/+dj27
	Uv2Ajw0dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNAEK-0002uR-Rm; Tue, 29 Sep 2020 07:39:20 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNADp-0002hg-MH
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 07:38:52 +0000
Received: by mail-pg1-x543.google.com with SMTP id y14so3135135pgf.12
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2020 00:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Kh1cgPE0z6ZaYTa5OCqa2rDxMEmjbF1J+zo1XE6Dzc=;
 b=QNnAm1umIqZw/2DLvd2wp3irYnYcyua/7QVqZM1qQ0IAu261zfNJya2qYqYVA9mpbd
 e6AJPlCGYWmh5BcSJBgbVx0pEf0KcBKlavOi25/linNkqEh14DI+RBfRo9/Ek05pBI8f
 xYWjZTx8PO8JSbr8OU4nD8Ji4AJsHWxsEVcIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Kh1cgPE0z6ZaYTa5OCqa2rDxMEmjbF1J+zo1XE6Dzc=;
 b=idXZUF8u2b8A0qbYbq2B12hzXG+PQC15/C3KZXsTQGK2atlRbjJx2ikG3mqBSdHRlz
 IAQ66RQh7++zLI8rNLikHeY6qU79waQLLAtXE/v3sIjLg7Tum1StZSQBfp2ds2FkP3ju
 sIxSnsFfHa3Hbz+FMQuPXK3xBQIp8aniGD0BE+gmTkYmOzIr9DEHJQL46czron70dJx2
 NKv6LHHzpDPo2OHWNgmAMQvv9wKJwjXad+ybWNWScN72nWKNR932Mj7HMGgtneyI59pa
 Jy8UmeNXAgLydomClyQ35MB18MYWvjnzmTDtBeDxobYkCA42g8fs/dwwEYwFsW16a5pJ
 Rv5w==
X-Gm-Message-State: AOAM5333rYwu0DPbbRLZaUXrVMDUHmX1vM/XW5S8qj485jgqppq0+hJs
 1Ckq7FrmbGQREwd/8ByJgYfbrA==
X-Google-Smtp-Source: ABdhPJyeKEeCFO9drJ59wOuGzyqYVRMXtgWAOmJ66srgwVHkEYZLkS53C9kvpTmRMDRnznNtWJA/Xg==
X-Received: by 2002:a17:902:9349:b029:d0:cb2d:f26c with SMTP id
 g9-20020a1709029349b02900d0cb2df26cmr3263756plp.5.1601365127053; 
 Tue, 29 Sep 2020 00:38:47 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id e13sm3737317pjy.38.2020.09.29.00.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 00:38:46 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 3/4] spi: spi-mtk-nor: support 36bit dma addressing
Date: Tue, 29 Sep 2020 15:37:54 +0800
Message-Id: <20200929153320.v4.3.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
In-Reply-To: <20200929073755.3741416-1-ikjn@chromium.org>
References: <20200929073755.3741416-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_033849_830462_DF5D9C39 
X-CRM114-Status: GOOD (  17.75  )
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

This patch enables 36bit dma address support to spi-mtk-nor.
Currently this is enabled only for mt8192-nor.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

Changes in v4:
- Fix 0-day ci warning from shifting 32bit value
- Fix missing initialization of internal flags, 'high_dma'

 drivers/spi/spi-mtk-nor.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index cfb9a2450962..eac613b3930d 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -78,6 +78,8 @@
 #define MTK_NOR_REG_DMA_FADR		0x71c
 #define MTK_NOR_REG_DMA_DADR		0x720
 #define MTK_NOR_REG_DMA_END_DADR	0x724
+#define MTK_NOR_REG_DMA_DADR_HB		0x738
+#define MTK_NOR_REG_DMA_END_DADR_HB	0x73c
 
 #define MTK_NOR_PRG_MAX_SIZE		6
 // Reading DMA src/dst addresses have to be 16-byte aligned
@@ -102,6 +104,7 @@ struct mtk_nor {
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
+	bool high_dma;
 	struct completion op_done;
 };
 
@@ -278,6 +281,13 @@ static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
 	writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
 	writel(dma_addr + length, sp->base + MTK_NOR_REG_DMA_END_DADR);
 
+	if (sp->high_dma) {
+		writel(upper_32_bits(dma_addr),
+		       sp->base + MTK_NOR_REG_DMA_DADR_HB);
+		writel(upper_32_bits(dma_addr + length),
+		       sp->base + MTK_NOR_REG_DMA_END_DADR_HB);
+	}
+
 	if (sp->has_irq) {
 		reinit_completion(&sp->op_done);
 		mtk_nor_rmw(sp, MTK_NOR_REG_IRQ_EN, MTK_NOR_IRQ_DMA, 0);
@@ -589,7 +599,8 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
 };
 
 static const struct of_device_id mtk_nor_match[] = {
-	{ .compatible = "mediatek,mt8173-nor" },
+	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
+	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_nor_match);
@@ -601,6 +612,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct clk *spi_clk, *ctlr_clk;
 	int ret, irq;
+	unsigned long dma_bits;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -614,6 +626,12 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	if (IS_ERR(ctlr_clk))
 		return PTR_ERR(ctlr_clk);
 
+	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
+		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
+		return -EINVAL;
+	}
+
 	ctlr = spi_alloc_master(&pdev->dev, sizeof(*sp));
 	if (!ctlr) {
 		dev_err(&pdev->dev, "failed to allocate spi controller\n");
@@ -639,6 +657,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->dev = &pdev->dev;
 	sp->spi_clk = spi_clk;
 	sp->ctlr_clk = ctlr_clk;
+	sp->high_dma = (dma_bits > 32);
 	sp->buffer = dmam_alloc_coherent(&pdev->dev,
 				MTK_NOR_BOUNCE_BUF_SIZE + MTK_NOR_DMA_ALIGN,
 				&sp->buffer_dma, GFP_KERNEL);
-- 
2.28.0.709.gb0816b6eb0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
