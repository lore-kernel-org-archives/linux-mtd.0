Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWGmy-0007Ut-DB
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2018 08:19:42 +0000
Subject: Re: [RFC PATCH 13/34] mtd: spi-nor: Add the concept of SPI NOR
 manufacturer driver
To: Boris Brezillon <boris.brezillon@bootlin.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Marek Vasut <marek.vasut@gmail.com>
CC: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
 <20181207092637.18687-14-boris.brezillon@bootlin.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <e0db2bce-df36-9068-cc41-149e9c919b1e@ti.com>
Date: Mon, 10 Dec 2018 13:50:03 +0530
MIME-Version: 1.0
In-Reply-To: <20181207092637.18687-14-boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 07/12/18 2:56 PM, Boris Brezillon wrote:
> Declare a spi_nor_manufacturer struct and add basic building blocks to
> move manufacturer specific code outside of the core. We also rename
> spi-nor.c into spi-nor-core.c and adjust the Makefile to be able to
> create spi-nor.o by linking the core and manufacturer drivers together.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/spi-nor/core.c      | 82 +++++++++++++++++++++++++++------
>  drivers/mtd/spi-nor/internals.h | 14 ++++++
>  include/linux/mtd/spi-nor.h     |  8 ++++
>  3 files changed, 89 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f8b7c8fbe960..8efd0490d2a0 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1722,6 +1722,23 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ },
>  };
>  
> +static const struct spi_nor_manufacturer *manufacturers[0];
> +
> +static const struct flash_info *
> +spi_nor_search_part_by_id(const struct flash_info *parts, unsigned int nparts,
> +			  const u8 *id)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nparts; i++) {
> +		if (parts[i].id_len &&
> +		    !memcmp(parts[i].id, id, parts[i].id_len))
> +			return &parts[i];
> +	}
> +
> +	return NULL;
> +}
> +
>  static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>  {
>  	int			tmp;
> @@ -1734,13 +1751,21 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>  		return ERR_PTR(tmp);
>  	}
>  
> -	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
> -		info = &spi_nor_ids[tmp];
> -		if (info->id_len) {
> -			if (!memcmp(info->id, id, info->id_len))
> -				return &spi_nor_ids[tmp];
> +	for (tmp = 0; tmp < ARRAY_SIZE(manufacturers); tmp++) {
> +		info = spi_nor_search_part_by_id(manufacturers[tmp]->parts,
> +						 manufacturers[tmp]->nparts,
> +						 id);

This could probably be optimized a bit by comparing manufacturer ID and
then looking through parts list of that particular manufacturer only.
(with expection of winbond manufacturer ID, where will have to go
through spansion parts list as well)

Regards
Vignesh

> +		if (info) {
> +			nor->manufacturer = manufacturers[tmp];
> +			return info;
>  		}
>  	}
> +
> +	info = spi_nor_search_part_by_id(spi_nor_ids,
> +					 ARRAY_SIZE(spi_nor_ids) - 1, id);
> +	if (info)
> +		return info;
> +
>  	dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %02x, %02x\n",
>  		id[0], id[1], id[2]);
>  	return ERR_PTR(-ENODEV);
> @@ -2334,9 +2359,22 @@ spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>  			 const struct sfdp_bfpt *bfpt,
>  			 struct spi_nor_flash_parameter *params)
>  {
> -	if (nor->info->fixups && nor->info->fixups->post_bfpt)
> -		return nor->info->fixups->post_bfpt(nor, bfpt_header, bfpt,
> -						    params);
> +	int ret;
> +
> +	if (nor->manufacturer && nor->manufacturer->fixups &&
> +	    nor->manufacturer->fixups->post_bfpt) {
> +		ret = nor->manufacturer->fixups->post_bfpt(nor, bfpt_header,
> +							   bfpt, params);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (nor->info->fixups && nor->info->fixups->post_bfpt) {
> +		ret = nor->info->fixups->post_bfpt(nor, bfpt_header, bfpt,
> +						   params);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	return 0;
>  }
> @@ -3426,6 +3464,10 @@ static int
>  spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
>  				      struct spi_nor_flash_parameter *params)
>  {
> +	if (nor->manufacturer && nor->manufacturer->fixups &&
> +	    nor->manufacturer->fixups->post_sfdp)
> +		return nor->manufacturer->fixups->post_sfdp(nor, params);
> +
>  	switch (JEDEC_MFR(nor->info)) {
>  	case SNOR_MFR_ATMEL:
>  		atmel_post_sfdp_fixups(nor);
> @@ -3481,15 +3523,25 @@ static int spi_nor_post_sfdp_fixups(struct spi_nor *nor,
>  	return ret;
>  }
>  
> -static const struct flash_info *spi_nor_match_id(const char *name)
> +static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
> +						 const char *name)
>  {
> -	const struct flash_info *id = spi_nor_ids;
> +	unsigned int i, j;
>  
> -	while (id->name) {
> -		if (!strcmp(name, id->name))
> -			return id;
> -		id++;
> +	for (i = 0; i < ARRAY_SIZE(spi_nor_ids) - 1; i++) {
> +		if (!strcmp(name, spi_nor_ids[i].name))
> +			return &spi_nor_ids[i];
>  	}
> +
> +	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
> +		for (j = 0; j < manufacturers[i]->nparts; j++) {
> +			if (!strcmp(name, manufacturers[i]->parts[j].name)) {
> +				nor->manufacturer = manufacturers[i];
> +				return &manufacturers[i]->parts[j];
> +			}
> +		}
> +	}
> +
>  	return NULL;
>  }
>  
> @@ -3514,7 +3566,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	nor->write_proto = SNOR_PROTO_1_1_1;
>  
>  	if (name)
> -		info = spi_nor_match_id(name);
> +		info = spi_nor_match_id(nor, name);
>  	/* Try to auto-detect if chip name wasn't specified or not found */
>  	if (!info)
>  		info = spi_nor_read_id(nor);
> diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
> index cc06fed99f49..c442d0bfa21a 100644
> --- a/drivers/mtd/spi-nor/internals.h
> +++ b/drivers/mtd/spi-nor/internals.h
> @@ -318,4 +318,18 @@ struct flash_info {
>  		.addr_width = 3,					\
>  		.flags = SPI_NOR_NO_FR | SPI_S3AN,
>  
> +/**
> + * struct spi_nor_manufacturer - SPI NOR manufacturer object
> + * @name: manufacturer name
> + * @parts: array of parts supported by this manufacturer
> + * @nparts: number of entries in the parts array
> + * @fixups: hooks called at various points in time during spi_nor_scan()
> + */
> +struct spi_nor_manufacturer {
> +	const char *name;
> +	const struct flash_info *parts;
> +	unsigned int nparts;
> +	const struct spi_nor_fixups *fixups;
> +};
> +
>  #endif /* __LINUX_MTD_SPI_NOR_INTERNALS_H */
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 8c64f1dcd35e..44ab116ce3d9 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -332,12 +332,19 @@ struct spi_nor_erase_map {
>   */
>  struct flash_info;
>  
> +/**
> + * struct flash_info - Forward declaration of a structure used internally by
> + *		       the core and manufacturer drivers
> + */
> +struct spi_nor_manufacturer;
> +
>  /**
>   * struct spi_nor - Structure for defining a the SPI NOR layer
>   * @mtd:		point to a mtd_info structure
>   * @lock:		the lock for the read/write/erase/lock/unlock operations
>   * @dev:		point to a spi device, or a spi nor controller device.
>   * @info:		spi-nor part JDEC MFR id and other info
> + * @manufacturer:	spi-nor manufacturer
>   * @page_size:		the page size of the SPI NOR
>   * @addr_width:		number of address bytes
>   * @erase_opcode:	the opcode for erasing a sector
> @@ -376,6 +383,7 @@ struct spi_nor {
>  	struct mutex		lock;
>  	struct device		*dev;
>  	const struct flash_info	*info;
> +	const struct spi_nor_manufacturer *manufacturer;
>  	u32			page_size;
>  	u8			addr_width;
>  	u8			erase_opcode;
> 

-- 
Regards
Vignesh
