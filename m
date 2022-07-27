Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1453C04A68
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jul 2022 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u95H4FttaMbISGuX2Kh9QHWbYQ98mTlWZBmxSuC+rxY=; b=adv9WsV25+k0n1iNHtsVchJ060
	aAiTbcfPg/A5/Lb5a1Lm5uQSMYaT1Li2v/eLJGFejJpw7V89A/24tPLx6Omv3jHYkQjDjhDnXsvgw
	lh1ODpXJZXoYdvxtCFFA0gUi3SegNIo6/KmIE3YfkZR2oUqD+8DvuEcpEORPhGXLVRiYOdjSxpoLX
	n2OFOaNd6D0hpON1bv8K+y4CbtR6NWXd3DaIcfD1r+xgQ6oXEH1i0gA/QnQIrkdgtQ/Zp1z+1/s+S
	7Q9Est6ChKDMJdW2pyJLom06vDPZcwK0tfw/uk8JcZ4Yv2OxUMk09WzDtjoXiW1B0zlYvwluSi76D
	zMgI3g5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGf3O-00CrLN-VV; Wed, 27 Jul 2022 11:18:15 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGf3L-00CrJ7-U7
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2022 11:18:13 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 02C7022239;
	Wed, 27 Jul 2022 13:18:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658920690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/HSIr0gYz8b3Q+Ppc2K4JH8hO5FvWOLooAkHZ63FBbU=;
	b=MeG76BbbDiEiRtYOaw6SoBelnb4rwnzmUK1o8DBZjgyUWIopxj2ayR05TGPa/mPeT480U5
	+OuFvsX+1aHRbGbjSnBuK2sO+hAX0il2qTIrFDEuMyrzLhheD28Q85Ns32MhQuPUt8V40z
	4MTLMO6x8v+3+GaL/7bieySo7eJ0on4=
MIME-Version: 1.0
Date: Wed, 27 Jul 2022 13:18:09 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, tkuw584924@gmail.com, Takahiro.Kuwano@infineon.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com
Subject: Re: [PATCH v17 7/7] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
In-Reply-To: <20220725092505.446315-8-tudor.ambarus@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
 <20220725092505.446315-8-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <a79ffcc34f8da3f7439b0fb72fb93084@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_041812_324911_3464203C 
X-CRM114-Status: GOOD (  32.90  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-07-25 11:25, schrieb Tudor Ambarus:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
> 
> These Infineon chips support volatile version of configuration 
> registers
> and it is recommended to update volatile registers in the field 
> application
> due to a risk of the non-volatile registers corruption by power 
> interrupt.
> Add support for volatile QE bit.
> 
> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
> uniform sector sizes are supported. This is due to missing or incorrect
> entries in SMPT. Fixup for other sector sizes configurations will be
> followed up as needed.
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 132 +++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c 
> b/drivers/mtd/spi-nor/spansion.c
> index 60e41e1a9a92..0f5b9e81719f 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -14,6 +14,8 @@
>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
> +#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
>  #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
> @@ -113,6 +115,68 @@ static int cypress_nor_octal_dtr_dis(struct 
> spi_nor *nor)
>  	return 0;
>  }
> 
> +/**
> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in 
> volatile
> + *                                      register.
> + * @nor:	pointer to a 'struct spi_nor'
> + *
> + * It is recommended to update volatile registers in the field 
> application due
> + * to a risk of the non-volatile registers corruption by power 
> interrupt. This
> + * function sets Quad Enable bit in CFR1 volatile. If users set the 
> Quad Enable
> + * bit in the CFR1 non-volatile in advance (typically by a Flash 
> programmer
> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 
> volatile is
> + * also set during Flash power-up.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
> +{
> +	struct spi_mem_op op;
> +	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
> +	u8 cfr1v_written;
> +	int ret;
> +
> +	op = (struct spi_mem_op)
> +		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
> +					  SPINOR_REG_CYPRESS_CFR1V,
> +					  nor->bouncebuf);
> +
> +	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> +		return 0;
> +
> +	/* Update the Quad Enable bit. */
> +	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> +	op = (struct spi_mem_op)
> +		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
> +					  SPINOR_REG_CYPRESS_CFR1V, 1,
> +					  nor->bouncebuf);
> +	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	cfr1v_written = nor->bouncebuf[0];
> +
> +	/* Read back and check it. */
> +	op = (struct spi_mem_op)
> +		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
> +					  SPINOR_REG_CYPRESS_CFR1V,
> +					  nor->bouncebuf);
> +	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->bouncebuf[0] != cfr1v_written) {
> +		dev_err(nor->dev, "CFR1: Read back test failed\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * cypress_nor_set_page_size() - Set page size which corresponds to 
> the flash
>   *                               configuration.
> @@ -143,6 +207,58 @@ static int cypress_nor_set_page_size(struct 
> spi_nor *nor)
>  	return 0;
>  }
> 
> +static int
> +s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
> +			const struct sfdp_parameter_header *bfpt_header,
> +			const struct sfdp_bfpt *bfpt)
> +{
> +	/* Replace Quad Enable with volatile version */
> +	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
> +
> +	return cypress_nor_set_page_size(nor);
> +}
> +
> +static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
> +{
> +	struct spi_nor_erase_type *erase_type =
> +					nor->params->erase_map.erase_type;
> +	int i;
> +
> +	/*
> +	 * In some parts, 3byte erase opcodes are advertised by 4BAIT.
> +	 * Convert them to 4byte erase opcodes.
> +	 */
> +	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
> +		switch (erase_type[i].opcode) {
> +		case SPINOR_OP_SE:
> +			erase_type[i].opcode = SPINOR_OP_SE_4B;
> +			break;
> +		case SPINOR_OP_BE_4K:
> +			erase_type[i].opcode = SPINOR_OP_BE_4K_4B;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +}
> +
> +static void s25hx_t_late_init(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	/* Fast Read 4B requires mode cycles */
> +	params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
> +
> +	/* The writesize should be ECC data unit size */
> +	params->writesize = 16;
> +}
> +
> +static struct spi_nor_fixups s25hx_t_fixups = {
> +	.post_bfpt = s25hx_t_post_bfpt_fixup,
> +	.post_sfdp = s25hx_t_post_sfdp_fixup,
> +	.late_init = s25hx_t_late_init,
> +};
> +
>  /**
>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress 
> flashes.
>   * @nor:		pointer to a 'struct spi_nor'
> @@ -319,6 +435,22 @@ static const struct flash_info 
> spansion_nor_parts[] = {
>  	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)

I know I'm really late, but would this also work with
{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 0, 0)
		PARSE_SFDP

It seems the former patch will figure out the page size anyway.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
