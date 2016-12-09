Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFOwW-00064i-8w
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2016 17:26:45 +0000
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: Add die_cnt field and flags
To: <marcin.krzeminski@nokia.com>, <linux-mtd@lists.infradead.org>
References: <1479465769-28276-1-git-send-email-marcin.krzeminski@nokia.com>
 <1479465769-28276-2-git-send-email-marcin.krzeminski@nokia.com>
CC: <rfsw-patches@mlist.nokia.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <cfc14d07-a49e-4dcf-27bf-69a564739e13@atmel.com>
Date: Fri, 9 Dec 2016 18:26:21 +0100
MIME-Version: 1.0
In-Reply-To: <1479465769-28276-2-git-send-email-marcin.krzeminski@nokia.com>
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

Le 18/11/2016 à 11:42, marcin.krzeminski@nokia.com a écrit :
> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> 
> This commit adds new field and flags that could
> be used to signalize that chip support die erase
> command.
> 
> If DIE_ERASE flag will be selected but die_cnt field
> will be 0 chip will not use chip erase command.
> 
IHMO, this semantics sounds odd.

> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 27 +++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h   |  5 +++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165..9b8656e 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -75,6 +75,7 @@ struct flash_info {
>  					 * bit. Must be used with
>  					 * SPI_NOR_HAS_LOCK.
>  					 */
> +#define DIE_ERASE			BIT(10)	/* Support for die erase cmd */
>  };
>  
>  #define JEDEC_MFR(info)	((info)->id[0])
> @@ -295,6 +296,32 @@ static int erase_chip(struct spi_nor *nor)
>  	return nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0);
>  }
>  
> +static int spi_nor_die_erase(struct spi_nor *nor, u32 addr)
> +{
> +	u8 buf[SPI_NOR_MAX_ADDR_WIDTH];
> +	u8 cmd;
> +	int i, ret;
> +
> +	dev_dbg(nor->dev, "erase @ 0x%X\n", addr);
> +
> +	write_enable(nor);
> +
> +	if (nor->erase) {
> +		cmd = nor->erase_opcode;
> +		nor->erase_opcode = SPINOR_OP_DIE_ERASE;
> +		ret = nor->erase(nor, addr);
> +		nor->erase_opcode = cmd;
> +		return ret;
> +	}
> +
> +	for (i = nor->addr_width - 1; i >= 0; i--) {
> +		buf[i] = addr & 0xff;
> +		addr >>= 8;
> +	}
> +
> +	return nor->write_reg(nor, SPINOR_OP_DIE_ERASE, buf, nor->addr_width);
> +}
> +
>  static int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>  {
>  	int ret = 0;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index c425c7b..80154b2 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -50,6 +50,7 @@
>  #define SPINOR_OP_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
>  #define SPINOR_OP_BE_32K	0x52	/* Erase 32KiB block */
>  #define SPINOR_OP_CHIP_ERASE	0xc7	/* Erase whole flash chip */
> +#define SPINOR_OP_DIE_ERASE	0xc4	/* Erase whole die within chip */
>  #define SPINOR_OP_SE		0xd8	/* Sector erase (usually 64KiB) */
>  #define SPINOR_OP_RDID		0x9f	/* Read JEDEC ID */
>  #define SPINOR_OP_RDCR		0x35	/* Read configuration register */
> @@ -119,6 +120,7 @@ enum spi_nor_ops {
>  enum spi_nor_option_flags {
>  	SNOR_F_USE_FSR		= BIT(0),
>  	SNOR_F_HAS_SR_TB	= BIT(1),
> +	SNOR_F_DIE_ERASE	= BIT(2),
>  };
>  
>  /**
> @@ -136,6 +138,8 @@ enum spi_nor_option_flags {
>   * @sst_write_second:	used by the SST write operation
>   * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
>   * @cmd_buf:		used by the write_reg
> + * @die_cnt:		number of dies in chip, if and SNOR_F_DIE_ERASE
> + * 			flasg is enabled CE command will be disabled
>   * @prepare:		[OPTIONAL] do some preparations for the
>   *			read/write/erase/lock/unlock operations
>   * @unprepare:		[OPTIONAL] do some post work after the
> @@ -167,6 +171,7 @@ struct spi_nor {
>  	bool			sst_write_second;
>  	u32			flags;
>  	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
> +	u32			die_cnt;
>  
>  	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
>  	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
> 
