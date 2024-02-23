Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF06C54E49
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 10:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Of/6vVe2A99x/UvYmVBmA/vXjCAluf+3tl4kYXu3VDA=; b=Kb7/enWposmbs+
	8UI8+ibf2YLTxuSS34kG4ZsyirDs4TUgucqAROTAJLGJko3IYAKr2984MSlTu1JhOOV5WYeyZqr2+
	MPtIj+JwATralGrl3Hx3PljfjJwzXL+9rQZ0PmawV4zkmtP3KDDt/tXo1bUP7Zkho3ShbdN5sDLW3
	lPA4Jjlf74fR/CcbKnV5+bqg8kJb0M4/2zRvHTTjed/2QzMyU9gG8B21JCt2zM8wgQ3by+9U5R2Sq
	gwmTC584J81dyD1R7j2obAyn/24ke6KGLbKEDMdLB6MjVb+okV4syX+pfOQqATe32a/FuUhD3rPfq
	N5dTjJGN1mYyHA6ITWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSaX-00000008rKD-2HTN;
	Fri, 23 Feb 2024 10:15:29 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSZt-00000008rGu-0IBa
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 10:15:10 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5BE8DA08;
	Fri, 23 Feb 2024 11:14:21 +0100 (CET)
Mime-Version: 1.0
Date: Fri, 23 Feb 2024 11:14:21 +0100
Message-Id: <CZCDNXMTGOA0.3QSDTTWS8H0LT@kernel.org>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: core: rework struct
 spi_nor_erase_region
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>
From: "Michael Walle" <mwalle@kernel.org>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
 <8e5e9e4081ed9f16ea9dce30693304a4b54d19b1.1708404584.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <8e5e9e4081ed9f16ea9dce30693304a4b54d19b1.1708404584.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_021458_798932_A578728C 
X-CRM114-Status: GOOD (  33.81  )
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

On Tue Feb 20, 2024 at 9:34 AM CET, tkuw584924 wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>
> Encoding bitmask flags into offset worsen the code readability. The
> erase type mask and flags should be stored in dedicated members. Also,
> erase_map.uniform_erase_type can be removed as it is redundant.
>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Suggested-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mtd/spi-nor/core.c    | 35 +++++++++++++++--------------------
>  drivers/mtd/spi-nor/core.h    | 28 ++++++++++------------------
>  drivers/mtd/spi-nor/debugfs.c | 13 +++++++------
>  drivers/mtd/spi-nor/sfdp.c    | 30 +++++++++++++-----------------
>  4 files changed, 45 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1b0c6770c14e..5b2f13d0888e 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1150,7 +1150,7 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
>  
>  static bool spi_nor_has_uniform_erase(const struct spi_nor *nor)
>  {
> -	return !!nor->params->erase_map.uniform_erase_type;
> +	return !!nor->params->erase_map.uniform_region.erase_mask;
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
> @@ -1550,7 +1549,7 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
>  			continue;
>  
>  		/* Alignment is not mandatory for overlaid regions */
> -		if (region->offset & SNOR_OVERLAID_REGION &&
> +		if (region->flags & SNOR_OVERLAID_REGION &&
>  		    region->size <= len)
>  			return erase;
>  
> @@ -1568,12 +1567,12 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
>  
>  static u64 spi_nor_region_is_last(const struct spi_nor_erase_region *region)
>  {
> -	return region->offset & SNOR_LAST_REGION;
> +	return region->flags & SNOR_LAST_REGION;
>  }
>  
>  static u64 spi_nor_region_end(const struct spi_nor_erase_region *region)

I'd drop this helper too. It doesn't add much value anymore.

>  {
> -	return (region->offset & ~SNOR_ERASE_FLAGS_MASK) + region->size;
> +	return region->offset + region->size;
>  }
>  
>  /**
> @@ -1604,16 +1603,14 @@ static struct spi_nor_erase_region *
>  spi_nor_find_erase_region(const struct spi_nor_erase_map *map, u64 addr)
>  {
>  	struct spi_nor_erase_region *region = map->regions;
> -	u64 region_start = region->offset & ~SNOR_ERASE_FLAGS_MASK;
> -	u64 region_end = region_start + region->size;
> +	u64 region_end = spi_nor_region_end(region);
>  
> -	while (addr < region_start || addr >= region_end) {
> +	while (addr < region->offset || addr >= region_end) {

while (addr < region->offset || addr >= region->offset + region->size) {

>  		region = spi_nor_region_next(region);
>  		if (!region)
>  			return ERR_PTR(-EINVAL);
>  
> -		region_start = region->offset & ~SNOR_ERASE_FLAGS_MASK;
> -		region_end = region_start + region->size;
> +		region_end = spi_nor_region_end(region);

Then get rid of the spi_nor_region_end() helper, which I don't see
as useful as it was anymore. Also debugfs.c and sfdp.c don't use
it neither.

>  	}
>  
>  	return region;
> @@ -1641,7 +1638,7 @@ spi_nor_init_erase_cmd(const struct spi_nor_erase_region *region,
>  	cmd->opcode = erase->opcode;
>  	cmd->count = 1;
>  
> -	if (region->offset & SNOR_OVERLAID_REGION)
> +	if (region->flags & SNOR_OVERLAID_REGION)
>  		cmd->size = region->size;
>  	else
>  		cmd->size = erase->size;
> @@ -1700,7 +1697,7 @@ static int spi_nor_init_erase_cmd_list(struct spi_nor *nor,
>  
>  		if (prev_erase != erase ||
>  		    erase->size != cmd->size ||
> -		    region->offset & SNOR_OVERLAID_REGION) {
> +		    region->flags & SNOR_OVERLAID_REGION) {
>  			cmd = spi_nor_init_erase_cmd(region, erase);
>  			if (IS_ERR(cmd)) {
>  				ret = PTR_ERR(cmd);
> @@ -2439,12 +2436,11 @@ void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase)
>  void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
>  				    u8 erase_mask, u64 flash_size)
>  {
> -	/* Offset 0 with erase_mask and SNOR_LAST_REGION bit set */
> -	map->uniform_region.offset = (erase_mask & SNOR_ERASE_TYPE_MASK) |
> -				     SNOR_LAST_REGION;
> +	map->uniform_region.offset = 0;
>  	map->uniform_region.size = flash_size;
> +	map->uniform_region.erase_mask = erase_mask;
> +	map->uniform_region.flags = SNOR_LAST_REGION;
>  	map->regions = &map->uniform_region;
> -	map->uniform_erase_type = erase_mask;
>  }
>  
>  int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
> @@ -2539,7 +2535,7 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
>  {
>  	const struct spi_nor_erase_type *tested_erase, *erase = NULL;
>  	int i;
> -	u8 uniform_erase_type = map->uniform_erase_type;
> +	u8 uniform_erase_type = map->uniform_region.erase_mask;
>  
>  	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
>  		if (!(uniform_erase_type & BIT(i)))
> @@ -2573,8 +2569,7 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
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
> index 9217379b9cfe..e002de22b18a 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -233,27 +233,25 @@ struct spi_nor_erase_command {
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
> + * @flags:		flags to determine if this region is overlaid, if this
> + *			region is the last in the SPI NOR flash memory
>   */
>  struct spi_nor_erase_region {
>  	u64		offset;
>  	u64		size;
> +	u8		erase_mask;
> +	u8		flags;
>  };
>  
>  #define SNOR_ERASE_TYPE_MAX	4
> -#define SNOR_ERASE_TYPE_MASK	GENMASK_ULL(SNOR_ERASE_TYPE_MAX - 1, 0)
>  
> -#define SNOR_LAST_REGION	BIT(4)
> -#define SNOR_OVERLAID_REGION	BIT(5)
> -
> -#define SNOR_ERASE_FLAGS_MAX	6
> -#define SNOR_ERASE_FLAGS_MASK	GENMASK_ULL(SNOR_ERASE_FLAGS_MAX - 1, 0)
> +#define SNOR_LAST_REGION	BIT(0)
> +#define SNOR_OVERLAID_REGION	BIT(1)
>  
>  /**
>   * struct spi_nor_erase_map - Structure to describe the SPI NOR erase map
> @@ -266,17 +264,11 @@ struct spi_nor_erase_region {
>   *			The erase types are sorted in ascending order, with the
>   *			smallest Erase Type size being the first member in the
>   *			erase_type array.
> - * @uniform_erase_type:	bitmask encoding erase types that can erase the
> - *			entire memory. This member is completed at init by
> - *			uniform and non-uniform SPI NOR flash memories if they
> - *			support at least one erase type that can erase the
> - *			entire memory.
>   */
>  struct spi_nor_erase_map {
>  	struct spi_nor_erase_region	*regions;
>  	struct spi_nor_erase_region	uniform_region;
>  	struct spi_nor_erase_type	erase_type[SNOR_ERASE_TYPE_MAX];
> -	u8				uniform_erase_type;
>  };
>  
>  /**
> diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
> index 6e163cb5b478..16b30f1a3066 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
> @@ -147,16 +147,17 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
>  	for (region = erase_map->regions;
>  	     region;
>  	     region = spi_nor_region_next(region)) {
> -		u64 start = region->offset & ~SNOR_ERASE_FLAGS_MASK;
> -		u64 flags = region->offset & SNOR_ERASE_FLAGS_MASK;
> +		u64 start = region->offset;
>  		u64 end = start + region->size - 1;
> +		u8 erase_mask = region->erase_mask;
> +		u8 flags = region->flags;
>  
>  		seq_printf(s, " %08llx-%08llx |     [%c%c%c%c] | %s\n",
>  			   start, end,
> -			   flags & BIT(0) ? '0' : ' ',
> -			   flags & BIT(1) ? '1' : ' ',
> -			   flags & BIT(2) ? '2' : ' ',
> -			   flags & BIT(3) ? '3' : ' ',
> +			   erase_mask & BIT(0) ? '0' : ' ',
> +			   erase_mask & BIT(1) ? '1' : ' ',
> +			   erase_mask & BIT(2) ? '2' : ' ',
> +			   erase_mask & BIT(3) ? '3' : ' ',
>  			   flags & SNOR_OVERLAID_REGION ? "overlaid" : "");
>  	}
>  
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index b3b11dfed789..c8d8b4e5b7e6 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -389,17 +389,14 @@ static u8 spi_nor_sort_erase_mask(struct spi_nor_erase_map *map, u8 erase_mask)
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

This comment could also be dropped now. The assignment is pretty
obvious now.

With above remarks fixed:
Reviewed-by: Michael Walle <mwalle@kernel.org>

Maybe Tudor can fix while applying.

-michael

> -		region->offset = (region->offset & ~SNOR_ERASE_TYPE_MASK) |
> -				 sorted_erase_mask;
> +		region->erase_mask = sorted_erase_mask;
>  
>  		region = spi_nor_region_next(region);
>  	}
> @@ -553,8 +550,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	 * selecting the uniform erase.
>  	 */
>  	spi_nor_regions_sort_erase_types(map);
> -	map->uniform_erase_type = map->uniform_region.offset &
> -				  SNOR_ERASE_TYPE_MASK;
>  
>  	/* Stop here if not JESD216 rev A or later. */
>  	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
> @@ -781,12 +776,12 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  
>  static void spi_nor_region_mark_end(struct spi_nor_erase_region *region)
>  {
> -	region->offset |= SNOR_LAST_REGION;
> +	region->flags |= SNOR_LAST_REGION;
>  }
>  
>  static void spi_nor_region_mark_overlay(struct spi_nor_erase_region *region)
>  {
> -	region->offset |= SNOR_OVERLAID_REGION;
> +	region->flags |= SNOR_OVERLAID_REGION;
>  }
>  
>  /**
> @@ -848,9 +843,10 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
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
> @@ -866,21 +862,21 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>  		 */
>  		regions_erase_type |= erase_type;
>  
> -		offset = (region[i].offset & ~SNOR_ERASE_FLAGS_MASK) +
> -			 region[i].size;
> +		offset = region[i].offset + region[i].size;
>  	}
>  	spi_nor_region_mark_end(&region[i - 1]);
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
