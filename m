Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiLs6-0002WJ-Ji
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 15:38:40 +0000
Date: Wed, 25 Jul 2018 17:38:16 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Wenyou Yang
 <wenyou.yang@microchip.com>, Josh Wu <rainyfeeling@outlook.com>, Stefan
 Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH v5 03/17] mtd: rawnand: lpc32xx_mlc: convert driver to
 nand_scan()
Message-ID: <20180725173816.71da16b5@bbrezillon>
In-Reply-To: <20180725133152.30898-4-miquel.raynal@bootlin.com>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
 <20180725133152.30898-4-miquel.raynal@bootlin.com>
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

On Wed, 25 Jul 2018 15:31:38 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Two helpers have been added to the core to do all kind of controller
> side configuration/initialization between the detection phase and the
> final NAND scan. Implement these hooks so that we can convert the driver
> to just use nand_scan() instead of the nand_scan_ident() +
> nand_scan_tail() pair.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/lpc32xx_mlc.c | 61 +++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
> index 052d123a8304..e82abada130a 100644
> --- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
> +++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
> @@ -184,6 +184,7 @@ static struct nand_bbt_descr lpc32xx_nand_bbt_mirror = {
>  };
>  
>  struct lpc32xx_nand_host {
> +	struct platform_device	*pdev;

You don't need pdev. With this field removed

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

>  	struct nand_chip	nand_chip;
>  	struct lpc32xx_mlc_platform_data *pdata;
>  	struct clk		*clk;
> @@ -653,6 +654,32 @@ static struct lpc32xx_nand_cfg_mlc *lpc32xx_parse_dt(struct device *dev)
>  	return ncfg;
>  }
>  
> +static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
> +	struct device *dev = &host->pdev->dev;
> +
> +	host->dma_buf = devm_kzalloc(dev, mtd->writesize, GFP_KERNEL);
> +	if (!host->dma_buf)
> +		return -ENOMEM;
> +
> +	host->dummy_buf = devm_kzalloc(dev, mtd->writesize, GFP_KERNEL);
> +	if (!host->dummy_buf)
> +		return -ENOMEM;
> +
> +	chip->ecc.mode = NAND_ECC_HW;
> +	chip->ecc.size = 512;
> +	mtd_set_ooblayout(mtd, &lpc32xx_ooblayout_ops);
> +	host->mlcsubpages = mtd->writesize / 512;
> +
> +	return 0;
> +}
> +
> +static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
> +	.attach_chip = lpc32xx_nand_attach_chip,
> +};
> +
>  /*
>   * Probe for NAND controller
>   */
> @@ -669,6 +696,8 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>  	if (!host)
>  		return -ENOMEM;
>  
> +	host->pdev = pdev;
> +
>  	rc = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	host->io_base = devm_ioremap_resource(&pdev->dev, rc);
>  	if (IS_ERR(host->io_base))
> @@ -748,31 +777,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	/*
> -	 * Scan to find existance of the device and
> -	 * Get the type of NAND device SMALL block or LARGE block
> -	 */
> -	res = nand_scan_ident(mtd, 1, NULL);
> -	if (res)
> -		goto release_dma_chan;
> -
> -	host->dma_buf = devm_kzalloc(&pdev->dev, mtd->writesize, GFP_KERNEL);
> -	if (!host->dma_buf) {
> -		res = -ENOMEM;
> -		goto release_dma_chan;
> -	}
> -
> -	host->dummy_buf = devm_kzalloc(&pdev->dev, mtd->writesize, GFP_KERNEL);
> -	if (!host->dummy_buf) {
> -		res = -ENOMEM;
> -		goto release_dma_chan;
> -	}
> -
> -	nand_chip->ecc.mode = NAND_ECC_HW;
> -	nand_chip->ecc.size = 512;
> -	mtd_set_ooblayout(mtd, &lpc32xx_ooblayout_ops);
> -	host->mlcsubpages = mtd->writesize / 512;
> -
>  	/* initially clear interrupt status */
>  	readb(MLC_IRQ_SR(host->io_base));
>  
> @@ -794,10 +798,11 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>  	}
>  
>  	/*
> -	 * Fills out all the uninitialized function pointers with the defaults
> -	 * And scans for a bad block table if appropriate.
> +	 * Scan to find existence of the device and get the type of NAND device:
> +	 * SMALL block or LARGE block.
>  	 */
> -	res = nand_scan_tail(mtd);
> +	nand_chip->dummy_controller.ops = &lpc32xx_nand_controller_ops;
> +	res = nand_scan(mtd, 1);
>  	if (res)
>  		goto free_irq;
>  
