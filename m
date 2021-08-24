Return-Path: <SRS0=de6p=NP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117AFC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 17:53:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C18646108F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 17:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C18646108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGBEFlZ6JFi5tsWPmgS4Utc1aJOOh7eB3bVyxi+C09g=; b=TpCZC71m12QfJf
	VV1hUazb+OICBAJC46cjRc0w0W6EnWa3B8K6itIk5Yj6mbHwBiPwpewvaG9HqHeuilYjOkfmAJASS
	O9V2HXwE7bAbTauVtXmfp3KDy/MNGvgvWGiS23zo8vGwJcG4rLw9iLe3nsu6ARfAxcIckRtmIe4pN
	PtFD5hJRASTVhSrJ/E9rLmg28ineHvnEJfejBCG/uXWQO5oAbonQrqWj6+gGZnmiATQWm+PRgUSzW
	s0/iT9geEF1HlwCkpfILnZYvbjhYqEwM4Zj9QltamRMF8um7+Lqa92zkL8G073CH232nkJznHGNyl
	uTWlcXewBRcKsA7q5Ymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIaav-004G0h-Vn; Tue, 24 Aug 2021 17:52:18 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIaaq-004Fzp-85; Tue, 24 Aug 2021 17:52:16 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17OHpg4G014178;
 Tue, 24 Aug 2021 12:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629827502;
 bh=Tgrsn7g/QXV7XB6taEu8jjV9YhY74uAPpMimuEt9M6Q=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=gWhczkuqBJgkXEwz1RhGzSGMO2MIcIQkqXTq0O6WH4sEhI/cPHi6TCwITNLWu6Df1
 zbAvBIxsiwHrNzX9mATtN4qdqR5z6YWTlJbhNMvTy/ipMFq516tJqomHuNg1AijOuW
 NVgzwN+EK4tXNMdn2NSIqltGvxUxjHno/MLOQHHI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17OHpgD2107889
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Aug 2021 12:51:42 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 24
 Aug 2021 12:51:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 24 Aug 2021 12:51:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17OHpfU0081474;
 Tue, 24 Aug 2021 12:51:41 -0500
Date: Tue, 24 Aug 2021 23:21:40 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 27/35] mtd: spi-nor: core: Init flash params based on
 SFDP first for new flash additions
Message-ID: <20210824175138.vggtefa5xoomcjto@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-28-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-28-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_105212_429347_9A106312 
X-CRM114-Status: GOOD (  41.15  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/07/21 07:52AM, Tudor Ambarus wrote:
> Remove the spagetti way of initializing flash parameters and settings,
> at least for the new flash additions (for now). All flash entries should
> be converted to either use SPI_NOR_PARSE_SFDP or SPI_NOR_SKIP_SFDP.
> SPI_NOR_SKIP_SFDP should be set either when the SFDP tables are completely
> wrong and we can't parse relevant data, or when the SFDP tables are not
> defined at all, or when RDSFDP command is not supported by the flash.
> After all the flash entries will be converted to use these flags and after
> the default_init() hook will be removed, the
> spi_nor_init_params_deprecated() will be replaced by
> spi_nor_info_init_params(). The flash parameters and settings will be
> initialized either by parsing SFDP, or via the flash info flags.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 103 +++++++++++++++++++++++++------------
>  1 file changed, 70 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 9193317f897d..ef06a8d6abb8 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2627,28 +2627,6 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
>  		nor->info->fixups->post_sfdp(nor);
>  }
>  
> -/**
> - * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
> - * based on JESD216 SFDP standard.
> - * @nor:	pointer to a 'struct spi_nor'.
> - *
> - * The method has a roll-back mechanism: in case the SFDP parsing fails, the
> - * legacy flash parameters and settings will be restored.
> - */
> -static void spi_nor_sfdp_init_params(struct spi_nor *nor)
> -{
> -	struct spi_nor_flash_parameter sfdp_params;
> -
> -	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
> -
> -	if (!spi_nor_parse_sfdp(nor))
> -		return spi_nor_post_sfdp_fixups(nor);
> -
> -	memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
> -	nor->addr_width = 0;
> -	nor->flags &= ~SNOR_F_4B_OPCODES;
> -}
> -
>  /**
>   * spi_nor_info_init_params() - Initialize the flash's parameters and settings
>   * based on nor->info data.
> @@ -2722,6 +2700,39 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
>  }
>  
> +/**
> + * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
> + * based on JESD216 SFDP standard.
> + * @nor:	pointer to a 'struct spi_nor'.

Missing documentation for treat_id_collisions.

Also, I assume this will go away when we get rid of 
spi_nor_init_params_deprecated(), correct?

> + *
> + * The method has a roll-back mechanism: in case the SFDP parsing fails, the
> + * legacy flash parameters and settings will be restored.
> + */
> +static void spi_nor_sfdp_init_params(struct spi_nor *nor,
> +				     bool treat_id_collisions)
> +{
> +	struct spi_nor_flash_parameter sfdp_params;
> +
> +	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
> +
> +	if (!spi_nor_parse_sfdp(nor))
> +		return spi_nor_post_sfdp_fixups(nor);
> +
> +	memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
> +	nor->addr_width = 0;
> +	nor->flags &= ~SNOR_F_4B_OPCODES;
> +
> +	if (!treat_id_collisions)
> +		return;

No, this doesn't seem quite right. Why would you not want to treat ID 
collisions for flashes that use spi_nor_init_params_deprecated()? What 
makes this not possible for them?

Anyway, even if we don't want to treat ID collisions for those flashes, 
we can't just return here. In the previous code, nor->params is already 
initialized by spi_nor_info_init_params() so restoring that via memcpy() 
would make sense since it would restore the info-initialized state. Now 
it would be just 0, with no useful information in there. You are bound 
to run into errors somewhere down the line.

So I think you either need to make this function return an error and 
propagate it up the call chain or run spi_nor_info_init_params() for 
both type of flashes to make sure we do our best effort to initialize 
the flash.

> +	/*
> +	 * Fallback to flash info params init in case the SFDP parsing fails.
> +	 * Used to handle ID collisions between flashes that define the SFDP
> +	 * tables and flashes that don't.
> +	 */
> +	spi_nor_info_init_params(nor);
> +	spi_nor_manufacturer_init_params(nor);
> +}
> +
>  /**
>   * spi_nor_late_init_params() - Late initialization of default flash parameters.
>   * @nor:	pointer to a 'struct spi_nor'
> @@ -2797,7 +2808,9 @@ static void spi_nor_nonsfdp_flags_init(struct spi_nor *nor)
>  }
>  
>  /**
> - * spi_nor_init_params() - Initialize the flash's parameters and settings.
> + * spi_nor_init_params_deprecated() - Initialize the flash's parameters and
> + * settings. The function is deprecated, it will be removed and replaced with
> + * spi_nor_info_init_params().
>   * @nor:	pointer to a 'struct spi_nor'.
>   *
>   * The flash parameters and settings are initialized based on a sequence of
> @@ -2821,11 +2834,40 @@ static void spi_nor_nonsfdp_flags_init(struct spi_nor *nor)
>   *    Please note that there are ->post_{bfpt, sfdp}() fixup hooks that can
>   *    overwrite the flash parameters and settings immediately after table
>   *    parsing.
> + */
> +static void spi_nor_init_params_deprecated(struct spi_nor *nor)
> +{
> +	spi_nor_info_init_params(nor);
> +	spi_nor_manufacturer_init_params(nor);
> +
> +	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
> +	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
> +		spi_nor_sfdp_init_params(nor, false);
> +}
> +
> +/**
> + * spi_nor_init_params() - Initialize the flash's parameters and settings.
> + * @nor:	pointer to a 'struct spi_nor'.
> + *
> + * The flash parameters and settings are initialized based on a sequence of
> + * calls that are ordered by priority:
> + *
> + * 1/ Default flash parameters initialization. The initializations are done
> + *    for all the flashes, regardless if the support SFDP or not.
> + *		spi_nor_init_default_params()
> + * which can be overwritten by:
>   *
> + * 2/ SFDP based or the deprecated way of initializing flash parameters.
> + * Ideally at this step the flash parameters init will be done either by
> + * parsing SFDP, where supported, or statically via flash_info flags.
> + *		spi_nor_sfdp_init_params() or spi_nor_init_params_deprecated()
>   * which can be overwritten by:
> - * 4/ Late flash parameters initialization, used to initialize flash
> + *
> + * 3/ Late flash parameters initialization, used to initialize flash
>   * parameters that are not declared in the JESD216 SFDP standard.
>   *		spi_nor_late_init_params()
> + *

Not really related to this patch, but we need to document the return 
value here as well.

>   */
>  static int spi_nor_init_params(struct spi_nor *nor)
>  {
> @@ -2835,15 +2877,10 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  
>  	spi_nor_init_default_params(nor);
>  
> -	spi_nor_info_init_params(nor);
> -
> -	spi_nor_manufacturer_init_params(nor);
> -
> -	if ((nor->info->flags & (SPI_NOR_PARSE_SFDP |
> -				 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
> -	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
> -		spi_nor_sfdp_init_params(nor);
> +	if (nor->info->flags & SPI_NOR_PARSE_SFDP)
> +		spi_nor_sfdp_init_params(nor, true);
> +	else
> +		spi_nor_init_params_deprecated(nor);
>  
>  	spi_nor_late_init_params(nor);
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
