Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E46C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 12:20:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B36C464DCE
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 12:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B36C464DCE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tFk9muiO0XIDciB5PIq8jmZCHCZVEMGu1W5XREsa8lM=; b=YsnnuVJsk0txTgQqbAhrBgxPH
	DU7Bf4JInwIdqoo6YDfrnueplEPi8vy+j4wbsaA1yNO0Rtdqbn8nlt0GG9qavc0Rw67IfVUdKe13i
	X2muE34HjxX4T2GOOjjzSjLuziOY3SvVQpkROsDb007O9Xl5mqCOqk44df8BHxe58a9ux8JjLyGlF
	z6LoTZ8AWCadxWnse+71MVsh2CCErSPxTf5Nn+dUuUKBhc1aIlM+ztKUoe2Xy4s1x3miIFH2+RJw5
	HdFPQItZp4n2d/cn/dzh9tNQ5Lgzkvck6zegHhBwqUgxG5iPbU26qiZ8GKOuibjUi4+2m7n5rn75y
	g8cpiauBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLmC1-00FqBx-Iv; Mon, 15 Mar 2021 12:19:29 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLm8D-00FotJ-KQ
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 12:15:39 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12FCFQOl106945;
 Mon, 15 Mar 2021 07:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615810526;
 bh=nAri7C+WJHie93/4q3ZMlBkDX+7m2l20Y1v4kAb6hKY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=dzKZyAbFZ6QOFNM8o0rLsVXjnZhmXqrjGvXKFaEFCTn+3O5tGK4TQXWTm5h4fmVt2
 bWNzL8IY+BBjS8frTMStgDFBLrew20B7NqKIEuOQU4B6Da87UyCA923nCQHe2+lgPi
 TUvdfPmdi/NjnAOkLrqEcSTn9hFpPIGELg89GpIk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12FCFQRE032099
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Mar 2021 07:15:26 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 07:15:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 07:15:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12FCFPor112141;
 Mon, 15 Mar 2021 07:15:25 -0500
Date: Mon, 15 Mar 2021 17:45:24 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Message-ID: <20210315121522.54lugjwoc72vpsqp@ti.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
 <b971b6a9378260368b287d64092ec75edc9eb9bb.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b971b6a9378260368b287d64092ec75edc9eb9bb.1615523176.git.Takahiro.Kuwano@infineon.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_121535_470699_A092234A 
X-CRM114-Status: GOOD (  37.11  )
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

On 12/03/21 06:45PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
> 
> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
> uniform sector sizes are supported. For the multi-die package parts (2Gb),
> only uniform sector sizes is supprted. This is due to missing or incorrect
> entries in SMPT. Fixup for other sector sizes configurations will be
> followed up as needed.
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v3:
>   - Remove S25HL256T and S25HS256T
>   - Add S25HL02GT and S25HS02GT 
>   - Add support for multi-die package parts support
>   - Remove erase_map fix for top/split sector layout
>   - Set ECC data unit size (16B) to writesize 
> 
>  drivers/mtd/spi-nor/spansion.c | 119 +++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 5742212fde2e..05a4ea00acfc 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -225,6 +225,107 @@ static int spansion_mdp_ready(struct spi_nor *nor, u8 reg_dummy, u32 die_size)
>  	return 1;
>  }
>  
> +static int s25hx_t_quad_enable(struct spi_nor *nor)
> +{
> +	return spansion_quad_enable_volatile(nor, 0, SZ_128M);
> +}
> +
> +static int s25hx_t_mdp_ready(struct spi_nor *nor)
> +{
> +	return spansion_mdp_ready(nor, 0, SZ_128M);
> +}
> +
> +static int
> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
> +			 const struct sfdp_parameter_header *bfpt_header,
> +			 const struct sfdp_bfpt *bfpt,
> +			 struct spi_nor_flash_parameter *params)
> +{
> +	int ret;
> +	u32 addr;
> +	u8 cfr3v;
> +
> +	ret = spi_nor_set_4byte_addr_mode(nor, true);
> +	if (ret)
> +		return ret;
> +	nor->addr_width = 4;
> +
> +	/* Replace Quad Enable with volatile version */
> +	params->quad_enable = s25hx_t_quad_enable;
> +
> +	/*
> +	 * The page_size is set to 512B from BFPT, but it actually depends on
> +	 * the configuration register. Look up the CFR3V and determine the
> +	 * page_size. For multi-die package parts, use 512B only when the all
> +	 * dies are configured to 512B buffer.
> +	 */
> +	for (addr = 0; addr < params->size; addr += SZ_128M) {
> +		ret = spansion_read_any_reg(nor,
> +					    addr + SPINOR_REG_CYPRESS_CFR3V, 0,
> +					    &cfr3v);
> +		if (ret)
> +			return ret;
> +
> +		if (!(cfr3v & SPINOR_REG_CYPRESS_CFR3V_PGSZ)) {
> +			params->page_size = 256;
> +			return 0;
> +		}
> +	}
> +	params->page_size = 512;
> +
> +	return 0;
> +}
> +
> +void s25hx_t_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	/*
> +	 * For the signle-die package parts (512Mb and 1Gb), bottom 4KB and

Typo. s/signle/single/

> +	 * uniform sector maps are correctly populated in the erase_map
> +	 * structure. The table below shows all possible combinations of related
> +	 * register bits and its availability in SMPT.
> +	 *
> +	 *   CFR3[3] | CFR1[6] | CFR1[2] | Sector Map | Available in SMPT?
> +	 *  -------------------------------------------------------------------
> +	 *      0    |    0    |    0    | Bottom     | YES
> +	 *      0    |    0    |    1    | Top        | NO (decoded as Split)
> +	 *      0    |    1    |    0    | Split      | NO
> +	 *      0    |    1    |    1    | Split      | NO (decoded as Top)
> +	 *      1    |    0    |    0    | Uniform    | YES
> +	 *      1    |    0    |    1    | Uniform    | NO
> +	 *      1    |    1    |    0    | Uniform    | NO
> +	 *      1    |    1    |    1    | Uniform    | NO
> +	 *  -------------------------------------------------------------------

Neat! This would be very helpful for anyone looking at this flash's SMPT 
table in the future.

> +	 */

Nitpick: It would be good to merge this

> +
> +	/* Fast Read 4B requires mode cycles */
> +	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
> +
> +	/* The writesize should be ECC data unit size */
> +	nor->params->writesize = 16;
> +
> +	/* Fixup for multi-die package parts */
> +	if (nor->params->size > SZ_128M) {
> +		/*
> +		 * For the dual-die package parts (2Gb), SMPT parse fails due to
> +		 * incorrect SMPT entries and the erase map is populated as 4K
> +		 * uniform that does not supported the parts. So it needs to be
> +		 * rolled back to 256K uniform that is the factory default of
> +		 * multi-die package parts.
> +		 */

... and this comment. If the table can't fit due to indentation, at 
least move it to above the "if" so it is at least somewhat close to 
where the SMPT is actually being fixed up.

> +		spi_nor_init_uniform_erase_map(&nor->params->erase_map,
> +					       BIT(SNOR_ERASE_TYPE_MAX - 1),
> +					       nor->params->size);
> +
> +		/* Need to check status of each die via RDAR command */
> +		nor->params->ready = s25hx_t_mdp_ready;
> +	}
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
> @@ -475,6 +576,24 @@ static const struct flash_info spansion_parts[] = {
>  	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			     SPI_NOR_4B_OPCODES) },
> +	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 256 * 1024, 1024,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 256 * 1024, 1024,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },
>  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>  			      SPI_NOR_NO_ERASE) },
>  	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,

Other than the comments above,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
