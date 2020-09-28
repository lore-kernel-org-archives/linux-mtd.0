Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF58CC4346E
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 02:20:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E25F20774
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 02:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0YsTRRxA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UwBVC3kc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E25F20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lhJmCLkDM/SLQwdskJhqJQMLkcxUBwaUkKHRh+cKCXg=; b=0YsTRRxAqwxITiAozDlccqa6L
	lwftKk+Qy6XKVVs6qZwF+ORvNqIrBVzM7KLnRkqvDYgkynl0cakhfnUU5Cjdm1IWoPd0PsocZhTCu
	mWyoj/meB+DQO44TMEQ9cn//c8WtSQa5ESBsrj0sQYQpgOa1Kcd6Ghcz/3y3G1C6Zmeqw368eSSpf
	YTMuJ7tCWf5CCfGEby1BLf33KGpeQYVEmMtP9KH6q/WaC2yCjusb1zVvUFUuWF3VL6uUt9l2J+j2b
	8j2UXyWK84DrFPA5X6AxFrWipJ8qbWGnk1dJydgB4QlpediWiOLMyvCBt+Sgys0YJbulFP+0Lmexu
	RNGYdpZRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMil5-0000vu-Fw; Mon, 28 Sep 2020 02:19:19 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMiky-0000uK-DV
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 02:19:13 +0000
Received: by mail-vk1-xa44.google.com with SMTP id e5so1202996vkm.2
 for <linux-mtd@lists.infradead.org>; Sun, 27 Sep 2020 19:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8r8ZQ9WFem+xMGOEuRI4QXJqsFWB3RpcceUKwYsgmIE=;
 b=UwBVC3kcZ8as2vQq5raFEecalgZi24VjAbQWkvAkqPqSIKs9/Rypej2ZHeDhZue48N
 uwHaCBKHLs+1KCY4qI3wedU96I6Mux+6hJM0PRuASqzFWoIP/oTDzMJcpvPIwW0lTStL
 nLAT/BYP8bBXu3sDR6cZGcmyVQKAKhxyLomq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8r8ZQ9WFem+xMGOEuRI4QXJqsFWB3RpcceUKwYsgmIE=;
 b=FSAT7zYgMXkO5mqttjhtdIB683k5zV/mcRSXQvHqQhrYBC0AHL7nwu8brSSIJPOoC+
 CRcQtdziXlY5bUAXwujg9wbKNQX2xJLJ5W+BH5MOzs0a6bGZNJQTuw0UCS2AlP9EaA2r
 OSvPwzQ+3MQQfp3jVX+X3tcgvtsDVqd/LmuCZxm5utGui/7r/eliiiowAGW/oremuG8V
 fWD7pI0zpgzH/+kKn88fQutXT1WTDIB5zesGUmD/rkcYYX/3M5ooxaFBzxNrjksteAyh
 ZnnNKIs7XloSv87IN2c0F2hQjQ2xPd9VEN2kni/CeBKZb7VJNdZkqzGdxXjo0ibwEuQM
 fSgQ==
X-Gm-Message-State: AOAM530TffzTDUvsBaLSb+X2FsajFcUjKPaGMkANivRh36CVo6oz4NRv
 5h4/+QeXCprykJ5GbJVmsBpa3F/3ouS27Ni/p4knYw==
X-Google-Smtp-Source: ABdhPJzMzVYBekXtY/fDL9QkaeRJXXppiNLoJcZ5OmOeX7nmgFpzlOFVzI+FQV2QY4jYTtNiAJiVdaRJ5Eo/3cOsnr4=
X-Received: by 2002:a1f:fcc2:: with SMTP id a185mr3771112vki.8.1601259549093; 
 Sun, 27 Sep 2020 19:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200925065418.1077472-1-ikjn@chromium.org>
 <20200925145255.v3.5.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
 <1601195424.7766.4.camel@mtksdaap41>
In-Reply-To: <1601195424.7766.4.camel@mtksdaap41>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 28 Sep 2020 10:18:58 +0800
Message-ID: <CAATdQgDP6kd=us35FJ=MWv4KtyATjd_RbEU5ENmBK+Z-m2GnSw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] spi: spi-mtk-nor: support 36bit dma addressing
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_221912_474125_CEF9E464 
X-CRM114-Status: GOOD (  27.48  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Sep 27, 2020 at 4:30 PM Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
>
> On Fri, 2020-09-25 at 14:54 +0800, Ikjoon Jang wrote:
> > This patch enables 36bit dma address support to spi-mtk-nor.
> > Currently this is enabled only for mt8192-nor.
> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/spi/spi-mtk-nor.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> > index 8dbafee7f431..35205635ed42 100644
> > --- a/drivers/spi/spi-mtk-nor.c
> > +++ b/drivers/spi/spi-mtk-nor.c
> > @@ -78,6 +78,8 @@
> >  #define MTK_NOR_REG_DMA_FADR         0x71c
> >  #define MTK_NOR_REG_DMA_DADR         0x720
> >  #define MTK_NOR_REG_DMA_END_DADR     0x724
> > +#define MTK_NOR_REG_DMA_DADR_HB              0x738
> > +#define MTK_NOR_REG_DMA_END_DADR_HB  0x73c
> >
> >  /* maximum bytes of TX in PRG mode */
> >  #define MTK_NOR_PRG_MAX_SIZE         6
> > @@ -106,6 +108,7 @@ struct mtk_nor {
> >       unsigned int spi_freq;
> >       bool wbuf_en;
> >       bool has_irq;
> > +     bool high_dma;
> >       struct completion op_done;
> >  };
> >
> > @@ -305,6 +308,11 @@ static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
> >       writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
> >       writel(dma_addr + length, sp->base + MTK_NOR_REG_DMA_END_DADR);
> >
> > +     if (sp->high_dma) {
> > +             writel(dma_addr >> 32, sp->base + MTK_NOR_REG_DMA_DADR_HB);
> > +             writel((dma_addr + length) >> 32, sp->base + MTK_NOR_REG_DMA_END_DADR_HB);
> > +     }
> > +
>
> Maybe use upper_32_bits() ?

Thanks, good to know that!

>
>
> >       if (sp->has_irq) {
> >               reinit_completion(&sp->op_done);
> >               mtk_nor_rmw(sp, MTK_NOR_REG_IRQ_EN, MTK_NOR_IRQ_DMA, 0);
> > @@ -635,7 +643,8 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
> >  };
> >
> >  static const struct of_device_id mtk_nor_match[] = {
> > -     { .compatible = "mediatek,mt8173-nor" },
> > +     { .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
> > +     { .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
> >       { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_nor_match);
> > @@ -647,6 +656,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
> >       void __iomem *base;
> >       struct clk *spi_clk, *ctlr_clk;
> >       int ret, irq;
> > +     unsigned long dma_bits;
> >
> >       base = devm_platform_ioremap_resource(pdev, 0);
> >       if (IS_ERR(base))
> > @@ -660,6 +670,12 @@ static int mtk_nor_probe(struct platform_device *pdev)
> >       if (IS_ERR(ctlr_clk))
> >               return PTR_ERR(ctlr_clk);
> >
> > +     dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
> > +     if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
> > +             dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
> > +             return -EINVAL;
> > +     }
> > +
>
> As said in previous version. I don't see any place enable high_dma, so I
> think this patch won't set >32bits for anychip. We need something like:
>
>         sp->hidh_dma = dma_bits > 32;
>
> Am I missing anything?

Yeah, you're right, that line disappeared between v2 ~ v3 (by mistake).

>
> Joe.C
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
