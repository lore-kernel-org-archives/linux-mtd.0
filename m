Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0C8C74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 17:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6ma/gQ3+m7yADDWpsmHa335b6VLQiEl52/f7JRMBtU=; b=iE6hGcpMQ4e2Xr
	mzgV4843dHcReDtbyOX+iE0yeKBHNeowgmzYYf+HiM4f//OMdNjYvtrY4M61P8DbjomvMHF0/r3j7
	9CYJfcsO9/6CzoTcPht/nVf3IdvoaL6P46gEn1KE9TuUI3LUQQwG5YehnMtvgaE6dP6w5inzXWYw2
	+dOby13TRLrYDXFYaNVFfgcxqALqjrJ08b6Fn88IYfrx8UEXRJL3TJ2wK/SDaseT65LqH9r92Yl0X
	IMKzoPDWcu8iVpgMmmfByTrHZ9vQhsyvCwjS8uFCYll8OFLawbDOqzsc+xvnvjQRlj58H3puN/GYV
	UGv0sL/VTlzEJXN+XhqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phZVV-001Hik-2m;
	Wed, 29 Mar 2023 17:22:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phZVT-001HgV-0P
	for linux-mtd@lists.infradead.org;
	Wed, 29 Mar 2023 17:22:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so11939575wmq.4
        for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2023 10:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680110557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CBLp/jpc9y9rMvN5jw6+q5ZIa3l3RNNfXuhJJ0vQxR0=;
        b=VC7WGgGMWaIeOKyxq6SQxvp9oqdZxna2+hYudCWSUs8GeIpJDaBDhBpKAKwxRscwDX
         RN1h08gvCeCF51kMXoXnx7yKVHxdMCZINtJZfkA0CflsMpyH4+TkrITtHzqZ+mJz0v7I
         88Ujk4P2vnreGOOC8IH2NQHPPrK1+eloCX8YS4w+iAvT90uPqxYll5qCYKpgtIoHX8qe
         llpMvo+ht67jL4l0Y+cfJOOHt+R180i7mmANwAeXlmz78m70hdeaOiD2CHASjf4Kg4/K
         9vnjnmwLpfjsafeJix1DcQw4MSc8qeFA9aRyUYZxGOsSE8VNU2U6J7jSrLDt0A05HO/h
         WBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680110557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBLp/jpc9y9rMvN5jw6+q5ZIa3l3RNNfXuhJJ0vQxR0=;
        b=MdoRsukD7HOOQWZQiN4nonPAkP86+s61OwodbXXA2wflxzcx4Us6spIMTzSveUDBRs
         9T29bV91ev5YUUnP4mEWM9YhZtL5gQfnxkM2hoWHbm/k/1cVvpGdfzTLTF9v+dG9FRnS
         RyGJNHUErprq2YGivRKz+vIxFbjPmCAlmdgLKmUmGwME32oqLFC8nLJ6fZlm+rTDOQiu
         ji/yQTKUDuBpZMhZ78YE2zyXCGy6rE8pGCSIBxPKLHzxp3xii/mt0tmYOxlcLIWsfzS4
         pAvpU0K8b3m1HgzhggTo/flYnkFpQaprXzLYEMsFvCDvqsiwu4Aosyfkd1MhenOxWbtb
         5jtQ==
X-Gm-Message-State: AO0yUKVIT7oxH8IEFgfCRQ5olTJCWBoYcDhH+VWjE/PxiHKE17361y3T
	CJF5UH8+aO2SZBVJXk2e6wMgNw==
X-Google-Smtp-Source: AK7set/NSAMg6i4zixiSHj3EJSwBQeYlpqO8qP+egSBJ7ZX924oEjLN4eEaaKdMHEOIWuKM4RsdJfA==
X-Received: by 2002:a7b:ca58:0:b0:3ed:93de:49ff with SMTP id m24-20020a7bca58000000b003ed93de49ffmr14877842wml.0.1680110556986;
        Wed, 29 Mar 2023 10:22:36 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id c8-20020a7bc848000000b003eea205671fsm2902356wml.39.2023.03.29.10.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 10:22:36 -0700 (PDT)
Message-ID: <86d79a51-d7d9-897e-9a4a-590987270e05@linaro.org>
Date: Wed, 29 Mar 2023 18:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 06/11] mtd: spi-nor: Parse BFPT to determine the 4-Byte
 Address Mode methods
To: michael@walle.cc, pratyush@kernel.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, Takahiro.Kuwano@infineon.com,
 bacem.daassi@infineon.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
 <20230322064033.2370483-7-tudor.ambarus@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230322064033.2370483-7-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_102243_168558_B29409A8 
X-CRM114-Status: GOOD (  30.81  )
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



On 3/22/23 06:40, Tudor Ambarus wrote:
> BFPT[DWORD(16)] defines the methods to enter and exit the 4-Byte Address
> Mode. Parse BFPT to determine the method. Will rename the methods with
> generic names in a further patch, to keep things trackable in this one.>

I forgot to update the commit message, will respin.

> Some regressions may be introduced by this patch, because the
> params->set_4byte_addr_mode method that was set either in
> spi_nor_init_default_params() or later overwritten in default_init() hooks,
> may now be overwritten with a different value based on the BFPT data. If
> that's the case, the fix is to introduce a post_bfpt fixup hook where one
> should fix the wrong BFPT info.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/sfdp.c    | 11 +++++++++++
>  drivers/mtd/spi-nor/sfdp.h    | 28 ++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/winbond.c | 11 ++++++++++-
>  3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 298ab5e53a8c..63b2810cf75e 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -438,6 +438,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	size_t len;
>  	int i, cmd, err;
>  	u32 addr, val;
> +	u32 dword;
>  	u16 half;
>  	u8 erase_mask;
>  
> @@ -607,6 +608,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		break;
>  	}
>  
> +	dword = bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_4B_ADDR_MODE_MASK;
> +	if (sfdp_bits_set(dword, BFPT_DWORD16_4B_ADDR_MODE_BRWR))
> +		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
> +	else if (sfdp_bits_set(dword, BFPT_DWORD16_4B_ADDR_MODE_WREN_EN4B_EX4B))
> +		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;
> +	else if (sfdp_bits_set(dword, BFPT_DWORD16_4B_ADDR_MODE_EN4B_EX4B))
> +		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
> +	else
> +		dev_dbg(nor->dev, "BFPT: 4-Byte Address Mode method is not recognized or not implemented\n");
> +
>  	/* Soft Reset support. */
>  	if (bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_SWRST_EN_RST)
>  		nor->flags |= SNOR_F_SOFT_RESET;
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index 500659b35655..a4b5fe795f18 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -16,6 +16,8 @@
>  /* SFDP DWORDS are indexed from 1 but C arrays are indexed from 0. */
>  #define SFDP_DWORD(i)		((i) - 1)
>  
> +#define sfdp_bits_set(dword, mask)		(((dword) & (mask)) == (mask))

s/sfdp_bits_set/sfdp_mask_check> +
>  /* Basic Flash Parameter Table */
>  
>  /* JESD216 rev D defines a Basic Flash Parameter Table of 20 DWORDs. */
> @@ -89,6 +91,32 @@ struct sfdp_bfpt {
>  #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
>  #define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
>  
> +#define BFPT_DWORD16_EN4B_MASK			GENMASK(31, 24)
> +#define BFPT_DWORD16_EN4B_ALWAYS_4B		BIT(30)
> +#define BFPT_DWORD16_EN4B_4B_OPCODES		BIT(29)
> +#define BFPT_DWORD16_EN4B_16BIT_NV_CR		BIT(28)
> +#define BFPT_DWORD16_EN4B_BRWR			BIT(27)
> +#define BFPT_DWORD16_EN4B_WREAR			BIT(26)
> +#define BFPT_DWORD16_EN4B_WREN_EN4B		BIT(25)
> +#define BFPT_DWORD16_EN4B_EN4B			BIT(24)
> +#define BFPT_DWORD16_EX4B_MASK			GENMASK(18, 14)
> +#define BFPT_DWORD16_EX4B_16BIT_NV_CR		BIT(18)
> +#define BFPT_DWORD16_EX4B_BRWR			BIT(17)
> +#define BFPT_DWORD16_EX4B_WREAR			BIT(16)
> +#define BFPT_DWORD16_EX4B_WREN_EX4B		BIT(15)
> +#define BFPT_DWORD16_EX4B_EX4B			BIT(14)
> +#define BFPT_DWORD16_4B_ADDR_MODE_MASK			\
> +	(BFPT_DWORD16_EN4B_MASK | BFPT_DWORD16_EX4B_MASK)
> +#define BFPT_DWORD16_4B_ADDR_MODE_16BIT_NV_CR		\
> +	(BFPT_DWORD16_EN4B_16BIT_NV_CR | BFPT_DWORD16_EX4B_16BIT_NV_CR)
> +#define BFPT_DWORD16_4B_ADDR_MODE_BRWR			\
> +	(BFPT_DWORD16_EN4B_BRWR | BFPT_DWORD16_EX4B_BRWR)
> +#define BFPT_DWORD16_4B_ADDR_MODE_WREAR			\
> +	(BFPT_DWORD16_EN4B_WREAR | BFPT_DWORD16_EX4B_WREAR)
> +#define BFPT_DWORD16_4B_ADDR_MODE_WREN_EN4B_EX4B	\
> +	(BFPT_DWORD16_EN4B_WREN_EN4B | BFPT_DWORD16_EX4B_WREN_EX4B)
> +#define BFPT_DWORD16_4B_ADDR_MODE_EN4B_EX4B		\
> +	(BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
>  #define BFPT_DWORD16_SWRST_EN_RST		BIT(12)
>  
>  #define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 9cea241c204b..a1b387accc07 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -218,13 +218,22 @@ static const struct spi_nor_otp_ops winbond_nor_otp_ops = {
>  
>  static void winbond_nor_default_init(struct spi_nor *nor)
>  {
> -	nor->params->set_4byte_addr_mode = winbond_nor_set_4byte_addr_mode;
>  }

I should have got ridden of default_init entirely, it's now an empty
function.
>  
>  static void winbond_nor_late_init(struct spi_nor *nor)
>  {
>  	if (nor->params->otp.org->n_regions)
>  		nor->params->otp.ops = &winbond_nor_otp_ops;
> +
> +	/*
> +	 * Winbond seems to require that the Extended Address Register to be set
> +	 * to zero when exiting the 4-Byte Address Mode, at least for W25Q256FV.
> +	 * This requirement is not described in the JESD216 SFDP standard, thus
> +	 * it is Winbond specific. Since we do not know if other Winbond flashes
> +	 * have the same requirement, play safe and overwrite the method parsed
> +	 * from BFPT, if any.
> +	 */
> +	nor->params->set_4byte_addr_mode = winbond_nor_set_4byte_addr_mode;
>  }
>  
>  static const struct spi_nor_fixups winbond_nor_fixups = {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
