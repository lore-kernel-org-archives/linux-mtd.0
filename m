Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTBBY-0001Ng-At
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 17:35:14 +0000
Subject: Re: [PATCH 1/2] mtd: spi-nor: make n_sectors in flash_info 32 bit wide
To: Bastian Stender <bst@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
References: <20170116151214.11195-1-bst@pengutronix.de>
CC: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <kernel@pengutronix.de>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <24d558a9-7e7b-8165-cd5d-f3a311deef17@atmel.com>
Date: Mon, 16 Jan 2017 18:34:48 +0100
MIME-Version: 1.0
In-Reply-To: <20170116151214.11195-1-bst@pengutronix.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bastian,

Le 16/01/2017 à 16:12, Bastian Stender a écrit :
> Since MRAM chips (like the Everspin mr25h40) are not sector organized
> they should be defined as n_sectors * 1 byte sectors. To be able to
> store the higher number of sectors n_sectors should be an unsigned 32
> bit integer just like sector_size.
> 

Could you comment a little bit more on what this series improves or fixes?

Swapping the info->sector_size and info->n_sectors doesn't change the value
of mtd->size:
mtd->size = info->sector_size * info->n_sectors;

info->n_sectors is used nowhere else whereas info->sector_size is only used
once more to initialized mtd->erasesize but due to the SPI_NOR_NO_ERASE
info->flags, mtd->erasesize should be never used.

However changing the type of n_sectors from u16 to unsigned int would
increase the size of the struct flash_info hence the size of the
spi_nor_ids[] array. So I don't know whether it's worth it.

However maybe swapping the values would better respect the meaning of
sector "size" and "number".

Best regards,

Cyrille

> Signed-off-by: Bastian Stender <bst@pengutronix.de>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index da7cd69d4857..c8399522c69d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -55,7 +55,7 @@ struct flash_info {
>  	 * necessarily called a "sector" by the vendor.
>  	 */
>  	unsigned	sector_size;
> -	u16		n_sectors;
> +	unsigned	n_sectors;
>  
>  	u16		page_size;
>  	u16		addr_width;
> 
