Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcch1-0006nW-LT
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 19:19:01 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Recover from Spansion/Cypress errors
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
References: <20170717155407.11921-1-alexander.sverdlin@nokia.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <e144f5b2-c91b-3c2f-73f1-64b4f1bbf865@wedev4u.fr>
Date: Tue, 1 Aug 2017 21:18:33 +0200
MIME-Version: 1.0
In-Reply-To: <20170717155407.11921-1-alexander.sverdlin@nokia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 17/07/2017 à 17:54, Alexander Sverdlin a écrit :
> S25FL{128|256|512}S datasheets say:
> "When P_ERR or E_ERR bits are set to one, the WIP bit will remain set to
> one indicating the device remains busy and unable to receive new operation
> commands. A Clear Status Register (CLSR) command must be received to return
> the device to standby mode."
> 
> Current spi-nor code works until first error occurs, but write/erase errors
> are not just rare hardware failures, they also occur if user tries to flash
> write-protected areas. After such attempt no SPI command can be executed
> any more and even read fails. This patch adds support for P_ERR and E_ERR
> bits in Status Register 1 (so that operation fails immediately and not
> after a long timeout) and proper recovery from the error condition.
> 
> Tested on Spansion S25FS128S, which is supported by S25FL129P entry.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

applied to the spi-nor/next branch of l2-mtd

I've fixed a little typo as reported by checkpatch: s/occured/occurred/

Best regards,

Cyrille

> ---
> Changelog:
> v2:
> - rebased onto spi-nor/next branch of the l2-mtd tree
> 
>  drivers/mtd/spi-nor/spi-nor.c | 29 +++++++++++++++++++++--------
>  include/linux/mtd/spi-nor.h   |  5 +++++
>  2 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 196b52f..d2c62eb 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -88,6 +88,7 @@ struct flash_info {
>  					 */
>  #define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
>  #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
> +#define USE_CLSR		BIT(14)	/* use CLSR command */
>  };
>  
>  #define JEDEC_MFR(info)	((info)->id[0])
> @@ -308,8 +309,18 @@ static inline int spi_nor_sr_ready(struct spi_nor *nor)
>  	int sr = read_sr(nor);
>  	if (sr < 0)
>  		return sr;
> -	else
> -		return !(sr & SR_WIP);
> +
> +	if (nor->flags & SNOR_F_USE_CLSR && sr & (SR_E_ERR | SR_P_ERR)) {
> +		if (sr & SR_E_ERR)
> +			dev_err(nor->dev, "Erase Error occured\n");
> +		else
> +			dev_err(nor->dev, "Programming Error occured\n");
> +
> +		nor->write_reg(nor, SPINOR_OP_CLSR, NULL, 0);
> +		return -EIO;
> +	}
> +
> +	return !(sr & SR_WIP);
>  }
>  
>  static inline int spi_nor_fsr_ready(struct spi_nor *nor)
> @@ -1043,15 +1054,15 @@ static const struct flash_info spi_nor_ids[] = {
>  	 */
>  	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> -	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
> -	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> -	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
> +	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> -	{ "s25fl128s",	INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> -	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> -	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
>  	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
>  	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
> @@ -2707,6 +2718,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		nor->flags |= SNOR_F_HAS_SR_TB;
>  	if (info->flags & NO_CHIP_ERASE)
>  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> +	if (info->flags & USE_CLSR)
> +		nor->flags |= SNOR_F_USE_CLSR;
>  
>  	if (info->flags & SPI_NOR_NO_ERASE)
>  		mtd->flags |= MTD_NO_ERASE;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 0df3638..1f0a7fc 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -105,6 +105,7 @@
>  
>  /* Used for Spansion flashes only. */
>  #define SPINOR_OP_BRWR		0x17	/* Bank register write */
> +#define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>  
>  /* Used for Micron flashes only. */
>  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
> @@ -119,6 +120,9 @@
>  #define SR_BP2			BIT(4)	/* Block protect 2 */
>  #define SR_TB			BIT(5)	/* Top/Bottom protect */
>  #define SR_SRWD			BIT(7)	/* SR write protect */
> +/* Spansion/Cypress specific status bits */
> +#define SR_E_ERR		BIT(5)
> +#define SR_P_ERR		BIT(6)
>  
>  #define SR_QUAD_EN_MX		BIT(6)	/* Macronix Quad I/O */
>  
> @@ -224,6 +228,7 @@ enum spi_nor_option_flags {
>  	SNOR_F_NO_OP_CHIP_ERASE	= BIT(2),
>  	SNOR_F_S3AN_ADDR_DEFAULT = BIT(3),
>  	SNOR_F_READY_XSR_RDY	= BIT(4),
> +	SNOR_F_USE_CLSR		= BIT(5),
>  };
>  
>  /**
> 
