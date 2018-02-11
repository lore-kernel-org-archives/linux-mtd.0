Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eksNe-0001PD-IW
 for linux-mtd@lists.infradead.org; Sun, 11 Feb 2018 14:13:25 +0000
Subject: Re: [PATCH 3/3] mtd: spi-nor: Add support of Sector Map Parameter
 Table
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 poonam.aggrwal@nxp.com, suresh.gupta@nxp.com, yogeshnarayan.gaur@nxp.com
References: <1517494812-2866-1-git-send-email-prabhakar.kushwaha@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <0aa45dc1-1618-ad1a-20ff-d790c2103107@wedev4u.fr>
Date: Sun, 11 Feb 2018 15:12:35 +0100
MIME-Version: 1.0
In-Reply-To: <1517494812-2866-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

Le 01/02/2018 à 15:20, Prabhakar Kushwaha a écrit :
> JESD216B defines Sector Map Parameter Table. It identifies the
> location and size of sectors within the main data array of the
> flash memory device and identifies which Erase Types are supported
> by each sector. This table is used when a memory device has sectors
> of more than one size Or, does not allow all Erase Type commands to
> be applied to all sectors.
> 
> Sector Map parameter table is parsed to get location and size of
> sectors along with supported Erase Type.
> 
> Also add support of selecting erase opcode based on erase address
> provided at run-time.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 293 +++++++++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/spi-nor.h   |  16 +++
>  2 files changed, 305 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d445a4d..cc8bbb2d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -245,6 +245,10 @@ static inline u8 spi_nor_convert_3to4_erase(u8 opcode)
>  static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
>  				      const struct flash_info *info)
>  {
> +	struct spi_nor_map *map = &nor->flash_map;
> +	struct spi_nor_region *reg;
> +	int i;
> +
>  	/* Do some manufacturer fixups first */
>  	switch (JEDEC_MFR(info)) {
>  	case SNOR_MFR_SPANSION:
> @@ -260,6 +264,16 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
>  	nor->read_opcode = spi_nor_convert_3to4_read(nor->read_opcode);
>  	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
>  	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
> +
> +	if (!map->flash_region)
> +		return;
> +
> +	reg = map->flash_region;
> +	for (i = 0; i < map->num_regions; i++) {
> +		reg[i].erase_opcode =
> +			spi_nor_convert_3to4_erase(reg[i].erase_opcode);
> +	}
> +
>  }
>  
>  /* Enable/disable 4-byte addressing mode. */
> @@ -483,6 +497,28 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  	return nor->write_reg(nor, nor->erase_opcode, buf, nor->addr_width);
>  }
>  
> +static void spi_nor_erase_select(struct mtd_info *mtd, u32 addr)
> +{
> +	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +	struct spi_nor_map *map = &nor->flash_map;
> +	struct spi_nor_region *reg;
> +	int i;
> +
> +	if (!map->flash_region)
> +		return;
> +
> +	reg = map->flash_region;
> +	for (i = 0; i < map->num_regions; i++) {
> +		if (addr >= reg[i].region_start &&
> +		    addr <= reg[i].region_end) {
> +			nor->erase_opcode = reg[i].erase_opcode;
> +			mtd->erasesize = reg[i].erasesize;
> +			if (reg[i].region_size < mtd->erasesize)
> +				mtd->erasesize = reg[i].region_size;

if reg[i].region_size is lower than reg[i].erasesize, it probably means that
you are dealing with some overlaid sector so be careful because you may then
erase some sector actually starting before reg[i].region_start,
which may be not intended.

See below my comment on the sector map parsing and the examples provided by the
JESD216B specification.

> +		}
> +	}
> +}
> +
>  /*
>   * Erase an address range on the nor chip.  The address range may extend
>   * one or more erase sectors.  Return an error is there is a problem erasing.
> @@ -491,8 +527,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  {
>  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
>  	u32 addr, len;
> -	uint32_t rem;
> +	uint32_t rem, erasesize;
>  	int ret;
> +	u8 erase_opcode;
>  
>  	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
>  			(long long)instr->len);
> @@ -508,6 +545,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	if (ret)
>  		return ret;
>  
> +	erase_opcode = nor->erase_opcode;
> +	erasesize = mtd->erasesize;
> +
>  	/* whole-chip erase? */
>  	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
>  		unsigned long timeout;
> @@ -542,6 +582,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  		while (len) {
>  			write_enable(nor);
>  
> +			spi_nor_erase_select(mtd, addr);
> +

You may rather keep the code as is for uniform memories and create a dedicated function with
a specific erase algorithm for non uniform memories. Like this, you may easily introduce
regressions for all the already supported uniform memories, changing the current behavior of
spi_nor_erase() for those memories too.
It sounds a little bit risky, IMHO.

>  			ret = spi_nor_erase_sector(nor, addr);
>  			if (ret)
>  				goto erase_err;
> @@ -558,6 +600,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	write_disable(nor);
>  
>  erase_err:
> +	nor->erase_opcode = erase_opcode;
> +	mtd->erasesize = erasesize;
>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_ERASE);
>  
>  	instr->state = ret ? MTD_ERASE_FAILED : MTD_ERASE_DONE;
> @@ -1754,6 +1798,11 @@ struct spi_nor_pp_command {
>  	enum spi_nor_protocol	proto;
>  };
>  
> +struct spi_nor_erase_command {
> +	u8			opcode;
> +	u32			erasesize;
> +};
> +
>  enum spi_nor_read_command_index {
>  	SNOR_CMD_READ,
>  	SNOR_CMD_READ_FAST,
> @@ -1796,6 +1845,15 @@ enum spi_nor_pp_command_index {
>  	SNOR_CMD_PP_MAX
>  };
>  
> +enum spi_nor_erase_command_index {
> +	SNOR_CMD_ERASE_TYPE1,
> +	SNOR_CMD_ERASE_TYPE2,
> +	SNOR_CMD_ERASE_TYPE3,
> +	SNOR_CMD_ERASE_TYPE4,
> +
> +	SNOR_CMD_ERASE_MAX
> +};
> +
>  struct spi_nor_flash_parameter {
>  	u64				size;
>  	u32				page_size;
> @@ -1803,6 +1861,7 @@ struct spi_nor_flash_parameter {
>  	struct spi_nor_hwcaps		hwcaps;
>  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
>  	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
> +	struct spi_nor_erase_command	erase[SNOR_CMD_ERASE_MAX];
>  
>  	int (*quad_enable)(struct spi_nor *nor);
>  };
> @@ -2024,6 +2083,31 @@ struct sfdp_bfpt {
>  	u32	dwords[BFPT_DWORD_MAX];
>  };
>  
> +#define SMPT_DESC_TYPE_RD_DATA_MASK		GENMASK(31, 24)
> +#define SMPT_DESC_TYPE_RD_DATA_SHIFT		24
> +#define SMPT_DESC_TYPE_ADR_LEN_MASK		GENMASK(23, 22)
> +#define SMPT_DESC_TYPE_ADDRESS_BYTES_3_ONLY	(0x1UL << 22)
> +#define SMPT_DESC_TYPE_ADDRESS_BYTES_3_OR_4	(0x3UL << 22)
> +#define SMPT_DESC_TYPE_ADDRESS_BYTES_4_ONLY	(0x2UL << 22)
> +#define SMPT_DESC_TYPE_RD_LATENCY_MASK		GENMASK(19, 16)
> +#define SMPT_DESC_TYPE_RD_LATENCY_SHIFT		16
> +#define SMPT_DESC_TYPE_CMD_INS_MASK		GENMASK(15, 8)
> +#define SMPT_DESC_TYPE_CMD_INS_SHIFT		8
> +#define SMPT_DESC_TYPE_MASK			GENMASK(1, 0)
> +#define SMPT_DESC_TYPE_MASK_SHIFT		1
> +#define SMPT_DESC_SEQ_END			(0x1UL << 0)
> +
> +#define SMPT_HEADER_REGION_COUNT		GENMASK(23, 16)
> +#define SMPT_HEADER_REGION_COUNT_SHIFT		16
> +#define SMPT_HEADER_CONFIG_ID			GENMASK(15, 8)
> +#define SMPT_HEADER_CONFIG_ID_SHIFT		8
> +
> +#define SMPT_REGION_SIZE			GENMASK(31, 8)
> +#define SMPT_REGION_SIZE_SHIFT		8
> +struct sfdp_smpt {
> +	u32	*dwords;
> +};
> +
>  /* Fast Read settings. */
>  
>  static inline void
> @@ -2258,14 +2342,18 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  
>  		erasesize = 1U << erasesize;
>  		opcode = (half >> 8) & 0xff;
> +
> +		params->erase[i].opcode = opcode;
> +		params->erase[i].erasesize = erasesize;
> +
>  #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>  		if (erasesize == SZ_4K) {
>  			nor->erase_opcode = opcode;
>  			mtd->erasesize = erasesize;
> -			break;
>  		}
>  #endif
> -		if (!mtd->erasesize || mtd->erasesize < erasesize) {
> +		if ((!mtd->erasesize || mtd->erasesize < erasesize) &&
> +		    (!nor->erase_opcode)) {
>  			nor->erase_opcode = opcode;
>  			mtd->erasesize = erasesize;
>  		}
> @@ -2311,6 +2399,203 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	return 0;
>  }
>  
> +static int spi_nor_parse_smpt_command(struct spi_nor *nor, u32 dword1,
> +				      u32 dword2,
> +				      struct spi_nor_flash_parameter *params)
> +{
> +	int ret = 0;
> +	u8 addr_width, config_bit;
> +	u32 cmd, mask;
> +
> +	addr_width = nor->addr_width;
> +
> +	switch (dword1 & SMPT_DESC_TYPE_ADR_LEN_MASK) {
> +	case SMPT_DESC_TYPE_ADDRESS_BYTES_3_ONLY:
> +		nor->addr_width = 3;
> +		break;
> +
> +	case SMPT_DESC_TYPE_ADDRESS_BYTES_4_ONLY:
> +		nor->addr_width = 4;
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	cmd = dword1 & SMPT_DESC_TYPE_CMD_INS_MASK;
> +	cmd >>= SMPT_DESC_TYPE_CMD_INS_SHIFT;
> +
> +	mask = dword1 & SMPT_DESC_TYPE_RD_DATA_MASK;
> +	mask >>= SMPT_DESC_TYPE_RD_DATA_SHIFT;
> +
> +	switch (cmd) {
> +	case SPINOR_OP_RDAR:
> +		if (nor->read_anyreg) {
> +			ret = nor->read_anyreg(nor, SPINOR_OP_RDAR, dword2,
> +			       &config_bit, 1);
> +			if (ret < 0) {
> +				dev_err(nor->dev, "error reading config_bit");
> +				goto err;
> +			}
> +
> +			config_bit &= mask;
> +
> +			ret = config_bit;
> +		}
> +		break;
> +
> +	default:
> +		dev_info(nor->dev, "Detection instructuion is not supported");

s/instructuion/instruction/

Anyway this message is cryptic and not very helpful for the end user.
Also you don't seem to handle the error at all but only silently fail.

This is not good!

> +		break;
> +	}
> +
> +err:
> +	nor->addr_width = addr_width;
> +
> +	return ret;
> +}
> +
> +static int spi_nor_parse_smpt_map(struct spi_nor *nor, u32 *dword,
> +				  struct spi_nor_flash_parameter *params)
> +{
> +	struct spi_nor_map *map = &nor->flash_map;
> +	u32 reg_size, start = 0,  opcode_index;
> +	u32 config_id, reg_count, i;
> +	struct spi_nor_region *reg;
> +
> +	config_id = *dword & SMPT_HEADER_CONFIG_ID;
> +	config_id >>= SMPT_HEADER_CONFIG_ID_SHIFT;
> +
> +	reg_count = *dword & SMPT_HEADER_REGION_COUNT;
> +	reg_count >>= SMPT_HEADER_REGION_COUNT_SHIFT;
> +	reg_count++;
> +
> +	if (map->config_sel != config_id)
> +		return reg_count;
> +
> +	map->flash_region = kmalloc((reg_count * sizeof(struct spi_nor_region)),
> +				    GFP_KERNEL);
> +	if (!map->flash_region)
> +		return -ENOMEM;
> +
> +	map->num_regions = reg_count;
> +
> +	dword++;
> +
> +	reg = map->flash_region;
> +	for (i = 0; reg_count > 0; reg_count--, dword++, i++) {
> +		reg_size = *dword & SMPT_REGION_SIZE;
> +		reg_size >>= SMPT_REGION_SIZE_SHIFT;
> +		reg_size = (reg_size + 1) * 256;
> +
> +		reg[i].region_size = reg_size;
> +		reg[i].region_start = start;
> +		reg[i].region_end = start + reg_size - 1;
> +
> +		opcode_index = ffs(*dword & 0x0F) - 1;

So you select only one of the 4 possible op codes per region and discard all
other supported op codes? And since the Erase Types are not guaranteed to be
sorted by their erase sizes, you don't even know whether you select the
greatest or lowest erase size. Possibly none of them.
That doesn't sound good! :(

You should save all the supported erase sizes for a given region and select
the proper op code/erase size inside spi_nor_erase() based on the addr and len
parameters. Indeed the user may request to erase 4KB starting from 0x0 but could
also request to erase 64KB from 0x0 too.

In the first case, the algorithm should select the 4KB erase block command whereas
in the second case, it should select the 64KB erase block so the memory would be
erased more quickly. I would like some more "adaptive" algorithm, please.

> +		reg[i].erase_opcode = params->erase[opcode_index].opcode;
> +		reg[i].erasesize = params->erase[opcode_index].erasesize;
> +
> +		start = reg[i].region_end + 1;

Erase regions may overlap so the actual start of one region is not always the
end of the previous one. The Start and End offsets have to be fixed and aligned
according to the erase sizes supported by the region.

Please refer to the examples provides in the JESD216B specification.

For instance: 8 x 4KB sectors at bottom, 1x *overlaid* 64KB sector at bottom,
511 uniform 64KB sectors.

region 0: size 32KB, supporting erase type 1 (4KB sector)
region 1: size 32KB, supporting erase type 2 (64KB sector)
region 2: size 511 * 64KB, supported erase type 2 (64KB sector)

Based on your parsing, the 2nd region would start at 0x8000 (32KB) but its
64KB sector actually starts at 0x0.

Best regards,

Cyrille

> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * spi_nor_parse_smpt() - read and parse the Basic Flash Parameter Table.
> + * @nor:		pointer to a 'struct spi_nor'
> + * @smpt_header:	pointer to the 'struct sfdp_parameter_header' describing
> + *			the Sector Map Parameter Table length and version
> + * @params:		pointer to the 'struct spi_nor_flash_parameter' to be
> + *			filled
> + *
> + * The Sector Map Parameter Table identifies the location and size of sectors
> + * within the main data array of the flash memory device and identifies which
> + * Erase Types are supported by each sector. This table is optional table as
> + * defined by the SFDP (JESD216) specification.
> + * If there is more than one user selected sector map (configuration),
> + * this table includes the definition of instructions needed to determine
> + * which sector map configuration is in use. The number of sector map
> + * configuration detection commands is variable, the number of
> + * configurations is variable, and  the number of regions in each
> + * configuration is variable, thus the size of this table is variable.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_parse_smpt(struct spi_nor *nor,
> +			      const struct sfdp_parameter_header *smpt_header,
> +			      struct spi_nor_flash_parameter *params)
> +{
> +	struct sfdp_smpt smpt;
> +	size_t len;
> +	int i, ret;
> +	u32 addr;
> +
> +	/* Read the Sector Map Parameter Table. */
> +	len = smpt_header->length * sizeof(u32);
> +	addr = SFDP_PARAM_HEADER_PTP(smpt_header);
> +
> +	smpt.dwords = kmalloc(len, GFP_KERNEL);
> +	if (!smpt.dwords)
> +		return -ENOMEM;
> +
> +	ret = spi_nor_read_sfdp_dma_unsafe(nor,  addr, len, smpt.dwords);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Fix endianness of the SMPT DWORDs. */
> +	for (i = 0; i < smpt_header->length; i++)
> +		smpt.dwords[i] = le32_to_cpu(smpt.dwords[i]);
> +
> +	i = 0;
> +
> +	while (!((smpt.dwords[i] & SMPT_DESC_TYPE_MASK) >>
> +		 SMPT_DESC_TYPE_MASK_SHIFT)) {
> +		ret = spi_nor_parse_smpt_command(nor, smpt.dwords[i],
> +						 smpt.dwords[i + 1], params);
> +		if (ret < 0) {
> +			dev_err(nor->dev, "error parsing smpt command");
> +			return ret;
> +		}
> +
> +		nor->flash_map.config_sel <<= 1;
> +		if (ret)
> +			nor->flash_map.config_sel |= 1;
> +
> +		if (smpt.dwords[i] & SMPT_DESC_SEQ_END)
> +			break;
> +
> +		/*
> +		 * Point to next config detect
> +		 */
> +		i = i + 2;
> +	};
> +
> +	/*
> +	 * Point to First config header
> +	 */
> +	i += 2;
> +
> +	while (((smpt.dwords[i] & SMPT_DESC_TYPE_MASK) >>
> +		SMPT_DESC_TYPE_MASK_SHIFT)) {
> +		ret = spi_nor_parse_smpt_map(nor, &smpt.dwords[i], params);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		if (ret == 0 || smpt.dwords[i] & SMPT_DESC_SEQ_END)
> +			break;
> +
> +		/*
> +		 * Point to next config header
> +		 */
> +		i = i + ret + 1;
> +	};
> +
> +	return 0;
> +}
> +
>  /**
>   * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
>   * @nor:		pointer to a 'struct spi_nor'
> @@ -2405,7 +2690,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  
>  		switch (SFDP_PARAM_HEADER_ID(param_header)) {
>  		case SFDP_SECTOR_MAP_ID:
> -			dev_info(dev, "non-uniform erase sector maps are not supported yet.\n");
> +			err = spi_nor_parse_smpt(nor, param_header, params);
>  			break;
>  
>  		default:
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index a747215..c018ffe 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -107,6 +107,8 @@
>  /* Used for Spansion flashes only. */
>  #define SPINOR_OP_BRWR		0x17	/* Bank register write */
>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
> +#define SPINOR_OP_RDAR		0x65	/* Read any register */
> +#define SPINOR_OP_WRAR		0x71	/* Write any register */
>  
>  /* Used for Micron flashes only. */
>  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
> @@ -235,6 +237,19 @@ enum spi_nor_option_flags {
>  	SNOR_F_USE_CLSR		= BIT(5),
>  };
>  
> +struct spi_nor_region {
> +	u32			region_size;
> +	u32			region_start;
> +	u32			region_end;
> +	u32			erasesize;
> +	u8			erase_opcode;
> +};
> +
> +struct spi_nor_map {
> +	u8			config_sel;
> +	u8			num_regions;
> +	struct spi_nor_region	*flash_region;
> +};
>  /**
>   * struct flash_info - Forward declaration of a structure used internally by
>   *		       spi_nor_scan()
> @@ -283,6 +298,7 @@ struct spi_nor {
>  	struct mtd_info		mtd;
>  	struct mutex		lock;
>  	struct device		*dev;
> +	struct spi_nor_map	flash_map;
>  	const struct flash_info	*info;
>  	u32			page_size;
>  	u8			addr_width;
> 
