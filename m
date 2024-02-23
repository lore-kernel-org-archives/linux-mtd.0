Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70E5C54E4A
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxxoZEEqlqYgwPQDs6dxnYR9NQVx6MaR5RxbwxYvmQk=; b=iB71UcXgYjDJs4
	29yOWfnBwKuNRLqO6tqqaPrg0+CiVA8cIXSgguM88qUlcAXxiO0yAwUPZGt63vEwvkin6RGDWIPr/
	ZKcRhAnHkKtQmDC2AoA/XwyHpUfvpgWxc7tVlg43+OGlYLZrk2izjoWGIfC/QqBJHx4T2j371/U1g
	PWx7zrawW3VNWutBRn3KqWQ+euhzc/RpN64ILZZ3HxIlLKz8UJWJ0hP99hOTaQh48uE0loUib8p2C
	6fNoFA3ddZgm8t0+SRSpF5TLE4biTVOx4iCQJHm1wnElbSHTVvHXQ4XlnDJ5NVSsaDURyNZbDtWbr
	1S+dLkWlBZEbrg/3FyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSdN-00000008s2c-16mL;
	Fri, 23 Feb 2024 10:18:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSd8-00000008rno-1y2R
	for linux-mtd@bombadil.infradead.org;
	Fri, 23 Feb 2024 10:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=7KNfDajaKy0432t1nxqJO795bwzxlDn7NXN4yiJxJVk=; b=jg+AvKIEsFfLVJisxOe90Lkl3R
	Qa5Vc7uWwuXTFKWrp3E9DS5XM9ulBl4miyGKcvrdovGPGUtBVI6MU2nAjq46YfAll+xaD+xsvfKgB
	VmEa2bplN5ygb2YGEqsMLTNXYgVGm7g8zxdkUA0z/iev2eByCSzfK8sVTsYDTuGmYvJzUt5LLgpho
	t3KCcuVXuDttez2dWlHbTjz8q9ZV/3m2IrkYzDgbaZd2ohYfgSK2Iuqu/hvDm2VeXP+b8aT/BNGgf
	0bxSS1gcx5PGM7cVEqx+UAcQvf9OFjD3i+9+wwTt+yXl4OqyVbNfz2bskSeotiDHfWCKTbhxl5Y+F
	V9UpdF5g==;
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSd5-00000006df0-0YdJ
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 10:18:08 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 148DDA08;
	Fri, 23 Feb 2024 11:17:51 +0100 (CET)
Mime-Version: 1.0
Date: Fri, 23 Feb 2024 11:17:50 +0100
Message-Id: <CZCDQLZW6P1M.26WJS6HQEVDRO@kernel.org>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 2/4] mtd: spi-nor: core: get rid of SNOR_LAST_REGION
 flag
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
 <eded84294bd81e966d6f423e578fc2cfb9a4a5b6.1708404584.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <eded84294bd81e966d6f423e578fc2cfb9a4a5b6.1708404584.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_101807_259839_ADAF3E9F 
X-CRM114-Status: GOOD (  25.98  )
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
> Introduce n_regions in spi_nor_erase_map structure and remove
> SNOR_LAST_REGION flag. Loop logics that depend on the flag are also
> reworked to use n_regions as loop condition.
>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Suggested-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mtd/spi-nor/core.c    | 105 +++++++++-------------------------
>  drivers/mtd/spi-nor/core.h    |  10 ++--
>  drivers/mtd/spi-nor/debugfs.c |  16 +++---
>  drivers/mtd/spi-nor/sfdp.c    |  18 ++----
>  4 files changed, 43 insertions(+), 106 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5b2f13d0888e..d9a0c0e31950 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1565,57 +1565,11 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
>  	return NULL;
>  }
>  
> -static u64 spi_nor_region_is_last(const struct spi_nor_erase_region *region)
> -{
> -	return region->flags & SNOR_LAST_REGION;
> -}
> -
>  static u64 spi_nor_region_end(const struct spi_nor_erase_region *region)
>  {
>  	return region->offset + region->size;
>  }
>  
> -/**
> - * spi_nor_region_next() - get the next spi nor region
> - * @region:	pointer to a structure that describes a SPI NOR erase region
> - *
> - * Return: the next spi nor region or NULL if last region.
> - */
> -struct spi_nor_erase_region *
> -spi_nor_region_next(struct spi_nor_erase_region *region)
> -{
> -	if (spi_nor_region_is_last(region))
> -		return NULL;
> -	region++;
> -	return region;
> -}
> -
> -/**
> - * spi_nor_find_erase_region() - find the region of the serial flash memory in
> - *				 which the offset fits
> - * @map:	the erase map of the SPI NOR
> - * @addr:	offset in the serial flash memory
> - *
> - * Return: a pointer to the spi_nor_erase_region struct, ERR_PTR(-errno)
> - *	   otherwise.
> - */
> -static struct spi_nor_erase_region *
> -spi_nor_find_erase_region(const struct spi_nor_erase_map *map, u64 addr)
> -{
> -	struct spi_nor_erase_region *region = map->regions;
> -	u64 region_end = spi_nor_region_end(region);
> -
> -	while (addr < region->offset || addr >= region_end) {
> -		region = spi_nor_region_next(region);
> -		if (!region)
> -			return ERR_PTR(-EINVAL);
> -
> -		region_end = spi_nor_region_end(region);
> -	}
> -
> -	return region;
> -}
> -
>  /**
>   * spi_nor_init_erase_cmd() - initialize an erase command
>   * @region:	pointer to a structure that describes a SPI NOR erase region
> @@ -1682,48 +1636,41 @@ static int spi_nor_init_erase_cmd_list(struct spi_nor *nor,
>  	struct spi_nor_erase_region *region;
>  	struct spi_nor_erase_command *cmd = NULL;
>  	u64 region_end;
> +	unsigned int i;
>  	int ret = -EINVAL;
>  
> -	region = spi_nor_find_erase_region(map, addr);
> -	if (IS_ERR(region))
> -		return PTR_ERR(region);
> -
> -	region_end = spi_nor_region_end(region);
> +	for (i = 0; i < map->n_regions; i++) {
> +		region = &map->regions[i];
> +		region_end = spi_nor_region_end(region);

Likewise,

region_end = return region->offset + region->size;

>  
> -	while (len) {
> -		erase = spi_nor_find_best_erase_type(map, region, addr, len);
> -		if (!erase)
> -			goto destroy_erase_cmd_list;
> -
> -		if (prev_erase != erase ||
> -		    erase->size != cmd->size ||
> -		    region->flags & SNOR_OVERLAID_REGION) {
> -			cmd = spi_nor_init_erase_cmd(region, erase);
> -			if (IS_ERR(cmd)) {
> -				ret = PTR_ERR(cmd);
> +		while (len && addr >= region->offset && addr < region_end) {
> +			erase = spi_nor_find_best_erase_type(map, region, addr,
> +							     len);
> +			if (!erase)
>  				goto destroy_erase_cmd_list;
> -			}
>  
> -			list_add_tail(&cmd->list, erase_list);
> -		} else {
> -			cmd->count++;
> -		}
> -
> -		addr += cmd->size;
> -		len -= cmd->size;
> +			if (prev_erase != erase || erase->size != cmd->size ||
> +			    region->flags & SNOR_OVERLAID_REGION) {
> +				cmd = spi_nor_init_erase_cmd(region, erase);
> +				if (IS_ERR(cmd)) {
> +					ret = PTR_ERR(cmd);
> +					goto destroy_erase_cmd_list;
> +				}
> +
> +				list_add_tail(&cmd->list, erase_list);
> +			} else {
> +				cmd->count++;
> +			}
>  
> -		if (len && addr >= region_end) {
> -			region = spi_nor_region_next(region);
> -			if (!region)
> -				goto destroy_erase_cmd_list;
> -			region_end = spi_nor_region_end(region);
> +			len -= cmd->size;
> +			addr += cmd->size;
> +			prev_erase = erase;
>  		}
>  
> -		prev_erase = erase;
> +		if (!len)
> +			return 0;
>  	}

From what I can tell, this looks ok,

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

>  
> -	return 0;
> -
>  destroy_erase_cmd_list:
>  	spi_nor_destroy_erase_cmd_list(erase_list);
>  	return ret;
> @@ -2439,8 +2386,8 @@ void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
>  	map->uniform_region.offset = 0;
>  	map->uniform_region.size = flash_size;
>  	map->uniform_region.erase_mask = erase_mask;
> -	map->uniform_region.flags = SNOR_LAST_REGION;
>  	map->regions = &map->uniform_region;
> +	map->n_regions = 1;
>  }
>  
>  int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index e002de22b18a..1668d79f55bc 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -238,8 +238,7 @@ struct spi_nor_erase_command {
>   *			inside this region. The erase types are sorted in
>   *			ascending order with the smallest Erase Type size being
>   *			at BIT(0).
> - * @flags:		flags to determine if this region is overlaid, if this
> - *			region is the last in the SPI NOR flash memory
> + * @flags:		flags to determine if this region is overlaid.
>   */
>  struct spi_nor_erase_region {
>  	u64		offset;
> @@ -250,8 +249,7 @@ struct spi_nor_erase_region {
>  
>  #define SNOR_ERASE_TYPE_MAX	4
>  
> -#define SNOR_LAST_REGION	BIT(0)
> -#define SNOR_OVERLAID_REGION	BIT(1)
> +#define SNOR_OVERLAID_REGION	BIT(0)
>  
>  /**
>   * struct spi_nor_erase_map - Structure to describe the SPI NOR erase map
> @@ -264,11 +262,13 @@ struct spi_nor_erase_region {
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
> @@ -699,8 +699,6 @@ void spi_nor_set_pp_settings(struct spi_nor_pp_command *pp, u8 opcode,
>  void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
>  			    u8 opcode);
>  void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase);
> -struct spi_nor_erase_region *
> -spi_nor_region_next(struct spi_nor_erase_region *region);
>  void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
>  				    u8 erase_mask, u64 flash_size);
>  
> diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
> index 16b30f1a3066..0832b5893d6b 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
> @@ -78,10 +78,10 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
>  	struct spi_nor *nor = s->private;
>  	struct spi_nor_flash_parameter *params = nor->params;
>  	struct spi_nor_erase_map *erase_map = &params->erase_map;
> -	struct spi_nor_erase_region *region;
> +	struct spi_nor_erase_region *region = erase_map->regions;
>  	const struct flash_info *info = nor->info;
>  	char buf[16], *str;
> -	int i;
> +	unsigned int i;
>  
>  	seq_printf(s, "name\t\t%s\n", info->name);
>  	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
> @@ -144,13 +144,11 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
>  	seq_puts(s, "\nsector map\n");
>  	seq_puts(s, " region (in hex)   | erase mask | flags\n");
>  	seq_puts(s, " ------------------+------------+----------\n");
> -	for (region = erase_map->regions;
> -	     region;
> -	     region = spi_nor_region_next(region)) {
> -		u64 start = region->offset;
> -		u64 end = start + region->size - 1;
> -		u8 erase_mask = region->erase_mask;
> -		u8 flags = region->flags;
> +	for (i = 0; i < erase_map->n_regions; i++) {
> +		u64 start = region[i].offset;
> +		u64 end = start + region[i].size - 1;
> +		u8 erase_mask = region[i].erase_mask;
> +		u8 flags = region[i].flags;
>  
>  		seq_printf(s, " %08llx-%08llx |     [%c%c%c%c] | %s\n",
>  			   start, end,
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index c8d8b4e5b7e6..c4721d7dc97a 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -390,15 +390,14 @@ static void spi_nor_regions_sort_erase_types(struct spi_nor_erase_map *map)
>  {
>  	struct spi_nor_erase_region *region = map->regions;
>  	u8 sorted_erase_mask;
> +	unsigned int i;
>  
> -	while (region) {
> -		sorted_erase_mask = spi_nor_sort_erase_mask(map,
> -							    region->erase_mask);
> +	for (i = 0; i < map->n_regions; i++) {
> +		sorted_erase_mask =
> +			spi_nor_sort_erase_mask(map, region[i].erase_mask);
>  
>  		/* Overwrite erase mask. */
> -		region->erase_mask = sorted_erase_mask;
> -
> -		region = spi_nor_region_next(region);
> +		region[i].erase_mask = sorted_erase_mask;
>  	}
>  }
>  
> @@ -774,11 +773,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  	return ret;
>  }
>  
> -static void spi_nor_region_mark_end(struct spi_nor_erase_region *region)
> -{
> -	region->flags |= SNOR_LAST_REGION;
> -}
> -
>  static void spi_nor_region_mark_overlay(struct spi_nor_erase_region *region)
>  {
>  	region->flags |= SNOR_OVERLAID_REGION;
> @@ -836,6 +830,7 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>  	if (!region)
>  		return -ENOMEM;
>  	map->regions = region;
> +	map->n_regions = region_count;
>  
>  	uniform_erase_type = 0xff;
>  	regions_erase_type = 0;
> @@ -864,7 +859,6 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>  
>  		offset = region[i].offset + region[i].size;
>  	}
> -	spi_nor_region_mark_end(&region[i - 1]);
>  
>  	save_uniform_erase_type = map->uniform_region.erase_mask;
>  	map->uniform_region.erase_mask =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
