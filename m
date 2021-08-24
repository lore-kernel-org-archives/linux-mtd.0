Return-Path: <SRS0=de6p=NP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76648C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 17:31:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 423C460231
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 17:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 423C460231
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/OmF3c8kS2WxgvUrGMsiZZjWfwQxn4nkFKALIDOuJc=; b=FCcR9Cr8Fyxqa3
	/bEjyIhDdS9O0hysPy0XgHDq3Q+4gnCj0YLe4q3D9NM+W5G6Xx1rCkAthT9LCaCgliBkUHPuCb5VP
	jIYQHaNlwN/49Ky+6hUGLeXULXXfVFKNFp8N1blldK0JS5qvugT2rD1hqfh4xaFaaHi5LrH7YlCgB
	zTDZjYtHLyM3DlHtz/7imJlOVyskiPi2462g0JA48BQo++XNARqcr4+tmLEect3Ma02S5vw27dB73
	FagM4ExmYI3BT78q3UibHkemBuu59wbfyb8Hz+N4f9MbRtvuG598LE42V1aML6YPkUoWUPH0Nb85A
	BGxrvbWk0MBZv1RmsXIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIaGL-004Akp-68; Tue, 24 Aug 2021 17:31:01 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIaGF-004Ahl-AQ; Tue, 24 Aug 2021 17:30:59 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17OHUMhb007628;
 Tue, 24 Aug 2021 12:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629826222;
 bh=joAeRLJIlrcOY4DqDd3gKdnPmZnHyibKrmmljwvM+u0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=jkxBkm3BIZ7PUcqrXJ0nm2T8yUjuiQIaKSC2t0HdR+yamF9rDN2Gql1OnDaXGG3VN
 NalbQmGwzjsBc8gVWe0wGEsTGWsZMtSQ7Mup5Kf9y7UPwihNZG5Ejtq3Zx/8j8qZ1R
 nGoMovgOM9188Fyb0XhErMt7/ZAhXUMsXYBQ2UMU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17OHUMPe075265
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Aug 2021 12:30:22 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 24
 Aug 2021 12:30:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 24 Aug 2021 12:30:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17OHULcG043752;
 Tue, 24 Aug 2021 12:30:21 -0500
Date: Tue, 24 Aug 2021 23:00:20 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 26/35] mtd: spi-nor: core: Introduce
 spi_nor_init_default_params()
Message-ID: <20210824173018.n6fw6t6mg4bwah37@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-27-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-27-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_103055_543635_D10FB8FE 
X-CRM114-Status: GOOD (  24.73  )
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
> Called for all flashes, regardless if they define SFDP tables or not.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 92 +++++++++++++++++++++-----------------
>  1 file changed, 52 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b3a01d7d6f0b..9193317f897d 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2543,6 +2543,56 @@ static int spi_nor_setup(struct spi_nor *nor,
>  	return spi_nor_set_addr_width(nor);
>  }
>  
> +/**
> + * spi_nor_init_default_params() - Default initialization of flash parameters
> + * and settings. Done for all flashes, regardless is they define SFDP tables
> + * or not.
> + * @nor:	pointer to a 'struct spi_nor'.
> + */
> +static void spi_nor_init_default_params(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +	const struct flash_info *info = nor->info;
> +	struct device_node *np = spi_nor_get_flash_node(nor);
> +
> +	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
> +	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
> +	params->setup = spi_nor_default_setup;
> +	params->otp.org = &info->otp_org;
> +
> +	/* Default to 16-bit Write Status (01h) Command */
> +	nor->flags |= SNOR_F_HAS_16BIT_SR;
> +
> +	/* Set SPI NOR sizes. */
> +	params->writesize = 1;
> +	params->size = (u64)info->sector_size * info->n_sectors;
> +	params->page_size = info->page_size;

I think these two lines should go in spi_nor_info_init_params() since 
you are using the nor info to initialize these parameters. Otherwise, 
what even is the difference between these two functions?

> +
> +	if (!(info->flags & SPI_NOR_NO_FR)) {
> +		/* Default to Fast Read for DT and non-DT platform devices. */
> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
> +
> +		/* Mask out Fast Read if not requested at DT instantiation. */
> +		if (np && !of_property_read_bool(np, "m25p,fast-read"))
> +			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> +	}
> +
> +	/* (Fast) Read settings. */
> +	params->hwcaps.mask |= SNOR_HWCAPS_READ;
> +	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
> +				  0, 0, SPINOR_OP_READ,
> +				  SNOR_PROTO_1_1_1);
> +
> +	if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
> +					  0, 8, SPINOR_OP_READ_FAST,
> +					  SNOR_PROTO_1_1_1);
> +	/* Page Program settings. */
> +	params->hwcaps.mask |= SNOR_HWCAPS_PP;
> +	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
> +				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
> +}
> +
>  /**
>   * spi_nor_manufacturer_init_params() - Initialize the flash's parameters and
>   * settings based on MFR register and ->default_init() hook.
> @@ -2609,43 +2659,8 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  	struct spi_nor_flash_parameter *params = nor->params;
>  	struct spi_nor_erase_map *map = &params->erase_map;
>  	const struct flash_info *info = nor->info;
> -	struct device_node *np = spi_nor_get_flash_node(nor);
>  	u8 i, erase_mask;
>  
> -	/* Initialize default flash parameters and settings. */
> -	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
> -	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
> -	params->setup = spi_nor_default_setup;
> -	params->otp.org = &info->otp_org;
> -
> -	/* Default to 16-bit Write Status (01h) Command */
> -	nor->flags |= SNOR_F_HAS_16BIT_SR;
> -
> -	/* Set SPI NOR sizes. */
> -	params->writesize = 1;
> -	params->size = (u64)info->sector_size * info->n_sectors;
> -	params->page_size = info->page_size;
> -
> -	if (!(info->flags & SPI_NOR_NO_FR)) {
> -		/* Default to Fast Read for DT and non-DT platform devices. */
> -		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
> -
> -		/* Mask out Fast Read if not requested at DT instantiation. */
> -		if (np && !of_property_read_bool(np, "m25p,fast-read"))
> -			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> -	}
> -
> -	/* (Fast) Read settings. */
> -	params->hwcaps.mask |= SNOR_HWCAPS_READ;
> -	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
> -				  0, 0, SPINOR_OP_READ,
> -				  SNOR_PROTO_1_1_1);
> -
> -	if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
> -		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
> -					  0, 8, SPINOR_OP_READ_FAST,
> -					  SNOR_PROTO_1_1_1);
> -
>  	if (info->flags & SPI_NOR_DUAL_READ) {
>  		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
>  		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
> @@ -2674,11 +2689,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  					  SNOR_PROTO_8_8_8_DTR);
>  	}
>  
> -	/* Page Program settings. */
> -	params->hwcaps.mask |= SNOR_HWCAPS_PP;
> -	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
> -				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
> -
>  	if (info->flags & SPI_NOR_OCTAL_DTR_PP) {
>  		params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
>  		/*
> @@ -2823,6 +2833,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  	if (!nor->params)
>  		return -ENOMEM;
>  
> +	spi_nor_init_default_params(nor);
> +
>  	spi_nor_info_init_params(nor);
>  
>  	spi_nor_manufacturer_init_params(nor);

I am neutral towards this patch. I don't think it improves much, but at 
the same time it doesn't make anything worse either.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
