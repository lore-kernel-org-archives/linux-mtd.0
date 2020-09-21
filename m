Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224F8C43463
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 06:53:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4EE7207BC
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 06:53:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a2R4zkDt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dDsnw+80"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4EE7207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xQ9A3OO4lSIoh68rG/6M7o1kU6OPZZuyDuc5lioM2fA=; b=a2R4zkDtOEIlgEXPNp3Jfs0TP
	Kz66hdSYbI/AkFYCvr7jOigY7/5JbKDsWOWlHowSR7NRtrC/E4rEME11D/WobKFkuN5kZLrZEjPJ8
	SEYX7mdrRCZ+1Z7DJiucqT/JvGxuU7F2Oyrwf8ujOLiYowewCBaJdehE2dChoo/R6AqThLxQ6memm
	Pz6QH8SvnofP9E0+nGX5q8v7Cllazvt1HUXy2ZDIJ/PDmszHlwgdvLHK1Y8bTMk89aEXkrPLS2J6z
	4lt0jae07g+CiK2hGUNUiNBCfAVbuHsDf+VerJMu+t1s0MhTDGfOHmF3XFDg+4/tkD4yBrxDqqiZu
	EMVy/HQZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKFgd-0002fp-PA; Mon, 21 Sep 2020 06:52:31 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKFga-0002ee-UL
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 06:52:30 +0000
Received: by mail-vs1-xe41.google.com with SMTP id p24so2513495vsf.8
 for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2020 23:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AeLRUtPe9HVlfuGxkbMZRtBXYqd2i71LyWN09E0jksA=;
 b=dDsnw+8075HinxoW83Bd0AAOX1rlDwkTptMNLXl2BgJeKaCtne8RTPqBpTGbxCY7V2
 pVsIfL3bg6W0301JBde9EatxJQMTyjuTFg6J9VAMX4qdwGM+/7OxbIDENt5YrdHjj6vs
 AlGBB0xjmRzr3DjcTGUyvIjHaWPG26kbF9F9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AeLRUtPe9HVlfuGxkbMZRtBXYqd2i71LyWN09E0jksA=;
 b=SWPxCn16JSHwscdO+WxvV9HGlG7YUSwuLghbfjAR4flV44qNQv15uYnlyiuBQ7YPLB
 C3Jb76Ai96iU0H2tZiDLeTJVAA2n3lpGloQmnRPp9MgDhwgSYFbB6h6KuVZo2Of9Kwy2
 hGQlTDiuwkip4aQnerAtcXx8sB931CL7Ve6AUklr34l8lSJJ+jFd4vVlUsEoKNz9peBG
 RWdSd2dCg6YA56VlyLhcFYYZFOqXl6OKEZ6I5QLxe5WycWknnFiHYCw/JKZi9wJtsuxd
 pTO7sg413sxJW7Lpy1QqaVc6R6/x/Nu6IavFOsyBaSsL5Y5S+9BO61603HBmWrZFPk02
 9ihQ==
X-Gm-Message-State: AOAM531tG6BpSYBekMIzRHKN1Ob/TEnX03G9lJtmYEa8UM4RUCXKHuyy
 cOvyjfsz0qhdCvexk/fWMJmj8quIC5oQXgWtiCRu1Q==
X-Google-Smtp-Source: ABdhPJwxJRS724WS0GpV4n1bZY+O9oUk+Jiyi+xUNpksXVtmiBEB3r94MIx7bx5rCSZDanbF+xKAxTL5tgYZDvhDtJs=
X-Received: by 2002:a67:8097:: with SMTP id b145mr16948393vsd.40.1600671146934; 
 Sun, 20 Sep 2020 23:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200918083124.3921207-1-ikjn@chromium.org>
 <20200918162834.v2.3.I06cb65401ab5ad63ea30c4788d26633928d80f38@changeid>
 <CAJsYDVLy_ef25Jb+7QFTUZx0-dcif1RKBGJ8TzQx5t7e2dDLMQ@mail.gmail.com>
In-Reply-To: <CAJsYDVLy_ef25Jb+7QFTUZx0-dcif1RKBGJ8TzQx5t7e2dDLMQ@mail.gmail.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 21 Sep 2020 14:52:16 +0800
Message-ID: <CAATdQgBk=-Xa0mUg_vdj1s5ei+VUtQYAnc3xrhT9EJiOZzfqEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] spi: spi-mtk-nor: use dma_alloc_coherent() for
 bounce buffer
To: Chuanhong Guo <gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_025228_994374_931CCC90 
X-CRM114-Status: GOOD (  34.85  )
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

On Fri, Sep 18, 2020 at 9:25 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> Hi!
>
> On Fri, Sep 18, 2020 at 4:35 PM Ikjoon Jang <ikjn@chromium.org> wrote:
> >
> > Use dma_alloc_coherent() for bounce buffer instead of kmalloc.
>
> The commit message should explain why such a change is
> needed. (i.e. why using dma_alloc_coherent here is better
> than kmalloc.) And if there's no benefit for this change I'd prefer
> leaving it untouched.
> I remembered reading somewhere that stream DMA api is
> prefered over dma_alloc_coherent for this kind of single-direction
> DMA operation.
>

I will add more description on why I changed it to dma_alloc_coherent():
- to explictly support devices like mt8173-nor which only supports
32bit addressing for dma.

And it also reminded me an another problem, (I won't address this
issue for now in v3):
as this device is using dma range as [start, end) format
where 'end' can be zero in that corner case of {start = 0xffff_f000; end = 0; }

> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/spi/spi-mtk-nor.c | 60 +++++++++++++++++++++++----------------
> >  1 file changed, 35 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> > index 54b2c0fde95b..e14798a6e7d0 100644
> > --- a/drivers/spi/spi-mtk-nor.c
> > +++ b/drivers/spi/spi-mtk-nor.c
> > @@ -96,6 +96,7 @@ struct mtk_nor {
> >         struct device *dev;
> >         void __iomem *base;
> >         u8 *buffer;
> > +       dma_addr_t buffer_dma;
> >         struct clk *spi_clk;
> >         struct clk *ctlr_clk;
> >         unsigned int spi_freq;
> > @@ -275,19 +276,16 @@ static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
> >         mtk_nor_rmw(sp, MTK_NOR_REG_BUSCFG, reg, MTK_NOR_BUS_MODE_MASK);
> >  }
> >
> > -static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
> > -                           u8 *buffer)
> > +static int read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
>
> This name is a bit confusing considering there's a mtk_nor_read_dma
> below.
> As this function now only executes dma readings and wait it to finish,
> what about mtk_nor_dma_exec instead?

yeah, good idea.

>
> > +                   dma_addr_t dma_addr)
> >  {
> >         int ret = 0;
> >         ulong delay;
> >         u32 reg;
> > -       dma_addr_t dma_addr;
> >
> > -       dma_addr = dma_map_single(sp->dev, buffer, length, DMA_FROM_DEVICE);
> > -       if (dma_mapping_error(sp->dev, dma_addr)) {
> > -               dev_err(sp->dev, "failed to map dma buffer.\n");
> > +       if (WARN_ON((length & MTK_NOR_DMA_ALIGN_MASK) ||
> > +                   (dma_addr & MTK_NOR_DMA_ALIGN_MASK)))
>
> These alignment is guaranteed by callers of this function if all
> my comments below are addressed. This check isn't needed.

ACK.

>
> >                 return -EINVAL;
> > -       }
> >
> >         writel(from, sp->base + MTK_NOR_REG_DMA_FADR);
> >         writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
> > @@ -312,30 +310,39 @@ static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
> >                                          (delay + 1) * 100);
> >         }
> >
> > -       dma_unmap_single(sp->dev, dma_addr, length, DMA_FROM_DEVICE);
> >         if (ret < 0)
> >                 dev_err(sp->dev, "dma read timeout.\n");
> >
> >         return ret;
> >  }
> >
> > -static int mtk_nor_read_bounce(struct mtk_nor *sp, u32 from,
> > -                              unsigned int length, u8 *buffer)
> > +static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from,
> > +                           unsigned int length, u8 *buffer)
> >  {
> > -       unsigned int rdlen;
> >         int ret;
> > +       dma_addr_t dma_addr;
> > +       bool bounce = need_bounce(buffer, length);
> >
> > -       if (length & MTK_NOR_DMA_ALIGN_MASK)
> > -               rdlen = (length + MTK_NOR_DMA_ALIGN) & ~MTK_NOR_DMA_ALIGN_MASK;
>
> The intention of this rdlen alignment is explained in 2/5.
> Please make sure this rdlen alignment logic is present
> only for PIO reading.

okay, I'll use padding again in v3.

>
> > -       else
> > -               rdlen = length;
> > +       if (!bounce) {
> > +               dma_addr = dma_map_single(sp->dev, buffer, length,
> > +                                         DMA_FROM_DEVICE);
> > +               if (dma_mapping_error(sp->dev, dma_addr)) {
> > +                       dev_err(sp->dev, "failed to map dma buffer.\n");
> > +                       return -EINVAL;
> > +               }
> > +       } else {
> > +               dma_addr = sp->buffer_dma;
> > +       }
> >
> > -       ret = mtk_nor_read_dma(sp, from, rdlen, sp->buffer);
> > -       if (ret)
> > -               return ret;
> > +       ret = read_dma(sp, from, length, dma_addr);
> >
> > -       memcpy(buffer, sp->buffer, length);
> > -       return 0;
> > +       if (!bounce)
> > +               dma_unmap_single(sp->dev, dma_addr, length,
> > +                                DMA_FROM_DEVICE);
> > +       else
> > +               memcpy(buffer, sp->buffer, length);
> > +
> > +       return ret;
> >  }
>
> I think a separated read_dma and read_bounce function will be
> cleaner than this if-else implementation:
> read_dma:
> 1. call dma_map_single to get physical address
> 2. call read_dma to execute operation
> 3. call dma_unmap_single
>
> read_bounce:
> 1. align reading length
> 2. call read_dma
> 3. call memcpy

ACK

>
> >
> >  static int mtk_nor_read_pio(struct mtk_nor *sp, const struct spi_mem_op *op)
> > @@ -439,11 +446,6 @@ static int mtk_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> >                 if (op->data.nbytes == 1) {
> >                         mtk_nor_set_addr(sp, op);
> >                         return mtk_nor_read_pio(sp, op);
> > -               } else if (((ulong)(op->data.buf.in) &
> > -                           MTK_NOR_DMA_ALIGN_MASK)) {
> > -                       return mtk_nor_read_bounce(sp, op->addr.val,
> > -                                                  op->data.nbytes,
> > -                                                  op->data.buf.in);
> >                 } else {
> >                         return mtk_nor_read_dma(sp, op->addr.val,
> >                                                 op->data.nbytes,
> > @@ -654,6 +656,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
> >         sp->dev = &pdev->dev;
> >         sp->spi_clk = spi_clk;
> >         sp->ctlr_clk = ctlr_clk;
>
> There is extra memory allocation code for sp->buffer in mtk_nor_probe.
> If you intend to replace this with dma_alloc_coherent you should
> drop those devm_kmalloc code as well.
>
> > +       sp->buffer = dma_alloc_coherent(&pdev->dev, MTK_NOR_BOUNCE_BUF_SIZE,
> > +                                       &sp->buffer_dma, GFP_KERNEL);
>
> There's a devm variant: dmam_alloc_coherent(dev, size, dma_handle, gfp)

ACK

>
> > +       if (!sp->buffer)
> > +               return -ENOMEM;
>
> This spi-nor controller requires all addresses to be 16-byte aligned.
> Although it should be guaranteed by a usually way larger page
> alignment address from dma_alloc_coherent I'd prefer an explicit
> check for address alignment here rather than letting it probe
> successfully and fail for every dma_read with bounce buffer.
>

Yep, I'll restore the padding.

>
> >
> >         irq = platform_get_irq_optional(pdev, 0);
> >         if (irq < 0) {
> > @@ -674,6 +680,8 @@ static int mtk_nor_probe(struct platform_device *pdev)
> >         ret = mtk_nor_init(sp);
> >         if (ret < 0) {
> >                 kfree(ctlr);
> > +               dma_free_coherent(&pdev->dev, MTK_NOR_BOUNCE_BUF_SIZE,
> > +                                 sp->buffer, sp->buffer_dma);
> >                 return ret;
> >         }
> >
> > @@ -692,6 +700,8 @@ static int mtk_nor_remove(struct platform_device *pdev)
> >
> >         mtk_nor_disable_clk(sp);
> >
> > +       dma_free_coherent(&pdev->dev, MTK_NOR_BOUNCE_BUF_SIZE,
> > +                         sp->buffer, sp->buffer_dma);
> >         return 0;
> >  }
> >
> > --
> > 2.28.0.681.g6f77f65b4e-goog
> >
>
>
> --
> Regards,
> Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
