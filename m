Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88D5C4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 06:57:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9956821D91
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 06:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YWgv87zq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="igrI5lat"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9956821D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=acmz9ylaDfyRUiO3UREMa46P0VqmJnDxn4t8jwJFUnk=; b=YWgv87zqdXVNNEBj/fmAz1X8i
	5xTfJJblgPnrAh6vJSxS8a/tM5XHQ/o/e8nlRI8VOQFmJ4Y2cdXJRh1EfvuZngdAWDpvKDHxSR8B3
	UEGg5nJ1I7yMsuM8dNNARmxDCkKjU8FsoC8gyv8qbqOXGGXzbcP2EL8X6X3VRxaMZ80uN0ncQdFmy
	WyMI+eDkLglbreuyxyY97l7inwALWTtdxW24mEspLI6WAoZCa/FYmiAlMjWGlNM+TBD/QKNE5YDyj
	n4HFH3HcYLLQ5WfEimao5oxKT0u37GfviMxhDTb4bH1qPOgYewM5m5P/YSYLq8rTql99lVEJYE8RS
	Zmiv3aThA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLheM-00046v-PR; Fri, 25 Sep 2020 06:56:10 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLhcw-0003TV-Gq
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 06:54:50 +0000
Received: by mail-pg1-x544.google.com with SMTP id 5so1733097pgf.5
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2020 23:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q1sjz1AOP3RHN+D2U3Yr0dC8Mgj3MJeltuBOhjJoHBE=;
 b=igrI5latvdPt4aE/Cq47rXBxO6po1rbw5Kx731skmFqpAxoNONI26r8BshXxGn08b5
 7rhWAUjAPpJpJmmlqioxbRerj0BO3MtHFX0r04U6ReyaNPpzPYR3EqTGYCkeWawahwEI
 y1+Eg2bUCBNsM2idfI5XtUqmHvNJFgM3c4qZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q1sjz1AOP3RHN+D2U3Yr0dC8Mgj3MJeltuBOhjJoHBE=;
 b=BzUer37JcCkd4deQUUGzOoNi6TM9wLq41vZO4T8PF3Cmiomzv90jZZtq5xiMl2dZBW
 JjOgoorOvwK2gRI5SqRArAT51n2Cwc/wOnaYAsSpA8Z0yP9f57NK1vDjjpbJcPtVgiLh
 JrGF3rGWVX93hLU+Axdnd6CwvBtZnRqXQe3WOCL0HMG1CD61o9hQJOTfUIl6DInghjy4
 FpL3/sUod8e7M5CGgqXQ3c46f4y/wP+iiSpMgi0pscQS3BfahhVlR2WWZsQd3V3U17nt
 FKoMwzr+Yj9YiIFfGWxd/XFzQtKx5wQ0Z5qdJhoEgCB94u2Gua03SWZiXRFvHeZEWaD7
 MVgw==
X-Gm-Message-State: AOAM533mnxGGO8KZpSMFY5GVfyVdnNIOecJhcuOUsoRShnoo26scz8hV
 ijdpuPWdtqWGFxY7DQIjlkgsmQ==
X-Google-Smtp-Source: ABdhPJwyB6XORjYiFS8uQ2wfeOioKyeLL0KFpbwVKrof6R1wEMQaX91jqXNpsA2X3ljJjbI6sOtfhg==
X-Received: by 2002:a62:fc06:0:b029:142:2501:397d with SMTP id
 e6-20020a62fc060000b02901422501397dmr2805467pfh.66.1601016880071; 
 Thu, 24 Sep 2020 23:54:40 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id x27sm1549612pfp.128.2020.09.24.23.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 23:54:39 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 5/6] spi: spi-mtk-nor: support 36bit dma addressing
Date: Fri, 25 Sep 2020 14:54:16 +0800
Message-Id: <20200925145255.v3.5.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200925065418.1077472-1-ikjn@chromium.org>
References: <20200925065418.1077472-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_025442_667056_5BAFA00C 
X-CRM114-Status: GOOD (  18.49  )
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

(no changes since v1)

 drivers/spi/spi-mtk-nor.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 8dbafee7f431..35205635ed42 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -78,6 +78,8 @@
 #define MTK_NOR_REG_DMA_FADR		0x71c
 #define MTK_NOR_REG_DMA_DADR		0x720
 #define MTK_NOR_REG_DMA_END_DADR	0x724
+#define MTK_NOR_REG_DMA_DADR_HB		0x738
+#define MTK_NOR_REG_DMA_END_DADR_HB	0x73c
 
 /* maximum bytes of TX in PRG mode */
 #define MTK_NOR_PRG_MAX_SIZE		6
@@ -106,6 +108,7 @@ struct mtk_nor {
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
+	bool high_dma;
 	struct completion op_done;
 };
 
@@ -305,6 +308,11 @@ static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
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
@@ -635,7 +643,8 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
 };
 
 static const struct of_device_id mtk_nor_match[] = {
-	{ .compatible = "mediatek,mt8173-nor" },
+	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
+	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_nor_match);
@@ -647,6 +656,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct clk *spi_clk, *ctlr_clk;
 	int ret, irq;
+	unsigned long dma_bits;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -660,6 +670,12 @@ static int mtk_nor_probe(struct platform_device *pdev)
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
-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
