Received: from mail-yk0-x242.google.com ([2607:f8b0:4002:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZruQy-0005SO-Kd
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2015 21:08:33 +0000
Received: by ykba4 with SMTP id a4so4543992ykb.3
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2015 14:08:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1445983540-27155-4-git-send-email-b45815@freescale.com>
References: <1445983540-27155-1-git-send-email-b45815@freescale.com>
 <1445983540-27155-4-git-send-email-b45815@freescale.com>
Date: Thu, 29 Oct 2015 23:08:10 +0200
Message-ID: <CAHp75Vf3OddaGgwrOyk0EE46oFmjoRt+rj3su2VBJQwUnGdRAw@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] dmaengine: mxs: add i.MX7D APBH DMA support
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Han Xu <b45815@freescale.com>
Cc: shijie.huang@arm.com, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, boris.brezillon@free-electrons.com,
 fabio.estevam@freescale.com, hofrat@osadl.org,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vinod.koul@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, dmaengine <dmaengine@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 28, 2015 at 12:05 AM, Han Xu <b45815@freescale.com> wrote:
> From: Adrian Alonso <aalonso@freescale.com>
>
> supports APBH DMA on i.MX7D by add extra clock clk_io

[]

>  MODULE_DEVICE_TABLE(of, mxs_dma_dt_ids);
> @@ -440,6 +448,13 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
>         if (ret)
>                 goto err_clk;
>
> +       /* enable the extra clk_io clock for i.MX7D */
> +       if (mxs_dma->dev_id == IMX7D_DMA) {
> +               ret = clk_prepare_enable(mxs_dma->clk_io);
> +               if (ret)
> +                       goto err_clk_unprepare;

Perhaps err_clk.

> +       }
> +
>         mxs_dma_reset_chan(chan);
>
>         dma_async_tx_descriptor_init(&mxs_chan->desc, chan);
> @@ -450,6 +465,8 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
>
>         return 0;
>
> +err_clk_unprepare:
> +       clk_disable_unprepare(mxs_dma->clk);
>  err_clk:
>         free_irq(mxs_chan->chan_irq, mxs_dma);
>  err_irq:
> @@ -471,6 +488,9 @@ static void mxs_dma_free_chan_resources(struct dma_chan *chan)
>         dma_free_coherent(mxs_dma->dma_device.dev, CCW_BLOCK_SIZE,
>                         mxs_chan->ccw, mxs_chan->ccw_phys);
>
> +       if (mxs_dma->dev_id == IMX7D_DMA)
> +               clk_disable_unprepare(mxs_dma->clk_io);
> +
>         clk_disable_unprepare(mxs_dma->clk);
>  }
>
> @@ -701,9 +721,15 @@ static int mxs_dma_init(struct mxs_dma_engine *mxs_dma)
>         if (ret)
>                 return ret;
>
> +       if (mxs_dma->dev_id == IMX7D_DMA) {
> +               ret = clk_prepare_enable(mxs_dma->clk_io);
> +               if (ret)
> +                       goto err_clk_bch;
> +       }
> +
>         ret = stmp_reset_block(mxs_dma->base);
>         if (ret)
> -               goto err_out;
> +               goto err_clk_io;
>
>         /* enable apbh burst */
>         if (dma_is_apbh(mxs_dma)) {
> @@ -717,7 +743,10 @@ static int mxs_dma_init(struct mxs_dma_engine *mxs_dma)
>         writel(MXS_DMA_CHANNELS_MASK << MXS_DMA_CHANNELS,
>                 mxs_dma->base + HW_APBHX_CTRL1 + STMP_OFFSET_REG_SET);
>
> -err_out:
> +err_clk_io:
> +       if (mxs_dma->dev_id == IMX7D_DMA)
> +               clk_disable_unprepare(mxs_dma->clk_io);
> +err_clk_bch:
>         clk_disable_unprepare(mxs_dma->clk);
>         return ret;
>  }
> @@ -803,9 +832,19 @@ static int __init mxs_dma_probe(struct platform_device *pdev)
>         if (IS_ERR(mxs_dma->base))
>                 return PTR_ERR(mxs_dma->base);
>
> -       mxs_dma->clk = devm_clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(mxs_dma->clk))
> -               return PTR_ERR(mxs_dma->clk);
> +       if (mxs_dma->dev_id == IMX7D_DMA) {
> +               mxs_dma->clk = devm_clk_get(&pdev->dev, "dma_apbh_bch");
> +               if (IS_ERR(mxs_dma->clk))
> +                       return PTR_ERR(mxs_dma->clk);
> +               mxs_dma->clk_io = devm_clk_get(&pdev->dev, "dma_apbh_io");
> +               if (IS_ERR(mxs_dma->clk_io))
> +                       return PTR_ERR(mxs_dma->clk_io);
> +

Redundant empty line.

> +       } else {
> +               mxs_dma->clk = devm_clk_get(&pdev->dev, NULL);
> +               if (IS_ERR(mxs_dma->clk))
> +                       return PTR_ERR(mxs_dma->clk);
> +       }



-- 
With Best Regards,
Andy Shevchenko
