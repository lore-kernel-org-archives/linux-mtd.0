Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTt7D-0001Fl-DI
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2017 16:29:41 +0000
Received: by mail-lf0-x243.google.com with SMTP id q89so2464094lfi.1
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2017 08:29:19 -0800 (PST)
Subject: Re: [PATCH] mtd: spi-nor: Fix S3AN addressing calculation
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20170118160854.10801-1-ricardo.ribalda@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <82a44983-b207-0bcb-29d8-f84b3b24ee4c@gmail.com>
Date: Wed, 18 Jan 2017 17:29:15 +0100
MIME-Version: 1.0
In-Reply-To: <20170118160854.10801-1-ricardo.ribalda@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/18/2017 05:08 PM, Ricardo Ribalda Delgado wrote:
> The page calculation under spi_nor_s3an_addr_convert() was wrong. On
> Default Address Mode we need to perform a divide by page_size.
> 
> Fixes: 61cba34bd6c1 ("mtd: spi-nor: Add support for S3AN spi-nor devices")
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 2a643a1bb45e..a374532068f0 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -431,11 +431,15 @@ static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>   */
>  static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
>  {
> -	unsigned int offset = addr;
> +	unsigned int offset;
> +	unsigned int ret;

Can you use something less opaque than "ret" , something more
descriptive ? Thanks

> -	offset %= nor->page_size;
> +	offset = addr % nor->page_size;
> +	ret = addr / nor->page_size;
> +	ret <<= (nor->page_size > 512) ? 10 : 9;
> +	ret |= offset;
>  
> -	return ((addr - offset) << 1) | offset;
> +	return ret;
>  }
>  
>  /*
> 


-- 
Best regards,
Marek Vasut
