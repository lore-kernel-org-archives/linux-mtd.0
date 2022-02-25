Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AA8C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 07:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNa6Prtkrk7E39mwpnbhwVlbqpkO2/+ZwVrBOJhVjRE=; b=3wJqNAnZvOtsxv
	kjtsP7C0OjgYDdK28sLl9igF5E4DcEHTUhn4ii0AlaN+uMwie7UCyMbObMYZT8X9V5J9y01u0vCxJ
	MkzRFKX4SrSuHwMPWCPKIh2EsfwJvtj98OM4ZDIhvVz5aVbu/FIOZ6EbfCMwOStT82Ay4EHhU6qiR
	NaXTgRACDGAX6MzJptd2QA2/P3Tx2eDmu9inGyMVLc4XVwyZtTWsBEBu7YYbOd675Bf9Y6YWPLlSF
	swWTTQf+IWls/ZSkut+wXFw/T7eeW7ur/2I018OHXwuY3vpibw+dxPZIrM/gs1NfM3MrMh97vnAVG
	QteG6BqwhvSteIAyg0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNV0I-003ab6-8K; Fri, 25 Feb 2022 07:27:02 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNV0F-003aaX-8d
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 07:27:01 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21P7QreW083035;
 Fri, 25 Feb 2022 01:26:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645774013;
 bh=xTPF11q/RGmArlu4lJrpXS+iTyOKoQpFvGZJ8fK6U2o=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=cx0NoTJvE4pcNAHFk+NcFA6aCL1Po5B4yyaw/DTtUaZnTSCJeDpln8mJbrEURh1/8
 /S3uZISRQenT0/B6ryJOARE0EeeJgHL7KnPZ4aoGDNMoXA8SnvK7nLt9q72cTDoN0A
 NSc2IqH+mFNQJUILnz4EoTQcYL9EI14ObaJawKhA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21P7QrlV122572
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Feb 2022 01:26:53 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 01:26:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 01:26:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21P7QqPi114909;
 Fri, 25 Feb 2022 01:26:52 -0600
Date: Fri, 25 Feb 2022 12:56:51 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v8 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Message-ID: <20220225072651.td7qvbzpwzoa3nf5@ti.com>
References: <cover.1645426789.git.Takahiro.Kuwano@infineon.com>
 <3a795886130b006d5d93591d1d08269f076cc3e4.1645426789.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a795886130b006d5d93591d1d08269f076cc3e4.1645426789.git.Takahiro.Kuwano@infineon.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_232659_418210_C85C94F2 
X-CRM114-Status: GOOD (  38.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 21/02/22 04:14PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
> 
> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
> uniform sector sizes are supported. This is due to missing or incorrect
> entries in SMPT. Fixup for other sector sizes configurations will be
> followed up as needed.
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v8:
>   - Call write_disable in error case only
>   - Use spi_nor_read_reg() helper
>   - Use nor->bouncebuf instead of variable on stack
>   - Update ID table to use FLAGS macro
>   
> Changes in v7:
>   - Add missing device info table in v6
>   
> Changes in v6:
>   - Remove 2Gb multi die pacakge support
> 
> Changes in v5:
>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
> 
> Changes in v4:
>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
> 
> Changes in v3:
>   - Remove S25HL256T and S25HS256T
>   - Add S25HL02GT and S25HS02GT 
>   - Add support for multi-die package parts support
>   - Remove erase_map fix for top/split sector layout
>   - Set ECC data unit size (16B) to writesize
> 
>  drivers/mtd/spi-nor/spansion.c | 103 +++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 5453b89a1c22..4511c0cfd090 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -166,6 +166,93 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
>  	return 0;
>  }
>  
> +static int s25hx_t_quad_enable(struct spi_nor *nor)
> +{
> +	int ret = spansion_quad_enable_volatile(nor, 0);
> +
> +	/* Reset WEL bit in any error cases */
> +	if (ret)
> +		spi_nor_write_disable(nor);
> +
> +	return ret;
> +}
> +
> +static int
> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
> +			 const struct sfdp_parameter_header *bfpt_header,
> +			 const struct sfdp_bfpt *bfpt)
> +{
> +	struct spi_mem_op op;
> +	int ret;
> +
> +	ret = spi_nor_set_4byte_addr_mode(nor, true);
> +	if (ret)
> +		return ret;
> +	nor->addr_width = 4;

Why do you enable 4 byte address mode here? Why not set 
nor->params->set_4byte_addr_mode and let spi_nor_init() do it?

> +
> +	/* Replace Quad Enable with volatile version */
> +	nor->params->quad_enable = s25hx_t_quad_enable;
> +
> +	/*
> +	 * From BFPT, the page_size is set to 512B(s25hs512t) or 256B(others),
> +	 * but it actually depends on the configuration register. Look up the
> +	 * CFR3V and determine the page_size.
> +	 */
> +	op = (struct spi_mem_op)
> +		SPI_NOR_SPANSION_RD_ANY_REG_OP(nor->addr_width,
> +					       SPINOR_REG_CYPRESS_CFR3V, 0, 1,
> +					       nor->bouncebuf);
> +	ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
> +		nor->params->page_size = 512;
> +	else
> +		nor->params->page_size = 256;

Ok.

> +
> +	return 0;
> +}
> +
> +/**
> + * s25hx_t_post_sfdp_fixups() - post SFDP fixups for S25HL-T and S25HS-T
> + * @nor:	pointer to a 'struct spi_nor'
> + *
> + * For the single-die package parts (512Mb and 1Gb), only bottom and uniform
> + * sector maps are correctly populated in the erase_map structure. This is due
> + * to missing or incorrect entries in SMPT. The table below shows all possible
> + * combinations of related register bits and its availability in SMPT. Since
> + * bottom (factorly default) and uniform are commonly used, we don't fix the
> + * erase_map for top and split.
> + *
> + *   CFR3[3] | CFR1[6] | CFR1[2] | Sector Map | Available in SMPT?
> + *  -------------------------------------------------------------------
> + *      0    |    0    |    0    | Bottom     | YES
> + *      0    |    0    |    1    | Top        | NO (decoded as Split)
> + *      0    |    1    |    0    | Split      | NO
> + *      0    |    1    |    1    | Split      | NO (decoded as Top)
> + *      1    |    0    |    0    | Uniform    | YES
> + *      1    |    0    |    1    | Uniform    | NO
> + *      1    |    1    |    0    | Uniform    | NO
> + *      1    |    1    |    1    | Uniform    | NO
> + *  -------------------------------------------------------------------
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +void s25hx_t_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	/* Fast Read 4B requires mode cycles but SFDP does not advertise it */

SFDP does not advertise it as in SFDP table has an entry for this but 
the flash does not populate it correctly? Or does the SFDP table itself 
not supposed to have this information?

This hook should only be used for correcting SFDP information. For 
information that is not defined via SFDP, please use the late_init() 
hook.

> +	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
> +
> +	/* The writesize should be ECC data unit size */
> +	nor->params->writesize = 16;

Same.

> +}
> +
> +static struct spi_nor_fixups s25hx_t_fixups = {
> +	.post_bfpt = s25hx_t_post_bfpt_fixups,
> +	.post_sfdp = s25hx_t_post_sfdp_fixups
> +};
> +
>  /**
>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:		pointer to a 'struct spi_nor'
> @@ -353,6 +440,22 @@ static const struct flash_info spansion_parts[] = {
>  	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
> +		FLAGS(USE_CLSR)
> +		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)

This is the old way of specifying flags. We changed this recently [0]. 
Please use just PARSE_SFDP flag, and let SFDP parser discover these 
capabilities. Only use flags for capabilities that can't be discovered 
via SFDP.

Same for other flashes.

> +		.fixups = &s25hx_t_fixups },
> +	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
> +		FLAGS(USE_CLSR)
> +		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		.fixups = &s25hx_t_fixups },
> +	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
> +		FLAGS(USE_CLSR)
> +		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		.fixups = &s25hx_t_fixups },
> +	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
> +		FLAGS(USE_CLSR)
> +		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		.fixups = &s25hx_t_fixups },
>  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
>  		FLAGS(SPI_NOR_NO_ERASE) },
>  	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
> -- 
> 2.25.1
> 

[0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20211207140254.87681-7-tudor.ambarus@microchip.com/

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
