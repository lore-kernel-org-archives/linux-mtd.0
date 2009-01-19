Received: from trinity.fluff.org ([89.145.97.151])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LOsUL-00075X-Sw
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2009 11:40:21 +0000
Date: Mon, 19 Jan 2009 11:40:08 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: Mike Rapoport <mike@compulab.co.il>
Subject: Re: [PATCH] MTD: NAND: pxa3xx_nand: allow building as module
Message-ID: <20090119114008.GC2425@trinity.fluff.org>
References: <1232364431-7941-1-git-send-email-mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1232364431-7941-1-git-send-email-mike@compulab.co.il>
Cc: linux-mtd@lists.infradead.org, eric.miao@marvell.com,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 19, 2009 at 01:27:11PM +0200, Mike Rapoport wrote:
> 
> Signed-off-by: Mike Rapoport <mike@compulab.co.il>
> ---
>  drivers/mtd/nand/Kconfig       |    2 +-
>  drivers/mtd/nand/pxa3xx_nand.c |   10 ++++++++++
>  2 files changed, 11 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 8b12e6e..d3966d0 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -334,7 +334,7 @@ config MTD_NAND_ATMEL_ECC_NONE
>  endchoice
>  
>  config MTD_NAND_PXA3xx
> -	bool "Support for NAND flash devices on PXA3xx"
> +	tristate "Support for NAND flash devices on PXA3xx"
>  	depends on MTD_NAND && PXA3xx
>  	help
>  	  This enables the driver for the NAND flash device found on
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index cc55cbc..628ba08 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -123,6 +123,7 @@ struct pxa3xx_nand_info {
>  
>  	struct clk		*clk;
>  	void __iomem		*mmio_base;
> +	struct resource		*res;
>  
>  	unsigned int 		buf_start;
>  	unsigned int		buf_count;
> @@ -1079,6 +1080,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
>  
>  	this = &info->nand_chip;
>  	mtd->priv = info;
> +	mtd->owner = THIS_MODULE;
>  
>  	info->clk = clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(info->clk)) {
> @@ -1125,6 +1127,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
>  		goto fail_put_clk;
>  	}
>  
> +	info->res = r;
>  	info->mmio_base = ioremap(r->start, r->end - r->start + 1);
>  	if (info->mmio_base == NULL) {
>  		dev_err(&pdev->dev, "ioremap() failed\n");
> @@ -1199,6 +1202,13 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
>  				info->data_buff, info->data_buff_phys);
>  	} else
>  		kfree(info->data_buff);
> +
> +	iounmap(info->mmio_base);
> +	release_mem_region(info->res->start, info->res->end - info->res->start + 1);

resource_size() is probably better for the second argument.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
