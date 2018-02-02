Received: from mail-db5eur01on0045.outbound.protection.outlook.com
 ([104.47.2.45] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ehTKH-0006uz-HI
 for linux-mtd@lists.infradead.org; Fri, 02 Feb 2018 04:51:52 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>, Poonam Aggrwal
 <poonam.aggrwal@nxp.com>, Suresh Gupta <suresh.gupta@nxp.com>
Subject: RE: [PATCH 3/3] mtd: spi-nor: Add support of Sector Map Parameter
 Table
Date: Fri, 2 Feb 2018 04:51:31 +0000
Message-ID: <DB6PR0402MB2838A11271F52C55B036515499F90@DB6PR0402MB2838.eurprd04.prod.outlook.com>
References: <1517494812-2866-1-git-send-email-prabhakar.kushwaha@nxp.com>
In-Reply-To: <1517494812-2866-1-git-send-email-prabhakar.kushwaha@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> -----Original Message-----
> From: Prabhakar Kushwaha
> Sent: Thursday, February 01, 2018 7:50 PM
> To: linux-mtd@lists.infradead.org
> Cc: boris.brezillon@free-electrons.com; cyrille.pitchen@wedev4u.fr;
> computersforpeace@gmail.com; Poonam Aggrwal
> <poonam.aggrwal@nxp.com>; Suresh Gupta <suresh.gupta@nxp.com>; Yogesh
> Narayan Gaur <yogeshnarayan.gaur@nxp.com>; Prabhakar Kushwaha
> <prabhakar.kushwaha@nxp.com>
> Subject: [PATCH 3/3] mtd: spi-nor: Add support of Sector Map Parameter Ta=
ble
>=20
> JESD216B defines Sector Map Parameter Table. It identifies the location a=
nd size
> of sectors within the main data array of the flash memory device and iden=
tifies
> which Erase Types are supported by each sector. This table is used when a
> memory device has sectors of more than one size Or, does not allow all Er=
ase
> Type commands to be applied to all sectors.
>=20
> Sector Map parameter table is parsed to get location and size of sectors =
along
> with supported Erase Type.
>=20
> Also add support of selecting erase opcode based on erase address provide=
d at
> run-time.
>=20
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 293
> +++++++++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/spi-nor.h   |  16 +++
>  2 files changed, 305 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c index
> d445a4d..cc8bbb2d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -245,6 +245,10 @@ static inline u8 spi_nor_convert_3to4_erase(u8
> opcode)  static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
>  				      const struct flash_info *info)  {
> +	struct spi_nor_map *map =3D &nor->flash_map;
> +	struct spi_nor_region *reg;
> +	int i;
> +
>  	/* Do some manufacturer fixups first */
>  	switch (JEDEC_MFR(info)) {
>  	case SNOR_MFR_SPANSION:
> @@ -260,6 +264,16 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor
> *nor,
>  	nor->read_opcode =3D spi_nor_convert_3to4_read(nor->read_opcode);
>  	nor->program_opcode =3D spi_nor_convert_3to4_program(nor-
> >program_opcode);
>  	nor->erase_opcode =3D spi_nor_convert_3to4_erase(nor-
> >erase_opcode);
> +
> +	if (!map->flash_region)
> +		return;
> +
> +	reg =3D map->flash_region;
> +	for (i =3D 0; i < map->num_regions; i++) {
> +		reg[i].erase_opcode =3D
> +			spi_nor_convert_3to4_erase(reg[i].erase_opcode);
> +	}
> +
>  }
>=20
>  /* Enable/disable 4-byte addressing mode. */ @@ -483,6 +497,28 @@ static=
 int
> spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  	return nor->write_reg(nor, nor->erase_opcode, buf, nor->addr_width);
> }
>=20
> +static void spi_nor_erase_select(struct mtd_info *mtd, u32 addr) {
> +	struct spi_nor *nor =3D mtd_to_spi_nor(mtd);
> +	struct spi_nor_map *map =3D &nor->flash_map;
> +	struct spi_nor_region *reg;
> +	int i;
> +
> +	if (!map->flash_region)
> +		return;
> +
> +	reg =3D map->flash_region;
> +	for (i =3D 0; i < map->num_regions; i++) {
> +		if (addr >=3D reg[i].region_start &&
> +		    addr <=3D reg[i].region_end) {
> +			nor->erase_opcode =3D reg[i].erase_opcode;
> +			mtd->erasesize =3D reg[i].erasesize;
> +			if (reg[i].region_size < mtd->erasesize)
> +				mtd->erasesize =3D reg[i].region_size;
> +		}
> +	}
> +}
> +
>  /*
>   * Erase an address range on the nor chip.  The address range may extend
>   * one or more erase sectors.  Return an error is there is a problem era=
sing.
> @@ -491,8 +527,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct
> erase_info *instr)  {
>  	struct spi_nor *nor =3D mtd_to_spi_nor(mtd);
>  	u32 addr, len;
> -	uint32_t rem;
> +	uint32_t rem, erasesize;
>  	int ret;
> +	u8 erase_opcode;
>=20
>  	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
>  			(long long)instr->len);
> @@ -508,6 +545,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct
> erase_info *instr)
>  	if (ret)
>  		return ret;
>=20
> +	erase_opcode =3D nor->erase_opcode;
> +	erasesize =3D mtd->erasesize;
> +
>  	/* whole-chip erase? */
>  	if (len =3D=3D mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
>  		unsigned long timeout;
> @@ -542,6 +582,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct
> erase_info *instr)
>  		while (len) {
>  			write_enable(nor);
>=20
> +			spi_nor_erase_select(mtd, addr);
> +
>  			ret =3D spi_nor_erase_sector(nor, addr);
>  			if (ret)
>  				goto erase_err;
> @@ -558,6 +600,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct
> erase_info *instr)
>  	write_disable(nor);
>=20
>  erase_err:
> +	nor->erase_opcode =3D erase_opcode;
> +	mtd->erasesize =3D erasesize;
>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_ERASE);
>=20
>  	instr->state =3D ret ? MTD_ERASE_FAILED : MTD_ERASE_DONE; @@ -
> 1754,6 +1798,11 @@ struct spi_nor_pp_command {
>  	enum spi_nor_protocol	proto;
>  };
>=20
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
>=20
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
>  	struct spi_nor_pp_command
> 	page_programs[SNOR_CMD_PP_MAX];
> +	struct spi_nor_erase_command	erase[SNOR_CMD_ERASE_MAX];
>=20
>  	int (*quad_enable)(struct spi_nor *nor);  }; @@ -2024,6 +2083,31 @@
> struct sfdp_bfpt {
>  	u32	dwords[BFPT_DWORD_MAX];
>  };
>=20
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
>=20
>  static inline void
> @@ -2258,14 +2342,18 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor=
,
>=20
>  		erasesize =3D 1U << erasesize;
>  		opcode =3D (half >> 8) & 0xff;
> +
> +		params->erase[i].opcode =3D opcode;
> +		params->erase[i].erasesize =3D erasesize;
> +
>  #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>  		if (erasesize =3D=3D SZ_4K) {
>  			nor->erase_opcode =3D opcode;
>  			mtd->erasesize =3D erasesize;
> -			break;
>  		}
>  #endif
> -		if (!mtd->erasesize || mtd->erasesize < erasesize) {
> +		if ((!mtd->erasesize || mtd->erasesize < erasesize) &&
> +		    (!nor->erase_opcode)) {
>  			nor->erase_opcode =3D opcode;
>  			mtd->erasesize =3D erasesize;
>  		}
> @@ -2311,6 +2399,203 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor=
,
>  	return 0;
>  }
>=20
> +static int spi_nor_parse_smpt_command(struct spi_nor *nor, u32 dword1,
> +				      u32 dword2,
> +				      struct spi_nor_flash_parameter *params) {
> +	int ret =3D 0;
> +	u8 addr_width, config_bit;
> +	u32 cmd, mask;
> +
> +	addr_width =3D nor->addr_width;
> +

Modify value for nor->read_dummy along with nor->addr_width before sending =
cmd to driver.
As per data sheet of flash ' S25FS512S' value of dummy cycles to be passed =
for reading SPINOR_OP_RDAR is 8.

--
Regards
Yogesh Gaur

> +	switch (dword1 & SMPT_DESC_TYPE_ADR_LEN_MASK) {
> +	case SMPT_DESC_TYPE_ADDRESS_BYTES_3_ONLY:
> +		nor->addr_width =3D 3;
> +		break;
> +
> +	case SMPT_DESC_TYPE_ADDRESS_BYTES_4_ONLY:
> +		nor->addr_width =3D 4;
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	cmd =3D dword1 & SMPT_DESC_TYPE_CMD_INS_MASK;
> +	cmd >>=3D SMPT_DESC_TYPE_CMD_INS_SHIFT;
> +
> +	mask =3D dword1 & SMPT_DESC_TYPE_RD_DATA_MASK;
> +	mask >>=3D SMPT_DESC_TYPE_RD_DATA_SHIFT;
> +
> +	switch (cmd) {
> +	case SPINOR_OP_RDAR:
> +		if (nor->read_anyreg) {
> +			ret =3D nor->read_anyreg(nor, SPINOR_OP_RDAR,
> dword2,
> +			       &config_bit, 1);
> +			if (ret < 0) {
> +				dev_err(nor->dev, "error reading config_bit");
> +				goto err;
> +			}
> +
> +			config_bit &=3D mask;
> +
> +			ret =3D config_bit;
> +		}
> +		break;
> +
> +	default:
> +		dev_info(nor->dev, "Detection instructuion is not supported");
> +		break;
> +	}
> +
> +err:
> +	nor->addr_width =3D addr_width;
> +
> +	return ret;
> +}
> +
> +static int spi_nor_parse_smpt_map(struct spi_nor *nor, u32 *dword,
> +				  struct spi_nor_flash_parameter *params) {
> +	struct spi_nor_map *map =3D &nor->flash_map;
> +	u32 reg_size, start =3D 0,  opcode_index;
> +	u32 config_id, reg_count, i;
> +	struct spi_nor_region *reg;
> +
> +	config_id =3D *dword & SMPT_HEADER_CONFIG_ID;
> +	config_id >>=3D SMPT_HEADER_CONFIG_ID_SHIFT;
> +
> +	reg_count =3D *dword & SMPT_HEADER_REGION_COUNT;
> +	reg_count >>=3D SMPT_HEADER_REGION_COUNT_SHIFT;
> +	reg_count++;
> +
> +	if (map->config_sel !=3D config_id)
> +		return reg_count;
> +
> +	map->flash_region =3D kmalloc((reg_count * sizeof(struct
> spi_nor_region)),
> +				    GFP_KERNEL);
> +	if (!map->flash_region)
> +		return -ENOMEM;
> +
> +	map->num_regions =3D reg_count;
> +
> +	dword++;
> +
> +	reg =3D map->flash_region;
> +	for (i =3D 0; reg_count > 0; reg_count--, dword++, i++) {
> +		reg_size =3D *dword & SMPT_REGION_SIZE;
> +		reg_size >>=3D SMPT_REGION_SIZE_SHIFT;
> +		reg_size =3D (reg_size + 1) * 256;
> +
> +		reg[i].region_size =3D reg_size;
> +		reg[i].region_start =3D start;
> +		reg[i].region_end =3D start + reg_size - 1;
> +
> +		opcode_index =3D ffs(*dword & 0x0F) - 1;
> +		reg[i].erase_opcode =3D params->erase[opcode_index].opcode;
> +		reg[i].erasesize =3D params->erase[opcode_index].erasesize;
> +
> +		start =3D reg[i].region_end + 1;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * spi_nor_parse_smpt() - read and parse the Basic Flash Parameter Table=
.
> + * @nor:		pointer to a 'struct spi_nor'
> + * @smpt_header:	pointer to the 'struct sfdp_parameter_header'
> describing
> + *			the Sector Map Parameter Table length and version
> + * @params:		pointer to the 'struct spi_nor_flash_parameter' to be
> + *			filled
> + *
> + * The Sector Map Parameter Table identifies the location and size of
> +sectors
> + * within the main data array of the flash memory device and identifies
> +which
> + * Erase Types are supported by each sector. This table is optional
> +table as
> + * defined by the SFDP (JESD216) specification.
> + * If there is more than one user selected sector map (configuration),
> + * this table includes the definition of instructions needed to
> +determine
> + * which sector map configuration is in use. The number of sector map
> + * configuration detection commands is variable, the number of
> + * configurations is variable, and  the number of regions in each
> + * configuration is variable, thus the size of this table is variable.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_parse_smpt(struct spi_nor *nor,
> +			      const struct sfdp_parameter_header *smpt_header,
> +			      struct spi_nor_flash_parameter *params) {
> +	struct sfdp_smpt smpt;
> +	size_t len;
> +	int i, ret;
> +	u32 addr;
> +
> +	/* Read the Sector Map Parameter Table. */
> +	len =3D smpt_header->length * sizeof(u32);
> +	addr =3D SFDP_PARAM_HEADER_PTP(smpt_header);
> +
> +	smpt.dwords =3D kmalloc(len, GFP_KERNEL);
> +	if (!smpt.dwords)
> +		return -ENOMEM;
> +
> +	ret =3D spi_nor_read_sfdp_dma_unsafe(nor,  addr, len, smpt.dwords);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Fix endianness of the SMPT DWORDs. */
> +	for (i =3D 0; i < smpt_header->length; i++)
> +		smpt.dwords[i] =3D le32_to_cpu(smpt.dwords[i]);
> +
> +	i =3D 0;
> +
> +	while (!((smpt.dwords[i] & SMPT_DESC_TYPE_MASK) >>
> +		 SMPT_DESC_TYPE_MASK_SHIFT)) {
> +		ret =3D spi_nor_parse_smpt_command(nor, smpt.dwords[i],
> +						 smpt.dwords[i + 1], params);
> +		if (ret < 0) {
> +			dev_err(nor->dev, "error parsing smpt command");
> +			return ret;
> +		}
> +
> +		nor->flash_map.config_sel <<=3D 1;
> +		if (ret)
> +			nor->flash_map.config_sel |=3D 1;
> +
> +		if (smpt.dwords[i] & SMPT_DESC_SEQ_END)
> +			break;
> +
> +		/*
> +		 * Point to next config detect
> +		 */
> +		i =3D i + 2;
> +	};
> +
> +	/*
> +	 * Point to First config header
> +	 */
> +	i +=3D 2;
> +
> +	while (((smpt.dwords[i] & SMPT_DESC_TYPE_MASK) >>
> +		SMPT_DESC_TYPE_MASK_SHIFT)) {
> +		ret =3D spi_nor_parse_smpt_map(nor, &smpt.dwords[i], params);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		if (ret =3D=3D 0 || smpt.dwords[i] & SMPT_DESC_SEQ_END)
> +			break;
> +
> +		/*
> +		 * Point to next config header
> +		 */
> +		i =3D i + ret + 1;
> +	};
> +
> +	return 0;
> +}
> +
>  /**
>   * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters=
.
>   * @nor:		pointer to a 'struct spi_nor'
> @@ -2405,7 +2690,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>=20
>  		switch (SFDP_PARAM_HEADER_ID(param_header)) {
>  		case SFDP_SECTOR_MAP_ID:
> -			dev_info(dev, "non-uniform erase sector maps are not
> supported yet.\n");
> +			err =3D spi_nor_parse_smpt(nor, param_header, params);
>  			break;
>=20
>  		default:
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h in=
dex
> a747215..c018ffe 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -107,6 +107,8 @@
>  /* Used for Spansion flashes only. */
>  #define SPINOR_OP_BRWR		0x17	/* Bank register write */
>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
> +#define SPINOR_OP_RDAR		0x65	/* Read any register */
> +#define SPINOR_OP_WRAR		0x71	/* Write any register */
>=20
>  /* Used for Micron flashes only. */
>  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
> @@ -235,6 +237,19 @@ enum spi_nor_option_flags {
>  	SNOR_F_USE_CLSR		=3D BIT(5),
>  };
>=20
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
>   * struct flash_info - Forward declaration of a structure used internall=
y by
>   *		       spi_nor_scan()
> @@ -283,6 +298,7 @@ struct spi_nor {
>  	struct mtd_info		mtd;
>  	struct mutex		lock;
>  	struct device		*dev;
> +	struct spi_nor_map	flash_map;
>  	const struct flash_info	*info;
>  	u32			page_size;
>  	u8			addr_width;
> --
> 2.7.4
