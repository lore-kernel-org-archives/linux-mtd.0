Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317A5C4727E
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 07:55:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3C112078E
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 07:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Li9vDnlZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LNtpACrZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3C112078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8d1admfuUzC8bplMA0YwVIXqNpRNjdSGQ3SrKJUFV64=; b=Li9vDnlZkhn8rgSp0q1JQlv87
	m0J88oZZ6XF3VkaWG+CwgQZLR1CyPGDcpUmmS9eogijoOkiROK1rC4XHsiK6IkM4C0X/LmR1Nv3K5
	q+Dg4U2e5VKTx3uERq+Wa5zulgvgtdalITwQIm2D9+M5f3J6nuumwAe511qd0KT4PhRJqjBueaDew
	hETIy6FIvS1Mlewy7S4MNUrCG9voLf/uPe7t7m+DfFwnUMOB2UrqRkNKCWVAhxfBGuHaQ3E82au2c
	27SnYjuZtjRD6r4h1ZtEiFip++QyRdhU1ZnabZRa07+bkN1CrfBWgywRQ6AEGVDaGrSWjvMzdkv3z
	7guBgNMuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPhoA-0002Y4-C2; Tue, 06 Oct 2020 07:54:50 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPhni-0002Mt-Hb
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 07:54:28 +0000
Received: by mail-pl1-x643.google.com with SMTP id t18so818166plo.1
 for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2020 00:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+6PvurjL54TX+y1/PrJh4kuSmSzUHQBfsfDBvhGtO0Q=;
 b=LNtpACrZ8QtTYX8EgAopthIK0bClQe8ZiTLpReJ07bZ9/zLcTwKlzsxX4ZdoDUdy3x
 9dghrilIND6vA+NcOkkScrBu4EmutgVlpYaoJB9MCFAWVyFUG4egXCit/P1JaK2wDWR1
 KntfDGXd3Vb4HlbctW0At8LyBY5dCh/oQ+SJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+6PvurjL54TX+y1/PrJh4kuSmSzUHQBfsfDBvhGtO0Q=;
 b=AftZ5aGjPLAPSm3x3dfBvMs04nGEyVBk9ACJsTE5oBmNWWX6ZK+hNzpt4vKH0C3UeM
 iJCC1rC18YwT6kWqMlZeA+wc0Vfqe9ARi3VosfZKiFMNmk01Br6vBQ4N35Zy1uZ4+Vrz
 7w2KmvvvwL8C0gIs2RQkqQ4GNd8Bji8ob5JiSiopkGgEYOeF94fixr2K19lVNoDOG6xa
 14S5h67BAHExQoNaJlQkKjtItUA5WdjKnrq7I2pM7Sh0KRpfSmdYWjMFqb/YoGiqNGn+
 /jjYNw6L0pekl+OXVyOGzZnRBvOrAvfkEgRFEspfwRZmkes/srDrAYGiz8veb/ZfRNi8
 tp+w==
X-Gm-Message-State: AOAM531i+qtCi6cYDA8xpPYwYezTeGdZzJodpW9WhzlGVivm4mHVZyCX
 Sm240Z8ngIbAnYtYNklvSqseqA==
X-Google-Smtp-Source: ABdhPJzhB+1be3wZjtai4CvszEV3UFQDP61BCOBkwhy382pX4F4n6lVjY7j9a/5gcKfhKpVJ5IebIw==
X-Received: by 2002:a17:902:6ac1:b029:d3:b3bd:b66e with SMTP id
 i1-20020a1709026ac1b02900d3b3bdb66emr2180366plt.21.1601970860839; 
 Tue, 06 Oct 2020 00:54:20 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id r6sm2545147pfq.11.2020.10.06.00.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 00:54:20 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v5 3/4] spi: spi-mtk-nor: support 36bit dma addressing
Date: Tue,  6 Oct 2020 15:54:04 +0800
Message-Id: <20201006155010.v5.3.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
In-Reply-To: <20201006075405.11658-1-ikjn@chromium.org>
References: <20201006075405.11658-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_035422_658721_47E7D395 
X-CRM114-Status: GOOD (  17.85  )
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
 drivers/spi/spi-mtk-nor.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index c11bed28b952..e46d5c93d742 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -79,6 +79,8 @@
 #define MTK_NOR_REG_DMA_FADR		0x71c
 #define MTK_NOR_REG_DMA_DADR		0x720
 #define MTK_NOR_REG_DMA_END_DADR	0x724
+#define MTK_NOR_REG_DMA_DADR_HB		0x738
+#define MTK_NOR_REG_DMA_END_DADR_HB	0x73c
 
 #define MTK_NOR_PRG_MAX_SIZE		6
 // Reading DMA src/dst addresses have to be 16-byte aligned
@@ -103,6 +105,7 @@ struct mtk_nor {
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
+	bool high_dma;
 	struct completion op_done;
 };
 
@@ -343,6 +346,13 @@ static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
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
@@ -731,7 +741,8 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
 };
 
 static const struct of_device_id mtk_nor_match[] = {
-	{ .compatible = "mediatek,mt8173-nor" },
+	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
+	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_nor_match);
@@ -743,6 +754,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct clk *spi_clk, *ctlr_clk;
 	int ret, irq;
+	unsigned long dma_bits;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -756,6 +768,12 @@ static int mtk_nor_probe(struct platform_device *pdev)
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
@@ -781,6 +799,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->dev = &pdev->dev;
 	sp->spi_clk = spi_clk;
 	sp->ctlr_clk = ctlr_clk;
+	sp->high_dma = (dma_bits > 32);
 	sp->buffer = dmam_alloc_coherent(&pdev->dev,
 				MTK_NOR_BOUNCE_BUF_SIZE + MTK_NOR_DMA_ALIGN,
 				&sp->buffer_dma, GFP_KERNEL);
-- 
2.28.0.806.g8561365e88-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
