Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czPis-0008M3-DI
 for linux-mtd@lists.infradead.org; Sat, 15 Apr 2017 15:34:52 +0000
Received: by mail-wr0-x243.google.com with SMTP id o21so15564123wrb.3
 for <linux-mtd@lists.infradead.org>; Sat, 15 Apr 2017 08:34:29 -0700 (PDT)
Subject: Re: [RFC PATCH v5 5/6] mtd: spi-nor: parse Serial Flash Discoverable
 Parameters (SFDP) tables
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, jartur@cadence.com, kdasu.kdev@gmail.com,
 mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <5d0f4afc75849523d7a2e4548b8a68f5b66b0baf.1490220411.git.cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c600c7c4-b1c5-bcd2-418a-3f2664489cc1@gmail.com>
Date: Sat, 15 Apr 2017 17:34:25 +0200
MIME-Version: 1.0
In-Reply-To: <5d0f4afc75849523d7a2e4548b8a68f5b66b0baf.1490220411.git.cyrille.pitchen@atmel.com>
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

On 03/23/2017 12:33 AM, Cyrille Pitchen wrote:
> This patch adds support to the JESD216B standard and parses the SFDP
> tables to dynamically initialize the 'struct spi_nor_flash_parameter'.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Hi, mostly nits below.

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 558 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h   |   6 +
>  2 files changed, 564 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 2e54792d506d..ce8722055a9c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -17,6 +17,7 @@
>  #include <linux/mutex.h>
>  #include <linux/math64.h>
>  #include <linux/sizes.h>
> +#include <linux/slab.h>
>  
>  #include <linux/mtd/mtd.h>
>  #include <linux/of_platform.h>
> @@ -86,6 +87,7 @@ struct flash_info {
>  					 * to support memory size above 128Mib.
>  					 */
>  #define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
> +#define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
>  };
>  
>  #define JEDEC_MFR(info)	((info)->id[0])
> @@ -1593,6 +1595,99 @@ static int spansion_quad_enable(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static int spansion_new_quad_enable(struct spi_nor *nor)
> +{
> +	u8 sr_cr[2];
> +	int ret;
> +
> +	/* Check current Quad Enable bit value. */
> +	ret = read_cr(nor);
> +	if (ret < 0) {
> +		dev_err(nor->dev,
> +			"error while reading configuration register\n");
> +		return -EINVAL;
> +	}
> +	sr_cr[1] = ret;
> +	if (sr_cr[1] & CR_QUAD_EN_SPAN)
> +		return 0;
> +
> +	dev_info(nor->dev, "setting Spansion Quad Enable (non-volatile) bit\n");
> +
> +	/* Keep the current value of the Status Register. */
> +	ret = read_sr(nor);
> +	if (ret < 0) {
> +		dev_err(nor->dev,
> +			"error while reading status register\n");
> +		return -EINVAL;
> +	}
> +	sr_cr[0] = ret;
> +	sr_cr[1] |= CR_QUAD_EN_SPAN;
> +
> +	write_enable(nor);
> +
> +	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
> +	if (ret < 0) {
> +		dev_err(nor->dev,
> +			"error while writing configuration register\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error while waiting for WRSR completion\n");
> +		return ret;
> +	}
> +
> +	/* read back and check it */
> +	ret = read_cr(nor);
> +	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {

Nit, you might want to align this with sr2_bit7_quad_enable() below, that is

if (ret || !(ret & CR_QUAD_ENABLE_SPAN))
 ...

> +		dev_err(nor->dev, "Spansion Quad bit not set\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sr2_bit7_quad_enable(struct spi_nor *nor)
> +{
> +	u8 sr2;
> +	int ret;
> +
> +	/* Check current Quad Enable bit value. */
> +	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, &sr2, 1);
> +	if (ret)
> +		return ret;
> +	if (sr2 & SR2_QUAD_EN_BIT7)
> +		return 0;
> +
> +	/* Update the Quad Enable bit. */
> +	sr2 |= SR2_QUAD_EN_BIT7;
> +
> +	write_enable(nor);
> +
> +	ret = nor->write_reg(nor, SPINOR_OP_WRSR2, &sr2, 1);
> +	if (ret < 0) {
> +		dev_err(nor->dev,
> +			"error while writing status register 2\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error while waiting for WRSR2 completion\n");
> +		return ret;
> +	}
> +
> +	/* Read back and check it. */
> +	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, &sr2, 1);
> +	if (ret || !(sr2 & SR2_QUAD_EN_BIT7)) {
> +		dev_err(nor->dev, "SR2 Quad bit not set\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int spi_nor_check(struct spi_nor *nor)
>  {
>  	if (!nor->dev || !nor->read || !nor->write ||
> @@ -1759,6 +1854,465 @@ spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
>  	map->uniform_region.size = flash_size;
>  }
>  
> +
> +/*
> + * SFDP parsing.
> + */
> +
> +static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
> +			     size_t len, void *buf)
> +{
> +	u8 addr_width, read_opcode, read_dummy;
> +	int ret;
> +
> +	read_opcode = nor->read_opcode;
> +	addr_width = nor->addr_width;
> +	read_dummy = nor->read_dummy;
> +
> +	nor->read_opcode = SPINOR_OP_RDSFDP;
> +	nor->addr_width = 3;
> +	nor->read_dummy = 8;
> +
> +	ret = nor->read(nor, addr, len, (u8 *)buf);
> +
> +	nor->read_opcode = read_opcode;
> +	nor->addr_width = addr_width;
> +	nor->read_dummy = read_dummy;
> +
> +	return (ret < 0) ? ret : 0;
> +}
> +
> +struct sfdp_parameter_header {
> +	u8		id_lsb;
> +	u8		minor;
> +	u8		major;
> +	u8		length; /* in double words */
> +	u8		parameter_table_pointer[3]; /* byte address */
> +	u8		id_msb;
> +};
> +
> +#define SFDP_PARAM_HEADER_ID(p)	((u16)(((p)->id_msb << 8) | (p)->id_lsb))
> +#define SFDP_PARAM_HEADER_PTP(p) \
> +	((u32)(((p)->parameter_table_pointer[2] << 16) | \

Is the u32 cast needed ?  And the u16 one above ?

> +	       ((p)->parameter_table_pointer[1] <<  8) | \
> +	       ((p)->parameter_table_pointer[0] <<  0)))
> +
> +
> +#define SFDP_BFPT_ID		0xff00u	/* Basic Flash Parameter Table */
> +
> +#define SFDP_SIGNATURE		0x50444653u
> +#define SFDP_JESD216_MAJOR	1
> +#define SFDP_JESD216_MINOR	0
> +#define SFDP_JESD216A_MINOR	5
> +#define SFDP_JESD216B_MINOR	6
> +
> +struct sfdp_header {
> +	u32		signature; /* Ox50444653 <=> "SFDP" */
> +	u8		minor;
> +	u8		major;
> +	u8		nph; /* 0-base number of parameter headers */
> +	u8		unused;
> +
> +	/* Basic Flash Parameter Table. */
> +	struct sfdp_parameter_header	bfpt_header;
> +};
> +
> +/* Basic Flash Parameter Table */
> +
> +/*
> + * JESD216B defines a Basic Flash Parameter Table of 16 DWORDs.
> + * They are indexed from 1 but C arrays are indexed from 0.
> + */
> +enum sfdp_bfpt_dword {

Is this really useful at all ?

> +	BFPT_DWORD1 = 0,
> +	BFPT_DWORD2,
> +	BFPT_DWORD3,
> +	BFPT_DWORD4,
> +	BFPT_DWORD5,
> +	BFPT_DWORD6,
> +	BFPT_DWORD7,
> +	BFPT_DWORD8,
> +	BFPT_DWORD9,
> +	BFPT_DWORD10,
> +	BFPT_DWORD11,
> +	BFPT_DWORD12,
> +	BFPT_DWORD13,
> +	BFPT_DWORD14,
> +	BFPT_DWORD15,
> +	BFPT_DWORD16,
> +
> +	BFPT_DWORD_MAX
> +};
> +
> +/* The first revision of JESB216 defined only 9 DWORDs. */
> +#define BFPT_DWORD_MAX_JESD216			9
> +
> +/* 1st DWORD. */
> +#define BFPT_DWORD1_FAST_READ_1_1_2		BIT(16)
> +#define BFPT_DWORD1_ADDRESS_BYTES_MASK		GENMASK(18, 17)
> +#define BFPT_DWORD1_ADDRESS_BYTES_3_ONLY	(0u << 17)
> +#define BFPT_DWORD1_ADDRESS_BYTES_3_OR_4	(1u << 17)
> +#define BFPT_DWORD1_ADDRESS_BYTES_4_ONLY	(2u << 17)
> +#define BFPT_DWORD1_DTR				BIT(19)
> +#define BFPT_DWORD1_FAST_READ_1_2_2		BIT(20)
> +#define BFPT_DWORD1_FAST_READ_1_4_4		BIT(21)
> +#define BFPT_DWORD1_FAST_READ_1_1_4		BIT(22)
> +
> +/* 5th DWORD. */
> +#define BFPT_DWORD5_FAST_READ_2_2_2		BIT(0)
> +#define BFPT_DWORD5_FAST_READ_4_4_4		BIT(4)
> +
> +/* 11th DWORD. */
> +#define BFPT_DWORD11_PAGE_SIZE_SHIFT		4
> +#define BFPT_DWORD11_PAGE_SIZE_MASK		GENMASK(7, 4)
> +
> +/* 15th DWORD. */
> +
> +/*
> + * (from JESD216B)
> + * Quad Enable Requirements (QER):
> + * - 000b: Device does not have a QE bit. Device detects 1-1-4 and 1-4-4
> + *         reads based on instruction. DQ3/HOLD# functions are hold during
> + *         instruction pahse.
> + * - 001b: QE is bit 1 of status register 2. It is set via Write Status with
> + *         two data bytes where bit 1 of the second byte is one.
> + *         [...]
> + *         Writing only one byte to the status register has the side-effect of
> + *         clearing status register 2, including the QE bit. The 100b code is
> + *         used if writing one byte to the status register does not modify
> + *         status register 2.
> + * - 010b: QE is bit 6 of status register 1. It is set via Write Status with
> + *         one data byte where bit 6 is one.
> + *         [...]
> + * - 011b: QE is bit 7 of status register 2. It is set via Write status
> + *         register 2 instruction 3Eh with one data byte where bit 7 is one.
> + *         [...]
> + *         The status register 2 is read using instruction 3Fh.
> + * - 100b: QE is bit 1 of status register 2. It is set via Write Status with
> + *         two data bytes where bit 1 of the second byte is one.
> + *         [...]
> + *         In contrast to the 001b code, writing one byte to the status
> + *         register does not modify status register 2.
> + * - 101b: QE is bit 1 of status register 2. Status register 1 is read using
> + *         Read Status instruction 05h. Status register2 is read using
> + *         instruction 35h. QE is set via Writ Status instruction 01h with
> + *         two data bytes where bit 1 of the second byte is one.
> + *         [...]
> + */
> +#define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
> +#define BFPT_DWORD15_QER_NONE			(0u << 20) /* Micron */
> +#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(1u << 20)
> +#define BFPT_DWORD15_QER_SR1_BIT6		(2u << 20) /* Macronix */
> +#define BFPT_DWORD15_QER_SR2_BIT7		(3u << 20)
> +#define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(4u << 20)
> +#define BFPT_DWORD15_QER_SR2_BIT1		(5u << 20) /* Spansion */
> +
> +
> +struct sfdp_bfpt {
> +	u32	dwords[BFPT_DWORD_MAX];
> +};
> +
> +/* Fast Read settings. */
> +
> +static inline void
> +spi_nor_set_read_settings_from_bfpt(struct spi_nor_read_command *read,
> +				    u16 half,
> +				    enum spi_nor_protocol proto)
> +{
> +	read->num_mode_clocks = (half >> 5) & 0x07u;

Is this u in 0x07u really needed here ?

> +	read->num_wait_states = (half >> 0) & 0x1Fu;
> +	read->opcode = (half >> 8) & 0xFFu;
> +	read->proto = proto;
> +}
> +

[...]

> +static int spi_nor_parse_sfdp(struct spi_nor *nor,
> +			      struct spi_nor_flash_parameter *params)
> +{
> +	const struct sfdp_parameter_header *param_header, *bfpt_header;
> +	struct sfdp_parameter_header *param_headers = NULL;
> +	struct sfdp_header header;
> +	size_t psize;
> +	int i, err;
> +
> +	/* Get the SFDP header. */
> +	err = spi_nor_read_sfdp(nor, 0, sizeof(header), &header);
> +	if (err)
> +		return err;
> +
> +	/* Check the SFDP header version. */
> +	if (le32_to_cpu(header.signature) != SFDP_SIGNATURE ||
> +	    header.major != SFDP_JESD216_MAJOR ||
> +	    header.minor < SFDP_JESD216_MINOR)
> +		return -EINVAL;
> +
> +	/*
> +	 * Verify that the first and only mandatory parameter header is a
> +	 * Basic Flash Parameter Table header as specified in JESD216.
> +	 */
> +	bfpt_header = &header.bfpt_header;
> +	if (SFDP_PARAM_HEADER_ID(bfpt_header) != SFDP_BFPT_ID ||
> +	    bfpt_header->major != SFDP_JESD216_MAJOR)
> +		return -EINVAL;
> +
> +	/* Allocate memory for parameter headers. */
> +	if (header.nph) {
> +		psize = header.nph * sizeof(*param_headers);
> +
> +		param_headers = kmalloc(psize, GFP_KERNEL);
> +		if (!param_headers) {
> +			dev_err(nor->dev,
> +				"failed to allocate memory for SFDP parameter headers\n");

If malloc in kernel fails, you will most likely not be able to print
anything because that printing will also need to allocate memory
somewhere down the line. Nuke these prints , they are useless.

> +			return -ENOMEM;
> +		}
> +
> +		err = spi_nor_read_sfdp(nor, sizeof(header),
> +					psize, param_headers);
> +		if (err) {
> +			dev_err(nor->dev,
> +				"failed to read SFDP parameter headers\n");
> +			goto exit;
> +		}
> +	}
> +
> +	/*
> +	 * Check other parameter headers to get the latest revision of
> +	 * the basic flash parameter table.
> +	 */
> +	for (i = 0; i < header.nph; i++) {
> +		param_header = &param_headers[i];
> +
> +		if (SFDP_PARAM_HEADER_ID(param_header) == SFDP_BFPT_ID &&
> +		    param_header->major == SFDP_JESD216_MAJOR &&
> +		    (param_header->minor > bfpt_header->minor ||
> +		     (param_header->minor == bfpt_header->minor &&
> +		      param_header->length > bfpt_header->length)))
> +			bfpt_header = param_header;
> +	}
> +	err = spi_nor_parse_bfpt(nor, bfpt_header, params);
> +	if (err)
> +		goto exit;
> +
> +exit:
> +	kfree(param_headers);
> +	return err;
> +}
> +
>  static int spi_nor_init_params(struct spi_nor *nor,
>  			       const struct flash_info *info,
>  			       struct spi_nor_flash_parameter *params)
> @@ -1834,6 +2388,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
>  		}
>  	}
>  
> +	/* Override the parameters with data read from SFDP tables. */
> +	if (!(info->flags & SPI_NOR_SKIP_SFDP))
> +		spi_nor_parse_sfdp(nor, params);

This returns int, handle the retval.

> +
>  	return 0;
>  }
>  
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index c12cafe99bee..a0d21a973d60 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -41,6 +41,8 @@
>  #define SPINOR_OP_WREN		0x06	/* Write enable */
>  #define SPINOR_OP_RDSR		0x05	/* Read status register */
>  #define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
> +#define SPINOR_OP_RDSR2		0x3f	/* Read status register 2 */
> +#define SPINOR_OP_WRSR2		0x3e	/* Write status register 2 */
>  #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */
>  #define SPINOR_OP_READ_FAST	0x0b	/* Read data bytes (high frequency) */
>  #define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual Output SPI) */
> @@ -56,6 +58,7 @@
>  #define SPINOR_OP_CHIP_ERASE	0xc7	/* Erase whole flash chip */
>  #define SPINOR_OP_SE		0xd8	/* Sector erase (usually 64KiB) */
>  #define SPINOR_OP_RDID		0x9f	/* Read JEDEC ID */
> +#define SPINOR_OP_RDSFDP	0x5a	/* Read SFDP */
>  #define SPINOR_OP_RDCR		0x35	/* Read configuration register */
>  #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
>  
> @@ -128,6 +131,9 @@
>  /* Configuration Register bits. */
>  #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
>  
> +/* Status Register 2 bits. */
> +#define SR2_QUAD_EN_BIT7	BIT(7)
> +
>  
>  /* Supported SPI protocols */
>  #define SNOR_PROTO_WIDTH_MASK	GENMASK(7, 0)
> 


-- 
Best regards,
Marek Vasut
