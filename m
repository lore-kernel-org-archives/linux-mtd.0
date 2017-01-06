Received: from mail-wj0-x243.google.com ([2a00:1450:400c:c01::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPeoI-0007Bp-3R
 for linux-mtd@lists.infradead.org; Sat, 07 Jan 2017 00:24:39 +0000
Received: by mail-wj0-x243.google.com with SMTP id ey1so1749826wjd.2
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2017 16:24:14 -0800 (PST)
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: Fix whole chip erasing for stacked
 chips.
To: Marcin Krzeminski <mar.krzeminski@gmail.com>, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org
References: <20170106171901.27565-1-mar.krzeminski@gmail.com>
 <20170106171901.27565-2-mar.krzeminski@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e9a447d9-da58-87ac-3136-d1dc0c75d591@gmail.com>
Date: Sat, 7 Jan 2017 00:45:00 +0100
MIME-Version: 1.0
In-Reply-To: <20170106171901.27565-2-mar.krzeminski@gmail.com>
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

On 01/06/2017 06:19 PM, Marcin Krzeminski wrote:
> Currently it is possible to disable chip erase for spi-nor driver.
> Some modern stacked (multi die) flash chips do not support chip
> erase opcode at all but spi-nor framework needs to cope with them too.
> This commit extends existing functionality to allow disable
> chip erase for a single flash chip.

I wonder whether this should really be opt-out flag. Since we'll see
more multi-die chips (and chips with different die sizes), I'd say this
should rather be opt-in flag.

> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 2a643a1..595de54 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -85,6 +85,7 @@ struct flash_info {
>  					 * Use dedicated 4byte address op codes
>  					 * to support memory size above 128Mib.
>  					 */
> +#define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
>  };
>  
>  #define JEDEC_MFR(info)	((info)->id[0])
> @@ -1621,6 +1622,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  		nor->flags |= SNOR_F_USE_FSR;
>  	if (info->flags & SPI_NOR_HAS_TB)
>  		nor->flags |= SNOR_F_HAS_SR_TB;
> +	if (info->flags & NO_CHIP_ERASE)
> +		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>  
>  #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>  	/* prefer "small sector" erase if possible */
> 


-- 
Best regards,
Marek Vasut
