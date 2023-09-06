Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13512EB8FAF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VaIzFAkt6CpV+5VuK2UcgySDhNAOuBlVXeoRMHC2tac=; b=d4Z7VV1P5fhRoW
	h5ht2kBBDSa1Eo/PxinLKE+cGmZQrs6wNuOoMeAS2e5ohJKvGdgEjNpBjyw32UsR7XE3WXAQQuwCH
	Ol+2MBxFtaj1szSAmigPb+79lQJekQClKBUUyb8BBeXJEQQiYTp9XZdX2hSE1jzlfOijuFnTKAl/u
	H9esyqjMYWbR77W7mYH0GndYFmYcnPKdzws2CXSAzLhEjtpFfEZGIYrOu+TCQ3CAHHvu4j/wXX/Zf
	X05z7yTgngvgjgc8YLYLOEULv0wKGxr3nU4gcT7aYdmkz+U0FqY1YfKLyo1Nr8vGcglkloMd6bHc7
	mfnFpEaIiGAcEZvrlj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdn5t-007Wig-1M;
	Wed, 06 Sep 2023 07:36:57 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdn5q-007Wgq-0i
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:36:55 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bd0bc8b429so56561221fa.2
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 00:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693985809; x=1694590609; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3kMRwBIHC7L8+hEho76HheQRei1P0MX42m7+GGNLw4=;
        b=KKh6e+F4547TTcK49cNh/BoFK2Md3cwklJlLNQCAMdmfwMkDjOSyyE3jEbXHo/+Aow
         qFIyj5H3xzlrJ/DE8wnvU6VwvYgK9+SAWQgj/rdCU2z/fxbgA2WwVu9IF7Kveobs17P6
         73QLiunTx5CHF54EUCINXBHZWC/Rjd1nLztjlrDIYVd5BifEjBIz4I4N5ZvovRSwdXwz
         qaWtPM/zEw9JTBVPGdTtxl6a+fYS8PFsFmx/F92N+M3erNy4KN0U60Pem5plXPEaHBNM
         KHfWeZFayelgMzPqBVSonh3NwGsNrtFgLQ/C5cUTmmDDLQDFYYd7xTgRNcHDgz0LWeoG
         yqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693985809; x=1694590609;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3kMRwBIHC7L8+hEho76HheQRei1P0MX42m7+GGNLw4=;
        b=jepsUbVsgFwnmkMvE/vvI0Jv7X+5587QyYO2Vuym42ZUlt1hycKJj81cuAuxoYxTCB
         8pg1yNwOnFt/aD7GgZIMg/EiUrLdVEPtlnHsyiK9JeyI78Rt5gTGa3d6+HKBgH6E54Gb
         4521ZVoc/qrTovmL/AxdVMhho8oeftKu2j+qCT/hUITY8UPp3ANw0/5M/9TSmnmx91Wc
         OQWL+C+nLSbIJhF8hV/MZxOZeF3NJZWjs86dD/4MNYqhpP1ju8TcyW0p9sw6kFOf2hqm
         4IcHor8ZuTjayegNBy+eGQl/PoDcBKlzU/Whf5qf+0oicVXYGyjmR8oVlFSB2pfHYJgg
         jQXw==
X-Gm-Message-State: AOJu0Yz88ecj/NIaL5Qj/RAwJLfUt6tzoib3WnBvEQjVRoelk3TocY25
	3tNNthfj37koZe2TnsOQntjJVg==
X-Google-Smtp-Source: AGHT+IF0P5fI6+5e3fP2lk2EB2fGR+1oTVzbbUKz9IKexLEKvu26Dsutoepc01lrH+mHTeAdv6rGPg==
X-Received: by 2002:a2e:3e1a:0:b0:2be:5b09:5544 with SMTP id l26-20020a2e3e1a000000b002be5b095544mr1417388lja.27.1693985809487;
        Wed, 06 Sep 2023 00:36:49 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d6844000000b003197b85bad2sm19652385wrw.79.2023.09.06.00.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:36:49 -0700 (PDT)
Message-ID: <eec52fd8-663d-7e56-3627-2b33259027b6@linaro.org>
Date: Wed, 6 Sep 2023 10:36:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 39/41] mtd: spi-nor: winbond: sort flash_info entries
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-39-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-39-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_003654_263837_8D096ECC 
X-CRM114-Status: GOOD (  16.47  )
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
> The flash ID is the new primary key into our database. Sort the entry by
> it. Keep the most specific ones first, because there might be ID
> collisions between shorter and longer ones.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

I'm fine with the sorting by ID.


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/spi-nor/winbond.c | 166 +++++++++++++++++++++---------------------
>  1 file changed, 83 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 1f95c4ccecd9..6ce50c3f3c27 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -72,37 +72,25 @@ static const struct flash_info winbond_nor_parts[] = {
>  		.name = "w25x16",
>  		.size = SZ_2M,
>  		.no_sfdp_flags = SECT_4K,
> -	}, {
> -		.id = SNOR_ID(0xef, 0x60, 0x15),
> -		.name = "w25q16dw",
> -		.size = SZ_2M,
> -		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> -		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x30, 0x16),
>  		.name = "w25x32",
>  		.size = SZ_4M,
>  		.no_sfdp_flags = SECT_4K,
>  	}, {
> -		.id = SNOR_ID(0xef, 0x70, 0x15),
> -		.name = "w25q16jv-im/jm",
> -		.size = SZ_2M,
> -		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> -		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +		.id = SNOR_ID(0xef, 0x30, 0x17),
> +		.name = "w25x64",
> +		.size = SZ_8M,
> +		.no_sfdp_flags = SECT_4K,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x40, 0x12),
>  		.name = "w25q20cl",
>  		.size = SZ_256K,
>  		.no_sfdp_flags = SECT_4K,
>  	}, {
> -		.id = SNOR_ID(0xef, 0x50, 0x12),
> -		.name = "w25q20bw",
> -		.size = SZ_256K,
> -		.no_sfdp_flags = SECT_4K,
> -	}, {
> -		.id = SNOR_ID(0xef, 0x60, 0x12),
> -		.name = "w25q20ew",
> -		.size = SZ_256K,
> +		.id = SNOR_ID(0xef, 0x40, 0x14),
> +		.name = "w25q80bl",
> +		.size = SZ_1M,
>  		.no_sfdp_flags = SECT_4K,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x40, 0x16),
> @@ -110,57 +98,84 @@ static const struct flash_info winbond_nor_parts[] = {
>  		.size = SZ_4M,
>  		.no_sfdp_flags = SECT_4K,
>  	}, {
> -		.id = SNOR_ID(0xef, 0x60, 0x16),
> -		.name = "w25q32dw",
> -		.size = SZ_4M,
> +		.id = SNOR_ID(0xef, 0x40, 0x17),
> +		.name = "w25q64",
> +		.size = SZ_8M,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id = SNOR_ID(0xef, 0x40, 0x18),
> +		.name = "w25q128",
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +	}, {
> +		.id = SNOR_ID(0xef, 0x40, 0x19),
> +		.name = "w25q256",
> +		.size = SZ_32M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> -		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
> +		.fixups = &w25q256_fixups,
>  	}, {
> -		.id = SNOR_ID(0xef, 0x70, 0x16),
> -		.name = "w25q32jv",
> -		.size = SZ_4M,
> +		.id = SNOR_ID(0xef, 0x40, 0x20),
> +		.name = "w25q512jvq",
> +		.size = SZ_64M,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id = SNOR_ID(0xef, 0x50, 0x12),
> +		.name = "w25q20bw",
> +		.size = SZ_256K,
> +		.no_sfdp_flags = SECT_4K,
> +	}, {
> +		.id = SNOR_ID(0xef, 0x50, 0x14),
> +		.name = "w25q80",
> +		.size = SZ_1M,
> +		.no_sfdp_flags = SECT_4K,
> +	}, {
> +		.id = SNOR_ID(0xef, 0x60, 0x12),
> +		.name = "w25q20ew",
> +		.size = SZ_256K,
> +		.no_sfdp_flags = SECT_4K,
> +	}, {
> +		.id = SNOR_ID(0xef, 0x60, 0x15),
> +		.name = "w25q16dw",
> +		.size = SZ_2M,
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
> -		.id = SNOR_ID(0xef, 0x80, 0x16),
> -		.name = "w25q32jwm",
> +		.id = SNOR_ID(0xef, 0x60, 0x16),
> +		.name = "w25q32dw",
>  		.size = SZ_4M,
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
>  	}, {
> -		.id = SNOR_ID(0xef, 0x80, 0x17),
> -		.name = "w25q64jwm",
> +		.id = SNOR_ID(0xef, 0x60, 0x17),
> +		.name = "w25q64dw",
>  		.size = SZ_8M,
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
> -		.id = SNOR_ID(0xef, 0x80, 0x18),
> -		.name = "w25q128jwm",
> +		.id = SNOR_ID(0xef, 0x60, 0x18),
> +		.name = "w25q128fw",
>  		.size = SZ_16M,
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
> -		.id = SNOR_ID(0xef, 0x80, 0x19),
> -		.name = "w25q256jwm",
> +		.id = SNOR_ID(0xef, 0x60, 0x19),
> +		.name = "w25q256jw",
>  		.size = SZ_32M,
> -		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
> -		.id = SNOR_ID(0xef, 0x30, 0x17),
> -		.name = "w25x64",
> -		.size = SZ_8M,
> -		.no_sfdp_flags = SECT_4K,
> +		.id = SNOR_ID(0xef, 0x60, 0x20),
> +		.name = "w25q512nwq",
> +		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
>  	}, {
> -		.id = SNOR_ID(0xef, 0x40, 0x17),
> -		.name = "w25q64",
> -		.size = SZ_8M,
> +		.id = SNOR_ID(0xef, 0x70, 0x15),
> +		.name = "w25q16jv-im/jm",
> +		.size = SZ_2M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
> -		.id = SNOR_ID(0xef, 0x60, 0x17),
> -		.name = "w25q64dw",
> -		.size = SZ_8M,
> +		.id = SNOR_ID(0xef, 0x70, 0x16),
> +		.name = "w25q32jv",
> +		.size = SZ_4M,
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
> @@ -168,64 +183,49 @@ static const struct flash_info winbond_nor_parts[] = {
>  		.name = "w25q64jvm",
>  		.size = SZ_8M,
>  		.no_sfdp_flags = SECT_4K,
> -	}, {
> -		.id = SNOR_ID(0xef, 0x60, 0x18),
> -		.name = "w25q128fw",
> -		.size = SZ_16M,
> -		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> -		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x70, 0x18),
>  		.name = "w25q128jv",
>  		.size = SZ_16M,
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> -	}, {
> -		.id = SNOR_ID(0xef, 0x50, 0x14),
> -		.name = "w25q80",
> -		.size = SZ_1M,
> -		.no_sfdp_flags = SECT_4K,
> -	}, {
> -		.id = SNOR_ID(0xef, 0x40, 0x14),
> -		.name = "w25q80bl",
> -		.size = SZ_1M,
> -		.no_sfdp_flags = SECT_4K,
> -	}, {
> -		.id = SNOR_ID(0xef, 0x40, 0x18),
> -		.name = "w25q128",
> -		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> -	}, {
> -		.id = SNOR_ID(0xef, 0x40, 0x19),
> -		.name = "w25q256",
> -		.size = SZ_32M,
> -		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> -		.fixups = &w25q256_fixups,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x70, 0x19),
>  		.name = "w25q256jvm",
> -	}, {
> -		.id = SNOR_ID(0xef, 0x60, 0x19),
> -		.name = "w25q256jw",
> -		.size = SZ_32M,
> -		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x71, 0x19),
>  		.name = "w25m512jv",
>  		.size = SZ_64M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
> -		.id = SNOR_ID(0xef, 0x60, 0x20),
> -		.name = "w25q512nwq",
> +		.id = SNOR_ID(0xef, 0x80, 0x16),
> +		.name = "w25q32jwm",
> +		.size = SZ_4M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
> +	}, {
> +		.id = SNOR_ID(0xef, 0x80, 0x17),
> +		.name = "w25q64jwm",
> +		.size = SZ_8M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id = SNOR_ID(0xef, 0x80, 0x18),
> +		.name = "w25q128jwm",
> +		.size = SZ_16M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id = SNOR_ID(0xef, 0x80, 0x19),
> +		.name = "w25q256jwm",
> +		.size = SZ_32M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x80, 0x20),
>  		.name = "w25q512nwm",
>  		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
> -	}, {
> -		.id = SNOR_ID(0xef, 0x40, 0x20),
> -		.name = "w25q512jvq",
> -		.size = SZ_64M,
> -		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	},
>  };
>  
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
