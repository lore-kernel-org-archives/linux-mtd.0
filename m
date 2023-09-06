Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCB1EB8FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzuEcQH3YC4hzsh0Ut2EPfLjdfalcGpQprx681IRsOA=; b=iS2g1fwbQXV2Pi
	kf0nUGNw3DJPA+AhRj8k7dQrFbQDRYZinVKyv2bCC5baBtWGJFw2KshorZ6X229SZQyf7+zpCxVNk
	iPl4efH3yWamyiE3xNhn+EFtB0Y/kne/eZjaRC2xAMVO86R8gEtPJ/Bvvk0SX2lBREoGTJwk0w9WY
	6vrAtpf/FfWlLczwduSaC/4B0+MJpt1NxodWlHW1i5Odd9i0p35sqzRODRJx4+lOtbEXh+RP1WoXR
	xVsa8q8Zb6dZj1hRg4NIKMRdgtJJe1exFc5Gthz7l2nyoshyAjZu2KrW33G6G3cqmBS5+lu3CozW4
	F/X9OWWxjNU0HNnyhiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmut-007UUL-1X;
	Wed, 06 Sep 2023 07:25:35 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmuq-007UTb-1s
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:25:33 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bcc846fed0so52314741fa.2
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 00:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693985131; x=1694589931; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mUAOYZdXRcgmDE4GJOIyJRjMyBBPbYoHip/KFygnL6I=;
        b=b3FSP5B1m2v+VsJgh8lau4wE5Sche/kmJmDo3R/v6OnCuoVHP9d+33CWPi+XU+6DgQ
         aXVI9iNpewbnlb2lLadfXF+f8ZzHgfhbyZzxPqTtEIc3wxPXf7feD5XrczCE0wR+NVV6
         pgz1kooaOxBlZhZ/ZptnUiPCLjL7IDmwRujc1XN0/CuVojzrBkpNjL/x5jwT7uiBRxak
         Xq9eKGpW0nfz/KmIKkH+oB4w4h7EFwzdEg9AHSMYucbQQwTuiwmBzshz4srmFhEgKa6V
         odxTP3fcULqoJFKcqI5adlnKp7WHfm7WOf3lEXGSq8bNCmNlohTj1RPUYajWn5vm2ew4
         GX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693985131; x=1694589931;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUAOYZdXRcgmDE4GJOIyJRjMyBBPbYoHip/KFygnL6I=;
        b=LopofLDdFxV3DyzqdOcd4VkLm8y6dFJ5K2vMDYhKRmUqxBD5OLr84diNoMvRCWtXGI
         4XGS6LzqBG8E2cKRfu4G8dIbFgaoFPwYZEjR0Ahas68THXjUnyPHnUSbpXnqFmPeQJHH
         T6HuTUCMIMhseocJuzZDsMX3SRkogY/Am7fAJltcXeVjctFaNvvSiv55LPscguIQnVpr
         ATtAdxGqqF3XMmqU4yFu3w2s3+bPq1CfZQKYG1+NIk1D8oHaWv8d7y6meHnESaS59RRh
         0e7OpizRyIY+pEuBFWQIdw+25DcFj7dp9v217l74e0/p307FviitcMR8wwnVA4PrxgVB
         6wNA==
X-Gm-Message-State: AOJu0YzV03Zw+Z+ZriSE+ai96LpdubU6gK55kPSkAvny7u+ZYqAtDm0n
	vZ+51zkuH2fObub/mvvlBs9YGw==
X-Google-Smtp-Source: AGHT+IGkbZGflpIW5BJD/uJXYniQZ1XaQe3cfHAUvuH3jHWmBuLCMVyCFN4J0k3Fj5x5wa+Nspf96g==
X-Received: by 2002:a2e:9016:0:b0:2b7:11f8:27d with SMTP id h22-20020a2e9016000000b002b711f8027dmr1422317ljg.7.1693985130776;
        Wed, 06 Sep 2023 00:25:30 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c1d0800b003fef6881350sm19682389wms.25.2023.09.06.00.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:25:30 -0700 (PDT)
Message-ID: <fdd524be-c339-09b1-e306-8002ee851b31@linaro.org>
Date: Wed, 6 Sep 2023 10:25:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 14/41] mtd: spi-nor: rename .otp_org to .otp and make
 it a pointer
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-14-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-14-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_002532_639108_4EDE80A6 
X-CRM114-Status: GOOD (  18.44  )
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



On 22.08.2023 10:09, Michael Walle wrote:
> Move the OTP ops out of the flash_info structure. Besides of saving some
> space, there will be a new macro SNOR_OTP() which can be used to set the
> ops:
>   .otp = SNOR_OTP(...),
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  drivers/mtd/spi-nor/core.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 80c340c7863a..1c443fe568cf 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2978,7 +2978,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>  	struct device_node *np = spi_nor_get_flash_node(nor);
>  
>  	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
> -	params->otp.org = &info->otp_org;
> +	params->otp.org = info->otp;
>  
>  	/* Default to 16-bit Write Status (01h) Command */
>  	nor->flags |= SNOR_F_HAS_16BIT_SR;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 81535f31907f..c22f5cf65a58 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -555,7 +555,7 @@ struct flash_info {
>  
>  	u8 mfr_flags;
>  
> -	const struct spi_nor_otp_organization otp_org;
> +	const struct spi_nor_otp_organization *otp;
>  	const struct spi_nor_fixups *fixups;
>  };
>  
> @@ -605,7 +605,7 @@ struct flash_info {
>  		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
>  
>  #define OTP_INFO(_len, _n_regions, _base, _offset)			\
> -		.otp_org = {						\
> +		.otp = &(const struct spi_nor_otp_organization){	\
>  			.len = (_len),					\
>  			.base = (_base),				\
>  			.offset = (_offset),				\
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
