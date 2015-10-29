Received: from mail-yk0-x241.google.com ([2607:f8b0:4002:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZruSq-0006e6-NX
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2015 21:10:29 +0000
Received: by ykdy125 with SMTP id y125so4547957ykd.1
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2015 14:10:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1445543676-19876-3-git-send-email-b45815@freescale.com>
References: <1445543676-19876-1-git-send-email-b45815@freescale.com>
 <1445543676-19876-3-git-send-email-b45815@freescale.com>
Date: Thu, 29 Oct 2015 23:10:07 +0200
Message-ID: <CAHp75VcqhNof8aWxZGH3uGHVcXLxCqTNWOGS0N_qE9XbozrGZw@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dmaengine: mxs: APBH DMA supports deep sleep mode
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

On Thu, Oct 22, 2015 at 10:54 PM, Han Xu <b45815@freescale.com> wrote:
> From: Huang Shijie <b32955@freescale.com>
>
> Deep Sleep Mode(dsm) turns off the power for APBH DMA module, DMA
> need to be re-initialized when system resumed back.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Signed-off-by: Han Xu <b45815@freescale.com>
> ---
>  drivers/dma/mxs-dma.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> index 60de352..7e5800a 100644
> --- a/drivers/dma/mxs-dma.c
> +++ b/drivers/dma/mxs-dma.c
> @@ -693,7 +693,7 @@ static enum dma_status mxs_dma_tx_status(struct dma_chan *chan,
>         return mxs_chan->status;
>  }
>
> -static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
> +static int mxs_dma_init(struct mxs_dma_engine *mxs_dma)
>  {
>         int ret;
>
> @@ -835,6 +835,7 @@ static int __init mxs_dma_probe(struct platform_device *pdev)
>
>         mxs_dma->pdev = pdev;
>         mxs_dma->dma_device.dev = &pdev->dev;
> +       dev_set_drvdata(&pdev->dev, mxs_dma);
>
>         /* mxs_dma gets 65535 bytes maximum sg size */
>         mxs_dma->dma_device.dev->dma_parms = &mxs_dma->dma_parms;
> @@ -872,9 +873,25 @@ static int __init mxs_dma_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> +static int mxs_dma_pm_resume(struct device *dev)
> +{
> +       struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);


> +       int ret;
> +
> +       ret = mxs_dma_init(mxs_dma);
> +       if (ret)
> +               return ret;
> +       return 0;

Just
return mxs_dma_init(mxs_dma);

> +}
> +
> +static const struct dev_pm_ops mxs_dma_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(NULL, mxs_dma_pm_resume)
> +};
> +
>  static struct platform_driver mxs_dma_driver = {
>         .driver         = {
>                 .name   = "mxs-dma",
> +               .pm = &mxs_dma_pm_ops,
>                 .of_match_table = mxs_dma_dt_ids,
>         },
>         .id_table       = mxs_dma_ids,



-- 
With Best Regards,
Andy Shevchenko
