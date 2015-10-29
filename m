Received: from mail-bn1bbn0107.outbound.protection.outlook.com
 ([157.56.111.107] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZruXv-00014Q-Sn
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2015 21:15:44 +0000
Date: Thu, 29 Oct 2015 16:03:56 -0500
From: Han Xu <han.xu@freescale.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Han Xu <b45815@freescale.com>, <shijie.huang@arm.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, <fabio.estevam@freescale.com>,
 <hofrat@osadl.org>, "open list:MEMORY TECHNOLOGY..."
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, "Dan
 Williams" <dan.j.williams@intel.com>, dmaengine <dmaengine@vger.kernel.org>
Subject: Re: [PATCH v7 3/7] dmaengine: mxs: add i.MX7D APBH DMA support
Message-ID: <20151029210355.GA7674@chopperman.am.freescale.net>
References: <1445983540-27155-1-git-send-email-b45815@freescale.com>
 <1445983540-27155-4-git-send-email-b45815@freescale.com>
 <CAHp75Vf3OddaGgwrOyk0EE46oFmjoRt+rj3su2VBJQwUnGdRAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75Vf3OddaGgwrOyk0EE46oFmjoRt+rj3su2VBJQwUnGdRAw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 29, 2015 at 11:08:10PM +0200, Andy Shevchenko wrote:
> On Wed, Oct 28, 2015 at 12:05 AM, Han Xu <b45815@freescale.com> wrote:
> > From: Adrian Alonso <aalonso@freescale.com>
> >
> > supports APBH DMA on i.MX7D by add extra clock clk_io
> 
> []
> 
> >  MODULE_DEVICE_TABLE(of, mxs_dma_dt_ids);
> > @@ -440,6 +448,13 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
> >         if (ret)
> >                 goto err_clk;
> >
> > +       /* enable the extra clk_io clock for i.MX7D */
> > +       if (mxs_dma->dev_id == IMX7D_DMA) {
> > +               ret = clk_prepare_enable(mxs_dma->clk_io);
> > +               if (ret)
> > +                       goto err_clk_unprepare;
> 
> Perhaps err_clk.
> 
it is err_clk_unprepare
> > +       }
> > +
> >         mxs_dma_reset_chan(chan);
> >
> >         dma_async_tx_descriptor_init(&mxs_chan->desc, chan);
> > @@ -450,6 +465,8 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
> >
> >         return 0;
> >
> > +err_clk_unprepare:
> > +       clk_disable_unprepare(mxs_dma->clk);
> >  err_clk:
> >         free_irq(mxs_chan->chan_irq, mxs_dma);
> >  err_irq:
> > @@ -471,6 +488,9 @@ static void mxs_dma_free_chan_resources(struct dma_chan *chan)
> >         dma_free_coherent(mxs_dma->dma_device.dev, CCW_BLOCK_SIZE,
> >                         mxs_chan->ccw, mxs_chan->ccw_phys);
> >
> > +       if (mxs_dma->dev_id == IMX7D_DMA)
> > +               clk_disable_unprepare(mxs_dma->clk_io);
> > +
> >         clk_disable_unprepare(mxs_dma->clk);
> >  }
> >
> > @@ -701,9 +721,15 @@ static int mxs_dma_init(struct mxs_dma_engine *mxs_dma)
> >         if (ret)
> >                 return ret;
> >
> > +       if (mxs_dma->dev_id == IMX7D_DMA) {
> > +               ret = clk_prepare_enable(mxs_dma->clk_io);
> > +               if (ret)
> > +                       goto err_clk_bch;
> > +       }
> > +
> >         ret = stmp_reset_block(mxs_dma->base);
> >         if (ret)
> > -               goto err_out;
> > +               goto err_clk_io;
> >
> >         /* enable apbh burst */
> >         if (dma_is_apbh(mxs_dma)) {
> > @@ -717,7 +743,10 @@ static int mxs_dma_init(struct mxs_dma_engine *mxs_dma)
> >         writel(MXS_DMA_CHANNELS_MASK << MXS_DMA_CHANNELS,
> >                 mxs_dma->base + HW_APBHX_CTRL1 + STMP_OFFSET_REG_SET);
> >
> > -err_out:
> > +err_clk_io:
> > +       if (mxs_dma->dev_id == IMX7D_DMA)
> > +               clk_disable_unprepare(mxs_dma->clk_io);
> > +err_clk_bch:
> >         clk_disable_unprepare(mxs_dma->clk);
> >         return ret;
> >  }
> > @@ -803,9 +832,19 @@ static int __init mxs_dma_probe(struct platform_device *pdev)
> >         if (IS_ERR(mxs_dma->base))
> >                 return PTR_ERR(mxs_dma->base);
> >
> > -       mxs_dma->clk = devm_clk_get(&pdev->dev, NULL);
> > -       if (IS_ERR(mxs_dma->clk))
> > -               return PTR_ERR(mxs_dma->clk);
> > +       if (mxs_dma->dev_id == IMX7D_DMA) {
> > +               mxs_dma->clk = devm_clk_get(&pdev->dev, "dma_apbh_bch");
> > +               if (IS_ERR(mxs_dma->clk))
> > +                       return PTR_ERR(mxs_dma->clk);
> > +               mxs_dma->clk_io = devm_clk_get(&pdev->dev, "dma_apbh_io");
> > +               if (IS_ERR(mxs_dma->clk_io))
> > +                       return PTR_ERR(mxs_dma->clk_io);
> > +
> 
> Redundant empty line.
> 
> > +       } else {
> > +               mxs_dma->clk = devm_clk_get(&pdev->dev, NULL);
> > +               if (IS_ERR(mxs_dma->clk))
> > +                       return PTR_ERR(mxs_dma->clk);
> > +       }
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko

-- 
Best Regards,

Han "Allen" Xu
