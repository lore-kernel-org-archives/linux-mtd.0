Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDCDEB8FAF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0poi8+kU1fw34zdedJUa8wAp7fMY1CzpYzzzWY9v3GY=; b=lFpBEFWUutPkWT
	V8DwLOVGjJMJ2it1UTQLyM6MYQj/0LYLOONz4PHZ4klBfqfB8vwCI9nm+zgWoTGl/waf/1NuCxkYt
	zAHAmkgTakxEJU6h8dC8OOQUJdBZsfOmpaH6yBkkPsYjG5FpclPDJr91x6giAQN92o5LpK7ufv86F
	gEa9Iy9FpAX76iCTlCSR26wVkMb1o+lYE6f4ENWXAc9Y8Whn1oB427p6Ok6h7qDNS6ugrs2jpJfHi
	qkFoRtYe0yZECGIWsUueDSFj0VrlANebRJxefdQcAOQGP89Ulcoi1KK6RsfnZU30/yO2IG+wy4JGK
	fG/8yv/vteufjaSdv1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdn4A-007WIZ-25;
	Wed, 06 Sep 2023 07:35:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdn47-007WGR-0b
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:35:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401da71b85eso31960025e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693985702; x=1694590502; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4F7Avj7xOpfFljV7YI4ozRVD1XpBz9VLRFq4+FFIk9Y=;
        b=R4ZEqTs55U2Fv3HANIK9fAskLpz52eYEz4yOcERNxZTt7qjRSVCEb1CRLpvzgHJJYc
         ykg2END5Jt7qVTTttJG8wXKhlSlxLzJFfLeGXJemvjUJCHEDOSvMyX3l5FM8D4ILHe5l
         dCZcHlLh7BI/rkP6S4fKdSm4UbJE4+1I30t1c46w5J/dBImOGw5bNMA/HdPAYqwT7/sU
         LpuORP1IfjYGebHLDN3+7JEoO2EKQELEk6RUblU4ouxA198u78ckL2Nx3cHTsl9RhCU0
         yIjK2F7Wa4lwCXOXQ90jbxrqefNIE2IUFAbLfj11G+PRhBbCS5xEDfUx5w2e3IUCIs5P
         NnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693985702; x=1694590502;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4F7Avj7xOpfFljV7YI4ozRVD1XpBz9VLRFq4+FFIk9Y=;
        b=YhvQ86NaYTF5c+3UZNKHYd5REn7I4kaS/s+at3T4OP84mqYeb1579NWjVvJjyCzWln
         71P7LAi6tZpwXcGYybddI7/mSlhu6qVAvmJIYwt0KOteXfwlqv0Shz8ULutJyVImtSDv
         M/qpUNJev237/DnOtyEK+FCcBwEyPb4Fi3zt0xYOK9DW66mFRWt3No5MWQIVe5lYxOQL
         xDpRTWOT0uX2LpzqQts+P8mO1uRTShJtX99G4RLIXdTa63Otq7pxFsGnPhE0ATMzLc+7
         UGnk9g5tQvtOeoaJXc/F3fHNm1jeF5HP1dofaYkiVPnruUd9UeZJKn5idOWsMZWHYyQC
         Vhbw==
X-Gm-Message-State: AOJu0YwOq24ehU+jhP7WmwU9Qz5MWc7uAsC8iIqljWbOq+hmoolGuw8/
	2Ck31QZ0/qXcyeyL5w0dbLmr1A==
X-Google-Smtp-Source: AGHT+IHh1yamYKvDysTndoWYxNsCGmDQHLNw1NTFk2BhlSy7HbT7tCjf0h4kvVxjEEPOM1nWodUk0Q==
X-Received: by 2002:a1c:7c0e:0:b0:3fe:5501:d293 with SMTP id x14-20020a1c7c0e000000b003fe5501d293mr1386719wmc.30.1693985702633;
        Wed, 06 Sep 2023 00:35:02 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c294500b003fa96fe2bd9sm22123894wmd.22.2023.09.06.00.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:35:02 -0700 (PDT)
Message-ID: <aba618e2-ad74-d716-c8d7-e77588b22509@linaro.org>
Date: Wed, 6 Sep 2023 10:35:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 17/41] mtd: spi-nor: atmel: convert flash_info to new
 format
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-17-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-17-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_003507_231473_60F40E4D 
X-CRM114-Status: GOOD (  16.97  )
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
> The INFOx() macros are going away. Convert the flash_info database to
> the new format.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mtd/spi-nor/atmel.c | 122 +++++++++++++++++++++++++++++---------------
>  1 file changed, 80 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index d2de2cb0c066..ccc985c48ae3 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -163,48 +163,86 @@ static const struct spi_nor_fixups atmel_nor_global_protection_fixups = {
>  };
>  
>  static const struct flash_info atmel_nor_parts[] = {
> -	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4)
> -		FLAGS(SPI_NOR_HAS_LOCK)
> -		NO_SFDP_FLAGS(SECT_4K)
> -		.fixups = &at25fs_nor_fixups },
> -	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8)
> -		FLAGS(SPI_NOR_HAS_LOCK)
> -		NO_SFDP_FLAGS(SECT_4K)
> -		.fixups = &at25fs_nor_fixups },
> -	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8)
> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -		NO_SFDP_FLAGS(SECT_4K)
> -		.fixups = &atmel_nor_global_protection_fixups },
> -	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64)
> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -		NO_SFDP_FLAGS(SECT_4K)
> -		.fixups = &atmel_nor_global_protection_fixups },
> -	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64)
> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -		NO_SFDP_FLAGS(SECT_4K)
> -		.fixups = &atmel_nor_global_protection_fixups },
> -	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128)
> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -		NO_SFDP_FLAGS(SECT_4K)
> -		.fixups = &atmel_nor_global_protection_fixups },
> -	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64)
> -		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> -	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
> -		NO_SFDP_FLAGS(SECT_4K) },
> -	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -		NO_SFDP_FLAGS(SECT_4K)
> -		.fixups = &atmel_nor_global_protection_fixups },
> -	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32)
> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -		NO_SFDP_FLAGS(SECT_4K)
> -		.fixups = &atmel_nor_global_protection_fixups },
> -	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64)
> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -		NO_SFDP_FLAGS(SECT_4K)
> -		.fixups = &atmel_nor_global_protection_fixups },
> -	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16)
> -		NO_SFDP_FLAGS(SECT_4K) },
> +	{
> +		.id = SNOR_ID(0x1f, 0x66, 0x01),
> +		.name = "at25fs010",

nitpick, we shall respect the order of the members declared in
flash_info struct.

And I'll let you double check if the conversion is accurate :D.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> +		.sector_size = SZ_32K,
> +		.size = SZ_128K,
> +		.flags = SPI_NOR_HAS_LOCK,
> +		.no_sfdp_flags = SECT_4K,
> +		.fixups = &at25fs_nor_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x66, 0x04),
> +		.name = "at25fs040",
> +		.size = SZ_512K,
> +		.flags = SPI_NOR_HAS_LOCK,
> +		.no_sfdp_flags = SECT_4K,
> +		.fixups = &at25fs_nor_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x44, 0x01),
> +		.name = "at25df041a",
> +		.size = SZ_512K,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
> +		.no_sfdp_flags = SECT_4K,
> +		.fixups = &atmel_nor_global_protection_fixups,
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x47, 0x00),
> +		.name = "at25df321",
> +		.size = SZ_4M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
> +		.no_sfdp_flags = SECT_4K,
> +		.fixups = &atmel_nor_global_protection_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x47, 0x01),
> +		.name = "at25df321a",
> +		.size = SZ_4M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
> +		.no_sfdp_flags = SECT_4K,
> +		.fixups = &atmel_nor_global_protection_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x48, 0x00),
> +		.name = "at25df641",
> +		.size = SZ_8M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
> +		.no_sfdp_flags = SECT_4K,
> +		.fixups = &atmel_nor_global_protection_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x42, 0x16),
> +		.name = "at25sl321",
> +		.size = SZ_4M,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x04, 0x00),
> +		.name = "at26f004",
> +		.size = SZ_512K,
> +		.no_sfdp_flags = SECT_4K,
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x45, 0x01),
> +		.name = "at26df081a",
> +		.size = SZ_1M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
> +		.no_sfdp_flags = SECT_4K,
> +		.fixups = &atmel_nor_global_protection_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x46, 0x01),
> +		.name = "at26df161a",
> +		.size = SZ_2M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
> +		.no_sfdp_flags = SECT_4K,
> +		.fixups = &atmel_nor_global_protection_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x47, 0x00),
> +		.name = "at26df321",
> +		.size = SZ_4M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
> +		.no_sfdp_flags = SECT_4K,
> +		.fixups = &atmel_nor_global_protection_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x25, 0x00),
> +		.name = "at45db081d",
> +		.size = SZ_1M,
> +		.no_sfdp_flags = SECT_4K,
> +	},
>  };
>  
>  const struct spi_nor_manufacturer spi_nor_atmel = {
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
