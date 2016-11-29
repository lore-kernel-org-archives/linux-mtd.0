Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBlgt-0003wp-7G
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2016 16:55:45 +0000
Subject: Re: [PATCH 3/3] mtd: spi-nor: Enable die erase for Micron 1GiB
To: <marcin.krzeminski@nokia.com>, <linux-mtd@lists.infradead.org>
References: <1477314214-17718-1-git-send-email-marcin.krzeminski@nokia.com>
 <1477314214-17718-4-git-send-email-marcin.krzeminski@nokia.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: <rfsw-patches@mlist.nokia.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>
Message-ID: <688b853c-6e08-81dd-63dd-eb528e2c6078@atmel.com>
Date: Tue, 29 Nov 2016 17:54:06 +0100
MIME-Version: 1.0
In-Reply-To: <1477314214-17718-4-git-send-email-marcin.krzeminski@nokia.com>
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

Le 24/10/2016 à 15:03, marcin.krzeminski@nokia.com a écrit :
> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> 
> Micron N25Q00 and MT25Q00 share same JEDEC Id,
> but it seem can be properly recognized by second
> ext_jedec id byte.
> 
> This commits extends n25q00 ids by adding ext
> bytes and also adds mt25q00 family.
> For MT25Q00 family, the number of dies is two, N25Q00
> has it four. Logic to support that is added.
> 
> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 17bbec0..b33ead6 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -218,6 +218,28 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
>  		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
>  	}
>  }
> +
> +static void spi_nor_die_cnt(struct spi_nor *nor,
> +		const struct flash_info *info)
> +{
> +	switch (JEDEC_MFR(info)) {
> +	case SNOR_MFR_MICRON:
> +		/* 1GiB devices */
> +		if (info->id[2] == 0x21) {
> +			/* MT25Q00 has 2 dies N25Q00 has 4 */
> +			if (info->id[4] & BIT(6))
> +				nor->die_cnt = 2;
> +			else
> +				nor->die_cnt = 4;
> +		} else
> +			nor->die_cnt = 0;

You set nor->die_cnt according to the JEDED ID but what is BIT(6) in the 5th
byte of the JEDEC ID?
How do you know whether this "rule of thumb" also applies to other Micron
memories?

I think we should find another solution to set nor->die_cnt properly.
Maybe adding some info in the relevant entries of the spi_nor_ids[] array?

Best regards,

Cyrille

> +	break;
> +	default:
> +		nor->die_cnt = 0;
> +		break;
> +	}
> +}
> +
>  static inline int spi_nor_sr_ready(struct spi_nor *nor)
>  {
>  	int sr = read_sr(nor);
> @@ -970,8 +992,14 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
> -	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
> -	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
> +	{ "n25q00",      INFO(0x20ba21, 0x1000, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
> +	{ "n25q00a",     INFO(0x20bb21, 0x1000, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
> +	{ "n25q00",      INFO(0x20ba21, 0x1004, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
> +	{ "n25q00a",     INFO(0x20bb21, 0x1004, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
> +	{ "mt25ql01g",   INFO(0x20ba21, 0x1044, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
> +	{ "mt25qu01g",   INFO(0x20bb21, 0x1044, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
> +	{ "mt25ql01g",   INFO(0x20ba21, 0x1040, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
> +	{ "mt25qu01g",   INFO(0x20bb21, 0x1040, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
>  
>  	/* PMC */
>  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
> @@ -1479,6 +1507,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  		nor->flags |= SNOR_F_USE_FSR;
>  	if (info->flags & SPI_NOR_HAS_TB)
>  		nor->flags |= SNOR_F_HAS_SR_TB;
> +	if (info->flags & DIE_ERASE) {
> +		nor->flags |= SNOR_F_DIE_ERASE;
> +		spi_nor_die_cnt(nor, info);
> +	}
>  
>  #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>  	/* prefer "small sector" erase if possible */
> 
