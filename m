Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BC1C43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:34:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3BCC2084C
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:34:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dRsHfw2A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RLCsRbGE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3BCC2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0YVT68m5M2d+0skZtQgARtWdtYvi10AE3IZlVieoLzA=; b=dRsHfw2AadjHbU2dCIjVK0B5s
	G43uZatABbC19O+zhBU7eIDbZ1Q/yb74QDZnLsBZ6zCTR2sQdyPEwubuB78F5cHQXw9vhdca+QX7f
	IYnk+g0QjxwiTUVP8JUan+4R7p0bvxYpk2aSsiJxflw22/69dv1i8wXFelLBiOrZ0P79pBQdZXpsp
	ze9WFE3aEeCnvW5OzRV8Hwqwlm5k+Cvl2SXJz6OX3fNqm3goPNnagGIrM/Ee35SE6T4PIG6T+SHyv
	BSZcjBfupiw9ba+Pl9I1Czo5XwPAEIl3w0bi/nvvECKkl2wcHIRUzOa24SqioauMk4OhlfpZdLq8m
	nD+bhMBdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBpL-0000Ru-AL; Fri, 18 Sep 2020 08:33:07 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBnz-0008GT-16
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 08:31:49 +0000
Received: by mail-pl1-x641.google.com with SMTP id x18so2620334pll.6
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2020 01:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V6QA5rlwQIgAumyCtY/vC8OZHPGW9fkvmobEZ61e3iw=;
 b=RLCsRbGEIvBCMUuhsoukaG9neeZlgVgZbHJD1ivveD5GumnlluwtLd2WdZ/jIC/XVi
 OVDwap9KXfLe1ucenLJ2xRDya+7cBCILx/fCyOEwcmdCfmTxCKCmDmCrU93XhmBaJmfn
 QGkSidPS6H6/ySwK04ULnFvBcvusmSA0Vbsog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V6QA5rlwQIgAumyCtY/vC8OZHPGW9fkvmobEZ61e3iw=;
 b=DdWf/vRuir/NqR3QRzRUf6bDqr9HvOLJlCVdEMYv2eML8OOTUdbEbxuoNsi2YWAxAB
 gjDPLuCERwDOp/bMjdcHud+Fgb6HAnkmibt4s37dgwWa08GgoCTF1a8rkkPjbEDTeYSw
 5tRe0zmbvjZ/ZL9qcF6VefbQ9mdVjmbJgt5lwBTFN59UAeap77ieO/chVeJOtF51q7U7
 w97fFU/ezMaMLNieAfcTDabyAJwXVY/TjIdFZTUHVEHq1jV/5ufvP6WSJN/iLyd1RWwS
 ozOhjdje563mGlCUdsVs5q3XguNUIq4ueKSFIIAuzw6G2tuT3sawBhnpBQn2k3uqisCf
 0Hmg==
X-Gm-Message-State: AOAM530vbzhp9YA8ua4IvatTvGHaeb9Y0A4fMKmIhzkR92i/xpSsxDMC
 nj9hK9/SPTNmnf1w35BAYQWYag==
X-Google-Smtp-Source: ABdhPJygqgBey434xgCtbPNom+Nm5OBIq9zcYixgGAlrzs7AOfK44AeJ1z3uv1szI1z/iQNJZqhoBQ==
X-Received: by 2002:a17:90b:1642:: with SMTP id
 il2mr11671416pjb.93.1600417900741; 
 Fri, 18 Sep 2020 01:31:40 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id g206sm2193172pfb.178.2020.09.18.01.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 01:31:40 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 4/5] spi: spi-mtk-nor: support 36bit dma addressing to
 mediatek
Date: Fri, 18 Sep 2020 16:31:22 +0800
Message-Id: <20200918162834.v2.4.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200918083124.3921207-1-ikjn@chromium.org>
References: <20200918083124.3921207-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_043143_159766_247B1D20 
X-CRM114-Status: GOOD (  16.82  )
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
Currently 36bit dma addressing is enabled only for mt8192-nor.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

(no changes since v1)

 drivers/spi/spi-mtk-nor.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index e14798a6e7d0..99dd5dca744e 100644
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
 
@@ -291,6 +294,11 @@ static int read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
 	writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
 	writel(dma_addr + length, sp->base + MTK_NOR_REG_DMA_END_DADR);
 
+	if (sp->high_dma) {
+		writel(dma_addr >> 32, sp->base + MTK_NOR_REG_DMA_DADR_HB);
+		writel((dma_addr + length) >> 32, sp->base + MTK_NOR_REG_DMA_END_DADR_HB);
+	}
+
 	if (sp->has_irq) {
 		reinit_completion(&sp->op_done);
 		mtk_nor_rmw(sp, MTK_NOR_REG_IRQ_EN, MTK_NOR_IRQ_DMA, 0);
@@ -594,7 +602,8 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
 };
 
 static const struct of_device_id mtk_nor_match[] = {
-	{ .compatible = "mediatek,mt8173-nor" },
+	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
+	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_nor_match);
@@ -607,6 +616,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	u8 *buffer;
 	struct clk *spi_clk, *ctlr_clk;
 	int ret, irq;
+	unsigned long dma_bits;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -623,6 +633,13 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	buffer = devm_kmalloc(&pdev->dev,
 			      MTK_NOR_BOUNCE_BUF_SIZE + MTK_NOR_DMA_ALIGN,
 			      GFP_KERNEL);
+
+	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
+		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
+		return -EINVAL;
+	}
+
 	if (!buffer)
 		return -ENOMEM;
 
-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
