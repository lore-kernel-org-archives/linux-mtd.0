Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecB5y-0001kE-C1
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 14:23:12 +0000
Date: Thu, 18 Jan 2018 15:22:53 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org, david.wolfe@nxp.com
Subject: Re: [PATCH v5 1/2] mtd: fsl-quadspi: Distinguish the mtd device names
Message-ID: <20180118152253.266c6b30@bbrezillon>
In-Reply-To: <1516211448-27594-1-git-send-email-fabio.estevam@nxp.com>
References: <1516211448-27594-1-git-send-email-fabio.estevam@nxp.com>
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

On Wed, 17 Jan 2018 15:50:47 -0200
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
> In order to keep mtdparts compatibility keep the mtd->name
> unchanged when a single SPI NOR is present.
> 
> Reported-by: David Wolfe <david.wolfe@nxp.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v4:
> - Only use the new name scheme when more than one SPI NOR is present (Boris)

Not a perfect solution, but at least we don't break existing setups.

> 
>  drivers/mtd/spi-nor/fsl-quadspi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 2901c7b..1038842 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -1051,6 +1051,24 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  		spi_nor_set_flash_node(nor, np);
>  		nor->priv = q;
>  
> +		if (q->nor_num > 1) {

You need to preserve the label value, if any:

		if (q->nor_num > 1 && !mtd->name) {

With that fixed

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> +			int spiflash_idx;
> +
> +			ret = of_property_read_u32(np, "reg", &spiflash_idx);
> +			if (!ret) {
> +				mtd->name = devm_kasprintf(dev, GFP_KERNEL,
> +							   "%s-%d",
> +							   dev_name(dev),
> +							   spiflash_idx);
> +				if (!mtd->name) {
> +					ret = -ENOMEM;
> +					goto mutex_failed;
> +				}
> +			} else {
> +				dev_warn(dev, "reg property is missing\n");
> +			}
> +		}
> +
>  		/* fill the hooks */
>  		nor->read_reg = fsl_qspi_read_reg;
>  		nor->write_reg = fsl_qspi_write_reg;
