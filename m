Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buylO-0004on-Vg
 for linux-mtd@lists.infradead.org; Fri, 14 Oct 2016 09:26:51 +0000
Subject: Re: [patch 1/2] mtd: spi-nor: Off by one in cqspi_setup_flash()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
References: <20161013080646.GB3389@mwanda>
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
From: Marek Vasut <marex@denx.de>
Message-ID: <360bddfc-0495-8836-41ef-4121517011a3@denx.de>
Date: Fri, 14 Oct 2016 09:19:05 +0200
MIME-Version: 1.0
In-Reply-To: <20161013080646.GB3389@mwanda>
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

On 10/13/2016 10:06 AM, Dan Carpenter wrote:
> There are CQSPI_MAX_CHIPSELECT elements in the ->f_pdata array so the >
> should be >=.
> 
> Fixes: 140623410536 ('mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Marek Vasut <marex@denx.de>

> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index d403ba7..944863b 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -1082,7 +1082,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  			goto err;
>  		}
>  
> -		if (cs > CQSPI_MAX_CHIPSELECT) {
> +		if (cs >= CQSPI_MAX_CHIPSELECT) {
>  			dev_err(dev, "Chip select %d out of range.\n", cs);
>  			goto err;
>  		}
> 


-- 
Best regards,
Marek Vasut
