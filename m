Received: from mail-bn1blp0190.outbound.protection.outlook.com
 ([207.46.163.190] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp7Ch-00032o-6y
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 02:33:28 +0000
Date: Tue, 27 May 2014 09:12:32 +0800
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: read 6 bytes for the ID
Message-ID: <20140527011231.GA5876@shlinux1.ap.freescale.net>
References: <1397470174-27856-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1397470174-27856-1-git-send-email-b32955@freescale.com>
Cc: marex@denx.de, angus.clark@st.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 14, 2014 at 06:09:34PM +0800, Huang Shijie wrote:
> Currently, we read 5 bytes for ID, but s25fl128s has the same ext_id(0x4d01)
> with s25fl129p1. The s25fl128s can support the DDR Quad read, while s25fl129p1
> does not. So we have to distinguish the two NOR flashs.
> 
> This patch reads out 6 bytes for the ID, and use the 6 bytes ID to search the
> right flash_info.
> 
> The detail of the patch is:
>   [1] change the "ext_id" from u16 to u32.
>       We can store two bytes or three bytes with the @ext_id now.
> 
>   [2] search the right flash_info with the 6byte ID and the new @ext_id.
>       We use "matched" variable to track the legacy two bytes @ext_id.
>       If the flash_info's @ext_id is three bytes, we will use the
>       sixth byte of the ID to check it.
> 
>   [3] add the new item to spi_nor_ids for s25fl128s.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
> based on Brian's patch set.
> ---
>  drivers/mtd/spi-nor/spi-nor.c |   27 ++++++++++++++++++++++-----
>  1 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d6f44d5..cd4b277 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -383,7 +383,7 @@ struct flash_info {
>  	 * then a two byte device id.
>  	 */
>  	u32		jedec_id;
> -	u16             ext_id;
> +	u32		ext_id;
>  
>  	/* The size listed here is what works with SPINOR_OP_SE, which isn't
>  	 * necessarily called a "sector" by the vendor.
> @@ -505,6 +505,7 @@ const struct spi_device_id spi_nor_ids[] = {
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> +	{ "s25fl128s",	INFO(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_QUAD_READ) },
>  	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
>  	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
>  	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
> @@ -593,12 +594,13 @@ EXPORT_SYMBOL_GPL(spi_nor_ids);
>  static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
>  {
>  	int			tmp;
> -	u8			id[5];
> +	u8			id[6];
>  	u32			jedec;
> -	u16                     ext_jedec;
> +	u32                     ext_jedec;
>  	struct flash_info	*info;
> +	int			matched = -1;
>  
> -	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, 5);
> +	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, 6);
>  	if (tmp < 0) {
>  		dev_dbg(nor->dev, " error %d reading JEDEC ID\n", tmp);
>  		return ERR_PTR(tmp);
> @@ -614,8 +616,23 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
>  	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
>  		info = (void *)spi_nor_ids[tmp].driver_data;
>  		if (info->jedec_id == jedec) {
> -			if (info->ext_id == 0 || info->ext_id == ext_jedec)
> +			if (info->ext_id == 0)
>  				return &spi_nor_ids[tmp];
> +
> +			/* the legacy two bytes ext_id */
> +			if ((info->ext_id >> 16) == 0) {
> +				if (info->ext_id == ext_jedec)
> +					matched = tmp;
> +			} else {
> +				/* check the sixth byte now */
> +				ext_jedec = ext_jedec << 8 | id[5];
> +				if (info->ext_id == ext_jedec)
> +					return &spi_nor_ids[tmp];
> +			}
> +		} else {
> +			/* shortcut */
> +			if (matched != -1)
> +				return &spi_nor_ids[matched];
>  		}
>  	}
>  	dev_err(nor->dev, "unrecognized JEDEC id %06x\n", jedec);
Hi Brian:
	any comment about this patch?

thanks
Huang Shijie
