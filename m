Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAIeK-0004k7-Ba
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2018 17:19:42 +0000
Date: Sun, 22 Apr 2018 19:19:18 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org, Angelo Dureghello <angelo@sysam.it>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: spi-nor: add support for ISSI is25lp256
Message-ID: <20180422191918.0201a590@bbrezillon>
In-Reply-To: <20180407130105.24671-1-marex@denx.de>
References: <20180407130105.24671-1-marex@denx.de>
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

On Sat,  7 Apr 2018 15:01:05 +0200
Marek Vasut <marex@denx.de> wrote:

> Add support for ISSI is25lp256 spi nor flash.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Angelo Dureghello <angelo@sysam.it>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

Applied to spi-nor/next.

Thanks,

Boris

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 5bfa36e95f35..a9e3f0ff0974 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1049,6 +1049,8 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
>  			SECT_4K | SPI_NOR_DUAL_READ) },
> +	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
> +			SECT_4K | SPI_NOR_DUAL_READ) },
>  
>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
