Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUZD5-000390-Fa
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2017 13:26:32 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Fix S3AN addressing calculation
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard
 Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20170118164016.27976-1-ricardo.ribalda@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <b62e4978-3a99-248e-533f-7fde6a378dd7@atmel.com>
Date: Fri, 20 Jan 2017 14:26:08 +0100
MIME-Version: 1.0
In-Reply-To: <20170118164016.27976-1-ricardo.ribalda@gmail.com>
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

Le 18/01/2017 à 17:40, Ricardo Ribalda Delgado a écrit :
> The page calculation under spi_nor_s3an_addr_convert() was wrong. On
> Default Address Mode we need to perform a divide by page_size.
> 
> Fixes: 61cba34bd6c1 ("mtd: spi-nor: Add support for S3AN spi-nor devices")
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Reviewed-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Marek, any comment on your side?

> ---
> 
> v2: Suggested by Marek Vasut <marek.vasut@gmail.com>
>   -Use more descriptive name for page
> 
>  drivers/mtd/spi-nor/spi-nor.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 2a643a1bb45e..f5c3ce8ac48b 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -431,11 +431,14 @@ static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>   */
>  static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
>  {
> -	unsigned int offset = addr;
> +	unsigned int offset;
> +	unsigned int page;
>  
> -	offset %= nor->page_size;
> +	offset = addr % nor->page_size;
> +	page = addr / nor->page_size;
> +	page <<= (nor->page_size > 512) ? 10 : 9;
>  
> -	return ((addr - offset) << 1) | offset;
> +	return page | offset;
>  }
>  
>  /*
> 
