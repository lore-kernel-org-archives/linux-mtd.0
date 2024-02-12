Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477C6C4829B
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhAkTjetX0iUGzLKffJIcIyi4PLcRnjSkpBYA8HSBSU=; b=KyyOL1pfayg2VF
	BB0ykiLGxlyKj9lM/b8uXePc4CwV3PX4eUurp/ND6rQvjLVGptCbmIoHw0bnCMVTrDAOk3nseduoQ
	d3L8AlaW41qY4abtS7AgX7bmjl52MCW+lJ/4XS2vG4CDbocWs+LaEZiD4ggPE5e+KvBmFRpFupLVy
	neR07SM/6xt+B1f5LDa/FibmG3gQam+EFDibwBPIoOHidfpjlDNPiKI/06dqIKaKUCJm3Jow86nuQ
	mT35z4lHj2TB2laUd8GBAyhO64roBr0wAXsGh1jNV8ybMOo2D4PcENMKK7t7nnqYcG9W78ZUM9yQ9
	M2pEyZokEEd1Y3hr/cWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZSD4-00000004gf2-0Z79;
	Mon, 12 Feb 2024 09:02:42 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZSD0-00000004geN-2Tc3
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 09:02:40 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6de3141f041so1945191b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2024 01:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707728556; x=1708333356; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=izaag1cM9s1tfpSFEDzKbTI43CSrCEzMPPv+gD0y9u8=;
        b=b83vgUNyPHUZuE8rQJgemI83RIHOq8hIWTHukWKy7wnpyG9WRkBx8BTDoTv3XUHxIT
         iaCjZOieHTcfuh9a3vpeHKDi6zizl97kboo1zFPgPbVX+yf3nHZnzs98WyGAfygv1shx
         JBbFN3uv59ttPKSC6E5u9bpc094DtZ/K0q6cXmN+E7JnlDVnmoIijI+1e8+ltrIaZvM0
         qlRGap2/qkg7suFGs5tw+iyYMD5mNJ/btQaVE5qWY4zfHvrJwOuAS3liJbhEF37RXuaj
         6AIWMVbx0uLzPYzEtD0Y25JTU/ZdN0rsw+pvQlnr5+hVvledYpxpU2Z+wkuC+w5bxDu9
         qk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707728556; x=1708333356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izaag1cM9s1tfpSFEDzKbTI43CSrCEzMPPv+gD0y9u8=;
        b=LgljfL7YidzKIJ9WUoXw7U3GgrobdBWfCzSpGt9rHpKEPiXTTcovw5cpUQa2VGMP4V
         U78CJ7CqJ9PWR6vCvQyBgDsdxd7NHT31THTJPu/AilRfbCy2fNmubWZ0rgXGLgs6hNHz
         iP7s2+aNBgHhpiiAJQHsnsCeAKIdJSOnlOLCWdPcCR+b4M/onC6sd0cCPvpDq2jeWO55
         b8gbl3Qes5FbRx2IpGAqQMRLfuc1ZxxQGdbEU+5kTu/c+ar2BapXrpS9yw7ZGCq1tFUN
         pryZTQxaVSNAq3D8EXwUx6GvQcbSq3KObsNRCDp8R1NeoDE2cOgqlW736sxXUmHBQJdz
         ++TA==
X-Forwarded-Encrypted: i=1; AJvYcCX6P5++DqlUZ0flowigvLa6hOSBF74+bTWIFxQz3msfjXhAQwGcd3eD+iBXDdqHSMrLQtJET4iL+aSn4uGjq+Rrano4DVqbbNVUeujLMw==
X-Gm-Message-State: AOJu0Yy4cC2PrI3YxGK2sKpOt92cCekOPRjF6nLB5EfK0/RptfRL6Wc0
	TtgddUG9U3mrT2wJ3LHfpqBk++a3yj9I2SvxRCdgKEqLh3UVASJ7RIoyzMShZXc=
X-Google-Smtp-Source: AGHT+IHQFJX3cMDQZKHJeUSFlLrtjhKaJ6r7r1LfwYpFNBxOcIrzodiNOYJuGn6+Vtlc4y+qnVTdaQ==
X-Received: by 2002:a17:903:11ce:b0:1d7:691e:2704 with SMTP id q14-20020a17090311ce00b001d7691e2704mr7412860plh.35.1707728555717;
        Mon, 12 Feb 2024 01:02:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvCrNHz+0llP8ejJAox1DBLxMkklMRyMqYdzQh5aq/lQoMAOY7z7Ndt2hUWOY1DsNOyDxc1ebB7TbW00H80aIqEVzev4PgLz0i+qMx8QzxXyg+03w8z87K/JJ+C2I5gC3NSxNrdxPe4p7QBO51/6HSfuzNbmjwdvmH7L2yJDnCllkg2+3JCBHrwY047waPNXXBY4Ic1bRON4ppusKT6NJFE2U3opkduerZgo9DG+1+iMksN7BKVc9UAsGJsD+YoWll3hB97/4U1OSEbQ2DhAopmrUzfw==
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id jw4-20020a170903278400b001d8f0e4bc32sm5495191plb.144.2024.02.12.01.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 01:02:34 -0800 (PST)
Message-ID: <a413323b-17e8-4476-824c-b75447432b2e@linaro.org>
Date: Mon, 12 Feb 2024 09:02:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: core: rework erase map and erase
 region structures
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1707193538.git.Takahiro.Kuwano@infineon.com>
 <028070a1a02fe6db3c9bc0c2e0ac93116ecb0c0d.1707193539.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <028070a1a02fe6db3c9bc0c2e0ac93116ecb0c0d.1707193539.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_010238_705245_638414C7 
X-CRM114-Status: GOOD (  37.28  )
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



On 2/6/24 04:37, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Encoding bitmask flags into offset worsen the code readability. In the
> spi_nor_erase_region, erase type mask and flags should be stored in
> dedicated members. The SNOR_LAST_REGION flag is removed and the number
> of regions is added in the spi_nor_erase_map. Also, uniform_erase_type
> is removed as it is redundant.
> 

Hi, Takahiro!

I find the idea good, thanks for working on this!
If this was Michael's idea we can add a Suggested-by tag.

Also, I find this a little difficult to review. Would it make sense to
split this patch in a patch for each flag removed?

Thanks!
ta

> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/core.c    | 51 +++++++++++++++--------------------
>  drivers/mtd/spi-nor/core.h    | 31 ++++++++-------------
>  drivers/mtd/spi-nor/debugfs.c | 18 ++++++-------
>  drivers/mtd/spi-nor/sfdp.c    | 42 ++++++++++-------------------
>  4 files changed, 56 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1b0c6770c14e..7f4ac146f56b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1150,7 +1150,7 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
>  
>  static bool spi_nor_has_uniform_erase(const struct spi_nor *nor)
>  {
> -	return !!nor->params->erase_map.uniform_erase_type;
> +	return nor->params->erase_map.uniform_region.erase_mask;
>  }
>  
>  static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
> @@ -1534,7 +1534,6 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
>  	const struct spi_nor_erase_type *erase;
>  	u32 rem;
>  	int i;
> -	u8 erase_mask = region->offset & SNOR_ERASE_TYPE_MASK;
>  
>  	/*
>  	 * Erase types are ordered by size, with the smallest erase type at
> @@ -1542,7 +1541,7 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
>  	 */
>  	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
>  		/* Does the erase region support the tested erase type? */
> -		if (!(erase_mask & BIT(i)))
> +		if (!(region->erase_mask & BIT(i)))
>  			continue;
>  
>  		erase = &map->erase_type[i];
> @@ -1550,8 +1549,7 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
>  			continue;
>  
>  		/* Alignment is not mandatory for overlaid regions */
> -		if (region->offset & SNOR_OVERLAID_REGION &&
> -		    region->size <= len)
> +		if (region->overlaid && region->size <= len)
>  			return erase;
>  
>  		/* Don't erase more than what the user has asked for. */
> @@ -1566,26 +1564,25 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
>  	return NULL;
>  }
>  
> -static u64 spi_nor_region_is_last(const struct spi_nor_erase_region *region)
> -{
> -	return region->offset & SNOR_LAST_REGION;
> -}
> -
>  static u64 spi_nor_region_end(const struct spi_nor_erase_region *region)
>  {
> -	return (region->offset & ~SNOR_ERASE_FLAGS_MASK) + region->size;
> +	return region->offset + region->size;
>  }
>  
>  /**
>   * spi_nor_region_next() - get the next spi nor region
> + * @map:	the erase map of the SPI NOR
>   * @region:	pointer to a structure that describes a SPI NOR erase region
>   *
>   * Return: the next spi nor region or NULL if last region.
>   */
>  struct spi_nor_erase_region *
> -spi_nor_region_next(struct spi_nor_erase_region *region)
> +spi_nor_region_next(const struct spi_nor_erase_map *map,
> +		    struct spi_nor_erase_region *region)
>  {
> -	if (spi_nor_region_is_last(region))
> +	unsigned int region_idx = region - map->regions;
> +
> +	if (region_idx + 1 >= map->n_regions)
>  		return NULL;
>  	region++;
>  	return region;
> @@ -1604,16 +1601,14 @@ static struct spi_nor_erase_region *
>  spi_nor_find_erase_region(const struct spi_nor_erase_map *map, u64 addr)
>  {
>  	struct spi_nor_erase_region *region = map->regions;
> -	u64 region_start = region->offset & ~SNOR_ERASE_FLAGS_MASK;
> -	u64 region_end = region_start + region->size;
> +	u64 region_end = spi_nor_region_end(region);
>  
> -	while (addr < region_start || addr >= region_end) {
> -		region = spi_nor_region_next(region);
> +	while (addr < region->offset || addr >= region_end) {
> +		region = spi_nor_region_next(map, region);
>  		if (!region)
>  			return ERR_PTR(-EINVAL);
>  
> -		region_start = region->offset & ~SNOR_ERASE_FLAGS_MASK;
> -		region_end = region_start + region->size;
> +		region_end = spi_nor_region_end(region);
>  	}
>  
>  	return region;
> @@ -1641,7 +1636,7 @@ spi_nor_init_erase_cmd(const struct spi_nor_erase_region *region,
>  	cmd->opcode = erase->opcode;
>  	cmd->count = 1;
>  
> -	if (region->offset & SNOR_OVERLAID_REGION)
> +	if (region->overlaid)
>  		cmd->size = region->size;
>  	else
>  		cmd->size = erase->size;
> @@ -1700,7 +1695,7 @@ static int spi_nor_init_erase_cmd_list(struct spi_nor *nor,
>  
>  		if (prev_erase != erase ||
>  		    erase->size != cmd->size ||
> -		    region->offset & SNOR_OVERLAID_REGION) {
> +		    region->overlaid) {
>  			cmd = spi_nor_init_erase_cmd(region, erase);
>  			if (IS_ERR(cmd)) {
>  				ret = PTR_ERR(cmd);
> @@ -1716,7 +1711,7 @@ static int spi_nor_init_erase_cmd_list(struct spi_nor *nor,
>  		len -= cmd->size;
>  
>  		if (len && addr >= region_end) {
> -			region = spi_nor_region_next(region);
> +			region = spi_nor_region_next(map, region);
>  			if (!region)
>  				goto destroy_erase_cmd_list;
>  			region_end = spi_nor_region_end(region);
> @@ -2439,12 +2434,11 @@ void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase)
>  void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
>  				    u8 erase_mask, u64 flash_size)
>  {
> -	/* Offset 0 with erase_mask and SNOR_LAST_REGION bit set */
> -	map->uniform_region.offset = (erase_mask & SNOR_ERASE_TYPE_MASK) |
> -				     SNOR_LAST_REGION;
> +	map->uniform_region.offset = 0;
>  	map->uniform_region.size = flash_size;
> +	map->uniform_region.erase_mask = erase_mask;
>  	map->regions = &map->uniform_region;
> -	map->uniform_erase_type = erase_mask;
> +	map->n_regions = 1;
>  }
>  
>  int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
> @@ -2539,7 +2533,7 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
>  {
>  	const struct spi_nor_erase_type *tested_erase, *erase = NULL;
>  	int i;
> -	u8 uniform_erase_type = map->uniform_erase_type;
> +	u8 uniform_erase_type = map->uniform_region.erase_mask;
>  
>  	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
>  		if (!(uniform_erase_type & BIT(i)))
> @@ -2573,8 +2567,7 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
>  		return NULL;
>  
>  	/* Disable all other Sector Erase commands. */
> -	map->uniform_erase_type &= ~SNOR_ERASE_TYPE_MASK;
> -	map->uniform_erase_type |= BIT(erase - map->erase_type);
> +	map->uniform_region.erase_mask = BIT(erase - map->erase_type);
>  	return erase;
>  }
>  
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 9217379b9cfe..3cc59f3f287c 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -233,27 +233,21 @@ struct spi_nor_erase_command {
>  /**
>   * struct spi_nor_erase_region - Structure to describe a SPI NOR erase region
>   * @offset:		the offset in the data array of erase region start.
> - *			LSB bits are used as a bitmask encoding flags to
> - *			determine if this region is overlaid, if this region is
> - *			the last in the SPI NOR flash memory and to indicate
> - *			all the supported erase commands inside this region.
> - *			The erase types are sorted in ascending order with the
> - *			smallest Erase Type size being at BIT(0).
>   * @size:		the size of the region in bytes.
> + * @erase_mask:		bitmask to indicate all the supported erase commands
> + *			inside this region. The erase types are sorted in
> + *			ascending order with the smallest Erase Type size being
> + *			at BIT(0).
> + * @overlaid:		determine if this region is overlaid.
>   */
>  struct spi_nor_erase_region {
>  	u64		offset;
>  	u64		size;
> +	u8		erase_mask;
> +	bool		overlaid;
>  };
>  
>  #define SNOR_ERASE_TYPE_MAX	4
> -#define SNOR_ERASE_TYPE_MASK	GENMASK_ULL(SNOR_ERASE_TYPE_MAX - 1, 0)
> -
> -#define SNOR_LAST_REGION	BIT(4)
> -#define SNOR_OVERLAID_REGION	BIT(5)
> -
> -#define SNOR_ERASE_FLAGS_MAX	6
> -#define SNOR_ERASE_FLAGS_MASK	GENMASK_ULL(SNOR_ERASE_FLAGS_MAX - 1, 0)
>  
>  /**
>   * struct spi_nor_erase_map - Structure to describe the SPI NOR erase map
> @@ -266,17 +260,13 @@ struct spi_nor_erase_region {
>   *			The erase types are sorted in ascending order, with the
>   *			smallest Erase Type size being the first member in the
>   *			erase_type array.
> - * @uniform_erase_type:	bitmask encoding erase types that can erase the
> - *			entire memory. This member is completed at init by
> - *			uniform and non-uniform SPI NOR flash memories if they
> - *			support at least one erase type that can erase the
> - *			entire memory.
> + * @n_regions:		number of erase regions.
>   */
>  struct spi_nor_erase_map {
>  	struct spi_nor_erase_region	*regions;
>  	struct spi_nor_erase_region	uniform_region;
>  	struct spi_nor_erase_type	erase_type[SNOR_ERASE_TYPE_MAX];
> -	u8				uniform_erase_type;
> +	unsigned int			n_regions;
>  };
>  
>  /**
> @@ -708,7 +698,8 @@ void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
>  			    u8 opcode);
>  void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase);
>  struct spi_nor_erase_region *
> -spi_nor_region_next(struct spi_nor_erase_region *region);
> +spi_nor_region_next(const struct spi_nor_erase_map *map,
> +		    struct spi_nor_erase_region *region);
>  void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
>  				    u8 erase_mask, u64 flash_size);
>  
> diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
> index 6e163cb5b478..0a9b40f4ee76 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
> @@ -142,22 +142,22 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
>  	}
>  
>  	seq_puts(s, "\nsector map\n");
> -	seq_puts(s, " region (in hex)   | erase mask | flags\n");
> +	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");
>  	seq_puts(s, " ------------------+------------+----------\n");
>  	for (region = erase_map->regions;
>  	     region;
> -	     region = spi_nor_region_next(region)) {
> -		u64 start = region->offset & ~SNOR_ERASE_FLAGS_MASK;
> -		u64 flags = region->offset & SNOR_ERASE_FLAGS_MASK;
> +	     region = spi_nor_region_next(erase_map, region)) {
> +		u64 start = region->offset;
>  		u64 end = start + region->size - 1;
> +		u8 mask = region->erase_mask;
>  
>  		seq_printf(s, " %08llx-%08llx |     [%c%c%c%c] | %s\n",
>  			   start, end,
> -			   flags & BIT(0) ? '0' : ' ',
> -			   flags & BIT(1) ? '1' : ' ',
> -			   flags & BIT(2) ? '2' : ' ',
> -			   flags & BIT(3) ? '3' : ' ',
> -			   flags & SNOR_OVERLAID_REGION ? "overlaid" : "");
> +			   mask & BIT(0) ? '0' : ' ',
> +			   mask & BIT(1) ? '1' : ' ',
> +			   mask & BIT(2) ? '2' : ' ',
> +			   mask & BIT(3) ? '3' : ' ',
> +			   region->overlaid ? "yes" : "no");
>  	}
>  
>  	return 0;
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index b3b11dfed789..e06abfe03794 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -389,19 +389,16 @@ static u8 spi_nor_sort_erase_mask(struct spi_nor_erase_map *map, u8 erase_mask)
>  static void spi_nor_regions_sort_erase_types(struct spi_nor_erase_map *map)
>  {
>  	struct spi_nor_erase_region *region = map->regions;
> -	u8 region_erase_mask, sorted_erase_mask;
> +	u8 sorted_erase_mask;
>  
>  	while (region) {
> -		region_erase_mask = region->offset & SNOR_ERASE_TYPE_MASK;
> -
>  		sorted_erase_mask = spi_nor_sort_erase_mask(map,
> -							    region_erase_mask);
> +							    region->erase_mask);
>  
>  		/* Overwrite erase mask. */
> -		region->offset = (region->offset & ~SNOR_ERASE_TYPE_MASK) |
> -				 sorted_erase_mask;
> +		region->erase_mask = sorted_erase_mask;
>  
> -		region = spi_nor_region_next(region);
> +		region = spi_nor_region_next(map, region);
>  	}
>  }
>  
> @@ -553,8 +550,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	 * selecting the uniform erase.
>  	 */
>  	spi_nor_regions_sort_erase_types(map);
> -	map->uniform_erase_type = map->uniform_region.offset &
> -				  SNOR_ERASE_TYPE_MASK;
>  
>  	/* Stop here if not JESD216 rev A or later. */
>  	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
> @@ -779,16 +774,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  	return ret;
>  }
>  
> -static void spi_nor_region_mark_end(struct spi_nor_erase_region *region)
> -{
> -	region->offset |= SNOR_LAST_REGION;
> -}
> -
> -static void spi_nor_region_mark_overlay(struct spi_nor_erase_region *region)
> -{
> -	region->offset |= SNOR_OVERLAID_REGION;
> -}
> -
>  /**
>   * spi_nor_region_check_overlay() - set overlay bit when the region is overlaid
>   * @region:	pointer to a structure that describes a SPI NOR erase region
> @@ -806,7 +791,7 @@ spi_nor_region_check_overlay(struct spi_nor_erase_region *region,
>  		if (!(erase[i].size && erase_type & BIT(erase[i].idx)))
>  			continue;
>  		if (region->size & erase[i].size_mask) {
> -			spi_nor_region_mark_overlay(region);
> +			region->overlaid = true;
>  			return;
>  		}
>  	}
> @@ -841,6 +826,7 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>  	if (!region)
>  		return -ENOMEM;
>  	map->regions = region;
> +	map->n_regions = region_count;
>  
>  	uniform_erase_type = 0xff;
>  	regions_erase_type = 0;
> @@ -848,9 +834,10 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>  	/* Populate regions. */
>  	for (i = 0; i < region_count; i++) {
>  		j = i + 1; /* index for the region dword */
> +		region[i].offset = offset;
>  		region[i].size = SMPT_MAP_REGION_SIZE(smpt[j]);
>  		erase_type = SMPT_MAP_REGION_ERASE_TYPE(smpt[j]);
> -		region[i].offset = offset | erase_type;
> +		region[i].erase_mask = erase_type;
>  
>  		spi_nor_region_check_overlay(&region[i], erase, erase_type);
>  
> @@ -866,21 +853,20 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>  		 */
>  		regions_erase_type |= erase_type;
>  
> -		offset = (region[i].offset & ~SNOR_ERASE_FLAGS_MASK) +
> -			 region[i].size;
> +		offset = region[i].offset + region[i].size;
>  	}
> -	spi_nor_region_mark_end(&region[i - 1]);
>  
> -	save_uniform_erase_type = map->uniform_erase_type;
> -	map->uniform_erase_type = spi_nor_sort_erase_mask(map,
> -							  uniform_erase_type);
> +	save_uniform_erase_type = map->uniform_region.erase_mask;
> +	map->uniform_region.erase_mask =
> +				spi_nor_sort_erase_mask(map,
> +							uniform_erase_type);
>  
>  	if (!regions_erase_type) {
>  		/*
>  		 * Roll back to the previous uniform_erase_type mask, SMPT is
>  		 * broken.
>  		 */
> -		map->uniform_erase_type = save_uniform_erase_type;
> +		map->uniform_region.erase_mask = save_uniform_erase_type;
>  		return -EINVAL;
>  	}
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
