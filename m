Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A159C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Dec 2022 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9wBcceqydJ7bWng1C3u/YX1jXPxlYPDji5+m6ce108=; b=VpXu2u3zfecgg0
	R2jxaUieevLWyZGhrwwowFI7VceqcydnHjF2Ejz9NseutGh6euh9XFawUYEenTD2Y8gp06RlyEQ5K
	w/Lk2Ok5fBqd/mEXUFzOn2hXvFtLZYB4UfbuFa5W9wK0LqNr7lwsD2kIKW/mhWE8xnHfeZm+7qOWg
	Z63kib5KYlN7NkTpzCQo0YtxinohfRHxWlgEJObMSpTSsKmyGz5X4TZr3Rrz0GVoy1Jt6picUci0f
	ErBxGYLHg08DuUwl4W0m9WcT2Usxe1HWhjGYQy7tonslmcJ1/Cs3fcFx6zf2a4HNDHPRkam8j7yA1
	UEDfvJgfauhkSspEeXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cZv-004ocA-0P; Fri, 23 Dec 2022 07:34:51 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cZn-004oXS-KX
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2022 07:34:45 +0000
Received: by mail-ej1-x636.google.com with SMTP id t17so10271418eju.1
        for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2022 23:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgnHfbgB7nsIiQ9YnEuWRZ7jGazE+zUdAepzp+ADwQI=;
        b=aPprpGWV62bRYdIaizR203DiIGj6jAGzNfxFinz/iCKavrNpE2qfulf6eeTVP2bmDu
         pgFBtSOFS/sbiaJj57k9tw63SIWmnxLf97OaupE0iwLpXiAb8TFuySFzS5LU6Jnfrfog
         u5I23NoAFj1r83Oig3HErv9OYXLZCR1856zhicKaPW7BP0hnGVfLeQ14azj5CFLtm4Xm
         16ogK3QG7c6N62v+4P7ZvgDCP5zDAHIJqSq3YTLy47w+x/9WY/fwCEJqPkkFEGEUHH+F
         uCvj2DAFzghAow+/JKiBPoXCTkMFxptOw+jqcfIu6zH1ZLndHt+CRyXj3fQq55f5Q+BF
         h6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgnHfbgB7nsIiQ9YnEuWRZ7jGazE+zUdAepzp+ADwQI=;
        b=o6JXJuSsq/4SaKXZEHB2mtNvjsQNGmsXSUOlaljHLjmufbdN9x6CFjsMXHRAVFxhPF
         rXRrkNDRwxjzVwVEYP2V/HXKRTv0tm3EER8/2h6NPRQhqIHI5b+gJr7V2SulhEK09qtJ
         +KTGCXIas6DBpfeS/DdyPCnHFAFLLdRX+elZNI4F84JvzczsndNvBfS4gWkXWeoo2XKN
         Btadb4FBeDEh7OY5Sx06rxczJXTCfUQr18FVPgB1R/AA2geWu+jLh5Sypsz5eTN/xwSs
         4QHZL42ScbOm4ycPqfACawztzUrXPYnySSSFCvdm0tOMlJgCjB1zE3tPX0x2xzJh28ul
         L6sQ==
X-Gm-Message-State: AFqh2kpMtfC74MxSizn5sblxw/5y4kdNIcNodyOB7f0TP5xPhJX2qG3Z
	czLCpsAOmJC7ydIm8+ir8yEtyg==
X-Google-Smtp-Source: AMrXdXuLQ2oCw7i5THSEkXb9O64pKgHqRFxVQP8A8Dbl00FQOhINxxGU1FpOleidK6p5BoxU/n4doQ==
X-Received: by 2002:a17:906:ae94:b0:7c0:dcc5:756c with SMTP id md20-20020a170906ae9400b007c0dcc5756cmr6602729ejb.71.1671780879721;
        Thu, 22 Dec 2022 23:34:39 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id m9-20020a1709062ac900b007c0d41736c0sm1092441eje.39.2022.12.22.23.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 23:34:39 -0800 (PST)
Message-ID: <75e3d323-d7aa-74bf-d800-fd6a51f465df@linaro.org>
Date: Fri, 23 Dec 2022 09:34:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] mtd: spi-nor: sfdp: Rename BFPT_DWORD() macro to
 SFDP_DWORD()
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
 <dedcb32567c6cc7a6d05e3f0f7d0155f20afd422.1671684805.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <dedcb32567c6cc7a6d05e3f0f7d0155f20afd422.1671684805.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_233443_732379_18485FA3 
X-CRM114-Status: GOOD (  24.09  )
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



On 23.12.2022 09:21, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> To use this macro for other parameter tables than BFPT.

In the future please try to not use the commit message as a continuation
of the commit subject. Explain what you do also in the commit message.

looks good!
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>   drivers/mtd/spi-nor/issi.c     |  2 +-
>   drivers/mtd/spi-nor/macronix.c |  2 +-
>   drivers/mtd/spi-nor/sfdp.c     | 44 +++++++++++++++++-----------------
>   drivers/mtd/spi-nor/sfdp.h     |  9 ++++---
>   4 files changed, 28 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index a0ddad2afffc..400e2b42f45a 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -18,7 +18,7 @@ is25lp256_post_bfpt_fixups(struct spi_nor *nor,
>   	 * BFPT_DWORD1_ADDRESS_BYTES_3_ONLY.
>   	 * Overwrite the number of address bytes advertised by the BFPT.
>   	 */
> -	if ((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
> +	if ((bfpt->dwords[SFDP_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
>   		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
>   		nor->params->addr_nbytes = 4;
>   
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index d81a4cb2812b..6853ec9ae65d 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -22,7 +22,7 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>   	 * seems that the F version advertises support for Fast Read 4-4-4 in
>   	 * its BFPT table.
>   	 */
> -	if (bfpt->dwords[BFPT_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
> +	if (bfpt->dwords[SFDP_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
>   		nor->flags |= SNOR_F_4B_OPCODES;
>   
>   	return 0;
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 5df2fcba5483..5c2ab868707b 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -242,64 +242,64 @@ static const struct sfdp_bfpt_read sfdp_bfpt_reads[] = {
>   	/* Fast Read 1-1-2 */
>   	{
>   		SNOR_HWCAPS_READ_1_1_2,
> -		BFPT_DWORD(1), BIT(16),	/* Supported bit */
> -		BFPT_DWORD(4), 0,	/* Settings */
> +		SFDP_DWORD(1), BIT(16),	/* Supported bit */
> +		SFDP_DWORD(4), 0,	/* Settings */
>   		SNOR_PROTO_1_1_2,
>   	},
>   
>   	/* Fast Read 1-2-2 */
>   	{
>   		SNOR_HWCAPS_READ_1_2_2,
> -		BFPT_DWORD(1), BIT(20),	/* Supported bit */
> -		BFPT_DWORD(4), 16,	/* Settings */
> +		SFDP_DWORD(1), BIT(20),	/* Supported bit */
> +		SFDP_DWORD(4), 16,	/* Settings */
>   		SNOR_PROTO_1_2_2,
>   	},
>   
>   	/* Fast Read 2-2-2 */
>   	{
>   		SNOR_HWCAPS_READ_2_2_2,
> -		BFPT_DWORD(5),  BIT(0),	/* Supported bit */
> -		BFPT_DWORD(6), 16,	/* Settings */
> +		SFDP_DWORD(5),  BIT(0),	/* Supported bit */
> +		SFDP_DWORD(6), 16,	/* Settings */
>   		SNOR_PROTO_2_2_2,
>   	},
>   
>   	/* Fast Read 1-1-4 */
>   	{
>   		SNOR_HWCAPS_READ_1_1_4,
> -		BFPT_DWORD(1), BIT(22),	/* Supported bit */
> -		BFPT_DWORD(3), 16,	/* Settings */
> +		SFDP_DWORD(1), BIT(22),	/* Supported bit */
> +		SFDP_DWORD(3), 16,	/* Settings */
>   		SNOR_PROTO_1_1_4,
>   	},
>   
>   	/* Fast Read 1-4-4 */
>   	{
>   		SNOR_HWCAPS_READ_1_4_4,
> -		BFPT_DWORD(1), BIT(21),	/* Supported bit */
> -		BFPT_DWORD(3), 0,	/* Settings */
> +		SFDP_DWORD(1), BIT(21),	/* Supported bit */
> +		SFDP_DWORD(3), 0,	/* Settings */
>   		SNOR_PROTO_1_4_4,
>   	},
>   
>   	/* Fast Read 4-4-4 */
>   	{
>   		SNOR_HWCAPS_READ_4_4_4,
> -		BFPT_DWORD(5), BIT(4),	/* Supported bit */
> -		BFPT_DWORD(7), 16,	/* Settings */
> +		SFDP_DWORD(5), BIT(4),	/* Supported bit */
> +		SFDP_DWORD(7), 16,	/* Settings */
>   		SNOR_PROTO_4_4_4,
>   	},
>   };
>   
>   static const struct sfdp_bfpt_erase sfdp_bfpt_erases[] = {
>   	/* Erase Type 1 in DWORD8 bits[15:0] */
> -	{BFPT_DWORD(8), 0},
> +	{SFDP_DWORD(8), 0},
>   
>   	/* Erase Type 2 in DWORD8 bits[31:16] */
> -	{BFPT_DWORD(8), 16},
> +	{SFDP_DWORD(8), 16},
>   
>   	/* Erase Type 3 in DWORD9 bits[15:0] */
> -	{BFPT_DWORD(9), 0},
> +	{SFDP_DWORD(9), 0},
>   
>   	/* Erase Type 4 in DWORD9 bits[31:16] */
> -	{BFPT_DWORD(9), 16},
> +	{SFDP_DWORD(9), 16},
>   };
>   
>   /**
> @@ -458,7 +458,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>   	le32_to_cpu_array(bfpt.dwords, BFPT_DWORD_MAX);
>   
>   	/* Number of address bytes. */
> -	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
> +	switch (bfpt.dwords[SFDP_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
>   	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
>   	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
>   		params->addr_nbytes = 3;
> @@ -475,7 +475,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>   	}
>   
>   	/* Flash Memory Density (in bits). */
> -	val = bfpt.dwords[BFPT_DWORD(2)];
> +	val = bfpt.dwords[SFDP_DWORD(2)];
>   	if (val & BIT(31)) {
>   		val &= ~BIT(31);
>   
> @@ -555,13 +555,13 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>   		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
>   
>   	/* Page size: this field specifies 'N' so the page size = 2^N bytes. */
> -	val = bfpt.dwords[BFPT_DWORD(11)];
> +	val = bfpt.dwords[SFDP_DWORD(11)];
>   	val &= BFPT_DWORD11_PAGE_SIZE_MASK;
>   	val >>= BFPT_DWORD11_PAGE_SIZE_SHIFT;
>   	params->page_size = 1U << val;
>   
>   	/* Quad Enable Requirements. */
> -	switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
> +	switch (bfpt.dwords[SFDP_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
>   	case BFPT_DWORD15_QER_NONE:
>   		params->quad_enable = NULL;
>   		break;
> @@ -608,7 +608,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>   	}
>   
>   	/* Soft Reset support. */
> -	if (bfpt.dwords[BFPT_DWORD(16)] & BFPT_DWORD16_SWRST_EN_RST)
> +	if (bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_SWRST_EN_RST)
>   		nor->flags |= SNOR_F_SOFT_RESET;
>   
>   	/* Stop here if not JESD216 rev C or later. */
> @@ -616,7 +616,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>   		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
>   
>   	/* 8D-8D-8D command extension. */
> -	switch (bfpt.dwords[BFPT_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
> +	switch (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
>   	case BFPT_DWORD18_CMD_EXT_REP:
>   		nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
>   		break;
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index c1969f0a2f46..500659b35655 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -13,13 +13,12 @@
>   #define SFDP_JESD216A_MINOR	5
>   #define SFDP_JESD216B_MINOR	6
>   
> +/* SFDP DWORDS are indexed from 1 but C arrays are indexed from 0. */
> +#define SFDP_DWORD(i)		((i) - 1)
> +
>   /* Basic Flash Parameter Table */
>   
> -/*
> - * JESD216 rev D defines a Basic Flash Parameter Table of 20 DWORDs.
> - * They are indexed from 1 but C arrays are indexed from 0.
> - */
> -#define BFPT_DWORD(i)		((i) - 1)
> +/* JESD216 rev D defines a Basic Flash Parameter Table of 20 DWORDs. */
>   #define BFPT_DWORD_MAX		20
>   
>   struct sfdp_bfpt {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
