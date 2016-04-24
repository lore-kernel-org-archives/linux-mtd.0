Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auCG8-0006sX-Gv
 for linux-mtd@lists.infradead.org; Sun, 24 Apr 2016 05:07:05 +0000
Subject: Re: [PATCH RFC 4/8] mtd: spi-nor: fix support of Dual (x-y-2) and
 Quad (x-y-4) SPI protocols
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
References: <cover.1460567255.git.cyrille.pitchen@atmel.com>
 <abc2b9a65c6934226ee958a87664c91877224aff.1460567256.git.cyrille.pitchen@atmel.com>
CC: <marex@denx.de>, <boris.brezillon@free-electrons.com>,
 <nicolas.ferre@atmel.com>, <linux-kernel@vger.kernel.org>
From: "R, Vignesh" <vigneshr@ti.com>
Message-ID: <571C5454.5040006@ti.com>
Date: Sun, 24 Apr 2016 10:36:28 +0530
MIME-Version: 1.0
In-Reply-To: <abc2b9a65c6934226ee958a87664c91877224aff.1460567256.git.cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

On 4/13/2016 10:53 PM, Cyrille Pitchen wrote:
[...]

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
> +
> +	/* Setup read operation. */
> +	rd_midx = fls(params->rd_modes & rd_modes) - 1;
> +	if (spi_nor_midx2proto(rd_midx, &nor->read_proto)) {
> +		dev_err(nor->dev, "invalid (fast) read\n");
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

^^^ 'i' is undefined here.

> +		if (params->erase_types[i].size == 0x0c)
> +			erase_type = &params->erase_types[i];
> +#endif
> +	nor->erase_opcode = erase_type->opcode;
> +	nor->mtd.erasesize = (1 << erase_type->size);
> +
> +
> +	enable_quad_io = (SNOR_PROTO_DATA_FROM_PROTO(nor->read_proto) == 4 ||
> +			  SNOR_PROTO_DATA_FROM_PROTO(nor->write_proto) == 4);
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
> +
> +int spi_nor_scan(struct spi_nor *nor, const char *name,
> +		 struct spi_nor_modes *modes)
> +{
> +	const struct spi_nor_basic_flash_parameter *params = NULL;
>  	const struct flash_info *info = NULL;
>  	struct device *dev = nor->dev;
>  	struct mtd_info *mtd = &nor->mtd;
> @@ -1342,11 +1483,17 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  	if (ret)
>  		return ret;
>  
> +	/* Reset SPI protocol for all commands */
> +	nor->erase_proto = SNOR_PROTO_1_1_1;
> +	nor->read_proto = SNOR_PROTO_1_1_1;
> +	nor->write_proto = SNOR_PROTO_1_1_1;
> +	nor->reg_proto = SNOR_PROTO_1_1_1;
> +
>  	if (name)
>  		info = spi_nor_match_id(name);
>  	/* Try to auto-detect if chip name wasn't specified or not found */
>  	if (!info)
> -		info = spi_nor_read_id(nor);
> +		info = spi_nor_read_id(nor, NULL, 0);
>  	if (IS_ERR_OR_NULL(info))
>  		return -ENOENT;
>  
> @@ -1357,7 +1504,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  	if (name && info->id_len) {
>  		const struct flash_info *jinfo;
>  
> -		jinfo = spi_nor_read_id(nor);
> +		jinfo = spi_nor_read_id(nor, info->params, modes->id_modes);
>  		if (IS_ERR(jinfo)) {
>  			return PTR_ERR(jinfo);
>  		} else if (jinfo->id_len != info->id_len ||
> @@ -1374,6 +1521,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  			info = jinfo;
>  		}
>  	}
> +	params = info->params;
>  
>  	mutex_init(&nor->lock);
>  
> @@ -1451,51 +1599,42 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  	if (np) {
>  		/* If we were instantiated by DT, use it */
>  		if (of_property_read_bool(np, "m25p,fast-read"))
> -			nor->flash_read = SPI_NOR_FAST;
> +			modes->rd_modes |= SNOR_MODE_1_1_1;
>  		else
> -			nor->flash_read = SPI_NOR_NORMAL;
> +			modes->rd_modes &= ~SNOR_MODE_1_1_1;
>  	} else {
>  		/* If we weren't instantiated by DT, default to fast-read */
> -		nor->flash_read = SPI_NOR_FAST;
> +		modes->rd_modes |= SNOR_MODE_1_1_1;
>  	}
>  
>  	/* Some devices cannot do fast-read, no matter what DT tells us */
>  	if (info->flags & SPI_NOR_NO_FR)
> -		nor->flash_read = SPI_NOR_NORMAL;
> +		modes->rd_modes &= ~SNOR_MODE_1_1_1;
>  
> -	/* Quad/Dual-read mode takes precedence over fast/normal */
> -	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
> -		ret = set_quad_mode(nor, info);
> -		if (ret) {
> -			dev_err(dev, "quad mode not supported\n");

Now that the set_quad_mode() is removed, could you explain how spansion
flash enters SNOR_MODE_1_1_4 mode? Is it bootloader's responsibility to
flash's set quad enable bit?

Regards
Vignesh
