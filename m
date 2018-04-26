Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBkfe-0007Df-Dd
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 17:27:04 +0000
Date: Thu, 26 Apr 2018 19:26:48 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 linux-mtd@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v3 10/11] mtd: rawnand: lpc32xx_slc: clean the probe
 function
Message-ID: <20180426192648.4df1ad55@bbrezillon>
In-Reply-To: <20180421180043.18366-11-miquel.raynal@bootlin.com>
References: <20180421180043.18366-1-miquel.raynal@bootlin.com>
 <20180421180043.18366-11-miquel.raynal@bootlin.com>
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

On Sat, 21 Apr 2018 20:00:42 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Before fixing the error path of the probe function, fix the style of the
> entire function and particularly the goto labels: they should indicate
> what the next cleanup to do is.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/lpc32xx_slc.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
> index 5f7cc6da0a7f..342f666ad435 100644
> --- a/drivers/mtd/nand/raw/lpc32xx_slc.c
> +++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
> @@ -831,11 +831,11 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>  	if (IS_ERR(host->clk)) {
>  		dev_err(&pdev->dev, "Clock failure\n");
>  		res = -ENOENT;
> -		goto err_exit1;
> +		goto release_gpio;
>  	}
>  	res = clk_prepare_enable(host->clk);
>  	if (res)
> -		goto err_exit1;
> +		goto release_gpio;
>  
>  	/* Set NAND IO addresses and command/ready functions */
>  	chip->IO_ADDR_R = SLC_DATA(host->io_base);
> @@ -874,19 +874,19 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>  				      GFP_KERNEL);
>  	if (host->data_buf == NULL) {
>  		res = -ENOMEM;
> -		goto err_exit2;
> +		goto release_clk;
>  	}
>  
>  	res = lpc32xx_nand_dma_setup(host);
>  	if (res) {
>  		res = -EIO;
> -		goto err_exit2;
> +		goto release_clk;
>  	}
>  
>  	/* Find NAND device */
>  	res = nand_scan_ident(mtd, 1, NULL);
>  	if (res)
> -		goto err_exit3;
> +		goto release_dma;
>  
>  	/* OOB and ECC CPU and DMA work areas */
>  	host->ecc_buf = (uint32_t *)(host->data_buf + LPC32XX_DMA_DATA_SIZE);
> @@ -920,21 +920,23 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>  	 */
>  	res = nand_scan_tail(mtd);
>  	if (res)
> -		goto err_exit3;
> +		goto release_dma;
>  
>  	mtd->name = "nxp_lpc3220_slc";
>  	res = mtd_device_register(mtd, host->ncfg->parts,
>  				  host->ncfg->num_parts);
> -	if (!res)
> -		return res;
> +	if (res)
> +		goto release_nand;
>  
> +	return 0;
> +
> +release_nand:
>  	nand_release(mtd);
> -
> -err_exit3:
> +release_dma:
>  	dma_release_channel(host->dma_chan);
> -err_exit2:
> +release_clk:

You mean unprepare_clk.

>  	clk_disable_unprepare(host->clk);
> -err_exit1:
> +release_gpio:

And I'd go for enable_wp here since it's not releasing the gpio at all.

No need to resend, I'll fix it when applying

>  	lpc32xx_wp_enable(host);
>  
>  	return res;
