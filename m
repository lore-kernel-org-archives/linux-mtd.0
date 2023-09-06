Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C53EB8FAF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 05:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMT8FQjz/vHv10cT9HeGYqE0QhUUAdpcqXZxtEjBPb0=; b=by/F8MSPJZJvpL
	GdGUlIN53hV/Fhqy4Rl/JRJxR+XYyKzAVrpwefdHTPAeuTCz5TWVDubHlJkqO9YLTJ/GJhHgqp+fc
	T0dm3a2n52Out5Pd3R95EZYTOhY54c6snT5OXwNfQ6tA9rwHkHYEGgDtK9veEQS4bN5Is0SZUzPuS
	6EARMDORwpXTmoXgczmyQyPMvJgF8z24to+2yrIVyvfT7R4Xny+pnFGvxjiO1rk7xGLWuQYO9Kmsx
	IiYfRKIXJY/naCI+LeK1FXqzS1ldtNufDZjeay8MrY9R2J4v9HTaeNEwlDyDQ5CgAaN/UYL+b4Fb2
	ecgSUnAzUltUiWxEmZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdlLJ-007JLA-3C;
	Wed, 06 Sep 2023 05:44:46 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdlLH-007JJf-17
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 05:44:44 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a1de3417acso121617766b.0
        for <linux-mtd@lists.infradead.org>; Tue, 05 Sep 2023 22:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693979079; x=1694583879; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vUHY9l/ahFbvg+wX1AOKxG+CKEDbszdQhJl5/ZPug+U=;
        b=DV1E2VPfXzkFvtvolB4Bp2fVG+pQ6JZYj7+nxeAEXhf2SSnvCnch6cCJuSGn+gUajJ
         xMeeazx4/qK3fK1UgFCax2sdSKteR/HgAFltu28cfHKNltlq3chsgSjIYnDtSl0HzxX2
         C+lPQtFg7Hvh6mHZMh3ZorB9fiC3UNuMZ1LGKTDYboJWoUx/KVAx/iA76Dv0LNnevg0y
         WxEKGzgou5Hg2TQCJaAopSJwkiN4cvyflXwQmZoFfmNzJBf8SMmPyKnaBQ2kb1xtvEWk
         uQmjt+KIsLxXWxcmH8hg93OnxdZhg8nuFx//ZdE13wn0qOSPQ7GS7iTcRs87p1VoK3lX
         LJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693979079; x=1694583879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUHY9l/ahFbvg+wX1AOKxG+CKEDbszdQhJl5/ZPug+U=;
        b=j35gMCzV+MMgunZ+0PPIkaYjYl2dIa3cBrX1Nr4yTGhSsH3RCTinXD511wxKOS6xnH
         Uydp/nAMXuABKnhHBnJcXdDHv5UxTBBqUwhl8jBp7UM9N0ugbTvX3w7tAgP7CvDEIWsx
         sD3hVwethiKJFDhJtl+lyCB/+UoqEIyTEs/LUR/aB+6QwuYVetJo4uNesxuKyMZEToz7
         YHm6FAQbQNFBFJnsqXVEfelUZFg/vuYcajLO7irw9wak2UUN7BWcpzFknvXwe3Cw+B2O
         libF6MAleVixtYnZzCJA+Fe7ZutsJFq8vWoB8nR3JLDO0gURu7GQ1nyD7lyhW5on66CT
         PWyw==
X-Gm-Message-State: AOJu0YwtsCkaT4XUsJF6Z9WxbUBs1mXOBsA6WCtzLbBPWlfBCCN76h+Z
	hnMqgb8GPK9NZbpLaJcHLtGPSiD7kPqRpqCyU+4=
X-Google-Smtp-Source: AGHT+IFl1BcO96LjspG5iGCfeQZEf2a6mVEE6l1iTne3gvRX8Z+bq8yIcW7UAnLjy+sjJTRGcXSk/g==
X-Received: by 2002:a17:906:53c5:b0:9a2:1e14:86b9 with SMTP id p5-20020a17090653c500b009a21e1486b9mr2036998ejo.0.1693979078634;
        Tue, 05 Sep 2023 22:44:38 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906241100b0099bd7b26639sm8551322eja.6.2023.09.05.22.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 22:44:38 -0700 (PDT)
Message-ID: <21cd9421-52e6-432a-b612-a8bb9c48f98b@linaro.org>
Date: Wed, 6 Sep 2023 06:44:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/41] mtd: spi-nor: make sector_size optional
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-10-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-10-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_224443_404774_72A7BD18 
X-CRM114-Status: GOOD (  25.19  )
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



On 8/22/23 08:09, Michael Walle wrote:
> Most of the (old, non-SFDP) flashes use a sector size of 64k. Make that
> a default value so it can be optional in the flash_info database.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mtd/spi-nor/core.c | 6 ++++--
>  drivers/mtd/spi-nor/core.h | 8 +++++---
>  drivers/mtd/spi-nor/swp.c  | 6 +++++-
>  3 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index c84be791341e..368851ff9f40 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2756,7 +2756,8 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = nor->params;
>  	struct spi_nor_erase_map *map = &params->erase_map;
> -	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
> +	const struct flash_info *info = nor->info;
> +	const u8 no_sfdp_flags = info->no_sfdp_flags;
>  	u8 i, erase_mask;
>  
>  	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
> @@ -2810,7 +2811,8 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
>  		i++;
>  	}
>  	erase_mask |= BIT(i);
> -	spi_nor_set_erase_type(&map->erase_type[i], nor->info->sector_size,
> +	spi_nor_set_erase_type(&map->erase_type[i],
> +			       info->sector_size ?: SPI_NOR_DEFAULT_SECTOR_SIZE,
>  			       SPINOR_OP_SE);
>  	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
>  }
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 8627d0b95be6..fba3ea8536a5 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -16,6 +16,7 @@
>   */
>  #define SPI_NOR_DEFAULT_PAGE_SIZE 256
>  #define SPI_NOR_DEFAULT_N_BANKS 1
> +#define SPI_NOR_DEFAULT_SECTOR_SIZE SZ_64K
>  
>  /* Standard SPI NOR flash operations. */
>  #define SPI_NOR_READID_OP(naddr, ndummy, buf, len)			\
> @@ -452,8 +453,9 @@ struct spi_nor_fixups {
>   *                  JEDIC ID. JEDEC ID zero means "no ID" (mostly older chips).
>   * @id_len:         the number of bytes of ID.
>   * @size:           the size of the flash in bytes.
> - * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
> - *                  isn't necessarily called a "sector" by the vendor.
> + * @sector_size:    (optional) the size listed here is what works with
> + *                  SPINOR_OP_SE, which isn't necessarily called a "sector" by
> + *                  the vendor. Defaults to 64k.
>   * @n_banks:        (optional) the number of banks. Defaults to 1.
>   * @page_size:      (optional) the flash's page size. Defaults to 256.
>   * @addr_nbytes:    number of address bytes to send.
> @@ -565,7 +567,7 @@ struct flash_info {
>  
>  #define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
>  	.size = (_sector_size) * (_n_sectors),				\
> -	.sector_size = (_sector_size),					\
> +	.sector_size = (_sector_size == SZ_64K) ? 0 : (_sector_size),	\

why do you clear the sector_size?

>  	.n_banks = (_n_banks)
>  
>  /* Used when the "_ext_id" is two bytes at most */
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 40bf52867095..585813310ee1 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -34,7 +34,11 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
>  static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
>  {
>  	unsigned int bp_slots, bp_slots_needed;
> -	unsigned int sector_size = nor->info->sector_size;
> +	/*
> +	 * sector_size will eventually be replaced with the max erase size of
> +	 * the flash. For now, we need to have that ugly default.
> +	 */
> +	unsigned int sector_size = nor->info->sector_size ?: SPI_NOR_DEFAULT_SECTOR_SIZE;
>  	u64 n_sectors = div_u64(nor->params->size, sector_size);
>  	u8 mask = spi_nor_get_sr_bp_mask(nor);
>  
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
