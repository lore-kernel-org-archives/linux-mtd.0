Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7F0C4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 14:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9xOxrS0y+BDQj2RnU/qLoqBeRQF7vpHSpXT2EKULAg=; b=3eJlfHwcGPrsHp
	E9LpkscRsuQE6TAQyl1faJ7ZI16nFbP1u+VX32i0Q4YCaCfFLTVGmBb1obopRy1oKOtbF++AeCw5I
	bq7L1/t0eN60RdT0J2zCXiam7Uz6z8G5jFE3Se02ygqZSA2E8jZJ+QGhHjzkaY6OC7gXyowtJZvdH
	fJiobSbDmli9TxcY/6TumyzuiJqNohd8jUcGHg3sDYkFYCfm7SLQudO2zjUC4LuJCtKtZ+18tsU4l
	GqrOnZyQxD4v4oesvUmrSpuqpxMaaj0VB3XUSwqXm1Zs68P4dYdwyGx4xAOOPW9qbG7LKdnx2a0FV
	WGn/yAus24XUV/rR0qEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6OV-0000000GN06-3VeX;
	Wed, 17 Apr 2024 14:36:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6OT-0000000GMzJ-04pH
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 14:36:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AB70BCE12B8;
	Wed, 17 Apr 2024 14:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6F3C072AA;
	Wed, 17 Apr 2024 14:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713364568;
	bh=+Y9JzAylpqFu2bRnmflUigQpLiwfuTJ/VegvAB2EcjM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=anjArfD6oxx6cZ4qCiZG864wcbmxykfLW+BETZ+XMQD+XcgrVnvSeTdx2jB4Apr/n
	 5ovg3ouCBrr84D1+CtJgiGng2wkoDTQkImulTZB80oJb+3jr86IPypSLiXsm2XewvE
	 +x5bg8vdu2oFCQzyz5p6m8geYsaC7KnX7scs89gjskEKJAcHAwpjrOL5lLB3pB+U+/
	 QY0AbML6ucdpVAtA6myQ5ciR8rJe/fliiOXbnWVVgQbw4TrpOAVuKr2l9ORtT9RZNq
	 zLYMBC6yeu6F0CBnjwLPmyffVi1Xw07u6QYlCk1Pqbc6NrlSH68tlq0gOYCpdeQC93
	 zNLfcSX/mubBw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v1 6/6] mtd: spi-nor: introduce support for
 displaying deprecation message
In-Reply-To: <20240412134405.381832-7-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 12 Apr 2024 15:44:05 +0200")
References: <20240412134405.381832-1-mwalle@kernel.org>
	<20240412134405.381832-7-mwalle@kernel.org>
Date: Wed, 17 Apr 2024 16:36:06 +0200
Message-ID: <mafs0jzkw6oq1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_073613_449663_C752950D 
X-CRM114-Status: GOOD (  27.60  )
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

On Fri, Apr 12 2024, Michael Walle wrote:

> SPI-NOR will automatically detect the attached flash device most of the
> time. We cannot easily find out if boards are using a given flash.
> Therefore, introduce a (temporary) flag to display a message on boot if

Why temporary? There will always be a need to deprecate one flash or
another. Might as well keep the flag around.

Also, this patch/series does not add any users of the deprecated flag.
If you have some flashes in mind, it would be good to add them to the
patch/series.

I like the idea in general. Do you think we should also print a rough
date for the deprecation as well?

> support for a given flash device is scheduled to be removed in the
> future.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mtd/spi-nor/core.c | 12 ++++++++++++
>  drivers/mtd/spi-nor/core.h |  1 +
>  2 files changed, 13 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 58d310427d35..a294eef2e34a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3312,6 +3312,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>  						       const char *name)
>  {
>  	const struct flash_info *jinfo = NULL, *info = NULL;
> +	const char *deprecated = NULL;
>  
>  	if (name)
>  		info = spi_nor_match_name(nor, name);
> @@ -3326,6 +3327,17 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>  			return jinfo;
>  	}
>  
> +	if (info && (info->flags & SPI_NOR_DEPRECATED))
> +		deprecated = info->name;
> +	else if (jinfo && (jinfo->flags & SPI_NOR_DEPRECATED))
> +		deprecated = jinfo->name;
> +
> +	if (deprecated)
> +		pr_warn("Your board or device tree is using a SPI NOR flash (%s) with\n"
> +			"deprecated driver support. It will be removed in future kernel\n"

Nit: "removed in a future kernel version"

> +			"version. If you feel this shouldn't be the case, please contact\n"
> +			"us at linux-mtd@lists.infradead.org\n", deprecated);
> +

Hmm, this isn't so nice. I'd suggest doing something like:

	/*
         * If caller has specified name of flash model that can normally be
         * ...
         */
	info = jinfo ?: info;

	if (info->flags & SPI_NOR_DEPRECATED)
        	pr_warn(...);

	return info;

>  	/*
>  	 * If caller has specified name of flash model that can normally be
>  	 * detected using JEDEC, let's verify it.
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 8552e31b1b07..0317d8e253f4 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -524,6 +524,7 @@ struct flash_info {
>  #define SPI_NOR_NO_ERASE		BIT(6)
>  #define SPI_NOR_QUAD_PP			BIT(8)
>  #define SPI_NOR_RWW			BIT(9)
> +#define SPI_NOR_DEPRECATED		BIT(15)

If you do agree with my suggestion of making it permanent, would it make
more sense to make it BIT(10) instead. Or BIT(9) once you move up the
others because we no longer have BIT(7).

>  
>  	u8 no_sfdp_flags;
>  #define SPI_NOR_SKIP_SFDP		BIT(0)

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
