Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27280C27C40
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OORHKuKZBJsV+Eit74rd0RVESk5gcpfKr7tD+1b+Sg=; b=EF8mBAFWmQ7Y62
	1zDy3l+JnmXvAoV/X6+Kq+GuJjYcg5lJrU0bnVfzlegVzgmDvmXyXQlXbCwL6LNHDVWL9IxXE++9L
	dsm0LT0UuP4chv9vQTu67zUZZZ7PvDdLJEDkGG0jfHr3335c8TCxwbutSjcHHd5RkSzEHhOoYcoCk
	zQW0tmy6batcjlxe97QO72YmNS1pn2MNfmKyFgGbzq53PZSaAa1393Ru8Yeqg7qFiCVr+v6Ysuu8d
	j2hhiqa1ueoT/PID4VSseQ+DiQulUQbRAPeX+kbm2leEDG+Lny09zbjuzkrDURJfRigiRBGD8PKv7
	f/y2UaKgmyRK0iOO5h9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5f1-002YXm-0R;
	Thu, 24 Aug 2023 08:25:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5ey-002YXF-2s
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 08:25:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fe32016bc8so59569885e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2023 01:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692865542; x=1693470342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufDuOrMZ6PX5JtRvNn4ZirU+4EA1nSr1OgPphDzyH8Q=;
        b=veuxEedyZ+2JZm3y+1GOuqEXAWuiRN/ynvhk9QgzsFCQ1flNWPcgeZREQYx8gBBqMI
         oPInzhVbfpFGrfM8Ae8nWMGWDUm8y2f/MIy7mCjN3DAZ8D6u6V3WO/F3iOdyCnJwQOvk
         YpIsirR4URjHAEJgpQr+b7JZUCQUZNcLw5HKCJIc1Tr3MKJu2QmcyWDo0CtzGANenGA7
         SPIwEvyx/KGLqj2ERLaRMl2d+gEBAk2ICSHHKNky/WArUdOnt39rtfZ4P33p8ptI3vF0
         9JLyAo7Tg15wVvUIiyK2vG1qC3g/6oC5TLgWLu7u2PvTKN39rCXXAGdO865YtwJIFgRg
         Z7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692865542; x=1693470342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufDuOrMZ6PX5JtRvNn4ZirU+4EA1nSr1OgPphDzyH8Q=;
        b=kbj4hFVDRv9BsF4vjl+7qUu3SA9h2DAEa2+Kv+b2Izl95qk05dn9DwH8n7qX9Hf42B
         fsUG8twXuEMM3PMc3xLspVMkwY60sKnKPKbbN52tWS5Kpzpm12WWJQqYVolf17Md8y2J
         2Vap/BRixCyvoizsYtG/XYUI7KzLtW37mzKXdM4Csnxkas1nrNxG5aibWB8ptdDVNubx
         xzLuw11oefgJI5POnBP2XgQSpiKJXZ1kvqKMzhACXFQZE8vMPIcB+x2DffnwVI4q3Q0A
         ceqkMNak2QQ1aMdzHKg9uQb/C8PTrnrzOrATDEvVLdZYqVdykfNBoLLIzjoG80L2oYgs
         7Kvg==
X-Gm-Message-State: AOJu0Yyw15j0W9aqQyfqh9zWRANOqZH0a+EkL1gw4Tfaf/lPZndSWXNN
	LkGDzUqOYNbekPhczIm97T0dOw==
X-Google-Smtp-Source: AGHT+IHPKNu2kUb4ciPw/tpNDJNSqsuJa6veUIyEOWqVFnVhTYNl0ohIzznHmH/Hti0seds6z4MUXw==
X-Received: by 2002:a7b:cd14:0:b0:3fc:1a6:7764 with SMTP id f20-20020a7bcd14000000b003fc01a67764mr11224846wmj.16.1692865542273;
        Thu, 24 Aug 2023 01:25:42 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.239])
        by smtp.gmail.com with ESMTPSA id 6-20020a05600c020600b003fc04d13242sm1954471wmi.0.2023.08.24.01.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:25:41 -0700 (PDT)
Message-ID: <3df0728d-60d8-1cff-a0d9-f3de505dfa17@linaro.org>
Date: Thu, 24 Aug 2023 09:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 05/41] mtd: spi-nor: convert .n_sectors to .size
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-5-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-5-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_012544_936963_C1837E7E 
X-CRM114-Status: GOOD (  27.68  )
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
> .n_sectors is rarely used. In fact it is only used in swp.c and to
> calculate the flash size in the core. The use in swp.c might be
> converted to use the (largest) flash erase size. For now, we just
> locally calculate the sector size.
> 
> Simplify the flash_info database and set the size of the flash directly.
> This also let us use the SZ_x macros.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mtd/spi-nor/core.c   | 2 +-
>  drivers/mtd/spi-nor/core.h   | 8 ++++----
>  drivers/mtd/spi-nor/swp.c    | 9 +++++----
>  drivers/mtd/spi-nor/xilinx.c | 4 ++--
>  4 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 286155002cdc..f4cc2eafcc5e 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2999,7 +2999,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>  
>  	/* Set SPI NOR sizes. */
>  	params->writesize = 1;
> -	params->size = (u64)info->sector_size * info->n_sectors;
> +	params->size = info->size;

would be good to check the sanity of info->size to not be null and to be
divisible by sector_size.

>  	params->bank_size = params->size;
>  	params->page_size = info->page_size;
>  
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index dfc20a3296fb..12c35409493b 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -443,9 +443,9 @@ struct spi_nor_fixups {
>   * @id:             the flash's ID bytes. The first three bytes are the
>   *                  JEDIC ID. JEDEC ID zero means "no ID" (mostly older chips).
>   * @id_len:         the number of bytes of ID.
> + * @size:           the size of the flash in bytes.
>   * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
>   *                  isn't necessarily called a "sector" by the vendor.
> - * @n_sectors:      the number of sectors.
>   * @n_banks:        the number of banks.
>   * @page_size:      the flash's page size.
>   * @addr_nbytes:    number of address bytes to send.
> @@ -505,8 +505,8 @@ struct flash_info {
>  	char *name;
>  	u8 id[SPI_NOR_MAX_ID_LEN];
>  	u8 id_len;
> +	size_t size;
>  	unsigned sector_size;
> -	u16 n_sectors;
>  	u16 page_size;
>  	u8 n_banks;
>  	u8 addr_nbytes;
> @@ -556,8 +556,8 @@ struct flash_info {
>  	.id_len = 6
>  
>  #define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
> +	.size = (_sector_size) * (_n_sectors),				\
>  	.sector_size = (_sector_size),					\
> -	.n_sectors = (_n_sectors),					\
>  	.page_size = 256,						\
>  	.n_banks = (_n_banks)
>  
> @@ -575,8 +575,8 @@ struct flash_info {
>  	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
>  
>  #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_nbytes)	\
> +		.size = (_sector_size) * (_n_sectors),			\
>  		.sector_size = (_sector_size),				\
> -		.n_sectors = (_n_sectors),				\
>  		.page_size = (_page_size),				\
>  		.n_banks = 1,						\
>  		.addr_nbytes = (_addr_nbytes),				\
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 5ab9d5324860..40bf52867095 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -34,17 +34,18 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
>  static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
>  {
>  	unsigned int bp_slots, bp_slots_needed;
> +	unsigned int sector_size = nor->info->sector_size;
> +	u64 n_sectors = div_u64(nor->params->size, sector_size);

if params(info)->size is zero here, we get into trouble.

>  	u8 mask = spi_nor_get_sr_bp_mask(nor);
>  
>  	/* Reserved one for "protect none" and one for "protect all". */
>  	bp_slots = (1 << hweight8(mask)) - 2;
> -	bp_slots_needed = ilog2(nor->info->n_sectors);
> +	bp_slots_needed = ilog2(n_sectors);
>  
>  	if (bp_slots_needed > bp_slots)
> -		return nor->info->sector_size <<
> -			(bp_slots_needed - bp_slots);
> +		return sector_size << (bp_slots_needed - bp_slots);
>  	else
> -		return nor->info->sector_size;
> +		return sector_size;
>  }
>  
>  static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
> diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
> index 34267591282c..284e2e4970ab 100644
> --- a/drivers/mtd/spi-nor/xilinx.c
> +++ b/drivers/mtd/spi-nor/xilinx.c
> @@ -23,8 +23,8 @@
>  
>  #define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
>  		SPI_NOR_ID(_jedec_id, 0),				\
> +		.size = 8 * (_page_size) * (_n_sectors),		\

here it's fine.

>  		.sector_size = (8 * (_page_size)),			\
> -		.n_sectors = (_n_sectors),				\
>  		.page_size = (_page_size),				\
>  		.n_banks = 1,						\
>  		.flags = SPI_NOR_NO_FR
> @@ -138,7 +138,7 @@ static int xilinx_nor_setup(struct spi_nor *nor,
>  		page_size = (nor->params->page_size == 264) ? 256 : 512;
>  		nor->params->page_size = page_size;
>  		nor->mtd.writebufsize = page_size;
> -		nor->params->size = 8 * page_size * nor->info->n_sectors;
> +		nor->params->size = nor->info->size;
>  		nor->mtd.erasesize = 8 * page_size;
>  	} else {
>  		/* Flash in Default addressing mode */
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
