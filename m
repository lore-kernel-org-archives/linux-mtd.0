Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buylN-0004o9-W2
 for linux-mtd@lists.infradead.org; Fri, 14 Oct 2016 09:26:51 +0000
Subject: Re: [patch 2/2] mtd: spi-nor: Fix some error codes in
 cqspi_setup_flash()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
References: <20161013080857.GC3389@mwanda>
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
From: Marek Vasut <marex@denx.de>
Message-ID: <3ebab16e-ddf8-0a4b-aaaf-d5b424720eb2@denx.de>
Date: Fri, 14 Oct 2016 09:16:23 +0200
MIME-Version: 1.0
In-Reply-To: <20161013080857.GC3389@mwanda>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/13/2016 10:30 AM, Dan Carpenter wrote:
> We return success or possibly uninitialized values on these error paths
> instead of proper error codes.
> 
> Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Nice

Reviewed-by: Marek Vasut <marex@denx.de>

> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 944863b..d489fbd 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -1077,12 +1077,14 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  
>  	/* Get flash device data */
>  	for_each_available_child_of_node(dev->of_node, np) {
> -		if (of_property_read_u32(np, "reg", &cs)) {
> +		ret = of_property_read_u32(np, "reg", &cs);
> +		if (ret) {
>  			dev_err(dev, "Couldn't determine chip select.\n");
>  			goto err;
>  		}
>  
>  		if (cs >= CQSPI_MAX_CHIPSELECT) {
> +			ret = -EINVAL;
>  			dev_err(dev, "Chip select %d out of range.\n", cs);
>  			goto err;
>  		}
> 


-- 
Best regards,
Marek Vasut
