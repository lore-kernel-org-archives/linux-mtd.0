Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZf5p-0003Vg-A4
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 15:48:38 +0000
Date: Thu, 11 Jan 2018 16:48:23 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>,
 <david.wolfe@nxp.com>, <han.xu@nxp.com>, <frank.li@nxp.com>
Subject: Re: [PATCH v4] mtd: fsl-quadspi: Distinguish the mtd device names
Message-ID: <20180111164823.34b0b8fd@bbrezillon>
In-Reply-To: <1515685478-31457-1-git-send-email-fabio.estevam@nxp.com>
References: <1515685478-31457-1-git-send-email-fabio.estevam@nxp.com>
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

On Thu, 11 Jan 2018 13:44:38 -0200
Fabio Estevam <fabio.estevam@nxp.com> wrote:

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
> Reported-by: David Wolfe <david.wolfe@nxp.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v1:
> - Do not fail probe when reg is not present
> 
>  drivers/mtd/spi-nor/fsl-quadspi.c | 20 +++++++++++++++++++-

Still missing the DT doc update. You can do it in a separate patch, but
please make it part of the same series.

>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 2901c7b..8020295 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -967,7 +967,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	struct spi_nor *nor;
>  	struct mtd_info *mtd;
> -	int ret, i = 0;
> +	int ret, i = 0, spiflash_idx;
>  
>  	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
>  	if (!q)
> @@ -1051,6 +1051,24 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  		spi_nor_set_flash_node(nor, np);
>  		nor->priv = q;
>  
> +		if (!mtd->name) {

Move the spiflash_idx declaration here.

> +			ret = of_property_read_u32(np, "reg", &spiflash_idx);
> +			if (!ret) {
> +				mtd->name = devm_kasprintf(dev, GFP_KERNEL,
> +							   "%s-%d",
> +							   dev_name(dev),
> +							   spiflash_idx);
> +			} else {
> +				mtd->name = dev_name(dev);
> +				dev_warn(dev, "reg property is missing\n");
> +			}
> +
> +			if (!mtd->name) {
> +				ret = -ENOMEM;
> +				goto mutex_failed;
> +			}
> +		}
> +
>  		/* fill the hooks */
>  		nor->read_reg = fsl_qspi_read_reg;
>  		nor->write_reg = fsl_qspi_write_reg;
