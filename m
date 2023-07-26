Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B7CC001DE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJ69jc0HHvE7WATjBz5l6gtjZyGbt8jgbYBnkzDSGXQ=; b=i+SChpjn+Id4hb
	zR6k9ecfAkdV7YglWgT5gZAkVQkdWGg9lOgXW/UOEBD5UObbIn+fcFso68XQGM8MYZkGUNW+mveEq
	mL9l6CyDd4wX3ZvfbJVLiKj26WRZqfdHdds5smaZT4D0zJ+A3aPVjB6G1bIgbpogNxSYjNbxM9Y6M
	aNWrAMGYQRTT8B6sgBGBehp+3Uyr+/OErspFFk3WALUJ9wRxY/f5YTkijIBnj6LgVhau+UPDD16gr
	22ZuX9z+4RjEqavaZ78SPZ4ESjBFwJU8X3Zp4g6CQny/vdU+lEPn2O09NysEtyRwhZVLlpOMU8+Uf
	u+tUn2hQdcoFXmkhnWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOav6-009kkM-2x;
	Wed, 26 Jul 2023 09:35:00 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOav4-009kjf-0y
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 09:35:00 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-565a8d9d832so4073749eaf.1
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 02:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690364096; x=1690968896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qD2n5rIKMCWHXvSdka0T1+kYPgKQzH9OCm3J0umHY2U=;
        b=Qafgj177JutlUzo3YRwny1Auq/RWtrQVd+FU/eW7VfKo9UowdZWu5NX5H+TlwAJ6ec
         LlVzPtwAybKSqiSzifNmzGwl9S9EoVAjG8sf/Te2KukvPUfcskWxHOhy9staU/cWWxXz
         u6KllIxLV+3MbpWZmBlgjDuWKOCtQ4nfiHPp4pCk+aNGCvFi24o82ngGpT7GwPH7qXgO
         fgphtipvFBEY84OVqV8HmMs1jlDOSJwEMI9uumWt95OlUx+1ZFueV68CK3RglC9VGTQ1
         KpcPV+5daoaEIbQQSHwxPtsj4xd1DVeMtDtykB2M74uyhwKkxWgSdqzd8zVk+6DDm24L
         mBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690364096; x=1690968896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qD2n5rIKMCWHXvSdka0T1+kYPgKQzH9OCm3J0umHY2U=;
        b=hHRgAHjWIYw6OHsOp6gYnmYxVrzW5K7G6fAEx/cunJlkr29IOORXpYkTA7fXLvdv0l
         T+C8uhuPPFy1vXbbWx9L4szLXnMumH4GDDABDXARP2CnwzjYrBBZMv8zAYWHk5egouf+
         49TCPZy8mXdOVSU9miwSBgKp2k4Yo7lSOss6ZQxhravCBvLUt/mitD1leqHlz6IHgSDu
         PZ4TFw1ZXVfEH2khZPYb9pgaQHkxTiLLrQPAPX/RClVv0YwC1CKnsMbAivaivwZCAeX0
         izPHSnwJUfhycfVZYkUSanwVYhY7gwYZJa06mXvM3giex0JPk2DycB2WnWzZrlBYd1x/
         agHg==
X-Gm-Message-State: ABy/qLarX12YCHWlLxm8gk3q+84f0gqJSSH1jHxbcnOcK/hGeVkawsag
	HrxnuG9BMtzLijX43KreU6g=
X-Google-Smtp-Source: APBJJlFkez745rAM68ezCz8K7fx/gJC3E81krgwYbc7KxjDG8QAKv9pUhMEBDRVcp1DPtLB00deHhA==
X-Received: by 2002:a05:6358:9389:b0:134:c815:f067 with SMTP id h9-20020a056358938900b00134c815f067mr1563430rwb.11.1690364096111;
        Wed, 26 Jul 2023 02:34:56 -0700 (PDT)
Received: from [192.168.0.11] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id w6-20020a63af06000000b0050f85ef50d1sm12041840pge.26.2023.07.26.02.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:34:55 -0700 (PDT)
Message-ID: <e0869526-3137-3073-1efd-832d5c16dc55@gmail.com>
Date: Wed, 26 Jul 2023 18:34:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 11/11] mtd: spi-nor: spansion: switch
 cypress_nor_get_page_size() to use vreg_offset
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, takahiro.kuwano@infineon.com,
 michael@walle.cc
Cc: pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
 <20230726075257.12985-12-tudor.ambarus@linaro.org>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20230726075257.12985-12-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_023458_338730_70E54F1C 
X-CRM114-Status: GOOD (  31.25  )
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

On 7/26/2023 4:52 PM, Tudor Ambarus wrote:
> All users of cypress_nor_get_page_size() but S25FS256T retrieve n_dice
> and vreg_offset from SFDP. S25FS256T does not define the SCCR map to
> retrive the vreg_offset, but it does support it: SPINOR_REG_CYPRESS_VREG.
> Switch cypress_nor_get_page_size() to always use vreg_offset so that we
> use the same code base for both single and multi chip package flashes.
> cypress_nor_get_page_size() is now called in the post_sfdp() hook instead
> of post_bfpt(), as vreg_offset and n_dice are parsed after BFPT.
> Consequently the null checks on n_dice and vreg_offset are moved to
> the post_sfdp() hook.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/spansion.c | 113 ++++++++++++++-------------------
>  1 file changed, 48 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 6abef5b515a1..a23eb2ae9488 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -32,8 +32,6 @@
>  #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
>  #define SPINOR_REG_CYPRESS_CFR2_ADRBYT		BIT(7)
>  #define SPINOR_REG_CYPRESS_CFR3			0x4
> -#define SPINOR_REG_CYPRESS_CFR3V					\
> -	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR3)
>  #define SPINOR_REG_CYPRESS_CFR3_PGSZ		BIT(4) /* Page size. */
>  #define SPINOR_REG_CYPRESS_CFR5			0x6
>  #define SPINOR_REG_CYPRESS_CFR5_BIT6		BIT(6)
> @@ -467,28 +465,17 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
>  	return 0;
>  }
>  
> -static int cypress_nor_get_page_size_single_chip(struct spi_nor *nor)
> -{
> -	struct spi_mem_op op =
> -		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
> -					  SPINOR_REG_CYPRESS_CFR3V, 0,
> -					  nor->bouncebuf);
> -	int ret;
> -
> -	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> -	if (ret)
> -		return ret;
> -
> -	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3_PGSZ)
> -		nor->params->page_size = 512;
> -	else
> -		nor->params->page_size = 256;
> -
> -	return 0;
> -}
> -
> -
> -static int cypress_nor_get_page_size_mcp(struct spi_nor *nor)
> +/**
> + * cypress_nor_get_page_size() - Get flash page size configuration.
> + * @nor:	pointer to a 'struct spi_nor'
> + *
> + * The BFPT table advertises a 512B or 256B page size depending on part but the
> + * page size is actually configurable (with the default being 256B). Read from
> + * CFR3V[4] and set the correct size.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int cypress_nor_get_page_size(struct spi_nor *nor)
>  {
>  	struct spi_mem_op op =
>  		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
> @@ -518,23 +505,6 @@ static int cypress_nor_get_page_size_mcp(struct spi_nor *nor)
>  	return 0;
>  }
>  
> -/**
> - * cypress_nor_get_page_size() - Get flash page size configuration.
> - * @nor:	pointer to a 'struct spi_nor'
> - *
> - * The BFPT table advertises a 512B or 256B page size depending on part but the
> - * page size is actually configurable (with the default being 256B). Read from
> - * CFR3V[4] and set the correct size.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -static int cypress_nor_get_page_size(struct spi_nor *nor)
> -{
> -	if (nor->params->n_dice)
> -		return cypress_nor_get_page_size_mcp(nor);
> -	return cypress_nor_get_page_size_single_chip(nor);
> -}
> -
>  static void cypress_nor_ecc_init(struct spi_nor *nor)
>  {
>  	/*
> @@ -571,20 +541,32 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
>  	if (nor->bouncebuf[0])
>  		return -ENODEV;
>  
> -	return cypress_nor_get_page_size(nor);
> +	return 0;
>  }
>  
>  static int s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = nor->params;
>  
> +	/*
> +	 * S25FS256T does not define the SCCR map, but we would like to use the
> +	 * same code base for both single and multi chip package devices, thus
> +	 * set the vreg_offset and n_dice to be able to do so.
> +	 */
> +	params->vreg_offset = devm_kmalloc(nor->dev, sizeof(u32), GFP_KERNEL);
> +	if (!params->vreg_offset)
> +		return -ENOMEM;
> +
> +	params->vreg_offset[0] = SPINOR_REG_CYPRESS_VREG;
> +	params->n_dice = 1;
> +
>  	/* PP_1_1_4_4B is supported but missing in 4BAIT. */
>  	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
>  	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
>  				SPINOR_OP_PP_1_1_4_4B,
>  				SNOR_PROTO_1_1_4);
>  
> -	return 0;
> +	return cypress_nor_get_page_size(nor);
>  }
>  
>  static int s25fs256t_late_init(struct spi_nor *nor)
> @@ -619,10 +601,20 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
>  
>  static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
>  {
> -	struct spi_nor_erase_type *erase_type =
> -					nor->params->erase_map.erase_type;
> +	struct spi_nor_flash_parameter *params = nor->params;
> +	struct spi_nor_erase_type *erase_type = params->erase_map.erase_type;
>  	unsigned int i;
>  
> +	if (!params->n_dice || !params->vreg_offset) {
> +		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
> +			__func__);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
> +	if (params->size == SZ_256M)
> +		params->n_dice = 2;
> +
>  	/*
>  	 * In some parts, 3byte erase opcodes are advertised by 4BAIT.
>  	 * Convert them to 4byte erase opcodes.
> @@ -640,10 +632,6 @@ static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
>  		}
>  	}
>  
> -	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
> -	if (nor->params->size == SZ_256M)
> -		nor->params->n_dice = 2;
> -
>  	return cypress_nor_get_page_size(nor);
>  }
>  
> @@ -651,12 +639,6 @@ static int s25hx_t_late_init(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = nor->params;
>  
> -	if (!params->n_dice || !params->vreg_offset) {
> -		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
> -			__func__);
> -		return -EOPNOTSUPP;
> -	}
> -
>  	/* Fast Read 4B requires mode cycles */
>  	params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
>  	params->ready = cypress_nor_sr_ready_and_clear;
> @@ -690,6 +672,17 @@ static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
>  static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	if (!params->n_dice || !params->vreg_offset) {
> +		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
> +			__func__);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
> +	if (params->size == SZ_256M)
> +		params->n_dice = 2;
> +
>  	/*
>  	 * On older versions of the flash the xSPI Profile 1.0 table has the
>  	 * 8D-8D-8D Fast Read opcode as 0x00. But it actually should be 0xEE.
> @@ -715,10 +708,6 @@ static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
>  	 */
>  	params->rdsr_addr_nbytes = 4;
>  
> -	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
> -	if (params->size == SZ_256M)
> -		params->n_dice = 2;
> -
>  	return cypress_nor_get_page_size(nor);
>  }
>  
> @@ -733,12 +722,6 @@ static int s28hx_t_late_init(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = nor->params;
>  
> -	if (!params->n_dice || !params->vreg_offset) {
> -		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
> -			__func__);
> -		return -EOPNOTSUPP;
> -	}
> -
>  	params->set_octal_dtr = cypress_nor_set_octal_dtr;
>  	params->ready = cypress_nor_sr_ready_and_clear;
>  	cypress_nor_ecc_init(nor);

Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
