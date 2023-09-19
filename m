Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475E7CD54AB
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuEizCAoH6qYDyYKcyKoiFHAaHpHcgGyXtWbTTbYCyw=; b=sI//NOjP4Ev3f4
	17HdB26S8Pglt2YFx9S1cA6gH8yQl9th/lkuFgxWdwYWBz956/fZfso75RkcEeVJOhC8rtb2kSND+
	HbSm4K/W/hvV1wHT5pAlcaxpRVSJCY07wbXK5VZetSiHmlFF/TtDK4ljoIH8etN4pDsF9NiuQfSFt
	qlAovV2hcQBdKi8NIm2oWTMqV62JXXm3K+okqbPWbjw8UN62xplOg3ZKJNsdhwHTZa/SrTSbf8WRo
	42VXQVd9S48gCcOj9hy2Tkvt4+6M1gIf91ju5+am7EOEu8Q0Es6DgU6nuAdJICy0UXNhUs0LGlHYa
	W9zocyMUd0r2Nhp9rMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWxs-00HRkp-0d;
	Tue, 19 Sep 2023 09:24:16 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWxp-00HRk0-0m
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 09:24:15 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so4510788a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 19 Sep 2023 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695115450; x=1695720250; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NdipXS3XvV3KRj6rKJENXG4HLWYuJ+l0yvNmUVb9N/c=;
        b=OHnU49/15tK2VbPCfNenYYUOsfxKfB6MHk5aRPhQuUbYrMuubBOQ8WtEHNCj3FcMNq
         3G4wziu+amm033HdLikjVKeM9Bpr2MooeIHzaFirBFYh+lzVH7d+YmW9aDfk003cEA14
         kCW1wg1510N/4s8Yb/fg1foKd3mHRnVMMOBkaEbxvV8cxbRAS+0KmfdIdwG9ijkIFTjH
         Z9Zi8hahxcoXjzLvxNu2SSfO/Sx6vsZlH3HIOatpEOQUiFw/VbPns6T5RSmqoknMRKRZ
         5xRqlI05naCnN0wt2Tax9sxAqo05r1cd7JyOCpnS/iCt92AH034C0PyK/wwRz7tAupEq
         crpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695115450; x=1695720250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdipXS3XvV3KRj6rKJENXG4HLWYuJ+l0yvNmUVb9N/c=;
        b=SukpdW0qA5XPvQUvmFxoqshye5CrjYwHRj6knZFzjR6GFaYMGfVbDiwVfoFDrbX8Mb
         1H6WztGqTnKIceWeMLsaLuzOCW7d3Zf/i3OMznKIG8i9IQNUM+/3Hg/gsTIu9zndVevH
         c/kt27AYqKXqaUo4K/U1aCKm9Xesy1kv0dBu+MWBVZSD816zXIXqSTTDcCICRK2R0Peb
         4cJ1Nd/l4CGUW8zJ/lRlnA9ahaiQOES1myehqqDj9qb1vt1BiI21I4ufXBRd2B+y2Uu7
         Bo6/YT+qAUMAxW1NM/iy+s7LgsTMukGFHcWDx5SVUdBPookvJX5iZQ3/IOXS3glddJvV
         tkEQ==
X-Gm-Message-State: AOJu0YzSht29+apUPJzXb59tAu92AsvRBsFbvmd8Zi081I8Wm1oCl3pL
	YLQ+XuPm+45Ahd7Joa1Fk+ngYQ==
X-Google-Smtp-Source: AGHT+IH64zfLtuxYw8F4H8HPvhGHakyXs2btpSGa7cXl1iulH3IKtlfCFKRCmJjpUSb+qNWnsdiHGw==
X-Received: by 2002:a05:6402:2789:b0:51e:5bd5:fe7e with SMTP id b9-20020a056402278900b0051e5bd5fe7emr2697704ede.17.1695115449717;
        Tue, 19 Sep 2023 02:24:09 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id o17-20020a056402039100b0052f66414ec6sm7161533edv.56.2023.09.19.02.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:24:08 -0700 (PDT)
Message-ID: <80641a1c-d922-22cc-edd4-76d475e1aac8@linaro.org>
Date: Tue, 19 Sep 2023 12:24:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 05/41] mtd: spi-nor: convert .n_sectors to .size
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
 <20230807-mtd-flash-info-db-rework-v3-5-e60548861b10@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-5-e60548861b10@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_022413_292560_FF7074FE 
X-CRM114-Status: GOOD (  28.65  )
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



On 08.09.2023 13:16, Michael Walle wrote:
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

this should use nor->params instead, but we can do it later on. New
flash additions must specify the sector size, otherwise we get a
division by zero below. I see you introduce a default value in patch 10,
which will guard us. I assume  you checked that there's no flash that
specifies BP and sector size of zero up to patch 9 inclusively,
otherwise we'll break bisect-ability. Let me know if yes, and I'll
update the commit message when applying.

> +	u64 n_sectors = div_u64(nor->params->size, sector_size);
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
