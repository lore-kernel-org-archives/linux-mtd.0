Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00117EB8FAF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqB46KeBpCFuMgMlBx7ASbSaGeSsizB14zqWF5p5NxI=; b=eBuzpFPBLvdm1c
	1qEpWkz48MKTKmNwM2nfaJAxEI7vO9BfQoOEr/2vyZdYB/L1Ec+t058cGNCQTg3FNgzgxflUzbdEn
	bjMcXeCL69nSmMK3IbcM2D/UEGu7tRVXIhw8QUKofe9GD4KV2mtAF7S9a07Hk9BbLMC5x3MREBAKI
	UXQ7SSsOG5my3rEfqf/ZOYoi0yr1zt87DjEtXc44Lpt69qmSHCVLO0UVUU+VuTsr/93kQ336z+gCe
	x0URuCltSA6BBkLHbj6rDSNc4RVgbX4a8vQ//sN+kLSwkSELWjxI4cgAviXk/6+s1aVZFKyJvTakN
	1I7+/Im9N0cK/otgyUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdn8z-007XYD-1v;
	Wed, 06 Sep 2023 07:40:09 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdn8w-007XVb-0Y
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:40:07 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52a3ff5f0abso4744648a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 00:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693985999; x=1694590799; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orvUtnN2ovbrorDPALco13qgAyfYNfZYZYYlqBkdr5o=;
        b=ft5ZgOocWQbpzNh8gefAz/G9S0MQ5no56AIFp7nilT0VKJqJ9GQYRJ+0KFVz4MVLGs
         8KKRKLTd0AYQeGwqrM/wbW49I+qCZ0aT4afYpo/fmBfuJKldHq/gObUx/WlcNORCdwao
         CuYH+3RSUtYcwRtOVhS/qsbkD4+VD1tbR/plIaRbhQ9m0qtt6OO+ffayJuY5JHIDx32f
         EwYhI2NCBdzA4SjPbOYXzUVZ+wAnmi3gFNoETWGa6P+rg9VOyur9JJxGA2dzaGquwqSZ
         Lx/zMlMFnWIV5k+Rxs+idMDRXGlNbExP3LRe1WnUAU8yW1YIWYOIXK1TyVz4RLJFcHgJ
         hJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693985999; x=1694590799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orvUtnN2ovbrorDPALco13qgAyfYNfZYZYYlqBkdr5o=;
        b=HAJyIs/ysp0EmsRLDCjoae9QCd0/zaFLC42omsYqpLEAPix8d22OSJThwzix136Nrg
         nRH444OPfknqYjHzlKGKBPNy4Sl4pLrPFZcv+ode/xz6nNefKYiSuYVfZ93xomFB/jNY
         +xPIJ2xxwjVHhoEIy7G/LI6g5FXTIJDTMCbJ45O4QTXWsQQXupAMk+GIttUx6TgBZMAS
         AhgnPRLC+oBviLpLbfv0OKiFTNq5KdBwD4XMZyvbI3a/XhRQqNIU3CNv6idZPAdxN/mN
         9HndRE5YxEqCx+CIp7jWRIV+kww5Io+pVk4RCbf8DRZ9HoX+gBAzePx2lcmHltpnK6a/
         dLZA==
X-Gm-Message-State: AOJu0YxeLQzirKfxZ5+90qx8NjCs8JaL6AD/UY2MHNgqj9Ux2YrCRrg7
	NkznpEkEN0iDSfBd6GLtfs652w==
X-Google-Smtp-Source: AGHT+IHiQSnCMmZF2IYo0dQojmRNvIMHTjIHbz8K7G0CiRy1PCg/A0xcmeRnekZzhuBTvgBwx/GFqg==
X-Received: by 2002:a17:907:a056:b0:9a6:4f23:9d8f with SMTP id gz22-20020a170907a05600b009a64f239d8fmr1555676ejc.47.1693985999381;
        Wed, 06 Sep 2023 00:39:59 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id c11-20020a170906924b00b009929ab17be0sm8607665ejx.162.2023.09.06.00.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:39:58 -0700 (PDT)
Message-ID: <47dbbc77-6ff4-2a5e-213e-f909ee90805f@linaro.org>
Date: Wed, 6 Sep 2023 10:39:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 40/41] mtd: spi-nor: atmel: drop duplicate entry
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-40-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-40-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_004006_252320_6338015C 
X-CRM114-Status: GOOD (  18.12  )
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
> The Atmel AT26DF321 and AT25DF321 have the same ID. Both were just
> discovered by reading their IDs, that is, there is no probing by name.
> Thus only the first one in the list was ever probed. The AT25DF is the
> newer series. Drop the older one.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

keep the first entry, to have the name backward compatible. It's not a
hard rule to have the name backward compatible, but if we can, let's
keep it.


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/spi-nor/atmel.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 18e904962d0e..95f0e139284e 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -206,13 +206,6 @@ static const struct flash_info atmel_nor_parts[] = {
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
>  		.no_sfdp_flags = SECT_4K,
>  		.fixups = &atmel_nor_global_protection_fixups
> -	}, {
> -		.id = SNOR_ID(0x1f, 0x47, 0x00),
> -		.name = "at26df321",
> -		.size = SZ_4M,
> -		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
> -		.no_sfdp_flags = SECT_4K,
> -		.fixups = &atmel_nor_global_protection_fixups
>  	}, {
>  		.id = SNOR_ID(0x1f, 0x47, 0x01),
>  		.name = "at25df321a",
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
