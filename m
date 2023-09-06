Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D878AEE14A1
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJwOWRnAia4XXcejklkyqirPvdpNREzMWGlPyNOCnhU=; b=XqIfscEdjM1Zvl
	bCT0D3KMYui3SNJ+AzI9x/wt09rNTSQ3lVlHuWBs0oxEmZsWaZg2sKAtikSBbLKdP4HhzXOmRWmN9
	h+nCsk04gpx2eWRnW1Q1oCrL9RZ3229mbjoOxwda6zF/pJPAL6L1d7dCas9ac2Zi2vsJ90czqII99
	PaLA4iLBC1sSLqIwGiGAE/9eDQHJ6W3MGrrxntks5EdUymHtLFTNYDkMLHZis06JYqWqDP6xF4/Cv
	wk9STtQa8AiVv4d65NiTZ8tXglrehhapeVRMiRQFwvOeBQTV9iKzt5mpw3CFajkmkFygd671ezNtX
	c9w2g1v6zFpioOESXF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdtw4-00AKjk-00;
	Wed, 06 Sep 2023 14:55:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdtvz-00AKhv-2M
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 14:55:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4013454fa93so36926235e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 07:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694012108; x=1694616908; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2Wn4ae4ktta97Pgw/pk1HevY2o9bgfbLOIPVEo+6uo=;
        b=nKFBSMiC5BqxQXau1ehnPBSmcyJFb666uQJt7w1qE2XOtp/1vEmDUuL+oYI81t3qIX
         f3gVJ00Pfmyi67ld23TmpVa6osQXzs2AAtjKQkJAPwKNreA9kRFmQJn4KnCuDn27Esa/
         teyVdxvnBIIf3NA/yPfT1RWMZjWgMcBFmoiUqb75ZNAUvNqEAvZqb2fVNivZHqel1Wqe
         j798jDhKW+C86/oF0TAs7gEwuCWL5eG8107IvI9fLLGR65KZ80Gfv0XZs3hSqmMKR5yC
         zEX2QUV3Whl94VxpLcTUjjC3pqERsnur8Je8yK/Eah1vsRG8wG4vVkR+bDOyC2c/ivZE
         E8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694012108; x=1694616908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2Wn4ae4ktta97Pgw/pk1HevY2o9bgfbLOIPVEo+6uo=;
        b=ZLNg3i/9MQrg8q90PKbtZSXFSyVZ0/gJDhBDovpXQjLAY4O9OObVafuAp8ZDUbp5BH
         EWqx9/fY4L4XPOmIso+lEjMxoYLq3tnZIOXSqXpthfR/scZYvPXLaWQN3MQigjetChWI
         173Ml9ZV+Gnydi8turk2FOT4IpLxx7msn0x9yvZD0sVnlJVzpvqfdQ3hT7Qap96dFY0q
         WU23CTx2QpxqXCf0ZYzNXpBMrwbskCKpsv5Bq+NC1H2nKIm82KzWP4OjwwNe9qhYRtKl
         zrNW3CjDuEdP3gP6w0G+MoIuJnORBzfiuYWM4sXxRmrsbaEH0zkltpq3uErKZGnTMv4/
         pmxg==
X-Gm-Message-State: AOJu0Yx3i6LYRfQjoCgwoNmnLAFa/9CPt9B+2ojksxMakApYm1kACAvH
	PEOkz0Sy//7R4FKxvUc7OKCk+ZvxMtCFHaG2/mc=
X-Google-Smtp-Source: AGHT+IE3K0yYjy7mbycfqUP/NML0G6BqwnctmDjHglxipAfPndVh7dADzkl2VD+yuxfLkpcQLHcjkA==
X-Received: by 2002:a7b:ce94:0:b0:401:b652:b6cf with SMTP id q20-20020a7bce94000000b00401b652b6cfmr2442432wmj.13.1694012107951;
        Wed, 06 Sep 2023 07:55:07 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id y23-20020a7bcd97000000b003fbc9d178a8sm23501217wmj.4.2023.09.06.07.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 07:55:07 -0700 (PDT)
Message-ID: <530942be-4175-43d5-a111-c433be7eff72@linaro.org>
Date: Wed, 6 Sep 2023 15:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/41] mtd: spi-nor: drop .parse_sfdp
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-11-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-11-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_075511_784842_FF91794A 
X-CRM114-Status: GOOD (  28.71  )
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



On 8/22/23 08:09, Michael Walle wrote:
> Drop the size parameter to indicate we need to do SFDP, we can do that
> because it is guaranteed that the size will be set by SFDP and because
> PARSE_SFDP forced the SFDP parsing it must be overwritten.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mtd/spi-nor/core.c       |  3 +--
>  drivers/mtd/spi-nor/core.h       | 23 ++++++++++++++++-------
>  drivers/mtd/spi-nor/eon.c        |  3 +--
>  drivers/mtd/spi-nor/gigadevice.c |  3 +--
>  drivers/mtd/spi-nor/issi.c       |  4 +---
>  drivers/mtd/spi-nor/macronix.c   |  1 -
>  drivers/mtd/spi-nor/spansion.c   | 12 ------------
>  drivers/mtd/spi-nor/sst.c        |  1 -
>  drivers/mtd/spi-nor/winbond.c    |  7 ++-----
>  9 files changed, 22 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 368851ff9f40..4ba1778eda4b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2017,7 +2017,6 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>  
>  static const struct flash_info spi_nor_generic_flash = {
>  	.name = "spi-nor-generic",
> -	.parse_sfdp = true,
>  };
>  
>  static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
> @@ -3069,7 +3068,7 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  
>  	spi_nor_init_default_params(nor);
>  
> -	if (nor->info->parse_sfdp) {
> +	if (spi_nor_needs_sfdp(nor)) {
>  		ret = spi_nor_parse_sfdp(nor);
>  		if (ret) {
>  			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index fba3ea8536a5..9e6ad02b03b0 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -460,9 +460,6 @@ struct spi_nor_fixups {
>   * @page_size:      (optional) the flash's page size. Defaults to 256.
>   * @addr_nbytes:    number of address bytes to send.
>   *
> - * @parse_sfdp:     true when flash supports SFDP tables. The false value has no
> - *                  meaning. If one wants to skip the SFDP tables, one should
> - *                  instead use the SPI_NOR_SKIP_SFDP sfdp_flag.
>   * @flags:          flags that indicate support that is not defined by the
>   *                  JESD216 standard in its SFDP tables. Flag meanings:
>   *   SPI_NOR_HAS_LOCK:        flash supports lock/unlock via SR
> @@ -521,7 +518,6 @@ struct flash_info {
>  	u8 n_banks;
>  	u8 addr_nbytes;
>  
> -	bool parse_sfdp;
>  	u16 flags;
>  #define SPI_NOR_HAS_LOCK		BIT(0)
>  #define SPI_NOR_HAS_TB			BIT(1)
> @@ -598,9 +594,6 @@ struct flash_info {
>  			.n_regions = (_n_regions),			\
>  		},
>  
> -#define PARSE_SFDP							\
> -	.parse_sfdp = true,						\
> -
>  #define FLAGS(_flags)							\
>  		.flags = (_flags),					\
>  
> @@ -740,6 +733,22 @@ static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
>  	return container_of(mtd, struct spi_nor, mtd);
>  }
>  
> +/**
> + * spi_nor_needs_sfdp() - returns true if SFDP parsing is used for this flash.
> + *
> + * Return: true if SFDP parsing is needed
> + */
> +static inline bool spi_nor_needs_sfdp(const struct spi_nor *nor)
> +{
> +	/*
> +	 * The flash size is one property parsed by the SFDP. We use it as an
> +	 * indicator whether we need SFDP parsing for a particular flash. I.e.
> +	 * non-legacy flash entries in flash_info will have a size of zero iff
> +	 * SFDP should be used.
> +	 */
> +	return nor->info->size;

the condition looks broken. the method returns bool, but here you return
size_t probably. And when size is zero one shall parse sfdp, not the
other way around.

maybe return (nor->info->size == 0)?

> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  void spi_nor_debugfs_register(struct spi_nor *nor);
>  void spi_nor_debugfs_shutdown(void);
> diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
> index 50a11053711f..434aaf155856 100644
> --- a/drivers/mtd/spi-nor/eon.c
> +++ b/drivers/mtd/spi-nor/eon.c
> @@ -25,8 +25,7 @@ static const struct flash_info eon_nor_parts[] = {
>  	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256) },
> -	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512)
> -		PARSE_SFDP },
> +	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  0) },
>  	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128)
>  		NO_SFDP_FLAGS(SECT_4K) },
>  };
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
> index d57ddaf1525b..7cf142c75529 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -62,8 +62,7 @@ static const struct flash_info gigadevice_nor_parts[] = {
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> -	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512)
> -		PARSE_SFDP
> +	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 0)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		.fixups = &gd25q256_fixups },
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index accdf7aa2bfd..9d22b799ce94 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -62,8 +62,7 @@ static const struct flash_info issi_nor_parts[] = {
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
> -	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512)
> -		PARSE_SFDP
> +	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 0)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		.fixups = &is25lp256_fixups },
>  	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64)
> @@ -73,7 +72,6 @@ static const struct flash_info issi_nor_parts[] = {
>  	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25wp256", INFO(0x9d7019, 0, 0, 0)
> -		PARSE_SFDP
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		FLAGS(SPI_NOR_QUAD_PP)
>  		.fixups = &is25lp256_fixups },
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index eb149e517c1f..0f3bd3ed8eff 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -83,7 +83,6 @@ static const struct flash_info macronix_nor_parts[] = {
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>  	{ "mx25uw51245g", INFOB(0xc2813a, 0, 0, 0, 4)
> -		PARSE_SFDP
>  		FLAGS(SPI_NOR_RWW) },
>  	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 709822fced86..e6468569f178 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -849,59 +849,47 @@ static const struct flash_info spansion_nor_parts[] = {
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>  	{ "s25fs256t",  INFO6(0x342b19, 0x0f0890, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25fs256t_fixups },
>  	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
>  	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
>  	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		FLAGS(NO_CHIP_ERASE)
>  		.fixups = &s25hx_t_fixups },
>  	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
>  	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
>  	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		FLAGS(NO_CHIP_ERASE)
>  		.fixups = &s25hx_t_fixups },
>  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
>  		FLAGS(SPI_NOR_NO_ERASE) },
>  	{ "s28hl512t",   INFO(0x345a1a,      0, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
>  	{ "s28hl01gt",   INFO(0x345a1b,      0, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
>  	{ "s28hs512t",   INFO(0x345b1a,      0, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
>  	{ "s28hs01gt",   INFO(0x345b1b,      0, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
>  	{ "s28hs02gt",   INFO(0x345b1c,      0, 0, 0)
> -		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 197d2c1101ed..57df68eab6aa 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -115,7 +115,6 @@ static const struct flash_info sst_nor_parts[] = {
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "sst26vf032b", INFO(0xbf2642, 0, 0, 0)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -		PARSE_SFDP
>  		.fixups = &sst26vf_nor_fixups },
>  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index cd99c9a1c568..c21fed842762 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -126,8 +126,7 @@ static const struct flash_info winbond_nor_parts[] = {
>  	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		.fixups = &w25q256_fixups },
> -	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512)
> -		PARSE_SFDP },
> +	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 0) },
>  	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> @@ -135,10 +134,8 @@ static const struct flash_info winbond_nor_parts[] = {
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_DUAL_READ) },
>  	{ "w25q512nwq", INFO(0xef6020, 0, 0, 0)
> -		PARSE_SFDP
>  		OTP_INFO(256, 3, 0x1000, 0x1000) },
> -	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
> -		PARSE_SFDP
> +	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 0)
>  		OTP_INFO(256, 3, 0x1000, 0x1000) },
>  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
