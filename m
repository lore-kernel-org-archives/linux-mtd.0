Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxKZd-0007uK-AP
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 21:40:43 +0000
Received: by mail-wr0-x243.google.com with SMTP id l28so2017431wre.0
 for <linux-mtd@lists.infradead.org>; Sun, 09 Apr 2017 14:40:20 -0700 (PDT)
Subject: Re: [PATCH v5 1/6] mtd: spi-nor: introduce more SPI protocols and the
 Dual Transfer Mode
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 jartur@cadence.com, kdasu.kdev@gmail.com, mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <65619c23078469af03e4d53d781a8cffa92d5a61.1490220411.git.cyrille.pitchen@atmel.com>
 <df606e17-4819-d605-8f76-260ab49628af@gmail.com>
 <3a309f90-99b0-a634-0aee-8098d5da0556@wedev4u.fr>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <2dae63f3-a467-7433-167a-d866702376a8@gmail.com>
Date: Sun, 9 Apr 2017 23:40:14 +0200
MIME-Version: 1.0
In-Reply-To: <3a309f90-99b0-a634-0aee-8098d5da0556@wedev4u.fr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/09/2017 11:16 PM, Cyrille Pitchen wrote:
> Hi Marek,

Hi,

> thanks for the review.

[...]

>>> +struct spi_nor_flash_parameter {
>>> +	u64				size;
>>> +	u32				page_size;
>>> +
>>> +	struct spi_nor_hwcaps		hwcaps;
>>> +	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
>>> +	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
>>> +
>>> +	int (*quad_enable)(struct spi_nor *nor);
>>
>> This callback should be added by a separate patch, there's WAY too much
>> crap in this patch.
>>
> 
> The manufacturer/flash specific quad_enable() handler sets the Quad
> Enable (QE) bit in some internal status register of the SPI flash.
> The QE bit may not exist for some manufacturers (actually only Micron
> AFAIK) but when it does, we must set this bit before sending any flash
> command using any Quad SPI protocol.

How does that matter for Dual Transfer Mode ? It doesn't , so it can be
split away from this patch .

> So my point is that the use of the quad_enable() handler is tightly
> bound up with the possibility to use more (Quad) SPI protocols, which is
> the purpose of this patch.

Which this patch does NOT enable ...

> From the JESD216B (SFDP) specification, the Quad Enable Requirement
> (QER) is part of the Basic Flash Parameter Table (BFPT). QER describes
> the procedure to set the QE bit. So this notion is translated into the
> quad_enable() handler being a member of the 'struct
> spi_nor_flash_parameter'.
> 
> The 'struct spi_nor_flash_parameter' is initialized in
> spi_nor_init_params(). This includes the (Fast) Read and Page Programs
> settings, which are also provided by the BFPT, as well as the choice of
> the right quad_enable() handler.
> Then spi_nor_setup() selects the right settings and calls the
> quad_enable() handler, if needed: that is to say if any Quad SPI
> protocol was selected for Fast Read or Page Program operation.
> 
> Then if you don't mind, I'd rather keep the quad_enable() handler within
> this patch. IMHO, it makes more sense.

[...]

>>> +	if (info->flags & SPI_NOR_QUAD_READ) {
>>> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
>>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
>>> +					  0, 8, SPINOR_OP_READ_1_1_4,
>>> +					  SNOR_PROTO_1_1_4);
>>> +	}
>>> +
>>> +	/* Page Program settings. */
>>> +	params->hwcaps.mask |= SNOR_HWCAPS_PP;
>>> +	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
>>> +				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
>>> +
>>> +	/* Select the procedure to set the Quad Enable bit. */
>>> +	if (params->hwcaps.mask & (SNOR_HWCAPS_READ_QUAD |
>>> +				   SNOR_HWCAPS_PP_QUAD)) {
>>> +		switch (JEDEC_MFR(info)) {
>>> +		case SNOR_MFR_MACRONIX:
>>> +			params->quad_enable = macronix_quad_enable;
>>> +			break;
>>> +
>>> +		case SNOR_MFR_MICRON:
>>> +			break;
>>> +
>>> +		default:
>>
>> Are you sure this is a good idea ?
> 
> This is exactly what was done before this patch. Please have a look at
> the former set_quad_mode() function.
> 
> Is it a good idea to choose spansion_quad_enable() also for default
> case? I agree with you, it is not.

Then why don't we fix that first ?

> However this patch should be seen as a base for further patches fixing
> step by step the many pending known issues. Currently, I'm focusing on a
> smooth transition in changing the 3rd argument of spi_nor_scan().
> Everything is expected to work just as before.

OK

> About the quad_enable() handler to be chosen for Spansion and other
> manufacturer SPI flash memories:
> Even when regarding Spansion memories only, the procedure to set the QE
> bit has evolved based on whether or not the memory part supports the op
> code to read the Control Register 1 / Status Register 2.
> 
> If supported, a new procedure is described in the JESD216B
> specification. The new procedure is more efficient and reliable than the
> old one, ie spansion_quad_enable().
> 
> This issue is fixed by patch 5 of this series.
> 
> 
>>
>>> +			params->quad_enable = spansion_quad_enable;
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int spi_nor_hwcaps2cmd(u32 hwcaps)
>>
>> const u32 hwcaps ...
>>
>>>  {
>>> +	switch (hwcaps) {
>>> +	case SNOR_HWCAPS_READ:			return SNOR_CMD_READ;
>>
>> You can do this as a table lookup or array indexing and it would be
>> checkpatch clean.
>>
> 
> This patch has already passed the checkpatch test.

This is weird, I wouldn't have expected this to be acceptable syntax.

>>> +	case SNOR_HWCAPS_READ_FAST:		return SNOR_CMD_READ_FAST;
>>> +	case SNOR_HWCAPS_READ_1_1_1_DTR:	return SNOR_CMD_READ_1_1_1_DTR;
>>> +	case SNOR_HWCAPS_READ_1_1_2:		return SNOR_CMD_READ_1_1_2;
>>> +	case SNOR_HWCAPS_READ_1_2_2:		return SNOR_CMD_READ_1_2_2;
>>> +	case SNOR_HWCAPS_READ_2_2_2:		return SNOR_CMD_READ_2_2_2;
>>> +	case SNOR_HWCAPS_READ_1_2_2_DTR:	return SNOR_CMD_READ_1_2_2_DTR;
>>> +	case SNOR_HWCAPS_READ_1_1_4:		return SNOR_CMD_READ_1_1_4;
>>> +	case SNOR_HWCAPS_READ_1_4_4:		return SNOR_CMD_READ_1_4_4;
>>> +	case SNOR_HWCAPS_READ_4_4_4:		return SNOR_CMD_READ_4_4_4;
>>> +	case SNOR_HWCAPS_READ_1_4_4_DTR:	return SNOR_CMD_READ_1_4_4_DTR;
>>> +	case SNOR_HWCAPS_READ_1_1_8:		return SNOR_CMD_READ_1_1_8;
>>> +	case SNOR_HWCAPS_READ_1_8_8:		return SNOR_CMD_READ_1_8_8;
>>> +	case SNOR_HWCAPS_READ_8_8_8:		return SNOR_CMD_READ_8_8_8;
>>> +	case SNOR_HWCAPS_READ_1_8_8_DTR:	return SNOR_CMD_READ_1_8_8_DTR;
>>> +
>>> +	case SNOR_HWCAPS_PP:			return SNOR_CMD_PP;
>>> +	case SNOR_HWCAPS_PP_1_1_4:		return SNOR_CMD_PP_1_1_4;
>>> +	case SNOR_HWCAPS_PP_1_4_4:		return SNOR_CMD_PP_1_4_4;
>>> +	case SNOR_HWCAPS_PP_4_4_4:		return SNOR_CMD_PP_4_4_4;
>>> +	case SNOR_HWCAPS_PP_1_1_8:		return SNOR_CMD_PP_1_1_8;
>>> +	case SNOR_HWCAPS_PP_1_8_8:		return SNOR_CMD_PP_1_8_8;
>>> +	case SNOR_HWCAPS_PP_8_8_8:		return SNOR_CMD_PP_8_8_8;
>>> +	}
>>> +
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int spi_nor_select_read(struct spi_nor *nor,
>>> +			       const struct spi_nor_flash_parameter *params,
>>> +			       u32 shared_hwcaps)
>>> +{
>>> +	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;
>>> +	const struct spi_nor_read_command *read;
>>> +
>>> +	if (best_match < 0)
>>> +		return -EINVAL;
>>> +
>>> +	cmd = spi_nor_hwcaps2cmd(BIT(best_match));
>>
>> How does this work? Do we assume that hwcaps2cmd is always given a value
>> with 1-bit set ? That's quite wasteful IMO.
>>
> 
> SNOR_HWCAPS_READ* and SNOR_HWCAPS_PP* are all defined with the BIT()
> macro since they are used to set the bitmask describing the hardware
> capabilities supported by the SPI flash memory and controller.
> Each of them can support many SPI commands hence the use of a bitmask.
> 
> Then we compute the best match from the hardware capabilities shared by
> both the memory and controller. It means we always select a single bit
> from the shared_hwcaps bitmask. So to answer your question, indeed,
> hwcaps2cmd() is always given a value with a single bit set.

Something tells me you might run out of bits very soon here ...

>>> +	if (cmd < 0)
>>> +		return -EINVAL;

return cmd ; ... propagate the errors .

>>> +	read = &params->reads[cmd];
>>> +	nor->read_opcode = read->opcode;
>>> +	nor->read_proto = read->proto;
>>> +
>>> +	/*
>>> +	 * In the spi-nor framework, we don't need to make the difference
>>> +	 * between mode clock cycles and wait state clock cycles.
>>> +	 * Indeed, the value of the mode clock cycles is used by a QSPI
>>> +	 * flash memory to know whether it should enter or leave its 0-4-4
>>> +	 * (Continuous Read / XIP) mode.
>>
>> 0-4-4 ?
> 
> Some manufacturer datasheets name this mode the "Continuous Read" mode
> or the "eXecution In Place" mode but the JESD216B specification calls it
> the 0-4-4 mode, just to have a consistent naming with the 4-4-4 mode.

OK

> Once in 0-4-4 mode, the SPI flash memory expects later Fast Read
> commands to start directly from the address clocks cycles, skipping the
> instruction clock cycles, hence the leading 0.
> 
> The value of the mode cycles, between the address and wait state cycles,
> in the Fast Read x-4-4 command tells the SPI flash memory whether is the
> next SPI flash command will be a Fast Read 0-4-4 command or any other
> command with instruction clock cycles.
> 
> It is common to split SPI flash commands into 3 parts:
> instruction | (address;mode;wait states) | data
> 
> So 0-4-4 means:
> - no instruction clock cycles
> - 4 I/O lines being used during address;mode;wait states clock cycles
> - 4 I/O lines being used during data clock cycles
> 
> 
>>
>>> +	 * eXecution In Place is out of the scope of the mtd sub-system.
>>> +	 * Hence we choose to merge both mode and wait state clock cycles
>>> +	 * into the so called dummy clock cycles.
>>> +	 */
>>> +	nor->read_dummy = read->num_mode_clocks + read->num_wait_states;
>>> +	return 0;
>>> +}
>>> +
>>> +static int spi_nor_select_pp(struct spi_nor *nor,
>>> +			     const struct spi_nor_flash_parameter *params,
>>> +			     u32 shared_hwcaps)
>>> +{
>>> +	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_PP_MASK) - 1;
>>> +	const struct spi_nor_pp_command *pp;
>>> +
>>> +	if (best_match < 0)
>>> +		return -EINVAL;
>>> +
>>> +	cmd = spi_nor_hwcaps2cmd(BIT(best_match));
>>> +	if (cmd < 0)
>>> +		return -EINVAL;
>>> +
>>> +	pp = &params->page_programs[cmd];
>>> +	nor->program_opcode = pp->opcode;
>>> +	nor->write_proto = pp->proto;
>>> +	return 0;
>>> +}
>>> +
>>> +static int spi_nor_select_erase(struct spi_nor *nor,
>>> +				const struct flash_info *info)
>>> +{
>>> +	struct mtd_info *mtd = &nor->mtd;
>>> +
>>> +#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>>> +	/* prefer "small sector" erase if possible */
>>> +	if (info->flags & SECT_4K) {
>>> +		nor->erase_opcode = SPINOR_OP_BE_4K;
>>> +		mtd->erasesize = 4096;
>>> +	} else if (info->flags & SECT_4K_PMC) {
>>> +		nor->erase_opcode = SPINOR_OP_BE_4K_PMC;
>>> +		mtd->erasesize = 4096;
>>> +	} else
>>> +#endif
>>> +	{
>>> +		nor->erase_opcode = SPINOR_OP_SE;
>>> +		mtd->erasesize = info->sector_size;
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>> +static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
>>> +			 const struct spi_nor_flash_parameter *params,
>>> +			 const struct spi_nor_hwcaps *hwcaps)
>>> +{
>>> +	u32 ignored_mask, shared_mask;
>>> +	bool enable_quad_io;
>>> +	int err;
>>> +
>>> +	/*
>>> +	 * Keep only the hardware capabilities supported by both the SPI
>>> +	 * controller and the SPI flash memory.
>>> +	 */
>>> +	shared_mask = hwcaps->mask & params->hwcaps.mask;
>>> +
>>> +	/* SPI protocol classes N-N-N are not supported yet. */
>>> +	ignored_mask = (SNOR_HWCAPS_READ_2_2_2 |
>>> +			SNOR_HWCAPS_READ_4_4_4 |
>>> +			SNOR_HWCAPS_READ_8_8_8 |
>>> +			SNOR_HWCAPS_PP_4_4_4 |
>>> +			SNOR_HWCAPS_PP_8_8_8);
>>> +	if (shared_mask & ignored_mask) {
>>> +		dev_dbg(nor->dev,
>>> +			"SPI protocol classes N-N-N are not supported yet.\n");
>>> +		shared_mask &= ~ignored_mask;
>>> +	}
>>> +
>>> +	/* Select the (Fast) Read command. */
>>> +	err = spi_nor_select_read(nor, params, shared_mask);
>>> +	if (err) {
>>> +		dev_err(nor->dev, "invalid (fast) read\n");
>>
>> What does this information tell me, as an end user ? If I see this error
>> message, what sort of conclusion can I derive from it ? I have
>> no idea ...
>>
> 
> I agree, this could be improved.

Please do.

>>> +		return err;
>>> +	}
>>> +
>>> +	/* Select the Page Program command. */
>>> +	err = spi_nor_select_pp(nor, params, shared_mask);
>>> +	if (err) {
>>> +		dev_err(nor->dev, "invalid page program\n");
>>> +		return err;
>>> +	}
>>> +
>>> +	/* Select the Sector Erase command. */
>>> +	err = spi_nor_select_erase(nor, info);
>>> +	if (err) {
>>> +		dev_err(nor->dev, "invalid sector/block erase\n");
>>> +		return err;
>>> +	}
>>> +
>>> +	/* Enable Quad I/O if needed. */
>>> +	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
>>> +			  spi_nor_get_protocol_width(nor->write_proto) == 4);
>>
>> What if read_proto != write_proto ? Also, this is awful code ... fix it.
>>
> 
> As explained earlier about the QE bit and the Quad Enable Requirement,
> this is indeed exactly what we want: we must set the QE bit, hence call
> nor->flash_quad_enable() whenever any Quad SPI protocol is used for any
> SPI flash command.
> 
> Currently Fast Read and Page Program are the only commands selected by
> the spi-nor protocols, which can use one Quad SPI protocol.
> 
> So this code works whether of not (read_proto == write_proto).

OK, then this should also be a separate patch .

>>> +	if (enable_quad_io && params->quad_enable)
>>> +		nor->flash_quad_enable = params->quad_enable;
>>> +	else
>>> +		nor->flash_quad_enable = NULL;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +int spi_nor_scan(struct spi_nor *nor, const char *name,
>>> +		 const struct spi_nor_hwcaps *hwcaps)
>>> +{
>>> +	struct spi_nor_flash_parameter params;
>>>  	const struct flash_info *info = NULL;
>>>  	struct device *dev = nor->dev;
>>>  	struct mtd_info *mtd = &nor->mtd;
>>> @@ -1548,6 +1824,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> +	/* Reset SPI protocol for all commands */
>>> +	nor->reg_proto = SNOR_PROTO_1_1_1;
>>> +	nor->read_proto = SNOR_PROTO_1_1_1;
>>> +	nor->write_proto = SNOR_PROTO_1_1_1;
>>> +
>>>  	if (name)
>>>  		info = spi_nor_match_id(name);
>>>  	/* Try to auto-detect if chip name wasn't specified or not found */
>> [...]
>>
> 
> Best regards,
> 
> Cyrille
> 


-- 
Best regards,
Marek Vasut
