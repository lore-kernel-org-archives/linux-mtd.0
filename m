Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F4FC61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Feb 2023 19:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWzFy9PCJAZ+HeelIucRjslYKgsFWWz97HBx+qgDjsk=; b=FJjD/XvxCoUVkd
	8tbjScZ+52SVDJ8D+8k6ZadZo3tzCDAtWwxKizn37wys7LaA6iAu0U7EHedb8eTS69JqylYXCjg2l
	xDQxcySXqtG9yyQ144zSC47NK8dAIEoe1erRsY7mc+1sWQJEI/pS6TSF7R0nPJtXU0glLvTy3hjzx
	bio5fx8B8YVC3baSD9fKEg3L4RAwDbr6Qkv75cJN6s8CvpWKGNzJMHHC5JSYge0Vx22HoBFMY9D8S
	8jcygbydHzjxOIatLZOVM391R9cLxSzm3rJKcmeNG08dBsEa71PVq//I6EfIbXR4Ly7gFsGzDyRU8
	wL8PLxP0NlpJy1ghLcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNf6O-00H3R4-MS; Thu, 02 Feb 2023 19:18:32 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNf6L-00H3Qf-67
	for linux-mtd@lists.infradead.org; Thu, 02 Feb 2023 19:18:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso2227790wms.3
        for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2023 11:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBd1tQ4lYUnEZjZjKPSKFpqKjg+iMCZFzM/mYOTnZgY=;
        b=BhakneDD6i/I33nPXwp8cf8ZerH+up1KKI+/oUSr1f0oUaAwYvYmT/V2I9YZ9OegxG
         4nukYlT4vK3n/J2K5ZdNzhAo4TbvkyVatelrjawKvUGEvMG50yGRsoqzXIkSBrATJ33X
         ZVag2A8fRxKcb68hBVWV/BZqUhX09tLrqq68nOaDN5NXKT2aCA8s1ljSmrf5HA8CJcsw
         uoXoSjcneLkCjxAVxbvfj9fRafkj5+M4cKWN0XrGf4LoAi2lY0RmvjdpeCOOXVpvtIHB
         rWP1ZSC7vvUtl9Vf1XEImBloUsXGBGAL2VETBpwGUgDjVeyUwAxOcphPsMuHnLlhB/iH
         vSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBd1tQ4lYUnEZjZjKPSKFpqKjg+iMCZFzM/mYOTnZgY=;
        b=xdCCpMzxrXCse+daikUv1e6XYlsLGfiOWCGKeKMkBz1qX95flcGqz9x/LSmCvdC1c+
         FvHQhqv9n7IbEnaIvdX9/cVF/UvgpPUCwYso1to/DEWtA+ewn8PalQbnbYsfulSVV6S3
         invSy/uKyPhnRmcvKvsjQ/Qt1GaY/+MelKIAVVwGkyMwlAKsfPNJ23IuMEK9FNw593PS
         kQKmtIiticxJINRoV8C6AJ/GdW2HzM2Hc+PvSiJGkEefL6ggt30uSokILE/HYrO6eDld
         JxK0oJuOOKZeEGcup05S9vWpAJLAdOmRucG4JGvlSq8hdXhDOVRGYra/au1MBAPJAvHM
         hFfw==
X-Gm-Message-State: AO0yUKVjJGKKnVa1pgviBLN3on7hlhmxzWJSESDt5Fm6Lqpswd9pEs0T
	zZGTg5sM1uRwLErCZgvLSYgDBw==
X-Google-Smtp-Source: AK7set9uXKuwT/5oeLkMFqWKtxJ7FTtTfMxw8TPS2QgNwX0uR6tzILHQqRb8/wtOMySFjH83UmfbAQ==
X-Received: by 2002:a05:600c:1d96:b0:3dd:af7a:53db with SMTP id p22-20020a05600c1d9600b003ddaf7a53dbmr7346523wms.11.1675365505488;
        Thu, 02 Feb 2023 11:18:25 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c16c400b003df245cd853sm483735wmn.44.2023.02.02.11.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 11:18:25 -0800 (PST)
Message-ID: <8c38974f-abe6-499c-6769-e368f298deea@linaro.org>
Date: Thu, 2 Feb 2023 21:18:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mtd: spi_nor: Fixes out of bound shift
To: lrannou@baylibre.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc
References: <20230126142612.1518046-1-lrannou@baylibre.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20230126142612.1518046-1-lrannou@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_111829_281299_89B4EE5C 
X-CRM114-Status: GOOD (  25.60  )
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

Hi!

On 26.01.2023 16:26, lrannou@baylibre.com wrote:
> From: Louis Rannou <lrannou@baylibre.com>
> 
> spi_nor_set_erase_type is called twice in sfdp.c with a null size. The
> return from ffs is 0 as well and the shift size becomes (2^32 - 1) which is
> out of bound when applied to the << operator.
> 
> This considers as illegal a call to this function with null size. It
> creates a replacement spi_nor_mask_erase_type for explicit calls to mask
> the erase type.
> 
> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> ---
>   drivers/mtd/spi-nor/core.c | 19 +++++++++++++++++--
>   drivers/mtd/spi-nor/sfdp.c |  4 ++--
>   2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d67c926bca8b..140a8fa81f03 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2015,15 +2015,30 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
>    * @erase:	pointer to a structure that describes a SPI NOR erase type
>    * @size:	the size of the sector/block erased by the erase type
>    * @opcode:	the SPI command op code to erase the sector/block
> + *
> + * Return: 0 on success, -errno otherwise
>    */
> -void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
> -			    u8 opcode)
> +int spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
> +			   u8 opcode)
>   {
>   	erase->size = size;
>   	erase->opcode = opcode;
>   	/* JEDEC JESD216B Standard imposes erase sizes to be power of 2. */
> +	if (size == 0)
> +		return -EINVAL;

we should check the return value on each call then.

>   	erase->size_shift = ffs(erase->size) - 1;
>   	erase->size_mask = (1 << erase->size_shift) - 1;
> +	return 0;
> +}
> +
> +/**
> + * spi_nor_mask_erase_type() - mask out a SPI NOR erase type
> + * @erase:	pointer to a structure that describes a SPI NOR erase type
> + */
> +void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase)
> +{
> +	erase->size = 0;

but I like the idea of introducing a mask out method.

I sent a slightly different version where I added your Suggested-by tag
for the mask out idea. Let me know if it's fine by you:
https://lore.kernel.org/linux-mtd/20230202191451.35142-1-tudor.ambarus@linaro.org/T/#u

Cheers,
ta
> +	erase->opcode = 0xFF;
>   }
>   
>   /**
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 8434f654eca1..8d158243fe49 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -875,7 +875,7 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>   	 */
>   	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++)
>   		if (!(regions_erase_type & BIT(erase[i].idx)))
> -			spi_nor_set_erase_type(&erase[i], 0, 0xFF);
> +			spi_nor_mask_erase_type(&erase[i]);
>   
>   	return 0;
>   }
> @@ -1089,7 +1089,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>   			erase_type[i].opcode = (dwords[1] >>
>   						erase_type[i].idx * 8) & 0xFF;
>   		else
> -			spi_nor_set_erase_type(&erase_type[i], 0u, 0xFF);
> +			spi_nor_mask_erase_type(&erase_type[i]);
>   	}
>   
>   	/*

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
