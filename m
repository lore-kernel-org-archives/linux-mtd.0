Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A688AC43465
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:34:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1477120789
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:34:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aibvRtuZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aKWzQy2E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1477120789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iZZJP0pO+FmkgqTCF8nLmJlQlRkBWvl82v0uZ+u0KYk=; b=aibvRtuZRWuWybxEnpSVq6I7c
	jeAOJdRSqIxdlLYXg9phlibO304LkbzDNSVTw8InFVhbJpnCZwKwixP+QEUFVLHnuHyTUVnHBe/5s
	CwWyCFThNCElYH6BkIRypY7mdzh2wPKFDJi9KzXwUz3JwOsn7YYALvkTitwDUJ1tZY6XjBd2LuWE2
	gk72F63a+6UAafpFnfCcLOgDuoruszTYGL9qOLJB3bEAmSp86t7p/SSJ8Su9oOAakbX4HYPck3jTP
	XuVDMXg012EX4uqWAqZlReKNafkXK9RokEKS8HascLNIsYvT0SXyheZvd75q6gQCyUnb8mJ614km9
	h51/LxPXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBp7-0000Jp-0g; Fri, 18 Sep 2020 08:32:53 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBnw-0008Et-NJ
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 08:31:46 +0000
Received: by mail-pj1-x1044.google.com with SMTP id mm21so2777232pjb.4
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2020 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mxzc9a+AIt4XaKyopJ42uaLRgvLPMA2J58JJPLPnlzc=;
 b=aKWzQy2E785EwAM3zf48FJb9SNxM9DqZ/gBRc2hdvGt4wpySSDDXJpsjYmHjGtfHFg
 Pef8sAkwLXdKucFl0JVcA28XlPywjWT6DIOd/jU30Y3A7jt6NOFX2NGxl2v6yHSy8XPy
 U0V84UjZArDqeNq+9eUQ3y6A7X+a2w20XBgfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mxzc9a+AIt4XaKyopJ42uaLRgvLPMA2J58JJPLPnlzc=;
 b=IZR05RepJ5cQxDVQjir4HpMEnY3+IuM4eY53FqKSYZoXAUgC3LvnMhXgFRq7DuvMhr
 UzOuRnJNFK8/c+qQEXi7ZlNjCxf8CrYlsJu5xu7ukA8fWEcxS2Ro0wxRFG4ozEmUCjSh
 EQ17rSwkQweUuRAX59xLQq6s2aCoE5U6g/X2Asnp/XrAdCeC0jR0O0mzar9OKjBslT53
 SdtWos1cJMw/YkoENNspCsTRyJdzULviAIADzGqjs5HlbFWBgOcN5yhoNNv5v1XLDZbH
 uqMcHFFSDLH2V34BnYyYeLhiGYN1UJGObP5j9FZSUNQMGejm/AwjXpyE6ASGP6AvL88J
 lxSg==
X-Gm-Message-State: AOAM531mdynQG/SE/FHF9jYUpSo1m81Albu+J39un6E5+JoQQV49u1V8
 6PRIlP/C/iVOmPetY/9c6vAt4w==
X-Google-Smtp-Source: ABdhPJzBVKAVejjumP8o+IHhjgLXqk+sE9Xn+VoGTnsSVjmfSDXZ5WjU6KJ+Men/NRjcjzHizH5IhA==
X-Received: by 2002:a17:90a:858a:: with SMTP id
 m10mr11441620pjn.185.1600417898406; 
 Fri, 18 Sep 2020 01:31:38 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id g206sm2193172pfb.178.2020.09.18.01.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 01:31:37 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/5] spi: spi-mtk-nor: use dma_alloc_coherent() for bounce
 buffer
Date: Fri, 18 Sep 2020 16:31:21 +0800
Message-Id: <20200918162834.v2.3.I06cb65401ab5ad63ea30c4788d26633928d80f38@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200918083124.3921207-1-ikjn@chromium.org>
References: <20200918083124.3921207-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_043140_847272_C14BE747 
X-CRM114-Status: GOOD (  18.52  )
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

Use dma_alloc_coherent() for bounce buffer instead of kmalloc.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

(no changes since v1)

 drivers/spi/spi-mtk-nor.c | 60 +++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 54b2c0fde95b..e14798a6e7d0 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -96,6 +96,7 @@ struct mtk_nor {
 	struct device *dev;
 	void __iomem *base;
 	u8 *buffer;
+	dma_addr_t buffer_dma;
 	struct clk *spi_clk;
 	struct clk *ctlr_clk;
 	unsigned int spi_freq;
@@ -275,19 +276,16 @@ static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
 	mtk_nor_rmw(sp, MTK_NOR_REG_BUSCFG, reg, MTK_NOR_BUS_MODE_MASK);
 }
 
-static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
-			    u8 *buffer)
+static int read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
+		    dma_addr_t dma_addr)
 {
 	int ret = 0;
 	ulong delay;
 	u32 reg;
-	dma_addr_t dma_addr;
 
-	dma_addr = dma_map_single(sp->dev, buffer, length, DMA_FROM_DEVICE);
-	if (dma_mapping_error(sp->dev, dma_addr)) {
-		dev_err(sp->dev, "failed to map dma buffer.\n");
+	if (WARN_ON((length & MTK_NOR_DMA_ALIGN_MASK) ||
+		    (dma_addr & MTK_NOR_DMA_ALIGN_MASK)))
 		return -EINVAL;
-	}
 
 	writel(from, sp->base + MTK_NOR_REG_DMA_FADR);
 	writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
@@ -312,30 +310,39 @@ static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
 					 (delay + 1) * 100);
 	}
 
-	dma_unmap_single(sp->dev, dma_addr, length, DMA_FROM_DEVICE);
 	if (ret < 0)
 		dev_err(sp->dev, "dma read timeout.\n");
 
 	return ret;
 }
 
-static int mtk_nor_read_bounce(struct mtk_nor *sp, u32 from,
-			       unsigned int length, u8 *buffer)
+static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from,
+			    unsigned int length, u8 *buffer)
 {
-	unsigned int rdlen;
 	int ret;
+	dma_addr_t dma_addr;
+	bool bounce = need_bounce(buffer, length);
 
-	if (length & MTK_NOR_DMA_ALIGN_MASK)
-		rdlen = (length + MTK_NOR_DMA_ALIGN) & ~MTK_NOR_DMA_ALIGN_MASK;
-	else
-		rdlen = length;
+	if (!bounce) {
+		dma_addr = dma_map_single(sp->dev, buffer, length,
+					  DMA_FROM_DEVICE);
+		if (dma_mapping_error(sp->dev, dma_addr)) {
+			dev_err(sp->dev, "failed to map dma buffer.\n");
+			return -EINVAL;
+		}
+	} else {
+		dma_addr = sp->buffer_dma;
+	}
 
-	ret = mtk_nor_read_dma(sp, from, rdlen, sp->buffer);
-	if (ret)
-		return ret;
+	ret = read_dma(sp, from, length, dma_addr);
 
-	memcpy(buffer, sp->buffer, length);
-	return 0;
+	if (!bounce)
+		dma_unmap_single(sp->dev, dma_addr, length,
+				 DMA_FROM_DEVICE);
+	else
+		memcpy(buffer, sp->buffer, length);
+
+	return ret;
 }
 
 static int mtk_nor_read_pio(struct mtk_nor *sp, const struct spi_mem_op *op)
@@ -439,11 +446,6 @@ static int mtk_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		if (op->data.nbytes == 1) {
 			mtk_nor_set_addr(sp, op);
 			return mtk_nor_read_pio(sp, op);
-		} else if (((ulong)(op->data.buf.in) &
-			    MTK_NOR_DMA_ALIGN_MASK)) {
-			return mtk_nor_read_bounce(sp, op->addr.val,
-						   op->data.nbytes,
-						   op->data.buf.in);
 		} else {
 			return mtk_nor_read_dma(sp, op->addr.val,
 						op->data.nbytes,
@@ -654,6 +656,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->dev = &pdev->dev;
 	sp->spi_clk = spi_clk;
 	sp->ctlr_clk = ctlr_clk;
+	sp->buffer = dma_alloc_coherent(&pdev->dev, MTK_NOR_BOUNCE_BUF_SIZE,
+					&sp->buffer_dma, GFP_KERNEL);
+	if (!sp->buffer)
+		return -ENOMEM;
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0) {
@@ -674,6 +680,8 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	ret = mtk_nor_init(sp);
 	if (ret < 0) {
 		kfree(ctlr);
+		dma_free_coherent(&pdev->dev, MTK_NOR_BOUNCE_BUF_SIZE,
+				  sp->buffer, sp->buffer_dma);
 		return ret;
 	}
 
@@ -692,6 +700,8 @@ static int mtk_nor_remove(struct platform_device *pdev)
 
 	mtk_nor_disable_clk(sp);
 
+	dma_free_coherent(&pdev->dev, MTK_NOR_BOUNCE_BUF_SIZE,
+			  sp->buffer, sp->buffer_dma);
 	return 0;
 }
 
-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
