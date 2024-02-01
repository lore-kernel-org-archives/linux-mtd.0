Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94F4C4828D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 16:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iG8SYq/ufZxHioBO3XoECAbR/5ffv+g35avKBfA4/TQ=; b=CSXQ+UVcaERq7/eFUZL2nRTkYB
	vLi9KT7Sq1GK0MStUhqSq0xj3R5+cRlOvWEUFbs1EBAbwSWsmNyU3zU8BJNU7rikuEkSuJJdTFcap
	9eM2iqOT8BsztDI7u9kWhKZdCNlOKCfYgKnpv8sjxi/0UV1gGF404jzjEtzLrZdRP74Cufv/RcxYx
	5HB+8Wx5LtisYWU4m96frkB6C3YJUPCyLWk2CTmSyZtfh2O47FPojgcUUc5TbCYUhh6aMlrFte0R3
	4xM29Q/PcaRtwBg0uKG+VoLMNZlC+0roUD8/vySnvDZkXWoiB/DBD9QHTWxok8cP+qt6i8O2fwRCp
	hXLRR7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZnw-00000008cLC-2eZ7;
	Thu, 01 Feb 2024 16:20:44 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZns-00000008cIo-3nCq
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 16:20:43 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id BE3B232E;
	Thu,  1 Feb 2024 17:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1706804438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tagKdmpTD9tFEeQ9YiKAwR4jMWWBKUehdwj1ewG2/EE=;
	b=CNgg4KU0H3hRFiE6kj0R8P32U309EcCJVY2NA5EEkSM92N+fK/kbhLVnFPyHftc8MuycSS
	I3NWbL8U/BiLfInr6VS0+pyMi2vTWIQF0nrTL4hSm0d/SSwp7xaEVumu+Q8K1KFxFgs6TK
	2kIKBdHzWzOYxnITMYk5+95kAhbsr+FpAXkrzPw0qjeAMckvbxx9kVXko3VjCslPrmQu8a
	BPLQ+FjtUNPqVAgrlh1bXiWcwgYpTlJz9CmBO6c6m+1x1HyGmT2DXNucnjlJkBbUpOde3Q
	vBb/IfBrb0/KEphrWxNE7EkChWbesuxz4v2nqn9wsbr9jXwOgVX/NoT/d4/i9Q==
MIME-Version: 1.0
Date: Thu, 01 Feb 2024 17:20:38 +0100
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: core: set mtd->eraseregions for
 non-uniform erase map
In-Reply-To: <9187339db22136fa306be69c2e20233516c3a4c4.1705996635.git.Takahiro.Kuwano@infineon.com>
References: <cover.1705996635.git.Takahiro.Kuwano@infineon.com>
 <9187339db22136fa306be69c2e20233516c3a4c4.1705996635.git.Takahiro.Kuwano@infineon.com>
Message-ID: <7a6b27c73656bab1db148bea94d91b6d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_082041_148632_FFA530B9 
X-CRM114-Status: GOOD (  29.84  )
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

Hi,

> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Infineon SPI NOR flash devices support hybrid sector layout 
> that
> overlays 4KB sectors on a 256KB sector and SPI NOR framework recognizes
> that by parsing SMPT and construct params->erase_map. The hybrid sector
> layout is similar to CFI flash devices that have small sectors on top
> and/or bottom address. In case of CFI flash devices, the erase map
> information is parsed through CFI table and populated into
> mtd->eraseregions so that users can create MTD partitions that aligned
> with small sector boundaries. This patch provides the same capability 
> to
> SPI NOR flash devices that have non-uniform erase map.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/core.c | 59 ++++++++++++++++++++++++++++++++++++--
>  drivers/mtd/spi-nor/core.h |  2 ++
>  drivers/mtd/spi-nor/sfdp.c |  1 +
>  3 files changed, 60 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5b2f13d0888e..25702d604fc5 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2441,6 +2441,7 @@ void spi_nor_init_uniform_erase_map(struct 
> spi_nor_erase_map *map,
>  	map->uniform_region.erase_mask = erase_mask;
>  	map->uniform_region.flags = SNOR_LAST_REGION;
>  	map->regions = &map->uniform_region;
> +	map->n_regions = 1;

Ahh, here it is. So, this should go into the former patch
and the SNOR_LAST_REGION flag should be dropped. They are
redundant, right?

>  }
> 
>  int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
> @@ -3403,7 +3404,54 @@ static const struct flash_info 
> *spi_nor_get_flash_info(struct spi_nor *nor,
>  	return info;
>  }
> 
> -static void spi_nor_set_mtd_info(struct spi_nor *nor)
> +static u32
> +spi_nor_get_region_erasesize(const struct spi_nor_erase_region 
> *region,
> +			     const struct spi_nor_erase_type *erase_type)
> +{
> +	u8 i;
> +
> +	if (region->flags & SNOR_OVERLAID_REGION)
> +		return region->size;
> +
> +	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
> +		if (region->erase_mask & BIT(i))
> +			return erase_type[i].size;
> +	}
> +
> +	return 0;
> +}
> +
> +static int spi_nor_set_mtd_eraseregions(struct spi_nor *nor)
> +{
> +	const struct spi_nor_erase_map *map = &nor->params->erase_map;
> +	const struct spi_nor_erase_region *region = map->regions;
> +	struct mtd_erase_region_info *mtd_region;
> +	struct mtd_info *mtd = &nor->mtd;
> +	u32 erasesize, i;
> +
> +	mtd_region = devm_kcalloc(nor->dev, map->n_regions, 
> sizeof(*mtd_region),
> +				  GFP_KERNEL);
> +	if (!mtd_region)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < map->n_regions; i++) {
> +		erasesize = spi_nor_get_region_erasesize(&region[i],
> +							 map->erase_type);
> +		if (!erasesize)
> +			return -EINVAL;
> +
> +		mtd_region[i].erasesize = erasesize;
> +		mtd_region[i].numblocks = div64_ul(region[i].size, erasesize);
> +		mtd_region[i].offset = region[i].offset;
> +	}
> +
> +	mtd->numeraseregions = map->n_regions;
> +	mtd->eraseregions = mtd_region;
> +
> +	return 0;
> +}
> +
> +static int spi_nor_set_mtd_info(struct spi_nor *nor)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  	struct device *dev = nor->dev;
> @@ -3434,6 +3482,11 @@ static void spi_nor_set_mtd_info(struct spi_nor 
> *nor)
>  	mtd->_resume = spi_nor_resume;
>  	mtd->_get_device = spi_nor_get_device;
>  	mtd->_put_device = spi_nor_put_device;
> +
> +	if (!spi_nor_has_uniform_erase(nor))
> +		return spi_nor_set_mtd_eraseregions(nor);

Btw I wonder if we can set it in any case?

Apart from the n_regions thing, this looks good.

-michael

> +
> +	return 0;
>  }
> 
>  static int spi_nor_hw_reset(struct spi_nor *nor)
> @@ -3526,7 +3579,9 @@ int spi_nor_scan(struct spi_nor *nor, const char 
> *name,
>  		return ret;
> 
>  	/* No mtd_info fields should be used up to this point. */
> -	spi_nor_set_mtd_info(nor);
> +	ret = spi_nor_set_mtd_info(nor);
> +	if (ret)
> +		return ret;
> 
>  	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>  			(long long)mtd->size >> 10);
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index e002de22b18a..fefa990525ff 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -264,11 +264,13 @@ struct spi_nor_erase_region {
>   *			The erase types are sorted in ascending order, with the
>   *			smallest Erase Type size being the first member in the
>   *			erase_type array.
> + * @n_regions:		number of erase regions.
>   */
>  struct spi_nor_erase_map {
>  	struct spi_nor_erase_region	*regions;
>  	struct spi_nor_erase_region	uniform_region;
>  	struct spi_nor_erase_type	erase_type[SNOR_ERASE_TYPE_MAX];
> +	unsigned int			n_regions;
>  };
> 
>  /**
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index c8d8b4e5b7e6..afe041f75f30 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -836,6 +836,7 @@ static int 
> spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>  	if (!region)
>  		return -ENOMEM;
>  	map->regions = region;
> +	map->n_regions = region_count;
> 
>  	uniform_erase_type = 0xff;
>  	regions_erase_type = 0;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
