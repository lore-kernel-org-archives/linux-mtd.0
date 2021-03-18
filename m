Return-Path: <SRS0=Kfvc=IQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29E8C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 06:51:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4B7164EE2
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 06:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4B7164EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V/lRq7hVjTbMnyOS2eE+E5QkGm/kd0Nz8qD9iK71evw=; b=oEPCmkczVWjEVFCjdUBx/eTGT
	u+s+La38hDfYUx6eREfAitDkVIR4yLkGbYdx6lqRVCjFX24b1aVnIiOFLJyPeG3Ly5z00E1uYMUZG
	qpHwuzRoDR4w1NA5fsXe+rQ6HpEbHE0upVKgrUmsVEqxZIzzs6ComzKMaQRfPpmxPajVxjVQ7SZX5
	AMH5Mm4fA6kMt4G/gLvV1yHwAYVtwf931ZVxuzcaPzd8kmEbjo4YqYMVYv+PjihEr/zlfZnQCLveB
	WQ1F5XVO49pGRfP2pBfgiA7C0CFZmPPqacNh3FfCPee2/Pca7DAY1zAnbHqtEeThgKAdmXdT3v+Ch
	q4+Gg/sWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMmUM-004e6m-0C; Thu, 18 Mar 2021 06:50:34 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMmUF-004e6H-3Y
 for linux-mtd@lists.infradead.org; Thu, 18 Mar 2021 06:50:29 +0000
Received: by mail-pg1-x52e.google.com with SMTP id l1so819141pgb.5
 for <linux-mtd@lists.infradead.org>; Wed, 17 Mar 2021 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4yBTGRFtLS1xDksmUX6NeLzuZH1v3S/RJJMZutxlPqg=;
 b=N74tYN4E5g3IOhcP+K5qr5/Np5IINYv+Ww31Nb9Iz0dbToWC86a7Z9RSqW8RId9Qax
 rSYTWKcliG2lXOAyT67b6jbkqTHtphxQkFCLldyvOpQEZAuYUZ5kyOKy5udqH7FaJaUJ
 831a7fUJSiQymgLJgaHufvH1MX5U8V1uth44TBq2yFJbAz1OG3pq58hjFt268JaQko5+
 6vIMdwOtdh0OYr4G+edjy1wT9hWRGqtR8ylR0YBEFe+p6VarEZnllZ/kj/oAhiiG7LgM
 b8DkZTrk27Oo832KUQXaIdY9LlyeyoGfJKBrbtsIPiIDhLfpgGNC4tBUqce9n5PKx4Vp
 Ar0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4yBTGRFtLS1xDksmUX6NeLzuZH1v3S/RJJMZutxlPqg=;
 b=Jz44gxywjsI4DLeguGzIHNCaD0C0fihYcuG4t4XLvNJw3SflF+bWOolx7FinrjcHFv
 p8wk+xdaRgwApL8Iw/cpEmIbX0ZvK9bRNNpIh1CnGs53k8pNL4culyVgJ1eN31oyhp8m
 VDkW75wflNMl8CbFsA7AXVdmd9BD83zdv17YT35OiHMF3ouv6mi2Cz7Ymwm9RnhEOQhl
 tE40tmIy78qxtjIyV9YGiMglGkhe6feRmZ4MzheOe13qH6ojagXTTWLaHQIXSlr+QAf7
 F8zg7lctNlC7kHeI0JFx4yX6WKdyNRgqp7HJqVrTMSJZFmpCOgrT1tkoLVZspcybKRQW
 OoyQ==
X-Gm-Message-State: AOAM532ThTftg9Zw2cLqLEYMHAqSgCiEmLH/aDtu4ZtSJ3tlFpiuc5Do
 w5qfPeko4Hh/8vQzo82jjpI=
X-Google-Smtp-Source: ABdhPJw4x/5lRBtrxoByzNJhATWuHGZj/ZIyjtmoOAgIQJJTEwpHM416gk36hOsw8tF79P5CnmLOWw==
X-Received: by 2002:a63:4c55:: with SMTP id m21mr5719136pgl.29.1616050225469; 
 Wed, 17 Mar 2021 23:50:25 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id f2sm1046096pju.46.2021.03.17.23.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 23:50:25 -0700 (PDT)
Subject: Re: [PATCH v3 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
 <b971b6a9378260368b287d64092ec75edc9eb9bb.1615523176.git.Takahiro.Kuwano@infineon.com>
 <20210315121522.54lugjwoc72vpsqp@ti.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <f212a580-aa41-0313-7fae-43dbefe57229@gmail.com>
Date: Thu, 18 Mar 2021 15:50:22 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315121522.54lugjwoc72vpsqp@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_065027_419234_747835CA 
X-CRM114-Status: GOOD (  34.64  )
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

Hi Pratyush,

I will fix the typo and merge the comment blocks.

On 3/15/2021 9:15 PM, Pratyush Yadav wrote:
> On 12/03/21 06:45PM, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
>>
>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>> uniform sector sizes are supported. For the multi-die package parts (2Gb),
>> only uniform sector sizes is supprted. This is due to missing or incorrect
>> entries in SMPT. Fixup for other sector sizes configurations will be
>> followed up as needed.
>>
>> Tested on Xilinx Zynq-7000 FPGA board.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>> Changes in v3:
>>   - Remove S25HL256T and S25HS256T
>>   - Add S25HL02GT and S25HS02GT 
>>   - Add support for multi-die package parts support
>>   - Remove erase_map fix for top/split sector layout
>>   - Set ECC data unit size (16B) to writesize 
>>
>>  drivers/mtd/spi-nor/spansion.c | 119 +++++++++++++++++++++++++++++++++
>>  1 file changed, 119 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 5742212fde2e..05a4ea00acfc 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -225,6 +225,107 @@ static int spansion_mdp_ready(struct spi_nor *nor, u8 reg_dummy, u32 die_size)
>>  	return 1;
>>  }
>>  
>> +static int s25hx_t_quad_enable(struct spi_nor *nor)
>> +{
>> +	return spansion_quad_enable_volatile(nor, 0, SZ_128M);
>> +}
>> +
>> +static int s25hx_t_mdp_ready(struct spi_nor *nor)
>> +{
>> +	return spansion_mdp_ready(nor, 0, SZ_128M);
>> +}
>> +
>> +static int
>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>> +			 const struct sfdp_parameter_header *bfpt_header,
>> +			 const struct sfdp_bfpt *bfpt,
>> +			 struct spi_nor_flash_parameter *params)
>> +{
>> +	int ret;
>> +	u32 addr;
>> +	u8 cfr3v;
>> +
>> +	ret = spi_nor_set_4byte_addr_mode(nor, true);
>> +	if (ret)
>> +		return ret;
>> +	nor->addr_width = 4;
>> +
>> +	/* Replace Quad Enable with volatile version */
>> +	params->quad_enable = s25hx_t_quad_enable;
>> +
>> +	/*
>> +	 * The page_size is set to 512B from BFPT, but it actually depends on
>> +	 * the configuration register. Look up the CFR3V and determine the
>> +	 * page_size. For multi-die package parts, use 512B only when the all
>> +	 * dies are configured to 512B buffer.
>> +	 */
>> +	for (addr = 0; addr < params->size; addr += SZ_128M) {
>> +		ret = spansion_read_any_reg(nor,
>> +					    addr + SPINOR_REG_CYPRESS_CFR3V, 0,
>> +					    &cfr3v);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (!(cfr3v & SPINOR_REG_CYPRESS_CFR3V_PGSZ)) {
>> +			params->page_size = 256;
>> +			return 0;
>> +		}
>> +	}
>> +	params->page_size = 512;
>> +
>> +	return 0;
>> +}
>> +
>> +void s25hx_t_post_sfdp_fixups(struct spi_nor *nor)
>> +{
>> +	/*
>> +	 * For the signle-die package parts (512Mb and 1Gb), bottom 4KB and
> 
> Typo. s/signle/single/
> 
>> +	 * uniform sector maps are correctly populated in the erase_map
>> +	 * structure. The table below shows all possible combinations of related
>> +	 * register bits and its availability in SMPT.
>> +	 *
>> +	 *   CFR3[3] | CFR1[6] | CFR1[2] | Sector Map | Available in SMPT?
>> +	 *  -------------------------------------------------------------------
>> +	 *      0    |    0    |    0    | Bottom     | YES
>> +	 *      0    |    0    |    1    | Top        | NO (decoded as Split)
>> +	 *      0    |    1    |    0    | Split      | NO
>> +	 *      0    |    1    |    1    | Split      | NO (decoded as Top)
>> +	 *      1    |    0    |    0    | Uniform    | YES
>> +	 *      1    |    0    |    1    | Uniform    | NO
>> +	 *      1    |    1    |    0    | Uniform    | NO
>> +	 *      1    |    1    |    1    | Uniform    | NO
>> +	 *  -------------------------------------------------------------------
> 
> Neat! This would be very helpful for anyone looking at this flash's SMPT 
> table in the future.
> 
>> +	 */
> 
> Nitpick: It would be good to merge this
> 
>> +
>> +	/* Fast Read 4B requires mode cycles */
>> +	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
>> +
>> +	/* The writesize should be ECC data unit size */
>> +	nor->params->writesize = 16;
>> +
>> +	/* Fixup for multi-die package parts */
>> +	if (nor->params->size > SZ_128M) {
>> +		/*
>> +		 * For the dual-die package parts (2Gb), SMPT parse fails due to
>> +		 * incorrect SMPT entries and the erase map is populated as 4K
>> +		 * uniform that does not supported the parts. So it needs to be
>> +		 * rolled back to 256K uniform that is the factory default of
>> +		 * multi-die package parts.
>> +		 */
> 
> ... and this comment. If the table can't fit due to indentation, at 
> least move it to above the "if" so it is at least somewhat close to 
> where the SMPT is actually being fixed up.
> 
>> +		spi_nor_init_uniform_erase_map(&nor->params->erase_map,
>> +					       BIT(SNOR_ERASE_TYPE_MAX - 1),
>> +					       nor->params->size);
>> +
>> +		/* Need to check status of each die via RDAR command */
>> +		nor->params->ready = s25hx_t_mdp_ready;
>> +	}
>> +}
>> +
>> +static struct spi_nor_fixups s25hx_t_fixups = {
>> +	.post_bfpt = s25hx_t_post_bfpt_fixups,
>> +	.post_sfdp = s25hx_t_post_sfdp_fixups
>> +};
>> +
>>  /**
>>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>>   * @nor:		pointer to a 'struct spi_nor'
>> @@ -475,6 +576,24 @@ static const struct flash_info spansion_parts[] = {
>>  	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
>>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>  			     SPI_NOR_4B_OPCODES) },
>> +	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256,
>> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
>> +	  .fixups = &s25hx_t_fixups },
>> +	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512,
>> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
>> +	  .fixups = &s25hx_t_fixups },
>> +	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 256 * 1024, 1024,
>> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
>> +	  .fixups = &s25hx_t_fixups },
>> +	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
>> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
>> +	  .fixups = &s25hx_t_fixups },
>> +	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
>> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
>> +	  .fixups = &s25hx_t_fixups },
>> +	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 256 * 1024, 1024,
>> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
>> +	  .fixups = &s25hx_t_fixups },
>>  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>>  			      SPI_NOR_NO_ERASE) },
>>  	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
> 
> Other than the comments above,
> 
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 

Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
