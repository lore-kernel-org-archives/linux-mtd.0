Received: from mail-qc0-x231.google.com ([2607:f8b0:400d:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLOaW-0006zb-HA
 for linux-mtd@lists.infradead.org; Wed, 11 Feb 2015 04:07:45 +0000
Received: by mail-qc0-f177.google.com with SMTP id s11so988359qcv.8
 for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2015 20:07:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1423483639-4305-1-git-send-email-fabio.estevam@freescale.com>
References: <1423483639-4305-1-git-send-email-fabio.estevam@freescale.com>
Date: Tue, 10 Feb 2015 22:07:23 -0600
Message-ID: <CA+EcR223Lv2eCn+HsO08O+HmSn7d8q9DAJm=akwXE_y0H_LvKg@mail.gmail.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Print the error value
From: Han Xu <xhnjupt@gmail.com>
To: Fabio Estevam <fabio.estevam@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 9, 2015 at 6:07 AM, Fabio Estevam
<fabio.estevam@freescale.com> wrote:
> When displaying dev_err() messages it is useful to print the error value.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 1c7308c..78b1b33 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -830,27 +830,27 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>
>         ret = clk_prepare_enable(q->clk_en);
>         if (ret) {
> -               dev_err(dev, "can not enable the qspi_en clock\n");
> +               dev_err(dev, "can not enable the qspi_en clock: %d\n", ret);
>                 return ret;
>         }
>
>         ret = clk_prepare_enable(q->clk);
>         if (ret) {
> -               dev_err(dev, "can not enable the qspi clock\n");
> +               dev_err(dev, "can not enable the qspi clock: %d\n", ret);
>                 goto clk_failed;
>         }
>
>         /* find the irq */
>         ret = platform_get_irq(pdev, 0);
>         if (ret < 0) {
> -               dev_err(dev, "failed to get the irq\n");
> +               dev_err(dev, "failed to get the irq: %d\n", ret);
>                 goto irq_failed;
>         }
>
>         ret = devm_request_irq(dev, ret,
>                         fsl_qspi_irq_handler, 0, pdev->name, q);
>         if (ret) {
> -               dev_err(dev, "failed to request irq.\n");
> +               dev_err(dev, "failed to request irq: %d\n", ret);
>                 goto irq_failed;
>         }
>
> --
> 1.9.1
>

Acked-by: Han Xu <han.xu@freescale.com>

>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
