Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FE7C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 06:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PaErrr6z8XmhCjZVMlqDuEV6AE4UU3iEUddQWlpTUD4=; b=fWi1OGFKpCn9r/
	Gpotmu00qddoeKNNg4gXHahp69nNlE5k8PjRH3s3opOLtFVZXVV9mcamSl4hIGw79j8bEpQrf1pk6
	YnKLQw8Lixx/ZjJlxfibnhqMODDh4oVU4lypBb8ar7Zvs0tGvG6y/iDCm2iEVR03TY1vbNx0drZMq
	BmbKSqoVGaqeGm+1dp40NpsXAKPoayXjcG3SgdNWNbsFHhoTki35ZsNsXWvJmebSy6/T8jKZXxcOq
	LGapKVnIWyPO+nzWXnPU6zoE3Dk6hs2ZRWLzVZRAwIPt1BXCV+w4SIavrqDMkQtsdsM7YHzcdOUob
	1taM+OdCmFZ3NIl7ACQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE1xQ-002DWy-0E;
	Fri, 15 Dec 2023 06:46:00 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE1xM-002DVP-38
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 06:45:58 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bfd3a5b54so294010e87.3
        for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2023 22:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702622754; x=1703227554; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3p/HzF5jq6ohoq4RyDSMlsycSg18j3MvCykR2ikHThQ=;
        b=DzzKtVzglSLidPYhnnl7jKHPSEVeURqjuuxP94L6c7X9WVXdbj3u7SsL1UrPUDfQEG
         ol11tjqqjU+xJzhJrdOYxwNGpea0GDQ/Y7P5aM6BQet1v5HKVipJ1eJ4/QDm6lQ5HKL1
         3KgCJrHv/jNzCGHpNQ84yA+JB6z8s0w+I1fYRoINP9MpLfDVZV/QM321ob1EC9q+Tc4E
         nKKKx+sIz7oCqzUk3VSGzrfXQ8liorAp8WWXsGdu9yXKzVZg0UyKqNBfU+Bljh1B9gZ2
         gOCekFTqi91MU4rkKj0cvFKXqR1SLcf7Jk5x+kkUgZetLvbRWbfy4ey5fYLLCY6w4fg0
         WSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702622754; x=1703227554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3p/HzF5jq6ohoq4RyDSMlsycSg18j3MvCykR2ikHThQ=;
        b=llkPqNJhgMSNmXb301KgN5MdGMGDmIuMs/jFrcBQBquwmyhqW5k/4JhVka4brc7YKx
         dD8Ylrds/fuDuOuaJR3LIHFFZ9DSNI0LilXFEngAGUA+u5YVn1ksJr0TTAiCDsFGrNcV
         fFV9gdJzZS2GpnjXxK0O4JdNd8YAzk3pwzRPIeSoO5cJCfo6q0TmVHVC5F4KfRTlMfiK
         8cisrZwSooKjtEVU0bDFdq3HLa9BE0fKwa1EC49XKQg+T3dIhCbKpv3dycFFFZDmczsJ
         eZsKfC8isgGBjY81rT6yWfCQ4JdZvNTaT75WGz35MpqwMdQYUg5ioFB/15GRi0pkPew0
         Kr4Q==
X-Gm-Message-State: AOJu0YzpdTdV5JaIp1nCJgx1uHHOCidqcjN3AB5mfMcfKamTZ/psPFnR
	sCVE1qVZ8q00zlawA20P+eqeuQ==
X-Google-Smtp-Source: AGHT+IFy5BIHZ1VIEWKtQt1IUt57+zq1iFZInoWfdl8bsdWlhjJ1MwfxGRiz96Fm+w4c/Xj1UdjCwg==
X-Received: by 2002:a05:6512:3da2:b0:50d:12fe:4881 with SMTP id k34-20020a0565123da200b0050d12fe4881mr7381528lfv.4.1702622754447;
        Thu, 14 Dec 2023 22:45:54 -0800 (PST)
Received: from [192.168.2.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id es21-20020a056402381500b0055267663784sm1527898edb.11.2023.12.14.22.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 22:45:54 -0800 (PST)
Message-ID: <a55b1338-d15c-4d1c-8b81-0d7a3913ec0a@linaro.org>
Date: Fri, 15 Dec 2023 08:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from
 BFPT
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231214073344.66644-1-jaimeliao.tw@gmail.com>
 <20231214073344.66644-2-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231214073344.66644-2-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_224557_068557_E45F332A 
X-CRM114-Status: GOOD (  18.46  )
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

Hi, Jaime,

Please update the commit subject to indicate that you parse 4BAIT as well.

On 14.12.2023 09:33, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> BFPT 17th DWORD contains the informations about 1-1-8,

Please run checkpatch on further submissions:
./scripts/checkpatch.pl --strict 000*
WARNING: 'informations' may be misspelled - perhaps 'information'?
#6:
BFPT 17th DWORD contains the informations about 1-1-8,
                             ^^^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 46 lines checked


> Parse BFPT 17 DWORD instruction to determine
> whether flash support 1-1-8, and set its dummy cycle
> accordingly.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 13 ++++++++++++-
>  drivers/mtd/spi-nor/sfdp.h |  3 +++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index b3b11dfed789..c55f39978762 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -446,6 +446,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	u32 dword;
>  	u16 half;
>  	u8 erase_mask;
> +	u8 dummy, opcode;
>  
>  	/* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
>  	if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
> @@ -525,7 +526,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_erases); i++) {
>  		const struct sfdp_bfpt_erase *er = &sfdp_bfpt_erases[i];
>  		u32 erasesize;
> -		u8 opcode;
>  
>  		half = bfpt.dwords[er->dword] >> er->shift;
>  		erasesize = half & 0xff;
> @@ -631,6 +631,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
>  		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
>  
> +	/* Parse 1-1-8 read instruction */
> +	opcode = FIELD_GET(BFPT_DWORD17_RD_1_1_8_CMD, bfpt.dwords[SFDP_DWORD(17)]);
> +	if (opcode) {
> +		dummy = FIELD_GET(BFPT_DWORD17_RD_1_1_8_DUMMY, bfpt.dwords[SFDP_DWORD(17)]);
> +		nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
> +		spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_1_8],
> +					  0, dummy, opcode,
> +					  SNOR_PROTO_1_1_8);
> +	}

You missed the mode clocks. You missed to parse 1-8-8. Please check how
the read settings are parsed and set in parse_bfpt() and do the same
here. See:
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/drivers/mtd/spi-nor/sfdp.c?h=spi-nor/next#n502

> +
>  	/* 8D-8D-8D command extension. */
>  	switch (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
>  	case BFPT_DWORD18_CMD_EXT_REP:
> @@ -968,6 +978,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
>  		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
>  		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
> +		{ SNOR_HWCAPS_READ_1_1_8,	BIT(20) },

let's set 1-8-8 as well please

>  	};
>  	static const struct sfdp_4bait programs[] = {
>  		{ SNOR_HWCAPS_PP,		BIT(6) },
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index 6eb99e1cdd61..584a05f9931d 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -118,6 +118,9 @@ struct sfdp_bfpt {
>  	(BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
>  #define BFPT_DWORD16_SWRST_EN_RST		BIT(12)
>  
> +#define BFPT_DWORD17_RD_1_1_8_CMD		GENMASK(31, 24)
> +#define BFPT_DWORD17_RD_1_1_8_DUMMY		GENMASK(20, 16)
> +
>  #define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
>  #define BFPT_DWORD18_CMD_EXT_REP		(0x0UL << 29) /* Repeat */
>  #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
