Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elmAN-0002Nw-W8
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 01:47:25 +0000
Received: by mail-oi0-x241.google.com with SMTP id b3so15384356oib.11
 for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2018 17:47:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1517001805-7646-1-git-send-email-festevam@gmail.com>
References: <1517001805-7646-1-git-send-email-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 13 Feb 2018 23:47:12 -0200
Message-ID: <CAOMZO5A91xYK+36MumVFxsH2j9aqhsqpg8_OVhbOKtiXTKAnEw@mail.gmail.com>
Subject: Re: [PATCH RESEND v6 1/2] mtd: fsl-quadspi: Distinguish the mtd
 device names
To: cyrille.pitchen@wedev4u.fr
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Han Xu <han.xu@nxp.com>, David Wolfe <david.wolfe@nxp.com>,
 Fabio Estevam <fabio.estevam@nxp.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

On Fri, Jan 26, 2018 at 7:23 PM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
>
> Currently on a imx6sx-sdb board, which has two SPI NOR chips connected
> to QSPI2 the following output from /proc/mtd is seen:
>
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 01000000 00010000 "21e4000.qspi"
> mtd1: 01000000 00010000 "21e4000.qspi"
>
> Attempts to partition them on the kernel command line result in both
> chips with identical (and identically named) partitions, which is
> an inconvenient behavior.
>
> Assign a different mtd->name for each mtd device to avoid this problem.
>
> After this change the output from /proc/mtd becomes:
>
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 01000000 00010000 "21e4000.qspi-0"
> mtd1: 01000000 00010000 "21e4000.qspi-1"
>
> In order to keep mtdparts compatibility keep the mtd->name
> unchanged when a single SPI NOR is present.
>
> Reported-by: David Wolfe <david.wolfe@nxp.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Acked-by: Han Xu <han.xu@nxp.com>
> ---
> Resending it as I missed to send it to Cyrille

 A gentle ping on this series.

>
> Changes since v5:
> - Preserve the label value, if any. (Boris)
>
>  drivers/mtd/spi-nor/fsl-quadspi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 2901c7b..1038842 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -1051,6 +1051,24 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>                 spi_nor_set_flash_node(nor, np);
>                 nor->priv = q;
>
> +               if (q->nor_num > 1 && !mtd->name) {
> +                       int spiflash_idx;
> +
> +                       ret = of_property_read_u32(np, "reg", &spiflash_idx);
> +                       if (!ret) {
> +                               mtd->name = devm_kasprintf(dev, GFP_KERNEL,
> +                                                          "%s-%d",
> +                                                          dev_name(dev),
> +                                                          spiflash_idx);
> +                               if (!mtd->name) {
> +                                       ret = -ENOMEM;
> +                                       goto mutex_failed;
> +                               }
> +                       } else {
> +                               dev_warn(dev, "reg property is missing\n");
> +                       }
> +               }
> +
>                 /* fill the hooks */
>                 nor->read_reg = fsl_qspi_read_reg;
>                 nor->write_reg = fsl_qspi_write_reg;
> --
> 2.7.4
>
