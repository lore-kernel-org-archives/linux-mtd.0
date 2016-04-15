Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arC4A-0008LN-Or
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 22:18:19 +0000
Message-ID: <571166AE.6030607@denx.de>
Date: Sat, 16 Apr 2016 00:09:50 +0200
From: Marek Vasut <marex@denx.de>
MIME-Version: 1.0
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
CC: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 4/8] mtd: spi-nor: fix support of Dual (x-y-2) and
 Quad (x-y-4) SPI protocols
References: <cover.1460567255.git.cyrille.pitchen@atmel.com>
 <abc2b9a65c6934226ee958a87664c91877224aff.1460567256.git.cyrille.pitchen@atmel.com>
In-Reply-To: <abc2b9a65c6934226ee958a87664c91877224aff.1460567256.git.cyrille.pitchen@atmel.com>
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

On 04/13/2016 07:23 PM, Cyrille Pitchen wrote:

[...]

Hi!

[...]

> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 9d6854467651..12112f7ae1a4 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -105,10 +105,10 @@ static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>  
>  static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
>  {
> -	switch (nor->flash_read) {
> -	case SPI_NOR_DUAL:
> +	switch (SNOR_PROTO_DATA_FROM_PROTO(nor->read_proto)) {
> +	case 2:

I have to say, I am not a big fan of replacing a macro with numeric
constant, but that might be a matter of taste.

>  		return 2;
> -	case SPI_NOR_QUAD:
> +	case 4:
>  		return 4;
>  	default:
>  		return 0;

[...]

> -int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
> +static int spi_nor_midx2proto(int midx, enum spi_nor_protocol *proto)

It is entirely inobvious what this function does from it's name.
I had to scroll through the code to figure out what midx means
and that it's "mode index". Either add a comment and rename the
function. I would be in favor of the later.

>  {
> +	switch (midx) {
> +	case SNOR_MIDX_SLOW:
> +	case SNOR_MIDX_1_1_1:
> +		*proto = SNOR_PROTO_1_1_1;

Can you not unify SNOR_PROTO_* and SNOR_MIDX_* , so this odd switch
would go away entirely ? If not, make this into a lookup table at
least.

> +		break;
> +
> +	case SNOR_MIDX_1_1_2:
> +		*proto = SNOR_PROTO_1_1_2;
> +		break;
> +
> +	case SNOR_MIDX_1_2_2:
> +		*proto = SNOR_PROTO_1_2_2;
> +		break;
> +
> +	case SNOR_MIDX_2_2_2:
> +		*proto = SNOR_PROTO_2_2_2;
> +		break;
> +
> +	case SNOR_MIDX_1_1_4:
> +		*proto = SNOR_PROTO_1_1_4;
> +		break;
> +
> +	case SNOR_MIDX_1_4_4:
> +		*proto = SNOR_PROTO_1_4_4;
> +		break;
> +
> +	case SNOR_MIDX_4_4_4:
> +		*proto = SNOR_PROTO_4_4_4;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
> +			 const struct spi_nor_basic_flash_parameter *params,
> +			 const struct spi_nor_modes *modes)
> +{
> +	bool enable_quad_io, enable_4_4_4, enable_2_2_2;
> +	u32 rd_modes, wr_modes, cmd_modes, mask;
> +	const struct spi_nor_erase_type *erase_type;
> +	const struct spi_nor_read *read;
> +	int rd_midx, wr_midx, err = 0;
> +
> +	/* 2-2-2 or 4-4-4 modes must be supported by BOTH read and write */
> +	mask = (SNOR_MODE_2_2_2 | SNOR_MODE_4_4_4);
> +	cmd_modes = (modes->rd_modes & modes->wr_modes) & mask;
> +	rd_modes = (modes->rd_modes & ~mask) | cmd_modes;
> +	wr_modes = (modes->wr_modes & ~mask) | cmd_modes;

This is a little cryptic, but it's indeed correct.

> +	/* Setup read operation. */
> +	rd_midx = fls(params->rd_modes & rd_modes) - 1;
> +	if (spi_nor_midx2proto(rd_midx, &nor->read_proto)) {
> +		dev_err(nor->dev, "invalid (fast) read\n");

The error spit could certainly be more descriptive.

> +		return -EINVAL;
> +	}
> +	read = &params->reads[rd_midx];
> +	nor->read_opcode = read->opcode;
> +	nor->read_dummy = read->num_mode_clocks + read->num_wait_states;
> +
> +	/* Set page program op code and protocol. */
> +	wr_midx = fls(params->wr_modes & wr_modes) - 1;
> +	if (spi_nor_midx2proto(wr_midx, &nor->write_proto)) {
> +		dev_err(nor->dev, "invalid page program\n");
> +		return -EINVAL;
> +	}
> +	nor->program_opcode = params->page_programs[wr_midx];
> +
> +	/* Set sector erase op code and size. */
> +	erase_type = &params->erase_types[0];
> +#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
> +	for (i = 1; i < SNOR_MAX_ERASE_TYPES; ++i)
> +		if (params->erase_types[i].size == 0x0c)
> +			erase_type = &params->erase_types[i];
> +#endif
> +	nor->erase_opcode = erase_type->opcode;
> +	nor->mtd.erasesize = (1 << erase_type->size);
> +
> +
> +	enable_quad_io = (SNOR_PROTO_DATA_FROM_PROTO(nor->read_proto) == 4 ||
> +			  SNOR_PROTO_DATA_FROM_PROTO(nor->write_proto) == 4);

What about dual IO? Shouldn't the code implement the same check ?

> +	enable_4_4_4 = (nor->read_proto == SNOR_PROTO_4_4_4);
> +	enable_2_2_2 = (nor->read_proto == SNOR_PROTO_2_2_2);
> +
> +	/* Enable Quad I/O if needed. */
> +	if ((enable_quad_io || enable_4_4_4) &&
> +	    params->enable_quad_io &&
> +	    nor->reg_proto != SNOR_PROTO_4_4_4) {
> +		err = params->enable_quad_io(nor, true);
> +		if (err) {
> +			dev_err(nor->dev,
> +				"failed to enable the Quad I/O mode\n");
> +			return err;
> +		}
> +	}
> +
> +	/* Enter/Leave 2-2-2 or 4-4-4 if needed. */
> +	if (enable_2_2_2 && params->enable_2_2_2 &&
> +	    nor->reg_proto != SNOR_PROTO_2_2_2)
> +		err = params->enable_2_2_2(nor, true);
> +	else if (enable_4_4_4 && params->enable_4_4_4 &&
> +		 nor->reg_proto != SNOR_PROTO_4_4_4)
> +		err = params->enable_4_4_4(nor, true);
> +	else if (!enable_2_2_2 && params->enable_2_2_2 &&
> +		 nor->reg_proto == SNOR_PROTO_2_2_2)
> +		err = params->enable_2_2_2(nor, false);
> +	else if (!enable_4_4_4 && params->enable_4_4_4 &&
> +		 nor->reg_proto == SNOR_PROTO_4_4_4)
> +		err = params->enable_4_4_4(nor, false);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * Fix erase protocol if needed, read and write protocols should
> +	 * already be valid.
> +	 */
> +	switch (nor->reg_proto) {
> +	case SNOR_PROTO_4_4_4:
> +		nor->erase_proto = SNOR_PROTO_4_4_4;
> +		break;
> +
> +	case SNOR_PROTO_2_2_2:
> +		nor->erase_proto = SNOR_PROTO_2_2_2;
> +		break;
> +
> +	default:
> +		nor->erase_proto = SNOR_PROTO_1_1_1;
> +		break;
> +	}
> +
> +	dev_dbg(nor->dev,
> +		"(Fast) Read:  opcode=%02Xh, protocol=%03x, mode=%u, wait=%u\n",
> +		nor->read_opcode, nor->read_proto,
> +		read->num_mode_clocks, read->num_wait_states);
> +	dev_dbg(nor->dev,
> +		"Page Program: opcode=%02Xh, protocol=%03x\n",
> +		nor->program_opcode, nor->write_proto);
> +	dev_dbg(nor->dev,
> +		"Sector Erase: opcode=%02Xh, protocol=%03x, sector size=%zu\n",
> +		nor->erase_opcode, nor->erase_proto, nor->mtd.erasesize);
> +
> +	return 0;
> +}

[...]

> +/* Supported modes */
> +enum spi_nor_mode_index {
> +	/* Sorted by ascending priority order */
> +	SNOR_MIDX_SLOW = 0,
> +	SNOR_MIDX_1_1_1,
> +	SNOR_MIDX_1_1_2,
> +	SNOR_MIDX_1_2_2,
> +	SNOR_MIDX_2_2_2,
> +	SNOR_MIDX_1_1_4,
> +	SNOR_MIDX_1_4_4,
> +	SNOR_MIDX_4_4_4,
> +
> +	SNOR_MIDX_MAX
> +};
> +
> +#define SNOR_MODE_SLOW		BIT(SNOR_MIDX_SLOW)
> +#define SNOR_MODE_1_1_1		BIT(SNOR_MIDX_1_1_1)
> +#define SNOR_MODE_1_1_2		BIT(SNOR_MIDX_1_1_2)
> +#define SNOR_MODE_1_2_2		BIT(SNOR_MIDX_1_2_2)
> +#define SNOR_MODE_2_2_2		BIT(SNOR_MIDX_2_2_2)
> +#define SNOR_MODE_1_1_4		BIT(SNOR_MIDX_1_1_4)
> +#define SNOR_MODE_1_4_4		BIT(SNOR_MIDX_1_4_4)
> +#define SNOR_MODE_4_4_4		BIT(SNOR_MIDX_4_4_4)

This is something I was pondering about, but why don't you encode this
SNOR mode as a 32-bit number, which would contain 8 bits for each
command/addr/data field and possibly 8 remaining bits for flags ?
This would allow for easy extraction of each component from it without
the need for all the switch() {} statements.

> +struct spi_nor_modes {
> +	u32	id_modes;	/* supported SPI modes for Read JEDEC ID */
> +	u32	rd_modes;	/* supported SPI modes for (Fast) Read */
> +	u32	wr_modes;	/* supported SPI modes for Page Program */
> +};
> +
> +
> +struct spi_nor_read {
> +	u8	num_wait_states:5;
> +	u8	num_mode_clocks:3;
> +	u8	opcode;
> +};
> +
> +#define SNOR_OP_READ(_num_mode_clocks, _num_wait_states, _opcode) \
> +	{							  \
> +		.num_wait_states = _num_wait_states,		  \
> +		.num_mode_clocks = _num_mode_clocks,		  \
> +		.opcode = _opcode,				  \
> +	}
> +
> +struct spi_nor_erase_type {
> +	u8	size;	/* specifies 'N' so erase size = 2^N */
> +	u8	opcode;
> +};
> +
> +#define SNOR_OP_ERASE(_size, _opcode) { .size = _size, .opcode = _opcode }

Use parentheses around (_size) and (_opcode) in the macro to avoid issues.

> +#define SNOR_OP_ERASE_64K(_opcode) SNOR_OP_ERASE(0x10, _opcode)
> +#define SNOR_OP_ERASE_32K(_opcode) SNOR_OP_ERASE(0x0f, _opcode)
> +#define SNOR_OP_ERASE_4K(_opcode)  SNOR_OP_ERASE(0x0c, _opcode)

DTTO above for (_opcode)

> +struct spi_nor;
> +
> +#define SNOR_MAX_ERASE_TYPES	4
> +
> +struct spi_nor_basic_flash_parameter {
> +	/* Fast Read settings */
> +	u32				rd_modes;
> +	struct spi_nor_read		reads[SNOR_MIDX_MAX];
> +
> +	/* Page Program settings */
> +	u32				wr_modes;
> +	u8				page_programs[SNOR_MIDX_MAX];
> +
> +	/* Sector Erase settings */
> +	struct spi_nor_erase_type	erase_types[SNOR_MAX_ERASE_TYPES];
> +
> +	int (*read_id)(struct spi_nor *nor, u8 *id, size_t id_len,
> +		       u32 id_modes);
> +	int (*enable_quad_io)(struct spi_nor *nor, bool enable);
> +	int (*enable_4_4_4)(struct spi_nor *nor, bool enable);
> +	int (*enable_2_2_2)(struct spi_nor *nor, bool enable);
> +};

[...]

-- 
Best regards,
Marek Vasut
