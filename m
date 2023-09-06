Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34F0EB8FB5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlRvvBUFRrUl/v5LIl9OjqZS0zJLmoPHYevs2qUhk/0=; b=kyOFVXdDZ4rntr
	7gD1t+h20NRtcqfpq5aWyeJSu7jiOMQRaNUCTXEsopSRhw3v4wMQQH20S3nuk7ZdKqA6vWSjp08fw
	j0NmSMrltV5VV97gHvtcQ6kywdYbycHTxkwSlPSsZnaMNYhz7bXHIJ1FSmof8+0FkCaTtT79xD8B8
	T/KavY4TfZ9U5kXUd9Wwtuthglw8jTXovq8mHoI5uwZjoRyyhwurjfBH/l0FfL5VG4XMy0vwuuKWH
	abJpOWeGBjmtIKOqrm4x2HqmlCNOGaa/J8kkxOcOmPKQWs/nPgW+bdUh/I3CrM0yBFJc7ueTxISc4
	wdtA8/pr3DhVF5KnbTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdn9E-007XbZ-1x;
	Wed, 06 Sep 2023 07:40:24 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdn9B-007Xa6-1O
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:40:22 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99357737980so509604066b.2
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 00:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693986017; x=1694590817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuUCTpEsoTeM3wxxff5fzdirFgNIUQLOysT5sVaJC10=;
        b=PL9DBr6HABZhkz+Wub2UcNM6SAx18NDS4OGbdjcoVLki8HY/Nqk1xXf3FYGl9th7hh
         XMOsKhWtwIv0ayrSLhhYftqXtpU0CBmrIipqAxsbgsXfI5HYvB/7B2JIhEkpCRWF0i7+
         dQzdBLW0yEG3PaHaWuQVK8IDQFY9aVlCVZAbMxBOTE8Jzr0tXHwind4N2tgrI/wpLMJ1
         rGe+hKRB3LKk0iRyy8VaRYIN1imbLhXQcK2n3YJy7TrSGCfEmJpyI+gt67UOTBR+XqsI
         c691QFPXkIUkNHd+VobAqajb8Uh/6MXsVSU6JAnTZQT9/YhGaQLkWuBLdxcDzWX5DGW6
         T7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693986017; x=1694590817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuUCTpEsoTeM3wxxff5fzdirFgNIUQLOysT5sVaJC10=;
        b=C2gelzbqqnzonBpjj6xRaaNe/78rlHSVxR8q2ORvzYA2ZNnBcBxNdpwg8avJ5PeA3i
         aEoOT0KbhI5zD7fiygvL8U+pKI5772RzjsSt659BaubEvYSDU99IieeMjaSbYtcM1rBQ
         oCbT/bm8gsxGAiqbpoJId+8/KjT9nN2MKS10/tXp4dUqUGDO3HWtpTjsid/urbhyK91w
         3Pq2gbkCHtuR0kxsde6/+AkBPvRKCGmVzB0AVbvHjbGx/U9CojDHac/MjGgfteFWl2vU
         DQjJLmp/W1TVfNGYcZH6+xYHhyIF0USxdaCbvfQXJfPfK9jAlIdWLgbNNp2cT1n/XxE5
         Cm2Q==
X-Gm-Message-State: AOJu0YxUdU1XJDHCuJrDvDol0G5rMQQ9Yexlutq2gw313f8VzHMoMKVs
	bsNszLVVDimDYDJueUQt3FmBYw==
X-Google-Smtp-Source: AGHT+IEUUsYk4gKEVGbyn0dBc48Ky0YgYjurPjh7f7S6Xm6VHVgPPVg5dQMVtVEmokxNpsVShQ/I7Q==
X-Received: by 2002:a17:906:530c:b0:9a5:e440:38dd with SMTP id h12-20020a170906530c00b009a5e44038ddmr1682445ejo.45.1693986017572;
        Wed, 06 Sep 2023 00:40:17 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id rp24-20020a170906d97800b009a5c98fd82asm8526472ejb.81.2023.09.06.00.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:40:17 -0700 (PDT)
Message-ID: <5f7142ae-08db-41f9-d8ab-ed19e7afb9d5@linaro.org>
Date: Wed, 6 Sep 2023 10:40:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 41/41] mtd: spi-nor: core: get rid of the INFOx()
 macros
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-41-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-41-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_004021_473411_3FB33EFE 
X-CRM114-Status: GOOD (  14.97  )
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
> Now that all flash_info tables are converted to the new format, remove
> the old INFOx() macros.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/spi-nor/core.h | 65 ----------------------------------------------
>  1 file changed, 65 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 420e5ca2cfe1..1febb4a3c59b 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -573,71 +573,6 @@ struct flash_info {
>  		.n_regions = (_n_regions),				\
>  	})
>  
> -#define SPI_NOR_ID_2ITEMS(_id) ((_id) >> 8) & 0xff, (_id) & 0xff
> -#define SPI_NOR_ID_3ITEMS(_id) ((_id) >> 16) & 0xff, SPI_NOR_ID_2ITEMS(_id)
> -
> -#define SPI_NOR_ID(_jedec_id, _ext_id)					\
> -	.id = &(const struct spi_nor_id){				\
> -		.bytes = (const u8[]){ SPI_NOR_ID_3ITEMS(_jedec_id),	\
> -				       SPI_NOR_ID_2ITEMS(_ext_id) },	\
> -		.len = !(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0)),	\
> -	}
> -
> -#define SPI_NOR_ID6(_jedec_id, _ext_id)					\
> -	.id = &(const struct spi_nor_id){				\
> -		.bytes = (const u8[]){ SPI_NOR_ID_3ITEMS(_jedec_id),	\
> -				       SPI_NOR_ID_3ITEMS(_ext_id) },	\
> -		.len = 6,						\
> -	}
> -
> -#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
> -	.size = (_sector_size) * (_n_sectors),				\
> -	.sector_size = (_sector_size == SZ_64K) ? 0 : (_sector_size),	\
> -	.n_banks = (_n_banks)
> -
> -/* Used when the "_ext_id" is two bytes at most */
> -#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
> -	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
> -	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
> -
> -#define INFO0(_sector_size, _n_sectors)					\
> -	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
> -
> -#define INFOB(_jedec_id, _ext_id, _sector_size, _n_sectors, _n_banks)	\
> -	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
> -	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), (_n_banks)),
> -
> -#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
> -	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
> -	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
> -
> -#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_nbytes)	\
> -		.size = (_sector_size) * (_n_sectors),			\
> -		.sector_size = (_sector_size),				\
> -		.page_size = (_page_size),				\
> -		.addr_nbytes = (_addr_nbytes),				\
> -		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
> -
> -#define OTP_INFO(_len, _n_regions, _base, _offset)			\
> -		.otp = &(const struct spi_nor_otp_organization){	\
> -			.len = (_len),					\
> -			.base = (_base),				\
> -			.offset = (_offset),				\
> -			.n_regions = (_n_regions),			\
> -		},
> -
> -#define FLAGS(_flags)							\
> -		.flags = (_flags),					\
> -
> -#define NO_SFDP_FLAGS(_no_sfdp_flags)					\
> -		.no_sfdp_flags = (_no_sfdp_flags),			\
> -
> -#define FIXUP_FLAGS(_fixup_flags)					\
> -		.fixup_flags = (_fixup_flags),				\
> -
> -#define MFR_FLAGS(_mfr_flags)						\
> -		.mfr_flags = (_mfr_flags),				\
> -
>  /**
>   * struct spi_nor_manufacturer - SPI NOR manufacturer object
>   * @name: manufacturer name
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
