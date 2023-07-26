Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9887C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzOPgxXzjHbEa49Ouv18JYc1z7Xn4jkCPlW9fM3UM8s=; b=RI2gIijzNvawtG
	8ScYaTlru0WFVB/R62ws+spKXcXpzj7I4cdJ40JL1PmAW/QIeOvzoAztSd6CkIDcpZAxa+XMCH9zg
	mh94IUmfsFTuwDG61TDUOqb8N/XDYikai2MHg5VwzPV9OqeEuta4vI8zGF7qqSmcW7W1Idxvpeep6
	TtklrtjoWQaSj1GdEZDnW8Q6atgce78m83sDYnu2h0Yz4/SPckpaGYh0FngPH8Y5Ph6wlraSsAmnr
	BZ2I5HuBBLntjOFco6BobBo32m1WXNFz5fl59bOSn+gDCcv6kG0xRhyu7h0RcGugsQjnLceNjZXyo
	bWbqW8mYYXpOUBpxQCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYRZ-009Jtv-1P;
	Wed, 26 Jul 2023 06:56:21 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYRW-009JtM-0s
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 06:56:20 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso10142089e87.3
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2023 23:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690354575; x=1690959375;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUl/LYjxwWHoQZ/syrIOUNtcf0DGxqrXlaz40etrwiY=;
        b=drIjjRQoW7onVsLwJXqYi1shcHbg/laJXl01IUJLUU5UsNnEJIGDdsoZxVF+jgdHT5
         k96nVJ3hQ0/1l3VsyfjawII10LwVl2ZRpwIt/WIEkfjFR7NzPSFcm6mr5P0z7w+QjHk5
         6ZsG6HonIGHjLZwrChSkgpZ7OHnBgT9m0W2GAlBqyNlU8I1yB8f8G5BWyBAEn+OolEpv
         WgmfVtQ82RdTBH++awp1kUbdmHkQZ0vdkOCvdmZgcUwhh9c27YOQXd1aCsZ2E2tIiwdR
         6ujUyJRfiJ9a/QxxGnLZuy7WCCj4PsfNR+hSo6aN1ML7ltnOWSKHcfo6ZvAK4LmeHS8i
         9nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690354575; x=1690959375;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUl/LYjxwWHoQZ/syrIOUNtcf0DGxqrXlaz40etrwiY=;
        b=eYTiGJcFT+nOIHMzeBFkqFAnNHg7DU3MQlYRUKBvfxAGbl/FZoKKwzJTGetknXCHyJ
         yGHKxkmTdqjvb2eonhf8IjTnGO5AiFnYg9xWt+pJF6sK4gqOE63n6N9m44nrGPs9wDmk
         dh2kkBisJiF4DWoSvGAtBeRr3Mup0YwlMW/F+Yatr54sy2twfGTMyitJi3YsgY7EvONn
         v2tiZ34q2J+BgAoHsqi0q4+iHIUb3HUL8XaWF7+DpVXQomUoYlYw/DUT7WU8sJwRIh0e
         kl1YWr4/j+kK4nRsv3L/j5H1eYscDahg2Sd1bFXTBR7ZsT3ncEe375a0GX3btskkkIHB
         A7bw==
X-Gm-Message-State: ABy/qLbCeyIURq0vPEhk/g5xb2qqDwqCEb6+EYjE4UBkE9J8rOruU5ZM
	b7Yf4Qc94Rdddd8Zc6anxM7C0w==
X-Google-Smtp-Source: APBJJlEdDBE1KiJK/x1uM3uX9nj+BEeBzIcBxOac8g46OyRUaZag8VLIje6jC4OAwTVX4Y9I6e9O6g==
X-Received: by 2002:a05:6512:701:b0:4fb:89e3:5ac6 with SMTP id b1-20020a056512070100b004fb89e35ac6mr606003lfs.62.1690354575202;
        Tue, 25 Jul 2023 23:56:15 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id t1-20020a7bc3c1000000b003f9bd9e3226sm1131211wmj.7.2023.07.25.23.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 23:56:14 -0700 (PDT)
Message-ID: <9cc81d00-7cce-93ef-7d43-adef519b1c95@linaro.org>
Date: Wed, 26 Jul 2023 09:56:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RESEND PATCH v3 11/11] mtd: spi-nor: spansion: switch
 cypress_nor_get_page_size() to use vreg_offset
To: Takahiro Kuwano <tkuw584924@gmail.com>, takahiro.kuwano@infineon.com,
 michael@walle.cc
Cc: pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
 <20230724081247.4779-12-tudor.ambarus@linaro.org>
 <40acee64-439c-8a93-2788-da4249cb714a@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <40acee64-439c-8a93-2788-da4249cb714a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_235618_319001_2CA5E2A7 
X-CRM114-Status: GOOD (  26.07  )
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



On 26.07.2023 07:15, Takahiro Kuwano wrote:
> Hi Tudor,
> 
> On 7/24/2023 5:12 PM, Tudor Ambarus wrote:
>> All users of cypress_nor_get_page_size() retrieve n_dice and vreg_offset
>> from SFDP. Switch cypress_nor_get_page_size() to always use vreg_offset
>> so that we use the same code base for both single and multi chip package
>> flashes. cypress_nor_get_page_size() is now called in the post_sfdp()
>> hook instead of post_bfpt(), as vreg_offset and n_dice are parsed after
>> BFPT and we now use them to get the page size in the post_sfdp hook.
>> Consequently the null checks on n_dice and vreg_offset are moved to
>> the post_sfdp() hook.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/mtd/spi-nor/spansion.c | 105 +++++++++++++--------------------
>>  1 file changed, 42 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 4027f0038ce5..0b01af33aa57 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -471,28 +471,17 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
>>  	return 0;
>>  }
>>  
>> -static int cypress_nor_get_page_size_single_chip(struct spi_nor *nor)
>> -{
>> -	struct spi_mem_op op =
>> -		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
>> -					  SPINOR_REG_CYPRESS_CFR3V, 0,
>> -					  nor->bouncebuf);
>> -	int ret;
>> -
>> -	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
>> -	if (ret)
>> -		return ret;
>> -
>> -	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3_PGSZ)
>> -		nor->params->page_size = 512;
>> -	else
>> -		nor->params->page_size = 256;
>> -
>> -	return 0;
>> -}
>> -
>> -
>> -static int cypress_nor_get_page_size_mcp(struct spi_nor *nor)
>> +/**
>> + * cypress_nor_get_page_size() - Get flash page size configuration.
>> + * @nor:	pointer to a 'struct spi_nor'
>> + *
>> + * The BFPT table advertises a 512B or 256B page size depending on part but the
>> + * page size is actually configurable (with the default being 256B). Read from
>> + * CFR3V[4] and set the correct size.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int cypress_nor_get_page_size(struct spi_nor *nor)
>>  {
>>  	struct spi_mem_op op =
>>  		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
>> @@ -522,23 +511,6 @@ static int cypress_nor_get_page_size_mcp(struct spi_nor *nor)
>>  	return 0;
>>  }
>>  
>> -/**
>> - * cypress_nor_get_page_size() - Get flash page size configuration.
>> - * @nor:	pointer to a 'struct spi_nor'
>> - *
>> - * The BFPT table advertises a 512B or 256B page size depending on part but the
>> - * page size is actually configurable (with the default being 256B). Read from
>> - * CFR3V[4] and set the correct size.
>> - *
>> - * Return: 0 on success, -errno otherwise.
>> - */
>> -static int cypress_nor_get_page_size(struct spi_nor *nor)
>> -{
>> -	if (nor->params->n_dice)
>> -		return cypress_nor_get_page_size_mcp(nor);
>> -	return cypress_nor_get_page_size_single_chip(nor);
>> -}
>> -
>>  static void cypress_nor_ecc_init(struct spi_nor *nor)
>>  {
>>  	/*
>> @@ -575,20 +547,26 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
>>  	if (nor->bouncebuf[0])
>>  		return -ENODEV;
>>  
>> -	return cypress_nor_get_page_size(nor);
>> +	return 0;
>>  }
>>  
>>  static int s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
>>  {
>>  	struct spi_nor_flash_parameter *params = nor->params;
>>  
>> +	if (!params->n_dice || !params->vreg_offset) {
>> +		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
>> +			__func__);
>> +		return -EOPNOTSUPP;
>> +	}
>> +
> S25FS256T failed here. I realized that S25FS256T doesn't have SCCR map...
> With fix like below, it works. Make sense?

Yes it does, will resubmit.
> 
> 	params->vreg_offset = devm_kmalloc(nor->dev, sizeof(u32), GFP_KERNEL);
> 	if (!params->vreg_offset)
> 		return -ENOMEM;
> 
> 	params->vreg_offset[0] = SPINOR_REG_CYPRESS_VREG;
> 	params->n_dice = 1;
> 
> 
>>  	/* PP_1_1_4_4B is supported but missing in 4BAIT. */
>>  	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
>>  	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
>>  				SPINOR_OP_PP_1_1_4_4B,
>>  				SNOR_PROTO_1_1_4);
>>  
>> -	return 0;
>> +	return cypress_nor_get_page_size(nor);
>>  }
>>  
>>  static int s25fs256t_late_init(struct spi_nor *nor)
>> @@ -623,10 +601,20 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
>>  
>>  static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
>>  {
>> -	struct spi_nor_erase_type *erase_type =
>> -					nor->params->erase_map.erase_type;
>> +	struct spi_nor_flash_parameter *params = nor->params;
>> +	struct spi_nor_erase_type *erase_type = params->erase_map.erase_type;
>>  	unsigned int i;
>>  
>> +	if (!params->n_dice || !params->vreg_offset) {
>> +		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
>> +			__func__);
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
>> +	if (params->size == SZ_256M)
>> +		params->n_dice = 2;
>> +
>>  	/*
>>  	 * In some parts, 3byte erase opcodes are advertised by 4BAIT.
>>  	 * Convert them to 4byte erase opcodes.
>> @@ -644,10 +632,6 @@ static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
>>  		}
>>  	}
>>  
>> -	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
>> -	if (nor->params->size == SZ_256M)
>> -		nor->params->n_dice = 2;
>> -
>>  	return cypress_nor_get_page_size(nor);
>>  }
>>  
>> @@ -655,12 +639,6 @@ static int s25hx_t_late_init(struct spi_nor *nor)
>>  {
>>  	struct spi_nor_flash_parameter *params = nor->params;
>>  
>> -	if (!params->n_dice || !params->vreg_offset) {
>> -		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
>> -			__func__);
>> -		return -EOPNOTSUPP;
>> -	}
>> -
>>  	/* Fast Read 4B requires mode cycles */
>>  	params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
>>  	params->ready = cypress_nor_sr_ready_and_clear;
>> @@ -694,6 +672,17 @@ static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
>>  static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
>>  {
>>  	struct spi_nor_flash_parameter *params = nor->params;
>> +
>> +	if (!params->n_dice || !params->vreg_offset) {
>> +		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
>> +			__func__);
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
>> +	if (params->size == SZ_256M)
>> +		params->n_dice = 2;
>> +
>>  	/*
>>  	 * On older versions of the flash the xSPI Profile 1.0 table has the
>>  	 * 8D-8D-8D Fast Read opcode as 0x00. But it actually should be 0xEE.
>> @@ -719,10 +708,6 @@ static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
>>  	 */
>>  	params->rdsr_addr_nbytes = 4;
>>  
>> -	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
>> -	if (params->size == SZ_256M)
>> -		params->n_dice = 2;
>> -
>>  	return cypress_nor_get_page_size(nor);
>>  }
>>  
>> @@ -737,12 +722,6 @@ static int s28hx_t_late_init(struct spi_nor *nor)
>>  {
>>  	struct spi_nor_flash_parameter *params = nor->params;
>>  
>> -	if (!params->n_dice || !params->vreg_offset) {
>> -		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
>> -			__func__);
>> -		return -EOPNOTSUPP;
>> -	}
>> -
>>  	params->set_octal_dtr = cypress_nor_set_octal_dtr;
>>  	params->ready = cypress_nor_sr_ready_and_clear;
>>  	cypress_nor_ecc_init(nor);
> 
> All other S25Hx and S28Hx devices work fine.
> 

Good!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
