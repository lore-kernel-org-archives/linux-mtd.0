Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZOge-0002md-GP
 for linux-mtd@lists.infradead.org; Wed, 10 Jan 2018 22:17:34 +0000
Date: Wed, 10 Jan 2018 23:17:19 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <han.xu@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, Fabio Estevam
 <fabio.estevam@nxp.com>, David Wolfe <david.wolfe@nxp.com>, Frank Li
 <frank.li@nxp.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: fsl-quadspi: Distinguish the mtd device names
Message-ID: <20180110231719.72767797@bbrezillon>
In-Reply-To: <VI1PR0401MB22213B0560C91999E6E22E7197130@VI1PR0401MB2221.eurprd04.prod.outlook.com>
References: <1515181560-1410-1-git-send-email-festevam@gmail.com>
 <VI1PR0401MB22213B0560C91999E6E22E7197130@VI1PR0401MB2221.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 8 Jan 2018 17:13:17 +0000
Han Xu <han.xu@nxp.com> wrote:

> ________________________________________
> From: Fabio Estevam <festevam@gmail.com>
> Sent: Friday, January 5, 2018 1:46 PM
> To: Han Xu
> Cc: cyrille.pitchen@wedev4u.fr; David Wolfe; Frank Li; linux-mtd@lists.infradead.org; Fabio Estevam
> Subject: [PATCH] mtd: fsl-quadspi: Distinguish the mtd device names
> 
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
> mtd0: 01000000 00010000 "fsl-quadspi.0"
> mtd1: 01000000 00010000 "fsl-quadspi.1"

What happens if you end up having 2 qspi IPs in the same SoC? IMHO,
it's more future proof to have something like
"<reg-addr>.qspi:<chipidx>" or "<reg-addr>.qspi:<chipidx>".

> 
> Reported-by: David Wolfe <david.wolfe@nxp.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index f17d224..7712c63 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -967,7 +967,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>         struct resource *res;
>         struct spi_nor *nor;
>         struct mtd_info *mtd;
> -       int ret, i = 0;
> +       int ret, i = 0, mtd_index = 0;

It's not the MTD index if you have other MTD devices. How about
spiflash_idx?

> 
>         q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
>         if (!q)
> @@ -1047,6 +1047,13 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>                 nor = &q->nor[i];
>                 mtd = &nor->mtd;
> 
> +               mtd->name = devm_kasprintf(dev, GFP_KERNEL, "fsl-quadspi.%d",
> +                                          mtd_index);

With the alternative naming scheme suggested above, it gives:

		mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s:%d"
					   dev_name(&pdev->dev),
					   mtd_index);

> +               if (!mtd->name) {
> +                       ret = -ENOMEM;
> +                       goto mutex_failed;
> +               }
> +
>                 nor->dev = dev;
>                 spi_nor_set_flash_node(nor, np);
>                 nor->priv = q;
> @@ -1098,6 +1105,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>                         nor->page_size = q->devtype_data->txfifo;
> 
>                 i++;
> +               mtd_index++;
>         }
> 
>         /* finish the rest init. */
> --
> 2.7.4
> 
> Acked-by: Han Xu <han.xu@nxp.com>
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
