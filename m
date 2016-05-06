Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayis7-000694-Iz
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 16:45:00 +0000
Message-ID: <572CC514.1070805@denx.de>
Date: Fri, 06 May 2016 18:23:48 +0200
From: Marek Vasut <marex@denx.de>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v2] mtd: spi-nor: support GigaDevice gd25lq64c
References: <1462549061-88356-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1462549061-88356-1-git-send-email-computersforpeace@gmail.com>
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

On 05/06/2016 05:37 PM, Brian Norris wrote:
> Also note the GigaDevice JEDEC ID.
> 
> No write-protect support yet, since this flash uses a different status
> register layout.
> 
> Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v2: fixed duplicate flag

Acked-by: Marek Vasut <marex@denx.de>

>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  include/linux/mtd/spi-nor.h   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 157841dc3e99..c52e45594bfd 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -832,6 +832,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	/* GigaDevice */
>  	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
> +	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },
>  
>  	/* Intel/Numonyx -- xxxs33b */
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 3c36113a88e1..7f041bd88b82 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -21,6 +21,7 @@
>   * Sometimes these are the same as CFI IDs, but sometimes they aren't.
>   */
>  #define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
> +#define SNOR_MFR_GIGADEVICE	0xc8
>  #define SNOR_MFR_INTEL		CFI_MFR_INTEL
>  #define SNOR_MFR_MICRON		CFI_MFR_ST /* ST Micro <--> Micron */
>  #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
> 


-- 
Best regards,
Marek Vasut
