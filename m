Received: from rv-out-0708.google.com ([209.85.198.251])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKOy2-0000Kn-GU
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 03:20:26 +0000
Received: by rv-out-0708.google.com with SMTP id b17so8197278rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Jan 2009 19:20:25 -0800 (PST)
Message-ID: <f17812d70901061920r66b273e1t233a7c3c81d84e63@mail.gmail.com>
Date: Wed, 7 Jan 2009 11:20:25 +0800
From: "Eric Miao" <eric.y.miao@gmail.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>
Subject: Re: [PATCH 3/3] Fix compilation without MTD partitioning support
In-Reply-To: <1231296053-2378-4-git-send-email-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1231296053-2378-1-git-send-email-marcel@ziswiler.com>
	<1231296053-2378-2-git-send-email-marcel@ziswiler.com>
	<1231296053-2378-3-git-send-email-marcel@ziswiler.com>
	<1231296053-2378-4-git-send-email-marcel@ziswiler.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 7, 2009 at 10:40 AM, Marcel Ziswiler <marcel@ziswiler.com> wrote:
> This fixes compilation without MTD partitioning support previously failing.
>
> Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index d2da717..90cadc9 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1162,7 +1162,11 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
>                goto fail_free_irq;
>        }
>
> +#ifdef CONFIG_MTD_PARTITIONS
>        return add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
> +#else
> +       return 0;
> +#endif
>

or maybe

#ifdef CONFIG_MTD_PARTITIONS
        ret = add_mtd_partitions(...)
#endif
        return ret;

I don't personally like mutual exclusive #ifdef.

>  fail_free_irq:
>        free_irq(IRQ_NAND, info);
> @@ -1193,7 +1197,9 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
>        platform_set_drvdata(pdev, NULL);
>
>        del_mtd_device(mtd);
> +#ifdef CONFIG_MTD_PARTITIONS
>        del_mtd_partitions(mtd);
> +#endif
>        free_irq(IRQ_NAND, info);
>        if (use_dma) {
>                pxa_free_dma(info->data_dma_ch);
> --
> 1.6.0.6
>
>

Otherwise looks OK to me.

-- 
Cheers
- eric
