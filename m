Received: from antcom.de ([2a03:4000:1::bc28:b2d8:1] helo=chuck.antcom.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw8D7-0007Vw-Ed
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 10:30:38 +0000
Message-ID: <52BC052F.2020201@antcom.de>
Date: Thu, 26 Dec 2013 11:30:07 +0100
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V3 5/8] mtd: lpc32xx_slc: Use devm_*() functions
References: <007901cf01db$8362f580$8a28e080$%han@samsung.com>
 <007d01cf01dc$052cd1d0$0f867570$%han@samsung.com>
In-Reply-To: <007d01cf01dc$052cd1d0$0f867570$%han@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26/12/13 02:44, Jingoo Han wrote:
> Use devm_*() functions to make cleanup paths simpler.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Acked-by: Roland Stigge <stigge@antcom.de>

> ---
> No change since v2.
> 
>  drivers/mtd/nand/lpc32xx_slc.c |   10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
> index 23e6974..5f20394 100644
> --- a/drivers/mtd/nand/lpc32xx_slc.c
> +++ b/drivers/mtd/nand/lpc32xx_slc.c
> @@ -791,8 +791,8 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>  	}
>  	if (host->ncfg->wp_gpio == -EPROBE_DEFER)
>  		return -EPROBE_DEFER;
> -	if (gpio_is_valid(host->ncfg->wp_gpio) &&
> -			gpio_request(host->ncfg->wp_gpio, "NAND WP")) {
> +	if (gpio_is_valid(host->ncfg->wp_gpio) && devm_gpio_request(&pdev->dev,
> +			host->ncfg->wp_gpio, "NAND WP")) {
>  		dev_err(&pdev->dev, "GPIO not available\n");
>  		return -EBUSY;
>  	}
> @@ -808,7 +808,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>  	mtd->dev.parent = &pdev->dev;
>  
>  	/* Get NAND clock */
> -	host->clk = clk_get(&pdev->dev, NULL);
> +	host->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(host->clk)) {
>  		dev_err(&pdev->dev, "Clock failure\n");
>  		res = -ENOENT;
> @@ -927,10 +927,8 @@ err_exit3:
>  	dma_release_channel(host->dma_chan);
>  err_exit2:
>  	clk_disable(host->clk);
> -	clk_put(host->clk);
>  err_exit1:
>  	lpc32xx_wp_enable(host);
> -	gpio_free(host->ncfg->wp_gpio);
>  
>  	return res;
>  }
> @@ -953,9 +951,7 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
>  	writel(tmp, SLC_CTRL(host->io_base));
>  
>  	clk_disable(host->clk);
> -	clk_put(host->clk);
>  	lpc32xx_wp_enable(host);
> -	gpio_free(host->ncfg->wp_gpio);
>  
>  	return 0;
>  }
> 
