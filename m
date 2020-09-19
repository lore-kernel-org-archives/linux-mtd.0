Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCE1C43464
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 15:28:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FAC12098B
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 15:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQmwF4yR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AkC4jDUG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FAC12098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MKIX6EG2ogWJRNgsDLHSCDhW/H76Y5gLcSL6VGml7ek=; b=bQmwF4yRrGpd+JRTO0VBzmZiM
	/N9Co+z9p2MyqNYHETxgSeYhTEvnIqmNYVgQ+boapI+HPupOXfUBr1ET7j/J6UwYYsjmYqdwEsf1p
	F9jMejuCe0rauzNRhPfvlRBuYkrgst4gTfnb+nNRzDEA/VV8wJerZwdMGXo7nh5Fuguo4gpzf7NBs
	NvULrnGojfOLyjABlD2vcFZubr/QvE+l2wZzPVbnaE2ou6lHz4lQk/ej8EEnAvgHCOxjd/clwZ0ss
	QREHuaNino6g7CISJYPj9VNz9oaxlxfi4JSfFftbO0pGHzyLVNazC1PvgdTpgySzO8h+76W1mK6tg
	UWL9GP20Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJelh-0000mz-CR; Sat, 19 Sep 2020 15:27:17 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJeld-0000j1-3I; Sat, 19 Sep 2020 15:27:15 +0000
X-UUID: 13ed17d77ef34e06a9bc351a089705f4-20200919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IrIcNVhFVMWRbTHiVNPXL4VIQ4/x908yIeAq6qk9Ekc=; 
 b=AkC4jDUGvMpB3L53ZdH1ue0FGSgGFs0n4j/r6cPjzBdoxCITafuHL1+KZakmoORsWbVBlIBD+Z+jxGoFMGRMt3JL8uVKSby43kwv/ZBVGx9o7SRkI4MdleN8ZkXPUF3oVHclKUJDTfdCQial5DRmFTjC0CrOqxeEsQbfCpWVeAQ=;
X-UUID: 13ed17d77ef34e06a9bc351a089705f4-20200919
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1125254471; Sat, 19 Sep 2020 07:26:54 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 19 Sep 2020 08:26:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 19 Sep 2020 23:26:50 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 19 Sep 2020 23:26:42 +0800
Message-ID: <1600529204.7002.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 4/5] spi: spi-mtk-nor: support 36bit dma addressing
 to mediatek
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Sat, 19 Sep 2020 23:26:44 +0800
In-Reply-To: <20200918162834.v2.4.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
References: <20200918083124.3921207-1-ikjn@chromium.org>
 <20200918162834.v2.4.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 46E17E8B4D077AB8C9950FBED0B79A5B30E2719458EBEF71FDC429C6B020E84F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_112714_156061_BD568686 
X-CRM114-Status: GOOD (  23.51  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-18 at 16:31 +0800, Ikjoon Jang wrote:
> This patch enables 36bit dma address support to spi-mtk-nor.
> Currently 36bit dma addressing is enabled only for mt8192-nor.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/spi/spi-mtk-nor.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index e14798a6e7d0..99dd5dca744e 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -78,6 +78,8 @@
>  #define MTK_NOR_REG_DMA_FADR		0x71c
>  #define MTK_NOR_REG_DMA_DADR		0x720
>  #define MTK_NOR_REG_DMA_END_DADR	0x724
> +#define MTK_NOR_REG_DMA_DADR_HB		0x738
> +#define MTK_NOR_REG_DMA_END_DADR_HB	0x73c
>  
>  #define MTK_NOR_PRG_MAX_SIZE		6
>  // Reading DMA src/dst addresses have to be 16-byte aligned
> @@ -102,6 +104,7 @@ struct mtk_nor {
>  	unsigned int spi_freq;
>  	bool wbuf_en;
>  	bool has_irq;
> +	bool high_dma;
>  	struct completion op_done;
>  };
>  
> @@ -291,6 +294,11 @@ static int read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
>  	writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
>  	writel(dma_addr + length, sp->base + MTK_NOR_REG_DMA_END_DADR);
>  
> +	if (sp->high_dma) {
> +		writel(dma_addr >> 32, sp->base + MTK_NOR_REG_DMA_DADR_HB);
> +		writel((dma_addr + length) >> 32, sp->base + MTK_NOR_REG_DMA_END_DADR_HB);
> +	}
> +
>  	if (sp->has_irq) {
>  		reinit_completion(&sp->op_done);
>  		mtk_nor_rmw(sp, MTK_NOR_REG_IRQ_EN, MTK_NOR_IRQ_DMA, 0);
> @@ -594,7 +602,8 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
>  };
>  
>  static const struct of_device_id mtk_nor_match[] = {
> -	{ .compatible = "mediatek,mt8173-nor" },
> +	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
> +	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_nor_match);
> @@ -607,6 +616,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
>  	u8 *buffer;
>  	struct clk *spi_clk, *ctlr_clk;
>  	int ret, irq;
> +	unsigned long dma_bits;
>  
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
> @@ -623,6 +633,13 @@ static int mtk_nor_probe(struct platform_device *pdev)
>  	buffer = devm_kmalloc(&pdev->dev,
>  			      MTK_NOR_BOUNCE_BUF_SIZE + MTK_NOR_DMA_ALIGN,
>  			      GFP_KERNEL);
> +
> +	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
> +	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
> +		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
> +		return -EINVAL;
> +	}
> +

Do we need to set sp->high_dma when we have >32bits DMA?

Joe.C
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
