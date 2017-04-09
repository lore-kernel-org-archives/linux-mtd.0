Received: from 14.mo1.mail-out.ovh.net ([178.32.97.215])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxKCu-0007iY-8c
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 21:17:15 +0000
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 8A92B67711
 for <linux-mtd@lists.infradead.org>; Sun,  9 Apr 2017 23:16:48 +0200 (CEST)
Subject: Re: [PATCH v5 1/6] mtd: spi-nor: introduce more SPI protocols and the
 Dual Transfer Mode
To: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 jartur@cadence.com, kdasu.kdev@gmail.com, mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <65619c23078469af03e4d53d781a8cffa92d5a61.1490220411.git.cyrille.pitchen@atmel.com>
 <df606e17-4819-d605-8f76-260ab49628af@gmail.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <3a309f90-99b0-a634-0aee-8098d5da0556@wedev4u.fr>
Date: Sun, 9 Apr 2017 23:16:34 +0200
MIME-Version: 1.0
In-Reply-To: <df606e17-4819-d605-8f76-260ab49628af@gmail.com>
Content-Type: text/plain; charset=windows-1252
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

thanks for the review.

my comments below:

Le 07/04/2017 à 01:30, Marek Vasut a écrit :
> On 03/23/2017 12:33 AM, Cyrille Pitchen wrote:
>> This patch changes the prototype of spi_nor_scan(): its 3rd parameter
>> is replaced by a 'struct spi_nor_hwcaps' pointer, which tells the spi-nor
>> framework about the actual hardware capabilities supported by the SPI
>> controller and its driver.
>>
>> Besides, this patch also introduces a new 'struct spi_nor_flash_parameter'
>> telling the spi-nor framework about the hardware capabilities supported by
>> the SPI flash memory and the associated settings required to use those
>> hardware caps.
>>
>> Currently the 'struct spi_nor_flash_parameter' is filled with legacy
>> values but a later patch will allow to fill it dynamically by reading the
>> JESD216 Serial Flash Discoverable Parameter (SFDP) tables from the SPI
>> memory.
>>
>> With both structures, the spi-nor framework can now compute the best
>> match between hardware caps supported by both the (Q)SPI memory and
>> controller hence selecting the relevant SPI protocols and op codes for
>> (Fast) Read, Page Program and Sector Erase operations.
>>
>> The 'struct spi_nor_flash_parameter' also provides the spi-nor framework
>> with the number of dummy cycles to be used with each Fast Read commands
>> and the erase block size associated to the erase block op codes.
>>
>> Finally the 'struct spi_nor_flash_parameter', through the optional
>> .enable_quad_io() hook, tells the spi-nor framework how to set the Quad
>> Enable (QE) bit of the QSPI memory to enable its Quad SPI features.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> ---
>>  drivers/mtd/devices/m25p80.c          |  16 +-
>>  drivers/mtd/spi-nor/aspeed-smc.c      |  23 +-
>>  drivers/mtd/spi-nor/atmel-quadspi.c   |  80 +++---
>>  drivers/mtd/spi-nor/cadence-quadspi.c |  18 +-
>>  drivers/mtd/spi-nor/fsl-quadspi.c     |   8 +-
>>  drivers/mtd/spi-nor/hisi-sfc.c        |  31 ++-
>>  drivers/mtd/spi-nor/intel-spi.c       |   7 +-
>>  drivers/mtd/spi-nor/mtk-quadspi.c     |  16 +-
>>  drivers/mtd/spi-nor/nxp-spifi.c       |  22 +-
>>  drivers/mtd/spi-nor/spi-nor.c         | 441 +++++++++++++++++++++++++++-------
>>  include/linux/mtd/spi-nor.h           | 158 +++++++++++-
>>  11 files changed, 643 insertions(+), 177 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index c4df3b1bded0..68986a26c8fe 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -111,10 +111,10 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>>  
>>  static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
>>  {
>> -	switch (nor->flash_read) {
>> -	case SPI_NOR_DUAL:
>> +	switch (nor->read_proto) {
>> +	case SNOR_PROTO_1_1_2:
>>  		return 2;
>> -	case SPI_NOR_QUAD:
>> +	case SNOR_PROTO_1_1_4:
>>  		return 4;
>>  	default:
>>  		return 0;
>> @@ -196,7 +196,9 @@ static int m25p_probe(struct spi_device *spi)
>>  	struct flash_platform_data	*data;
>>  	struct m25p *flash;
>>  	struct spi_nor *nor;
>> -	enum read_mode mode = SPI_NOR_NORMAL;
>> +	struct spi_nor_hwcaps hwcaps = {
>> +		.mask = (SNOR_HWCAPS_READ | SNOR_HWCAPS_PP),
> 
> Drop the unneeded parenthesis.
> 
>> +	};
>>  	char *flash_name;
>>  	int ret;
>>  
>> @@ -222,9 +224,9 @@ static int m25p_probe(struct spi_device *spi)
>>  	flash->spi = spi;
>>  
>>  	if (spi->mode & SPI_RX_QUAD)
>> -		mode = SPI_NOR_QUAD;
>> +		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
>>  	else if (spi->mode & SPI_RX_DUAL)
>> -		mode = SPI_NOR_DUAL;
>> +		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
>>  
>>  	if (data && data->name)
>>  		nor->mtd.name = data->name;
>> @@ -241,7 +243,7 @@ static int m25p_probe(struct spi_device *spi)
>>  	else
>>  		flash_name = spi->modalias;
>>  
>> -	ret = spi_nor_scan(nor, flash_name, mode);
>> +	ret = spi_nor_scan(nor, flash_name, &hwcaps);
>>  	if (ret)
>>  		return ret;
>>  
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 56051d30f000..723026d9cf0c 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -585,14 +585,12 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>  	 * TODO: Adjust clocks if fast read is supported and interpret
>>  	 * SPI-NOR flags to adjust controller settings.
>>  	 */
>> -	switch (chip->nor.flash_read) {
>> -	case SPI_NOR_NORMAL:
>> -		cmd = CONTROL_COMMAND_MODE_NORMAL;
>> -		break;
>> -	case SPI_NOR_FAST:
>> -		cmd = CONTROL_COMMAND_MODE_FREAD;
>> -		break;
>> -	default:
>> +	if (chip->nor.read_proto == SNOR_PROTO_1_1_1) {
>> +		if (chip->nor.read_dummy == 0)
>> +			cmd = CONTROL_COMMAND_MODE_NORMAL;
>> +		else
>> +			cmd = CONTROL_COMMAND_MODE_FREAD;
>> +	} else {
>>  		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
>>  		return -EINVAL;
>>  	}
>> @@ -608,6 +606,11 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>  static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>  				  struct device_node *np, struct resource *r)
>>  {
>> +	struct spi_nor_hwcaps hwcaps = {
>> +		.mask = (SNOR_HWCAPS_READ |
>> +			 SNOR_HWCAPS_READ_FAST |
>> +			 SNOR_HWCAPS_PP),
> 
> Drop the extra parenthesis ... shouldn't the structure be const ?
> 
>> +	};
>>  	const struct aspeed_smc_info *info = controller->info;
>>  	struct device *dev = controller->dev;
>>  	struct device_node *child;
>> @@ -671,11 +674,11 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>  			break;
>>  
>>  		/*
>> -		 * TODO: Add support for SPI_NOR_QUAD and SPI_NOR_DUAL
>> +		 * TODO: Add support for Dual and Quad SPI protocols
>>  		 * attach when board support is present as determined
>>  		 * by of property.
>>  		 */
>> -		ret = spi_nor_scan(nor, NULL, SPI_NOR_NORMAL);
>> +		ret = spi_nor_scan(nor, NULL, &hwcaps);
>>  		if (ret)
>>  			break;
> 
> 
> [...]
> 
>> +struct spi_nor_flash_parameter {
>> +	u64				size;
>> +	u32				page_size;
>> +
>> +	struct spi_nor_hwcaps		hwcaps;
>> +	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
>> +	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
>> +
>> +	int (*quad_enable)(struct spi_nor *nor);
> 
> This callback should be added by a separate patch, there's WAY too much
> crap in this patch.
>

The manufacturer/flash specific quad_enable() handler sets the Quad
Enable (QE) bit in some internal status register of the SPI flash.
The QE bit may not exist for some manufacturers (actually only Micron
AFAIK) but when it does, we must set this bit before sending any flash
command using any Quad SPI protocol.

So my point is that the use of the quad_enable() handler is tightly
bound up with the possibility to use more (Quad) SPI protocols, which is
the purpose of this patch.

>From the JESD216B (SFDP) specification, the Quad Enable Requirement
(QER) is part of the Basic Flash Parameter Table (BFPT). QER describes
the procedure to set the QE bit. So this notion is translated into the
quad_enable() handler being a member of the 'struct
spi_nor_flash_parameter'.

The 'struct spi_nor_flash_parameter' is initialized in
spi_nor_init_params(). This includes the (Fast) Read and Page Programs
settings, which are also provided by the BFPT, as well as the choice of
the right quad_enable() handler.
Then spi_nor_setup() selects the right settings and calls the
quad_enable() handler, if needed: that is to say if any Quad SPI
protocol was selected for Fast Read or Page Program operation.

Then if you don't mind, I'd rather keep the quad_enable() handler within
this patch. IMHO, it makes more sense.


>> +};
>> +
>> +
>> +static inline void
>> +spi_nor_set_read_settings(struct spi_nor_read_command *read,
>> +			  u8 num_mode_clocks,
>> +			  u8 num_wait_states,
>> +			  u8 opcode,
>> +			  enum spi_nor_protocol proto)
>> +{
>> +	read->num_mode_clocks = num_mode_clocks;
>> +	read->num_wait_states = num_wait_states;
>> +	read->opcode = opcode;
>> +	read->proto = proto;
>> +}
>> +
>> +static inline void
> 
> Drop the inline , the compiler will decide. Fix globally.
> 
>> +spi_nor_set_pp_settings(struct spi_nor_pp_command *pp,
>> +			u8 opcode,
>> +			enum spi_nor_protocol proto)
>> +{
>> +	pp->opcode = opcode;
>> +	pp->proto = proto;
>> +}
>> +
>> +static int spi_nor_init_params(struct spi_nor *nor,
>> +			       const struct flash_info *info,
>> +			       struct spi_nor_flash_parameter *params)
>> +{
>> +	/* Set legacy flash parameters as default. */
>> +	memset(params, 0, sizeof(*params));
>> +
>> +	/* Set SPI NOR sizes. */
>> +	params->size = info->sector_size * info->n_sectors;
>> +	params->page_size = info->page_size;
>> +
>> +	/* (Fast) Read settings. */
>> +	params->hwcaps.mask |= SNOR_HWCAPS_READ;
>> +	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
>> +				  0, 0, SPINOR_OP_READ,
>> +				  SNOR_PROTO_1_1_1);
> 
> Newline
> 
>> +	if (!(info->flags & SPI_NOR_NO_FR)) {
>> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
>> +					  0, 8, SPINOR_OP_READ_FAST,
>> +					  SNOR_PROTO_1_1_1);
>> +	}
> 
> Newline
> 
>> +	if (info->flags & SPI_NOR_DUAL_READ) {
>> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
>> +					  0, 8, SPINOR_OP_READ_1_1_2,
>> +					  SNOR_PROTO_1_1_2);
>> +	}
> 
> Newline ... this is really hard to read as it is.
> 
>> +	if (info->flags & SPI_NOR_QUAD_READ) {
>> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
>> +					  0, 8, SPINOR_OP_READ_1_1_4,
>> +					  SNOR_PROTO_1_1_4);
>> +	}
>> +
>> +	/* Page Program settings. */
>> +	params->hwcaps.mask |= SNOR_HWCAPS_PP;
>> +	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
>> +				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
>> +
>> +	/* Select the procedure to set the Quad Enable bit. */
>> +	if (params->hwcaps.mask & (SNOR_HWCAPS_READ_QUAD |
>> +				   SNOR_HWCAPS_PP_QUAD)) {
>> +		switch (JEDEC_MFR(info)) {
>> +		case SNOR_MFR_MACRONIX:
>> +			params->quad_enable = macronix_quad_enable;
>> +			break;
>> +
>> +		case SNOR_MFR_MICRON:
>> +			break;
>> +
>> +		default:
> 
> Are you sure this is a good idea ?

This is exactly what was done before this patch. Please have a look at
the former set_quad_mode() function.

Is it a good idea to choose spansion_quad_enable() also for default
case? I agree with you, it is not.

However this patch should be seen as a base for further patches fixing
step by step the many pending known issues. Currently, I'm focusing on a
smooth transition in changing the 3rd argument of spi_nor_scan().
Everything is expected to work just as before.

About the quad_enable() handler to be chosen for Spansion and other
manufacturer SPI flash memories:
Even when regarding Spansion memories only, the procedure to set the QE
bit has evolved based on whether or not the memory part supports the op
code to read the Control Register 1 / Status Register 2.

If supported, a new procedure is described in the JESD216B
specification. The new procedure is more efficient and reliable than the
old one, ie spansion_quad_enable().

This issue is fixed by patch 5 of this series.


> 
>> +			params->quad_enable = spansion_quad_enable;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int spi_nor_hwcaps2cmd(u32 hwcaps)
> 
> const u32 hwcaps ...
> 
>>  {
>> +	switch (hwcaps) {
>> +	case SNOR_HWCAPS_READ:			return SNOR_CMD_READ;
> 
> You can do this as a table lookup or array indexing and it would be
> checkpatch clean.
>

This patch has already passed the checkpatch test.

>> +	case SNOR_HWCAPS_READ_FAST:		return SNOR_CMD_READ_FAST;
>> +	case SNOR_HWCAPS_READ_1_1_1_DTR:	return SNOR_CMD_READ_1_1_1_DTR;
>> +	case SNOR_HWCAPS_READ_1_1_2:		return SNOR_CMD_READ_1_1_2;
>> +	case SNOR_HWCAPS_READ_1_2_2:		return SNOR_CMD_READ_1_2_2;
>> +	case SNOR_HWCAPS_READ_2_2_2:		return SNOR_CMD_READ_2_2_2;
>> +	case SNOR_HWCAPS_READ_1_2_2_DTR:	return SNOR_CMD_READ_1_2_2_DTR;
>> +	case SNOR_HWCAPS_READ_1_1_4:		return SNOR_CMD_READ_1_1_4;
>> +	case SNOR_HWCAPS_READ_1_4_4:		return SNOR_CMD_READ_1_4_4;
>> +	case SNOR_HWCAPS_READ_4_4_4:		return SNOR_CMD_READ_4_4_4;
>> +	case SNOR_HWCAPS_READ_1_4_4_DTR:	return SNOR_CMD_READ_1_4_4_DTR;
>> +	case SNOR_HWCAPS_READ_1_1_8:		return SNOR_CMD_READ_1_1_8;
>> +	case SNOR_HWCAPS_READ_1_8_8:		return SNOR_CMD_READ_1_8_8;
>> +	case SNOR_HWCAPS_READ_8_8_8:		return SNOR_CMD_READ_8_8_8;
>> +	case SNOR_HWCAPS_READ_1_8_8_DTR:	return SNOR_CMD_READ_1_8_8_DTR;
>> +
>> +	case SNOR_HWCAPS_PP:			return SNOR_CMD_PP;
>> +	case SNOR_HWCAPS_PP_1_1_4:		return SNOR_CMD_PP_1_1_4;
>> +	case SNOR_HWCAPS_PP_1_4_4:		return SNOR_CMD_PP_1_4_4;
>> +	case SNOR_HWCAPS_PP_4_4_4:		return SNOR_CMD_PP_4_4_4;
>> +	case SNOR_HWCAPS_PP_1_1_8:		return SNOR_CMD_PP_1_1_8;
>> +	case SNOR_HWCAPS_PP_1_8_8:		return SNOR_CMD_PP_1_8_8;
>> +	case SNOR_HWCAPS_PP_8_8_8:		return SNOR_CMD_PP_8_8_8;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int spi_nor_select_read(struct spi_nor *nor,
>> +			       const struct spi_nor_flash_parameter *params,
>> +			       u32 shared_hwcaps)
>> +{
>> +	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;
>> +	const struct spi_nor_read_command *read;
>> +
>> +	if (best_match < 0)
>> +		return -EINVAL;
>> +
>> +	cmd = spi_nor_hwcaps2cmd(BIT(best_match));
> 
> How does this work? Do we assume that hwcaps2cmd is always given a value
> with 1-bit set ? That's quite wasteful IMO.
>

SNOR_HWCAPS_READ* and SNOR_HWCAPS_PP* are all defined with the BIT()
macro since they are used to set the bitmask describing the hardware
capabilities supported by the SPI flash memory and controller.
Each of them can support many SPI commands hence the use of a bitmask.

Then we compute the best match from the hardware capabilities shared by
both the memory and controller. It means we always select a single bit
from the shared_hwcaps bitmask. So to answer your question, indeed,
hwcaps2cmd() is always given a value with a single bit set.


>> +	if (cmd < 0)
>> +		return -EINVAL;
>> +
>> +	read = &params->reads[cmd];
>> +	nor->read_opcode = read->opcode;
>> +	nor->read_proto = read->proto;
>> +
>> +	/*
>> +	 * In the spi-nor framework, we don't need to make the difference
>> +	 * between mode clock cycles and wait state clock cycles.
>> +	 * Indeed, the value of the mode clock cycles is used by a QSPI
>> +	 * flash memory to know whether it should enter or leave its 0-4-4
>> +	 * (Continuous Read / XIP) mode.
> 
> 0-4-4 ?

Some manufacturer datasheets name this mode the "Continuous Read" mode
or the "eXecution In Place" mode but the JESD216B specification calls it
the 0-4-4 mode, just to have a consistent naming with the 4-4-4 mode.

Once in 0-4-4 mode, the SPI flash memory expects later Fast Read
commands to start directly from the address clocks cycles, skipping the
instruction clock cycles, hence the leading 0.

The value of the mode cycles, between the address and wait state cycles,
in the Fast Read x-4-4 command tells the SPI flash memory whether is the
next SPI flash command will be a Fast Read 0-4-4 command or any other
command with instruction clock cycles.

It is common to split SPI flash commands into 3 parts:
instruction | (address;mode;wait states) | data

So 0-4-4 means:
- no instruction clock cycles
- 4 I/O lines being used during address;mode;wait states clock cycles
- 4 I/O lines being used during data clock cycles


> 
>> +	 * eXecution In Place is out of the scope of the mtd sub-system.
>> +	 * Hence we choose to merge both mode and wait state clock cycles
>> +	 * into the so called dummy clock cycles.
>> +	 */
>> +	nor->read_dummy = read->num_mode_clocks + read->num_wait_states;
>> +	return 0;
>> +}
>> +
>> +static int spi_nor_select_pp(struct spi_nor *nor,
>> +			     const struct spi_nor_flash_parameter *params,
>> +			     u32 shared_hwcaps)
>> +{
>> +	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_PP_MASK) - 1;
>> +	const struct spi_nor_pp_command *pp;
>> +
>> +	if (best_match < 0)
>> +		return -EINVAL;
>> +
>> +	cmd = spi_nor_hwcaps2cmd(BIT(best_match));
>> +	if (cmd < 0)
>> +		return -EINVAL;
>> +
>> +	pp = &params->page_programs[cmd];
>> +	nor->program_opcode = pp->opcode;
>> +	nor->write_proto = pp->proto;
>> +	return 0;
>> +}
>> +
>> +static int spi_nor_select_erase(struct spi_nor *nor,
>> +				const struct flash_info *info)
>> +{
>> +	struct mtd_info *mtd = &nor->mtd;
>> +
>> +#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>> +	/* prefer "small sector" erase if possible */
>> +	if (info->flags & SECT_4K) {
>> +		nor->erase_opcode = SPINOR_OP_BE_4K;
>> +		mtd->erasesize = 4096;
>> +	} else if (info->flags & SECT_4K_PMC) {
>> +		nor->erase_opcode = SPINOR_OP_BE_4K_PMC;
>> +		mtd->erasesize = 4096;
>> +	} else
>> +#endif
>> +	{
>> +		nor->erase_opcode = SPINOR_OP_SE;
>> +		mtd->erasesize = info->sector_size;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
>> +			 const struct spi_nor_flash_parameter *params,
>> +			 const struct spi_nor_hwcaps *hwcaps)
>> +{
>> +	u32 ignored_mask, shared_mask;
>> +	bool enable_quad_io;
>> +	int err;
>> +
>> +	/*
>> +	 * Keep only the hardware capabilities supported by both the SPI
>> +	 * controller and the SPI flash memory.
>> +	 */
>> +	shared_mask = hwcaps->mask & params->hwcaps.mask;
>> +
>> +	/* SPI protocol classes N-N-N are not supported yet. */
>> +	ignored_mask = (SNOR_HWCAPS_READ_2_2_2 |
>> +			SNOR_HWCAPS_READ_4_4_4 |
>> +			SNOR_HWCAPS_READ_8_8_8 |
>> +			SNOR_HWCAPS_PP_4_4_4 |
>> +			SNOR_HWCAPS_PP_8_8_8);
>> +	if (shared_mask & ignored_mask) {
>> +		dev_dbg(nor->dev,
>> +			"SPI protocol classes N-N-N are not supported yet.\n");
>> +		shared_mask &= ~ignored_mask;
>> +	}
>> +
>> +	/* Select the (Fast) Read command. */
>> +	err = spi_nor_select_read(nor, params, shared_mask);
>> +	if (err) {
>> +		dev_err(nor->dev, "invalid (fast) read\n");
> 
> What does this information tell me, as an end user ? If I see this error
> message, what sort of conclusion can I derive from it ? I have
> no idea ...
>

I agree, this could be improved.


>> +		return err;
>> +	}
>> +
>> +	/* Select the Page Program command. */
>> +	err = spi_nor_select_pp(nor, params, shared_mask);
>> +	if (err) {
>> +		dev_err(nor->dev, "invalid page program\n");
>> +		return err;
>> +	}
>> +
>> +	/* Select the Sector Erase command. */
>> +	err = spi_nor_select_erase(nor, info);
>> +	if (err) {
>> +		dev_err(nor->dev, "invalid sector/block erase\n");
>> +		return err;
>> +	}
>> +
>> +	/* Enable Quad I/O if needed. */
>> +	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
>> +			  spi_nor_get_protocol_width(nor->write_proto) == 4);
> 
> What if read_proto != write_proto ? Also, this is awful code ... fix it.
>

As explained earlier about the QE bit and the Quad Enable Requirement,
this is indeed exactly what we want: we must set the QE bit, hence call
nor->flash_quad_enable() whenever any Quad SPI protocol is used for any
SPI flash command.

Currently Fast Read and Page Program are the only commands selected by
the spi-nor protocols, which can use one Quad SPI protocol.

So this code works whether of not (read_proto == write_proto).

>> +	if (enable_quad_io && params->quad_enable)
>> +		nor->flash_quad_enable = params->quad_enable;
>> +	else
>> +		nor->flash_quad_enable = NULL;
>> +
>> +	return 0;
>> +}
>> +
>> +int spi_nor_scan(struct spi_nor *nor, const char *name,
>> +		 const struct spi_nor_hwcaps *hwcaps)
>> +{
>> +	struct spi_nor_flash_parameter params;
>>  	const struct flash_info *info = NULL;
>>  	struct device *dev = nor->dev;
>>  	struct mtd_info *mtd = &nor->mtd;
>> @@ -1548,6 +1824,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>  	if (ret)
>>  		return ret;
>>  
>> +	/* Reset SPI protocol for all commands */
>> +	nor->reg_proto = SNOR_PROTO_1_1_1;
>> +	nor->read_proto = SNOR_PROTO_1_1_1;
>> +	nor->write_proto = SNOR_PROTO_1_1_1;
>> +
>>  	if (name)
>>  		info = spi_nor_match_id(name);
>>  	/* Try to auto-detect if chip name wasn't specified or not found */
> [...]
> 

Best regards,

Cyrille
