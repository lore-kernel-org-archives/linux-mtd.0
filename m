Received: from exsmtp02.microchip.com ([198.175.253.38]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPW3u-0004Qw-Ug
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 15:04:12 +0000
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Fix whole chip erasing for stacked
 chips.
To: Marcin Krzeminski <mar.krzeminski@gmail.com>, <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>
References: <20170106130302.8074-1-mar.krzeminski@gmail.com>
 <20170106130302.8074-2-mar.krzeminski@gmail.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Message-ID: <c26ed6c7-5e14-1f02-d77b-a47ccae71361@microchip.com>
Date: Fri, 6 Jan 2017 16:03:46 +0100
MIME-Version: 1.0
In-Reply-To: <20170106130302.8074-2-mar.krzeminski@gmail.com>
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

Hi Marcin,

You have many typos in your commit message:

Le 06/01/2017 à 14:03, Marcin Krzeminski a écrit :
> Curretly it is possible to disable chip erase for spi-nor driver.
Currently
> Some modern stacked (multi die) flash chips does not support chip
do not support
> erase opcode at all but spi-nor framework need to cope with them too.
needs to
> This commit extend exising functionality to allow disable
extends existing
> chip erase for a single flash chip.
> 
> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 15fb8af..b6656b2 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -81,6 +81,7 @@ struct flash_info {
>  					 * because it has the same value as
>  					 * ATMEL flashes)
>  					*/
> +#define NO_CHIP_ERASE	BIT(10) /* Chip does not support chip erase */
>  };
>

Sorry but since yesterday, this can't apply to the github spi-nor tree:
I've merged the "mtd: spi-nor: add a stateless method to support memory
size above 128Mib" patch, which already defines a new macro with the
BIT(10) value.

>  #define JEDEC_MFR(info)	((info)->id[0])
> @@ -1545,6 +1546,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  		nor->flags |= SNOR_F_USE_FSR;
>  	if (info->flags & SPI_NOR_HAS_TB)
>  		nor->flags |= SNOR_F_HAS_SR_TB;
> +	if (info->flags & NO_CHIP_ERASE)
> +		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>  
>  #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>  	/* prefer "small sector" erase if possible */
> 

Best regards,

Cyrille
