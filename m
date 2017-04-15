Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czPky-0001qQ-Ip
 for linux-mtd@lists.infradead.org; Sat, 15 Apr 2017 15:37:02 +0000
Received: by mail-wr0-x244.google.com with SMTP id u18so15601384wrc.1
 for <linux-mtd@lists.infradead.org>; Sat, 15 Apr 2017 08:36:40 -0700 (PDT)
Subject: Re: [RFC PATCH v5 6/6] mtd: spi-nor: parse SFDP 4-byte Address
 Instruction Table
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, jartur@cadence.com, kdasu.kdev@gmail.com,
 mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <a8ec3a70dc9c49ced1a1191a65c177048143e3c3.1490220411.git.cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <ec3fea03-1eb8-6ad9-bae7-20a81c6f9af9@gmail.com>
Date: Sat, 15 Apr 2017 17:36:37 +0200
MIME-Version: 1.0
In-Reply-To: <a8ec3a70dc9c49ced1a1191a65c177048143e3c3.1490220411.git.cyrille.pitchen@atmel.com>
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
> This patch adds supports for SFDP (JESD216B) 4-byte Address Instruction
> Table. This table is optional but when available, we parse it to get the
> 4-byte address op codes supported by the memory.
> Using these op codes is stateless as opposed to entering the 4-byte
> address mode or setting the Base Address Register (BAR).
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 166 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 165 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index ce8722055a9c..ea044efc4e6d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1899,6 +1899,7 @@ struct sfdp_parameter_header {
>  
>  
>  #define SFDP_BFPT_ID		0xff00u	/* Basic Flash Parameter Table */
> +#define SFDP_4BAIT_ID		0xff84u	/* 4-byte Address Instruction Table */
>  
>  #define SFDP_SIGNATURE		0x50444653u
>  #define SFDP_JESD216_MAJOR	1
> @@ -2241,6 +2242,149 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	return 0;
>  }
>  
> +struct sfdp_4bait {
> +	/* The hardware capability. */
> +	u32		hwcaps;
> +
> +	/*
> +	 * The <supported_bit> bit in DWORD1 of the 4BAIT tells us whether
> +	 * the associated 4-byte address op code is supported.
> +	 */
> +	u32		supported_bit;
> +};
> +
> +static int spi_nor_parse_4bait(struct spi_nor *nor,
> +			       const struct sfdp_parameter_header *param_header,
> +			       struct spi_nor_flash_parameter *params)
> +{
> +	static const struct sfdp_4bait reads[] = {
> +		{ SNOR_HWCAPS_READ,		BIT(0) },
> +		{ SNOR_HWCAPS_READ_FAST,	BIT(1) },
> +		{ SNOR_HWCAPS_READ_1_1_2,	BIT(2) },
> +		{ SNOR_HWCAPS_READ_1_2_2,	BIT(3) },
> +		{ SNOR_HWCAPS_READ_1_1_4,	BIT(4) },
> +		{ SNOR_HWCAPS_READ_1_4_4,	BIT(5) },
> +		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
> +		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
> +		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
> +	};
> +	static const struct sfdp_4bait programs[] = {
> +		{ SNOR_HWCAPS_PP,		BIT(6) },
> +		{ SNOR_HWCAPS_PP_1_1_4,		BIT(7) },
> +		{ SNOR_HWCAPS_PP_1_4_4,		BIT(8) },
> +	};
> +	static const struct sfdp_4bait erases[SNOR_CMD_ERASE_MAX] = {
> +		{ 0u /* not used */,		BIT(9) },
> +		{ 0u /* not used */,		BIT(10) },
> +		{ 0u /* not used */,		BIT(11) },
> +		{ 0u /* not used */,		BIT(12) },
> +	};
> +	u32 dwords[2], addr, discard_hwcaps, read_hwcaps, pp_hwcaps, erase_mask;
> +	struct spi_nor_erase_map *map = &nor->erase_map;
> +	int i, err;
> +
> +	if (param_header->major != SFDP_JESD216_MAJOR ||
> +	    param_header->length < ARRAY_SIZE(dwords))
> +		return -EINVAL;
> +
> +	/* Read the 4-byte Address Instruction Table. */
> +	addr = SFDP_PARAM_HEADER_PTP(param_header);
> +	err = spi_nor_read_sfdp(nor, addr, sizeof(dwords), dwords);
> +	if (err)
> +		return err;
> +
> +	/* Fix endianness of the 4BAIT DWORDs. */
> +	for (i = 0; i < ARRAY_SIZE(dwords); i++)
> +		dwords[i] = le32_to_cpu(dwords[i]);
> +
> +	/*
> +	 * Compute the subset of (Fast) Read commands for which the 4-byte
> +	 * version is supported.
> +	 */
> +	discard_hwcaps = 0;
> +	read_hwcaps = 0;
> +	for (i = 0; i < ARRAY_SIZE(reads); i++) {
> +		const struct sfdp_4bait *read = &reads[i];
> +
> +		discard_hwcaps |= read->hwcaps;
> +		if ((params->hwcaps.mask & read->hwcaps) &&
> +		    (dwords[0] & read->supported_bit))
> +			read_hwcaps |= read->hwcaps;
> +	}

Looks like there is a bit of repeated stuff here, maybe this can be
pulled out ?

> +	/*
> +	 * Compute the subset of Page Program commands for which the 4-byte
> +	 * version is supported.
> +	 */
> +	pp_hwcaps = 0;
> +	for (i = 0; i < ARRAY_SIZE(programs); i++) {
> +		const struct sfdp_4bait *program = &programs[i];
> +
> +		discard_hwcaps |= program->hwcaps;
> +		if ((params->hwcaps.mask & program->hwcaps) &&
> +		    (dwords[0] & program->supported_bit))
> +			pp_hwcaps |= program->hwcaps;
> +	}
> +
> +	/*
> +	 * Compute the subet of Sector Erase commands for which the 4-byte
> +	 * version is supported.
> +	 */
> +	erase_mask = 0;
> +	for (i = 0; i < SNOR_CMD_ERASE_MAX; i++) {
> +		const struct sfdp_4bait *erase = &erases[i];
> +
> +		if ((map->commands[i].size > 0) &&
> +		    (dwords[0] & erase->supported_bit))
> +			erase_mask |= BIT(i);
> +	}
> +
> +	/*
> +	 * We need at least one 4-byte op code per read, program and erase
> +	 * operation; the .read(), .write() and .erase() hooks share the
> +	 * nor->addr_width value.
> +	 */
> +	if (!read_hwcaps || !pp_hwcaps || !erase_mask)
> +		return 0;
> +
> +	/*
> +	 * Discard all operations from the 4-byte instruction set which are
> +	 * not supported by this memory.
> +	 */
> +	params->hwcaps.mask &= ~discard_hwcaps;
> +	params->hwcaps.mask |= (read_hwcaps | pp_hwcaps);
> +
> +	/* Use the 4-byte address instruction set. */
> +	for (i = 0; i < SNOR_CMD_READ_MAX; i++) {
> +		struct spi_nor_read_command *read_cmd = &params->reads[i];
> +
> +		read_cmd->opcode = spi_nor_convert_3to4_read(read_cmd->opcode);
> +	}
> +	for (i = 0; i < SNOR_CMD_PP_MAX; i++) {
> +		struct spi_nor_pp_command *pp_cmd = &params->page_programs[i];
> +
> +		pp_cmd->opcode = spi_nor_convert_3to4_program(pp_cmd->opcode);
> +	}
> +	for (i = 0; i < SNOR_CMD_ERASE_MAX; i++) {
> +		struct spi_nor_erase_command *erase_cmd = &map->commands[i];
> +
> +		if (erase_mask & BIT(i))
> +			erase_cmd->opcode = (dwords[1] >> (i * 8)) & 0xFF;
> +		else
> +			spi_nor_set_erase_command(erase_cmd, 0u, 0xFF);
> +	}
> +
> +	/*
> +	 * We set nor->addr_width here to skip spi_nor_set_4byte_opcodes()
> +	 * later because this latest function implements a legacy quirk for
> +	 * the erase size of Spansion memory. However this quirk is no longer
> +	 * needed with new SFDP compliant memories.
> +	 */
> +	nor->addr_width = 4;
> +	nor->flags |= SNOR_F_4B_OPCODES;
> +	return 0;
> +}
> +
>  static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  			      struct spi_nor_flash_parameter *params)
>  {
> @@ -2308,6 +2452,23 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  	if (err)
>  		goto exit;
>  
> +	/* Parse other parameter headers. */
> +	for (i = 0; i < header.nph; i++) {
> +		param_header = &param_headers[i];
> +
> +		switch (SFDP_PARAM_HEADER_ID(param_header)) {
> +		case SFDP_4BAIT_ID:
> +			err = spi_nor_parse_4bait(nor, param_header, params);
> +			break;
> +
> +		default:
> +			break;
> +		}
> +
> +		if (err)
> +			goto exit;
> +	}
> +
>  exit:
>  	kfree(param_headers);
>  	return err;
> @@ -2885,7 +3046,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (ret)
>  		return ret;
>  
> -	if (info->addr_width)
> +	if (nor->addr_width)
> +		/* already configured by spi_nor_setup() */
> +		;

I think you can drop this part.

> +	else if (info->addr_width)
>  		nor->addr_width = info->addr_width;
>  	else if (mtd->size > 0x1000000) {
>  		/* enable 4-byte addressing if the device exceeds 16MiB */
> 


-- 
Best regards,
Marek Vasut
