Received: from mail-wm0-f68.google.com ([74.125.82.68])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUu7F-00020b-6v
 for linux-mtd@lists.infradead.org; Sat, 21 Jan 2017 11:45:54 +0000
Received: by mail-wm0-f68.google.com with SMTP id r126so13082427wmr.3
 for <linux-mtd@lists.infradead.org>; Sat, 21 Jan 2017 03:45:31 -0800 (PST)
Subject: Re: [PATCH, 1/1] mtd: spi-nor: Added support for gd25q16
To: Kamal Dasu <kdasu.kdev@gmail.com>, linux-spi@vger.kernel.org,
 f.fainelli@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
References: <1484940351-8145-1-git-send-email-kdasu.kdev@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8647a273-4ad8-264b-5dcd-a48662dae40d@gmail.com>
Date: Sat, 21 Jan 2017 12:36:56 +0100
MIME-Version: 1.0
In-Reply-To: <1484940351-8145-1-git-send-email-kdasu.kdev@gmail.com>
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

On 01/20/2017 08:25 PM, Kamal Dasu wrote:
> Add GigaDevice GD25Q16 (16M-bit) to supported list.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index da7cd69..8530d51 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -833,6 +833,11 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  
>  	/* GigaDevice */
>  	{
> +		"gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +	},
> +	{
>  		"gd25q32", INFO(0xc84016, 0, 64 * 1024,  64,
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> 


-- 
Best regards,
Marek Vasut
