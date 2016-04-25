Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aufDC-0005Nl-PZ
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 12:02:00 +0000
Subject: Re: [PATCH RFC 4/8] mtd: spi-nor: fix support of Dual (x-y-2) and
 Quad (x-y-4) SPI protocols
To: Marek Vasut <marex@denx.de>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
References: <cover.1460567255.git.cyrille.pitchen@atmel.com>
 <abc2b9a65c6934226ee958a87664c91877224aff.1460567256.git.cyrille.pitchen@atmel.com>
 <571166AE.6030607@denx.de>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <linux-kernel@vger.kernel.org>
Message-ID: <571E071F.8020300@atmel.com>
Date: Mon, 25 Apr 2016 14:01:35 +0200
MIME-Version: 1.0
In-Reply-To: <571166AE.6030607@denx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

Le 16/04/2016 00:09, Marek Vasut a écrit :
> On 04/13/2016 07:23 PM, Cyrille Pitchen wrote:
> 
> [...]
> 
> Hi!
> 
> [...]
> 
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 9d6854467651..12112f7ae1a4 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -105,10 +105,10 @@ static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>>  
>>  static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
>>  {
>> -	switch (nor->flash_read) {
>> -	case SPI_NOR_DUAL:
>> +	switch (SNOR_PROTO_DATA_FROM_PROTO(nor->read_proto)) {
>> +	case 2:
> 
> I have to say, I am not a big fan of replacing a macro with numeric
> constant, but that might be a matter of taste.
> 

I guess here I could use the SPI_NBITS_{SINGLE, DUAL, QUAD} macros as defined
in include/linux/spi/spi.h
>>  		return 2;
>> -	case SPI_NOR_QUAD:
>> +	case 4:
>>  		return 4;
>>  	default:
>>  		return 0;
> 
> [...]
> 
>> -int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>> +static int spi_nor_midx2proto(int midx, enum spi_nor_protocol *proto)
> 
> It is entirely inobvious what this function does from it's name.
> I had to scroll through the code to figure out what midx means
> and that it's "mode index". Either add a comment and rename the
> function. I would be in favor of the later.
> 

I'm thinking about a way to simply remove the enum spi_nor_mode_index.
1 - I need to build bit masks for struct spi_nor_modes and struct
    spi_nor_basic_flash_parameter so I can easily select the best match
    between the memory (mask1) and the controller (mask2) capabilities:
    fls(mask1 & mask2)
2 - I need to easily extract the three widths x, y and z from SPI x-y-z
    protocol (x = code, y = addr, z = data).

So I plan to use another way to encode the widths:

/* 2 bits are enough to encode the protocol class */
enum spi_nor_protocol_class {
	SNOR_PCLASS_1_1_N,
	SNOR_PCLASS_1_N_N,
	SNOR_PCLASS_N_N_N,

	SNOR_PCLASS_MAX
};

/* 3 bits are enough to encode widths up to 2^7 = 128 */
enum spi_nor_protocol_width {
	SNOR_PWIDTH_1,
	SNOR_PWIDTH_2,
	SNOR_PWIDTH_4,
	SNOR_PWDITH_8,
};

#define SNOR_PROTO(pclass, pwidth) \
	((((pwidth) & 0x7) << 2) | ((pclass) & 0x3))

#define SNOR_PROTO2CLASS(proto)	\
	((enum spi_nor_protocol_class)((proto) & 0x3))

#define SNOR_PROTO2WIDTH(proto) \
	((enum spi_nor_protocol_width)(((proto) >> 2) & 0x7))

enum spi_nor_protocol {
	SNOR_PROTO_1_1_1 = SNOR_PROTO(SNOR_PCLASS_1_1_N, SNOR_PWIDTH_1)
	SNOR_PROTO_1_1_4 = SNOR_PROTO(SNOR_PCLASS_1_1_N, SNOR_PWIDTH_4)
	SNOR_PROTO_1_2_2 = SNOR_PROTO(SNOR_PCLASS_1_N_N, SNOR_PWDITH_2)
	SNOR_PROTO_4_4_4 = SNOR_PROTO(SNOR_PCLASS_N_N_N, SNOR_PWIDTH_4)
[...]
};

/*
 * 1 - The higher pwidth, the higher protocol priority.
 * 2 - For a given pwidth, the higher pclass, the higher protocol priority.
 */
#define SNOR_PROTO_BIT(pclass, pwidth) \
	BIT((pwidth) * SNOR_PCLASS_MAX + (pclass))

/* Helper conversion functions */

/*
 * spi_nor_protocol_*_width() functions are used at runtime for instance
 * by m25p80_read().
 */
static inline u8 spi_nor_protocol_code_width(enum spi_nor_protocol proto)
{
	enum spi_nor_protocol_class pclass = SNOR_PROTO2CLASS(proto);
	enum spi_nor_protocol_width pwidth = SNOR_PROTO2WIDTH(proto);

	return (pclass == SNOR_PCLASS_N_N_N) ? (1 << pwidth) : 1;
}

static inline u8 spi_nor_protocol_addr_width(enum spi_nor_protocol proto)
{
	enum spi_nor_protocol_class pclass = SNOR_PROTO2CLASS(proto);
	enum spi_nor_protocol_width pwidth = SNOR_PROTO2WIDTH(proto);

	return (pclass == SNOR_PCLASS_1_1_N) ? 1 : (1 << pwidth);
}

static inline u8 spi_nor_protocol_data_width(enum spi_nor_protocol proto)
{
	enum spi_nor_protocol_width pwidth = SNOR_PROTO2WIDTH(proto);

	return (1 << pwdith);
}

/* Only used once from spi_nor_scan() */
static inline int spi_nor_bitmask2proto(uint32_t bitmask,
					enum spi_nor_protocol *proto)
{
	int pclass, pwidth, index = fls(bitmask) - 1;

	if (unlikely(index < 0))
		return -EINVAL;

	pclass = index % SNOR_PCLASS_MAX;
	pwidth = index / SNOR_PCLASS_MAX;
	*proto = SNOR_PROTO(pclass, pwidth);

	return 0;
}

>>  {
>> +	switch (midx) {
>> +	case SNOR_MIDX_SLOW:
>> +	case SNOR_MIDX_1_1_1:
>> +		*proto = SNOR_PROTO_1_1_1;
> 
> Can you not unify SNOR_PROTO_* and SNOR_MIDX_* , so this odd switch
> would go away entirely ? If not, make this into a lookup table at
> least.
> 

With the spi_nor_bitmask2proto() function described above I could get rid of
this switch statement. I just need to find out a mean to encode support
of Read vs Fast Read.

pclass belongs to {0, 1, 2} and pwidth to {0, 1, 2, .., 7} so the maximum
index is 7 * 3 + 2 = 23. BIT(24) up to BIT(31) are available for flags such
as "support slow read", "support fast read".

>> +		break;
>> +
>> +	case SNOR_MIDX_1_1_2:
>> +		*proto = SNOR_PROTO_1_1_2;
>> +		break;
>> +
>> +	case SNOR_MIDX_1_2_2:
>> +		*proto = SNOR_PROTO_1_2_2;
>> +		break;
>> +
>> +	case SNOR_MIDX_2_2_2:
>> +		*proto = SNOR_PROTO_2_2_2;
>> +		break;
>> +
>> +	case SNOR_MIDX_1_1_4:
>> +		*proto = SNOR_PROTO_1_1_4;
>> +		break;
>> +
>> +	case SNOR_MIDX_1_4_4:
>> +		*proto = SNOR_PROTO_1_4_4;
>> +		break;
>> +
>> +	case SNOR_MIDX_4_4_4:
>> +		*proto = SNOR_PROTO_4_4_4;
>> +		break;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
>> +			 const struct spi_nor_basic_flash_parameter *params,
>> +			 const struct spi_nor_modes *modes)
>> +{
>> +	bool enable_quad_io, enable_4_4_4, enable_2_2_2;
>> +	u32 rd_modes, wr_modes, cmd_modes, mask;
>> +	const struct spi_nor_erase_type *erase_type;
>> +	const struct spi_nor_read *read;
>> +	int rd_midx, wr_midx, err = 0;
>> +
>> +	/* 2-2-2 or 4-4-4 modes must be supported by BOTH read and write */
>> +	mask = (SNOR_MODE_2_2_2 | SNOR_MODE_4_4_4);
>> +	cmd_modes = (modes->rd_modes & modes->wr_modes) & mask;
>> +	rd_modes = (modes->rd_modes & ~mask) | cmd_modes;
>> +	wr_modes = (modes->wr_modes & ~mask) | cmd_modes;
> 
> This is a little cryptic, but it's indeed correct.
> 
Maybe I can develop the commit some more: the SNOR_MODE_4_4_4 bit must be set
in both rd_modes and wr_modes bitmask, otherwise it's not relevant so I clear
it. I do the same for the SNOR_MODE_2_2_2 bit.

>> +	/* Setup read operation. */
>> +	rd_midx = fls(params->rd_modes & rd_modes) - 1;
>> +	if (spi_nor_midx2proto(rd_midx, &nor->read_proto)) {
>> +		dev_err(nor->dev, "invalid (fast) read\n");
> 
> The error spit could certainly be more descriptive.
> 
>> +		return -EINVAL;
>> +	}
>> +	read = &params->reads[rd_midx];
>> +	nor->read_opcode = read->opcode;
>> +	nor->read_dummy = read->num_mode_clocks + read->num_wait_states;
>> +
>> +	/* Set page program op code and protocol. */
>> +	wr_midx = fls(params->wr_modes & wr_modes) - 1;
>> +	if (spi_nor_midx2proto(wr_midx, &nor->write_proto)) {
>> +		dev_err(nor->dev, "invalid page program\n");
>> +		return -EINVAL;
>> +	}
>> +	nor->program_opcode = params->page_programs[wr_midx];
>> +
>> +	/* Set sector erase op code and size. */
>> +	erase_type = &params->erase_types[0];
>> +#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>> +	for (i = 1; i < SNOR_MAX_ERASE_TYPES; ++i)
>> +		if (params->erase_types[i].size == 0x0c)
>> +			erase_type = &params->erase_types[i];
>> +#endif
>> +	nor->erase_opcode = erase_type->opcode;
>> +	nor->mtd.erasesize = (1 << erase_type->size);
>> +
>> +
>> +	enable_quad_io = (SNOR_PROTO_DATA_FROM_PROTO(nor->read_proto) == 4 ||
>> +			  SNOR_PROTO_DATA_FROM_PROTO(nor->write_proto) == 4);
> 
> What about dual IO? Shouldn't the code implement the same check ?
> 
Dual I/O doesn't exit: the SPI 1-1-1 protocol use MOSI/IO0 to send data to the
memory and MISO/IO1 to receive data from the memory.
The SPI 1-1-2, 1-1-2 and 2-2-2 protocols are also limited to IO0 and IO1 to
send and receive data.

The issue comes with Quad SPI protocols (SPI 1-1-4, 1-4-4 and 4-4-4). Those
protocol require two additional I/O lines, IO2 and IO3, which didn't exist
in the legacy SPI protocol. This is why most manufacturers provide a mean
to reassign 2 pins to other function:
- #Write Protect <-> IO2
- #Reset or #Hold <-> IO3

If you want to use Quad SPI protocols, you need IO2 and IO3 but you are likely
not to be able to use the write protect, reset and hold features any longer.
Actually it might also depends on the package: some packages have enough pins
so #Write Protect and IO2 don't share the same pin for instance.

>> +	enable_4_4_4 = (nor->read_proto == SNOR_PROTO_4_4_4);
>> +	enable_2_2_2 = (nor->read_proto == SNOR_PROTO_2_2_2);
>> +
>> +	/* Enable Quad I/O if needed. */
>> +	if ((enable_quad_io || enable_4_4_4) &&
>> +	    params->enable_quad_io &&
>> +	    nor->reg_proto != SNOR_PROTO_4_4_4) {
>> +		err = params->enable_quad_io(nor, true);
>> +		if (err) {
>> +			dev_err(nor->dev,
>> +				"failed to enable the Quad I/O mode\n");
>> +			return err;
>> +		}
>> +	}
>> +
>> +	/* Enter/Leave 2-2-2 or 4-4-4 if needed. */
>> +	if (enable_2_2_2 && params->enable_2_2_2 &&
>> +	    nor->reg_proto != SNOR_PROTO_2_2_2)
>> +		err = params->enable_2_2_2(nor, true);
>> +	else if (enable_4_4_4 && params->enable_4_4_4 &&
>> +		 nor->reg_proto != SNOR_PROTO_4_4_4)
>> +		err = params->enable_4_4_4(nor, true);
>> +	else if (!enable_2_2_2 && params->enable_2_2_2 &&
>> +		 nor->reg_proto == SNOR_PROTO_2_2_2)
>> +		err = params->enable_2_2_2(nor, false);
>> +	else if (!enable_4_4_4 && params->enable_4_4_4 &&
>> +		 nor->reg_proto == SNOR_PROTO_4_4_4)
>> +		err = params->enable_4_4_4(nor, false);
>> +	if (err)
>> +		return err;
>> +
>> +	/*
>> +	 * Fix erase protocol if needed, read and write protocols should
>> +	 * already be valid.
>> +	 */
>> +	switch (nor->reg_proto) {
>> +	case SNOR_PROTO_4_4_4:
>> +		nor->erase_proto = SNOR_PROTO_4_4_4;
>> +		break;
>> +
>> +	case SNOR_PROTO_2_2_2:
>> +		nor->erase_proto = SNOR_PROTO_2_2_2;
>> +		break;
>> +
>> +	default:
>> +		nor->erase_proto = SNOR_PROTO_1_1_1;
>> +		break;
>> +	}
>> +
>> +	dev_dbg(nor->dev,
>> +		"(Fast) Read:  opcode=%02Xh, protocol=%03x, mode=%u, wait=%u\n",
>> +		nor->read_opcode, nor->read_proto,
>> +		read->num_mode_clocks, read->num_wait_states);
>> +	dev_dbg(nor->dev,
>> +		"Page Program: opcode=%02Xh, protocol=%03x\n",
>> +		nor->program_opcode, nor->write_proto);
>> +	dev_dbg(nor->dev,
>> +		"Sector Erase: opcode=%02Xh, protocol=%03x, sector size=%zu\n",
>> +		nor->erase_opcode, nor->erase_proto, nor->mtd.erasesize);
>> +
>> +	return 0;
>> +}
> 
> [...]
> 
>> +/* Supported modes */
>> +enum spi_nor_mode_index {
>> +	/* Sorted by ascending priority order */
>> +	SNOR_MIDX_SLOW = 0,
>> +	SNOR_MIDX_1_1_1,
>> +	SNOR_MIDX_1_1_2,
>> +	SNOR_MIDX_1_2_2,
>> +	SNOR_MIDX_2_2_2,
>> +	SNOR_MIDX_1_1_4,
>> +	SNOR_MIDX_1_4_4,
>> +	SNOR_MIDX_4_4_4,
>> +
>> +	SNOR_MIDX_MAX
>> +};
>> +
>> +#define SNOR_MODE_SLOW		BIT(SNOR_MIDX_SLOW)
>> +#define SNOR_MODE_1_1_1		BIT(SNOR_MIDX_1_1_1)
>> +#define SNOR_MODE_1_1_2		BIT(SNOR_MIDX_1_1_2)
>> +#define SNOR_MODE_1_2_2		BIT(SNOR_MIDX_1_2_2)
>> +#define SNOR_MODE_2_2_2		BIT(SNOR_MIDX_2_2_2)
>> +#define SNOR_MODE_1_1_4		BIT(SNOR_MIDX_1_1_4)
>> +#define SNOR_MODE_1_4_4		BIT(SNOR_MIDX_1_4_4)
>> +#define SNOR_MODE_4_4_4		BIT(SNOR_MIDX_4_4_4)
> 
> This is something I was pondering about, but why don't you encode this
> SNOR mode as a 32-bit number, which would contain 8 bits for each
> command/addr/data field and possibly 8 remaining bits for flags ?
> This would allow for easy extraction of each component from it without
> the need for all the switch() {} statements.
> 

This is what I did with SNOR_PROTO(code, addr, data) macro below in the very
same file: I use 4 bits per code, addr, and data hence 12 bits.
The SNOR_PROTO() macro is used to set the values in the enum spi_nor_protocol.
This encoding was chosen so it's easy to extract the code, address and data
widths from an enum spi_nor_protocol such as nor->read_proto.

However this encoding was not suited to build bitmask used by the struct
spi_nor_modes. Hence the new encoding I proposed earlier with pclass and
pwidth.

>> +struct spi_nor_modes {
>> +	u32	id_modes;	/* supported SPI modes for Read JEDEC ID */
>> +	u32	rd_modes;	/* supported SPI modes for (Fast) Read */
>> +	u32	wr_modes;	/* supported SPI modes for Page Program */
>> +};
>> +
>> +
>> +struct spi_nor_read {
>> +	u8	num_wait_states:5;
>> +	u8	num_mode_clocks:3;
>> +	u8	opcode;
>> +};
>> +
>> +#define SNOR_OP_READ(_num_mode_clocks, _num_wait_states, _opcode) \
>> +	{							  \
>> +		.num_wait_states = _num_wait_states,		  \
>> +		.num_mode_clocks = _num_mode_clocks,		  \
>> +		.opcode = _opcode,				  \
>> +	}
>> +
>> +struct spi_nor_erase_type {
>> +	u8	size;	/* specifies 'N' so erase size = 2^N */
>> +	u8	opcode;
>> +};
>> +
>> +#define SNOR_OP_ERASE(_size, _opcode) { .size = _size, .opcode = _opcode }
> 
> Use parentheses around (_size) and (_opcode) in the macro to avoid issues.
> 
You're right, I forgot them :)

>> +#define SNOR_OP_ERASE_64K(_opcode) SNOR_OP_ERASE(0x10, _opcode)
>> +#define SNOR_OP_ERASE_32K(_opcode) SNOR_OP_ERASE(0x0f, _opcode)
>> +#define SNOR_OP_ERASE_4K(_opcode)  SNOR_OP_ERASE(0x0c, _opcode)
> 
> DTTO above for (_opcode)
> 
>> +struct spi_nor;
>> +
>> +#define SNOR_MAX_ERASE_TYPES	4
>> +
>> +struct spi_nor_basic_flash_parameter {
>> +	/* Fast Read settings */
>> +	u32				rd_modes;
>> +	struct spi_nor_read		reads[SNOR_MIDX_MAX];
>> +
>> +	/* Page Program settings */
>> +	u32				wr_modes;
>> +	u8				page_programs[SNOR_MIDX_MAX];
>> +
>> +	/* Sector Erase settings */
>> +	struct spi_nor_erase_type	erase_types[SNOR_MAX_ERASE_TYPES];
>> +
>> +	int (*read_id)(struct spi_nor *nor, u8 *id, size_t id_len,
>> +		       u32 id_modes);
>> +	int (*enable_quad_io)(struct spi_nor *nor, bool enable);
>> +	int (*enable_4_4_4)(struct spi_nor *nor, bool enable);
>> +	int (*enable_2_2_2)(struct spi_nor *nor, bool enable);
>> +};
> 
> [...]
> 

Thanks for your review,

Best regards,

Cyrille
