Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHqxz-0004IJ-Ii
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2018 13:55:30 +0000
Date: Wed, 31 Oct 2018 14:55:05 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Huijin Park <huijin.park@samsung.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 bbanghj.park@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cast to u64 to avoid unexpected error
Message-ID: <20181031145505.6b034b84@bbrezillon>
In-Reply-To: <1535009282-1480-1-git-send-email-huijin.park@samsung.com>
References: <CGME20180823072813eucas1p2a534b4be94a3a2bc3480adcefca2ca22@eucas1p2.samsung.com>
 <1535009282-1480-1-git-send-email-huijin.park@samsung.com>
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

Hi Huijin,

Subject prefix should be "mtd: spi-nor: ...", and please replace
"unexpected error" by "unsigned int overflows".

On Thu, 23 Aug 2018 03:28:02 -0400
Huijin Park <huijin.park@samsung.com> wrote:

> From: "huijin.park" <huijin.park@samsung.com>
> 
> the params->size is defined as "u64"
> and, "info->sector_size" and "info->n_sectors" is defined as unsgined and u16

						 ^ are		^ unsigned

> thus, u64 data might have strange data(loss data) if data is overflow.

						    ^ if the result
overflows an unsigned int.

> this patch cast it to u64.

	     ^casts info->sector_size to an u64.

> 
> Signed-off-by: huijin.park <huijin.park@samsung.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d9c368c..527f281 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2459,7 +2459,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
>  	memset(params, 0, sizeof(*params));
>  
>  	/* Set SPI NOR sizes. */
> -	params->size = info->sector_size * info->n_sectors;
> +	params->size = (u64)info->sector_size * (u64)info->n_sectors;

						^ this cast is not needed.

BTW, I doubt we'll ever have to deal with NORs that are more than 4GB,
but making static code analysis tools happy and enforcing code
correctness is important too.

>  	params->page_size = info->page_size;
>  
>  	/* (Fast) Read settings. */

Regards,

Boris
