Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaW8w-00080Z-It
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 20:09:15 +0000
Date: Wed, 16 Apr 2014 22:08:49 +0200
From: Gerhard Sittig <gsi@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: spi-nor: fix the wrong dummy value
Message-ID: <20140416200849.GO3528@book.gsilab.sittig.org>
References: <1397636299-2390-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397636299-2390-1-git-send-email-b32955@freescale.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-04-16 at 16:18 +0800, Huang Shijie wrote:
> 
> The dummy cycles is actually 8 for SPI fast/dual/quad read.
> 
> This patch fixes the wrong dummy value for both the spi-nor.c and m25p80.c.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/devices/m25p80.c  |    3 +++
>  drivers/mtd/spi-nor/spi-nor.c |    2 +-
>  2 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 1557d8f..112ca8b 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -131,6 +131,9 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>  	int dummy = nor->read_dummy;
>  	int ret;
>  
> +	/* convert the dummy cycles to the number of byte */
> +	dummy >>= 3;
> +

"dummy /= 8" to match the comment / commit message, and for
better mental association with a byte's width and the below
return value?

is the number of bits guaranteed to always be a multiple of 8
bits?  I guess it is for m25p80, but thought I'd ask (have seen
"odd" numbers like 6 bits in quad spi implementations -- those
are impossible to run with "traditional" SPI controllers)

>  	/* Wait till previous write/erase is done. */
>  	ret = nor->wait_till_ready(nor);
>  	if (ret)
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index cd4b277..b88cc7e 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -77,7 +77,7 @@ static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
>  	case SPI_NOR_FAST:
>  	case SPI_NOR_DUAL:
>  	case SPI_NOR_QUAD:
> -		return 1;
> +		return 8;
>  	case SPI_NOR_NORMAL:
>  		return 0;
>  	}


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
