Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A57CD54A9
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Bysm91HOkSHGW/X4usqZH7jFFbxNObI4JbyhL1ZWLQ=; b=fBgaFGVnrVlhi7
	hWh2dkscyV4N0JJbWMTjATNOINOfjvxnS2ziz98eD9jPIlNZrNZdCPIG/4+6ElK3Cy9GqITivfl6d
	acu+ldjfrhqal9L4WkVXwbnSu6ycWnBeqzOL3ujbkvJeyVBRFPCHaJWMibrAQ5RsSI7BjuiW9zRkm
	VJ5LXPaGdGOE8jKW8jpgEFQdQTGFwN4GoAkp/39OXcVIwH996DwY7hQmLy5CWESBq/VQi9um/5V95
	cbR99oIAQMgeDBua5IcSiVLmF0DFcLLZFVw05JpHMlh9ZC5EsUTxSPMVomIVaGGsmiBsim/zt5PL3
	vWJgN/w2cv9MuBUBtqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWzH-00HS4U-19;
	Tue, 19 Sep 2023 09:25:43 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWzE-00HS10-0a
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 09:25:41 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-530ce262ab2so3515568a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 19 Sep 2023 02:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695115536; x=1695720336; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EqYqPFsuKPJ27YsPuao4HG1nRy4TwOXvP2qF4wZU/F8=;
        b=hJfZUeNjRwwRqLc9rQmr/hQNcGgwQL2Fr9Rnk1ksNKe+w9GLy+onopcvDRhhq7s27d
         G3IRS+SP97lbA4IK9JBB228qwchkVBWNhDVYw8JVflQh2peffrtRIBuQfclrWWsFRZHv
         35RFxZOKLfA/I9iTmeR1WT713GNpH4JQ9vc28ewj7ofEYHf9/STPk+yrfpy6SNH0b2+4
         QP/18y5Ye18JyOY+IXEXdhVHt09PRjJcNCELBN12YVlwFT1tMosaoHdFeewvxfhbf6hk
         Fi3GofcprBV1MUAdCkbybSHkxxg+nW+zrYdpYGR0IOG4IobPQmdKk2BdFUdb2JBclTSx
         Te7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695115536; x=1695720336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqYqPFsuKPJ27YsPuao4HG1nRy4TwOXvP2qF4wZU/F8=;
        b=hjeXW/k73o25I2yyxcGQJgj84B7voYIKEMlMGP5DVtDsazoKSZnwinrJY6NqYNy1z7
         qjUeKCwLkIUZ9Rd4ryFhjcZaJKyFaFGKW4ecHK5RxbrhBSl2ouLOsWpXkm28aQuMnGMe
         JaFhGaniTUfypO/W3Zia8wi82DWq5Jg9VVVOyWTM9z5DDKKsIOlZ1OjNTPtmdKk/KmVe
         Vy3IGSw5jGY10RJinHchL9t1Ym20CrQzmo2r7WlK7vddYLnr7Hdy6K6Uwa13mLJjTMz6
         CMFMGbOUmUh3yeSvHeEIl3fyyQ71AwkPvmWlJFwCSu+X/kpTjSoITtnMAsRsYnQSVB6U
         yeGw==
X-Gm-Message-State: AOJu0Yzxfiru/i++65OX+Ct6tcarqVvKdFC9xVIF6drpCvCppCSC5tCl
	r3zNCvgWAMErflzg9YUYod9Y7w==
X-Google-Smtp-Source: AGHT+IEIfQ/nWjCtgsUWYKW3bJ5BrPYUBZqRMxmkK40+vxmtgp+VTWIJv94Z6JqjGYS0EuQwEfuRyw==
X-Received: by 2002:a17:907:7842:b0:9ad:a59f:331a with SMTP id lb2-20020a170907784200b009ada59f331amr10334920ejc.57.1695115536397;
        Tue, 19 Sep 2023 02:25:36 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id cf21-20020a170906b2d500b009ad8d444be4sm7482440ejb.43.2023.09.19.02.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:25:35 -0700 (PDT)
Message-ID: <417fb0fa-e774-c744-8641-7618347a8d1a@linaro.org>
Date: Tue, 19 Sep 2023 12:25:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 10/41] mtd: spi-nor: make sector_size optional
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
 <20230807-mtd-flash-info-db-rework-v3-10-e60548861b10@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-10-e60548861b10@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_022540_221098_03A9DEEA 
X-CRM114-Status: GOOD (  30.63  )
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
> Most of the (old, non-SFDP) flashes use a sector size of 64k. Make that
> a default value so it can be optional in the flash_info database.
> 
> As a preparation for conversion to the new database format, set the
> sector size to zero if the default value is used. This way, the actual
> change is happening with this patch ant not with a later conversion
> patch.
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

all these info->sector_size checks can be removed if we use
params->sector_size. I'll do it after applying the series.

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
