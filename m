Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A94C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:32:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C3260E76
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21C3260E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vdc2idko/Ksh9Tcf3ejixYzIS2pyyLQXyk0aTglJ68=; b=m53wKbQGB+rhPS
	jQNk4NkbS6+VlG3AeIKly7ubBAQVHcpQcmBfZUQPjZxSqXkY4Jn7QoM6xXj2eoRExVAvNtxM1zrnB
	hgm8tHrv/0ms3cXZaG4XJjvDcYXfEOcEN2Vby7lexF9hsEdssk4LdssJi5EqFrIj/ltk7afPrW6Sw
	MQ7myQCODALuhV/yGZi/RJVxRSlBmBMnEQE4P2U+GbhOPTctRQsXl+Q3+R2twvnmIQEDrR+NVwiW9
	oNdKIL7Asscoh+RdmcX7OOYyCW8aAvhhPvMSq3AVu/brPrTSbK+J1dXKZ2EIKlk7mE9/x3d2y8//B
	3raGs8hHE/XYW/RKQsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFiLD-000Ac0-5L; Mon, 16 Aug 2021 19:32:11 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFiL7-000AZz-FN; Mon, 16 Aug 2021 19:32:09 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17GJVfhR110169;
 Mon, 16 Aug 2021 14:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629142301;
 bh=yhTkpfPv5Z7HGLAFPtoX6O6E817ZN/lCDB3VTCPa3p4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=KZ9vU0xD+6kHgaoC1HLjmiqAyeVLQ9GUARve2KLtSLM6dxxSgoZ+SzWVQ+ahC4bNw
 0OscCK6wcbj4BV+WzWzjnYrMoHdSg1LL7gkXMQNcxUWdbQDucoM4CFJkJrXRC5F5+d
 Zdnb7y4RH3zVKvyDzY474lQuh+KSgMend0uIFQQE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17GJVfwL082683
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Aug 2021 14:31:41 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 16
 Aug 2021 14:31:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 16 Aug 2021 14:31:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17GJVeMQ004510;
 Mon, 16 Aug 2021 14:31:41 -0500
Date: Tue, 17 Aug 2021 01:01:39 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 15/35] mtd: spi-nor: core: Call
 spi_nor_post_sfdp_fixups() only when SFDP is defined
Message-ID: <20210816193137.xyb4v4edgyge3k54@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-16-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-16-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_123205_656013_03F5606B 
X-CRM114-Status: GOOD (  35.27  )
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
> spi_nor_post_sfdp_fixups() was called even when there were no SFDP
> tables defined and the function name was misleading.
> 
> We introduced the late_init() hook which is used to tweak various
> parameters that could not be extracted by other means, i.e. when
> parameters are not defined in the JESD216 SFDP standard, or when
> the flash_info flags are incomplete.
> 
> Use spi_nor_post_sfdp_fixups() just to fix SFDP data. post_sfdp()
> hook is as of now used just by s28hs512t, mt35xu512aba, and both
> support SFDP, there's no functional change with this patch.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 66 +++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 15ccc9994215..1f38fa8ab2fa 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2509,6 +2509,25 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
>  		nor->info->fixups->default_init(nor);
>  }
>  
> +/**
> + * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
> + * after SFDP has been parsed.
> + * @nor:	pointer to a 'struct spi_nor'
> + *
> + * Typically used to tweak various parameters that could not be extracted by
> + * other means (i.e. when information provided by the SFDP tables are
> + * incomplete or wrong).

Do we want to keep the "incomplete" here? Wouldn't incomplete 
information (like missing parameter tables) be more suited for 
late_init()?

> + */
> +static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	if (nor->manufacturer && nor->manufacturer->fixups &&
> +	    nor->manufacturer->fixups->post_sfdp)
> +		nor->manufacturer->fixups->post_sfdp(nor);
> +
> +	if (nor->info->fixups && nor->info->fixups->post_sfdp)
> +		nor->info->fixups->post_sfdp(nor);
> +}
> +
>  /**
>   * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
>   * based on JESD216 SFDP standard.
> @@ -2523,11 +2542,12 @@ static void spi_nor_sfdp_init_params(struct spi_nor *nor)
>  
>  	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
>  
> -	if (spi_nor_parse_sfdp(nor)) {
> -		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
> -		nor->addr_width = 0;
> -		nor->flags &= ~SNOR_F_4B_OPCODES;
> -	}
> +	if (!spi_nor_parse_sfdp(nor))
> +		return spi_nor_post_sfdp_fixups(nor);

Huh. I didn't know you could do return foo() in a void function if foo() 
is also void. Dunno how I feel about this though. It definitely confused 
me for a bit.

> +
> +	memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
> +	nor->addr_width = 0;
> +	nor->flags &= ~SNOR_F_4B_OPCODES;

I feel like the new flow makes these 3 lines more confusing. Earlier, 
these were called under if (spi_nor_parse_sfdp()) so it was a bit easier 
to make the connection that these are undoing the changes performed by 
that function. Now it is a little harder to spot. I think a comment is 
in order.

>  }
>  
>  /**
> @@ -2643,26 +2663,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
>  }
>  
> -/**
> - * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
> - * after SFDP has been parsed (is also called for SPI NORs that do not
> - * support RDSFDP).
> - * @nor:	pointer to a 'struct spi_nor'
> - *
> - * Typically used to tweak various parameters that could not be extracted by
> - * other means (i.e. when information provided by the SFDP/flash_info tables
> - * are incomplete or wrong).
> - */
> -static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
> -{
> -	if (nor->manufacturer && nor->manufacturer->fixups &&
> -	    nor->manufacturer->fixups->post_sfdp)
> -		nor->manufacturer->fixups->post_sfdp(nor);
> -
> -	if (nor->info->fixups && nor->info->fixups->post_sfdp)
> -		nor->info->fixups->post_sfdp(nor);
> -}
> -
>  /**
>   * spi_nor_late_init_params() - Late initialization of default flash parameters.
>   * @nor:	pointer to a 'struct spi_nor'
> @@ -2709,18 +2709,12 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>   *    should be more accurate that the above.
>   *		spi_nor_sfdp_init_params()
>   *
> - *    Please note that there is a ->post_bfpt() fixup hook that can overwrite
> - *    the flash parameters and settings immediately after parsing the Basic
> - *    Flash Parameter Table.
> + *    Please note that there are ->post_{bfpt, sfdp}() fixup hooks that can
> + *    overwrite the flash parameters and settings immediately after table
> + *    parsing.
>   *
>   * which can be overwritten by:
> - * 4/ Post SFDP flash parameters initialization. Used to tweak various
> - *    parameters that could not be extracted by other means (i.e. when
> - *    information provided by the SFDP/flash_info tables are incomplete or
> - *    wrong).
> - *		spi_nor_post_sfdp_fixups()
> - *
> - * 5/ Late flash parameters initialization, used to initialize flash
> + * 4/ Late flash parameters initialization, used to initialize flash
>   * parameters that are not declared in the JESD216 SFDP standard.
>   *		spi_nor_late_init_params()
>   */
> @@ -2740,8 +2734,6 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
>  		spi_nor_sfdp_init_params(nor);
>  
> -	spi_nor_post_sfdp_fixups(nor);
> -
>  	spi_nor_late_init_params(nor);
>  
>  	return 0;
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
