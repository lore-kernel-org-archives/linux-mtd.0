Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhIde-000650-Gb
 for linux-mtd@lists.infradead.org; Mon, 14 Aug 2017 16:54:53 +0000
Subject: Re: [PATCH v7 1/2] mtd: spi-nor: add spi_nor_init() function
To: Kamal Dasu <kdasu.kdev@gmail.com>, marek.vasut@gmail.com
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
References: <1501627276-4567-1-git-send-email-kdasu.kdev@gmail.com>
 <1501627276-4567-2-git-send-email-kdasu.kdev@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <daa55ab5-6249-22b0-9c29-6af47699cad0@wedev4u.fr>
Date: Mon, 14 Aug 2017 18:54:26 +0200
MIME-Version: 1.0
In-Reply-To: <1501627276-4567-2-git-send-email-kdasu.kdev@gmail.com>
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

Hi Kamal,

Le 02/08/2017 à 00:41, Kamal Dasu a écrit :
> This patch extracts some chunks from spi_nor_init_params and spi_nor_scan()
>  and moves them into a new spi_nor_init() function.
> 
> Indeed, spi_nor_init() regroups all the required SPI flash commands to be
> sent to the SPI flash memory before performing any runtime operations
> (Fast Read, Page Program, Sector Erase, ...). Hence spi_nor_init():
> 1) removes the flash protection if applicable for certain vendors.
> 2) sets the Quad Enable bit, if needed, before using Quad SPI protocols.
> 3) makes the memory enter its (stateful) 4-byte address mode, if needed,
>    for SPI flash memory > 128Mbits not supporting the 4-byte address
>    instruction set.
> 
> spi_nor_scan() now ends by calling spi_nor_init() once the probe phase has
> completed. Further patches could also use spi_nor_init() to implement the
> mtd->_resume() handler for the spi-nor framework.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 62 ++++++++++++++++++++++++++++++-------------
>  include/linux/mtd/spi-nor.h   |  9 +++++++
>  2 files changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 1413828..10033ed 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1784,7 +1784,6 @@ static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
>  			 const struct spi_nor_hwcaps *hwcaps)
>  {
>  	u32 ignored_mask, shared_mask;
> -	bool enable_quad_io;
>  	int err;
>  
>  	/*
> @@ -1829,20 +1828,42 @@ static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
>  		return err;
>  	}
>  
> -	/* Enable Quad I/O if needed. */
> -	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
> -			  spi_nor_get_protocol_width(nor->write_proto) == 4);
> -	if (enable_quad_io && params->quad_enable) {
> -		err = params->quad_enable(nor);
> +	return 0;
> +}
> +
> +static int spi_nor_init(struct spi_nor *nor)
> +{
> +	int err;
> +
> +	/*
> +	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
> +	 * with the software protection bits set
> +	 */
> +	if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
> +	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
> +	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
> +	    nor->info->flags & SPI_NOR_HAS_LOCK) {
> +		write_enable(nor);
> +		write_sr(nor, 0);
> +		spi_nor_wait_till_ready(nor);
> +	}
> +
> +	if (nor->quad_enable) {
> +		err = nor->quad_enable(nor);
>  		if (err) {
>  			dev_err(nor->dev, "quad mode not supported\n");
>  			return err;
>  		}
>  	}
>  
> +	if ((JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
> +	    !(nor->info->flags & SPI_NOR_4B_OPCODES))
> +		set_4byte(nor, nor->info, 1);
> +

I've forgotten to test whether nor->addr_width == 4: if not, set_4byte()
should not be called.

>  	return 0;
>  }
>  
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -1853,6 +1874,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	struct device_node *np = spi_nor_get_flash_node(nor);
>  	int ret;
>  	int i;
> +	bool enable_quad_io;
>  
>  	ret = spi_nor_check(nor);
>  	if (ret)
> @@ -1915,15 +1937,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	 * with the software protection bits set
>  	 */
>
The comment above is attached to the chunk below. Since you've moved
both the chunk and its comment into the spi_nor_init() function, remove
the comment from spi_nor_scan() too.

> -	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
> -	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
> -	    JEDEC_MFR(info) == SNOR_MFR_SST ||
> -	    info->flags & SPI_NOR_HAS_LOCK) {
> -		write_enable(nor);
> -		write_sr(nor, 0);
> -		spi_nor_wait_till_ready(nor);
> -	}
> -
>  	if (!mtd->name)
>  		mtd->name = dev_name(dev);
>  	mtd->priv = nor;
> @@ -2002,8 +2015,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
>  		    info->flags & SPI_NOR_4B_OPCODES)
>  			spi_nor_set_4byte_opcodes(nor, info);
> -		else
> -			set_4byte(nor, info, 1);
>  	} else {
>  		nor->addr_width = 3;
>  	}
> @@ -2020,8 +2031,21 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  			return ret;
>  	}
>  
> -	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
> -			(long long)mtd->size >> 10);
> +	/* Send all the required SPI flash commands to initialize device */
> +	nor->info = info;
> +	/* Enable Quad I/O if needed. */
> +	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
> +			  spi_nor_get_protocol_width(nor->write_proto) == 4);
> +	if (enable_quad_io && params.quad_enable)
> +		nor->quad_enable = params.quad_enable;

I would just leave this chunk in spi_nor_setup() now executing
+		nor->quad_enable = params.quad_enable;
instead of calling
-		err = params->quad_enable(nor);

2 reasons:
- to avoid spi_nor_scan() growing too much as it is already a little bit
too long, IMHO.
- The read & write protocols are selected in spi_nor_setup() and the
need to call params->quad_enable() is a direct consequence of those choices.

> +
> +	ret = spi_nor_init(nor);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "%s (%lld Kbytes), %dByte addr, %s\n", info->name,
> +		 (long long)mtd->size >> 10, nor->addr_width,
> +		 (nor->quad_enable ? "quad io enabled" : "quad io disabled"));
>

The "quad io enabled" / "quad io disabled" are not really meaningful for
regular users, this is more a debug output.
Besides, the "quad io disabled" string would be displayed for all non
Quad SPI memories which doesn't make sense.
Also nor->quad_enable will be NULL for Micron memory since those
memories have no special procedure to enable Quad I/O. So printing "quad
io disabled" in that case would be wrong too.

Moreover, the "%dByte addr" string is debug output too and except for
very few particular cases, the memory size already tell us the actual
number of address bytes:
- <= 128Mib <-> 3 byte address
- > 128Mib <-> 4 byte address

So leave the dev_info() string as is, please.


>  	dev_dbg(dev,
>  		"mtd .name = %s, .size = 0x%llx (%lldMiB), "
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 55faa2f..db127b8 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -220,11 +220,17 @@ enum spi_nor_option_flags {
>  	SNOR_F_READY_XSR_RDY	= BIT(4),
>  };
>  
> +/* struct flash_info - Forward declaration of a structure used internally by
> + *		       spi_nor_scan()
> + */

The kernel doc format is:
/**
 * strcut flash_info - Forward declaration ...
 *
 */

Best regards,

Cyrille

> +struct flash_info;
> +
>  /**
>   * struct spi_nor - Structure for defining a the SPI NOR layer
>   * @mtd:		point to a mtd_info structure
>   * @lock:		the lock for the read/write/erase/lock/unlock operations
>   * @dev:		point to a spi device, or a spi nor controller device.
> + * @info:		spi-nor part JDEC MFR id and other info
>   * @page_size:		the page size of the SPI NOR
>   * @addr_width:		number of address bytes
>   * @erase_opcode:	the opcode for erasing a sector
> @@ -251,6 +257,7 @@ enum spi_nor_option_flags {
>   * @flash_lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
>   * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
>   * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
> + * @quad_enable:	[FLASH-SPECIFIC] enables SPI NOR quad mode
>   *			completely locked
>   * @priv:		the private data
>   */
> @@ -258,6 +265,7 @@ struct spi_nor {
>  	struct mtd_info		mtd;
>  	struct mutex		lock;
>  	struct device		*dev;
> +	const struct flash_info	*info;
>  	u32			page_size;
>  	u8			addr_width;
>  	u8			erase_opcode;
> @@ -285,6 +293,7 @@ struct spi_nor {
>  	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>  	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>  	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
> +	int (*quad_enable)(struct spi_nor *nor);
>  
>  	void *priv;
>  };
> 
