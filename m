Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJlcn-0000s7-Db
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 20:05:15 +0000
Date: Fri, 18 May 2018 22:04:52 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stephen Douthit <stephend@silicom-usa.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Add Winbond w25q32jv support
Message-ID: <20180518220452.4ec155d2@bbrezillon>
In-Reply-To: <20180307235557.27108-1-stephend@silicom-usa.com>
References: <20180307235557.27108-1-stephend@silicom-usa.com>
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

On Wed,  7 Mar 2018 18:55:57 -0500
Stephen Douthit <stephend@silicom-usa.com> wrote:

> Datasheet:
> https://www.winbond.com/resource-files/w25q32jv%20dtr%20revf%2002242017.pdf
> 
> Minimal testing done with fw_printenv/fw_setenv, test board did not
> support dual or quad access.
> 
> Signed-off-by: Stephen Douthit <stephend@silicom-usa.com>
> Tested-by: Stephen Douthit <stephend@silicom-usa.com>

Queued to spi-nor/next.

Thanks,

Boris

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d445a4d3b770..a0022549ad92 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1201,6 +1201,11 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  	},
> +	{
> +		"w25q32jv", INFO(0xef7016, 0, 64 * 1024,  64,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +	},
>  	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
>  	{
