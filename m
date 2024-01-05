Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB875C3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hipq9j1RU1CMZQXZ/8C5GyYqD4mfxgxp7f+0Qvs+1s=; b=Jp+ieFSNy899GfHahpsnkFoZO0
	nrR21RiH3DgSWfDwASjeMnQO2EbIjrZwxOSQQGhDHVD4pgvJsvTFf0+SkUWa1r0IOn8Na138qf7x6
	7au2v8vDqc/1dLZA3FDO6mlZ7w8+VRMlwhgfF9755h8zgWFyTbhtouFI0n+hkBGQJDJFEDimD9zwc
	a75tG49W6dGLM9N65NmaFh9CgM41LI8bzWyB9RXACuBaEVJIuvFU0K4YZ56dVaHQ5iyNpfRjd6tZk
	8GJc08aiybyOhiqwnKj+g2InA0T/W8UWppwFszlNgaaAs7qkP61h5gE7TgJ5ouWsMnAdR11C7OImO
	/DQprvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjEb-00GqFM-0J;
	Fri, 05 Jan 2024 12:23:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjEY-00GqEz-1X
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 12:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 74E5261A9F;
	Fri,  5 Jan 2024 12:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24146C433C8;
	Fri,  5 Jan 2024 12:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704457409;
	bh=u7T6Y7DWhVMRnobA9AmM4fwhwJDj+WcNQNmnKaTekQU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TdIe41GdHREOCSk6APQ9eoKmPL2oU20pWaPI2MkbJknxzzWIG2YfkumR1Y51nVE8x
	 j3VYJv2HPhGafFYkDQBM+OyWbzDBNN+BNOowv5JUMUP/dxs5IzWnNPt5mDkp0Ybu/6
	 2V+Oe6GPPfqABHjQfiWqlzkJxK2I75PZQR6RUD9TOKcKKEgJo73MlPn+X113nH/2kw
	 J2x5jD1JvqVbUFFcC2Ee1zZvyArUgMaB4ILe1qiDBLAaS/8JD4gTvuJsFHiyurmpA0
	 PjadoNqLDoJJbWK+o7srYYdw7z6Bv4UYbDuU2A+TpPF6Gh/ogFuZ9AHLwVXgxkeJvW
	 XXYbBDdf6cvWQ==
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 13:23:24 +0100
From: Michael Walle <mwalle@kernel.org>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
In-Reply-To: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
Message-ID: <740bf235110e05eae9ec7768603e6e2a@walle.cc>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_042330_620412_77853776 
X-CRM114-Status: GOOD (  19.40  )
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

> -static void spi_nor_set_mtd_info(struct spi_nor *nor)
> +static int spi_nor_set_mtd_eraseregions(struct spi_nor *nor)
> +{
> +	struct spi_nor_erase_map *map = &nor->params->erase_map;
> +	struct spi_nor_erase_region *region = map->regions;
> +	struct mtd_info *mtd = &nor->mtd;
> +	struct mtd_erase_region_info *mtd_region;
> +	u32 erase_size;
> +	u8 erase_mask;
> +	int n_regions, i, j;
> +
> +	for (i = 0; !spi_nor_region_is_last(&region[i]); i++)
> +		;

Please put that into a helper which returns the number of regions.

FWIW, I really dislike the magic around encoding all sorts of stuff
into the offset. It makes the code just hard to read.


> +
> +	n_regions = i + 1;
> +	mtd_region = devm_kcalloc(nor->dev, n_regions, sizeof(*mtd_region),
> +				  GFP_KERNEL);

Who's the owner? mtd->dev or nor->dev?

> +	if (!mtd_region)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < n_regions; i++) {
> +		if (region[i].offset & SNOR_OVERLAID_REGION) {

Btw. what is an overlaid region? I couldn't find any comment
about it.

> +			erase_size = region[i].size;
> +		} else {
> +			erase_mask = region[i].offset & SNOR_ERASE_TYPE_MASK;
> +
> +			for (j = SNOR_ERASE_TYPE_MAX - 1; j >= 0; j--) {
> +				if (erase_mask & BIT(j)) {
> +					erase_size = map->erase_type[j].size;
> +					break;
> +				}
> +			}
> +		}
> +		mtd_region[i].erasesize = erase_size;
> +		mtd_region[i].numblocks = div64_ul(region[i].size, erase_size);
> +		mtd_region[i].offset = region[i].offset &
> +				       ~SNOR_ERASE_FLAGS_MASK;
> +	}
> +
> +	mtd->numeraseregions = n_regions;
> +	mtd->eraseregions = mtd_region;
> +
> +	return 0;
> +}
> +
> +static int spi_nor_set_mtd_info(struct spi_nor *nor)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  	struct device *dev = nor->dev;
> @@ -3439,6 +3483,11 @@ static void spi_nor_set_mtd_info(struct spi_nor 
> *nor)
>  	mtd->_resume = spi_nor_resume;
>  	mtd->_get_device = spi_nor_get_device;
>  	mtd->_put_device = spi_nor_put_device;
> +
> +	if (spi_nor_has_uniform_erase(nor))
> +		return 0;
> +
> +	return spi_nor_set_mtd_eraseregions(nor);

mtd->erasesize is set somewhere else, please move it into this
function, because it will also have a special case for the
non_uniform flashes. Maybe we'll need our own erasesize stored
together with the opcode.

Also this should be written as

if (!spi_nor_has_uniform_erase(nor))
   spi_nor_set_mtd_eraseregions(nor);

return 0;

-michael

>  }
> 
>  static int spi_nor_hw_reset(struct spi_nor *nor)
> @@ -3531,7 +3580,9 @@ int spi_nor_scan(struct spi_nor *nor, const char 
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

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
