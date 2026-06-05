Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BAFCD6E79
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 13:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bv2cMlErc2Jk0ylcHAxfMNXtl46bhAi/soefp8RUy+4=; b=4wGG7FRJW50OOq
	boufBvxUKkh0ZvTWtmA/F87pbV0PY5MJuOxBG7HwrxqQed7l/k5aKSCnsY7RA1owQL8N2aDW6tHKA
	PlMtFIjRcaNpd8qz1z+FX6KD9l6J54VM0JKeg6scgJ+bl66IMrUBLiAdRslHgqytokNqIFYKz+U30
	1p5cuMkTFaAEYfMAhbFRUgk6HwCsGJtENAuwxYhmZB6Tzs7lHftdhWEYJIp28K/7/Ut4ONg3QYU7i
	KEQsgtOGkEOYyqX3UwvBxYuB0NR8yUTrqqJAOR3l2mVYnwFvIKOAyBWLr0G2kKzmzrr6QhCq58Tbb
	AzVc+NyucY7VYuPW3ehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVUQ9-00000000fax-3GYM;
	Fri, 05 Jun 2026 13:17:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVUQ7-00000000faR-0Dx2
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 13:17:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4905529b933so19231265e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jun 2026 06:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780665425; x=1781270225; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WlSe6xaIhW4lMQuBjyY7xNSqPkDFaBjnxZVNeHOSqXk=;
        b=ToDsi3cfE5RnqgOScJzPgCz5OUR9pLotbrGaXqCS7EMdzdK+gPKIrW5fybF4FPcgHR
         wO2Di3aPvV9qwIQG25rrS3Dv3hm24RMu8b3eUpv5+rY/fVwO57/EKCNg0v9pmaHTO7pe
         frLdfNt2aU/UeZAfQPkl9PKKrDc8EBkwEeJ5I70wdOmo2s1DMsxr3Hc+nwF7DQpuCbT+
         XJPHhEX9LUtHefdRAM6pd/Wnw6SK8r31ZveQTKoU4I8Kgm21ydlCzrPhcuMNJQ8qrZHi
         EZuuyv5JbHxLfBgca95d19Bm8ZSUG8wfQa02YNfLltf6WgDFzSCViUqVMczYI7K3FpOG
         Xxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780665425; x=1781270225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlSe6xaIhW4lMQuBjyY7xNSqPkDFaBjnxZVNeHOSqXk=;
        b=QrYivzVksu8CQ0dHssLdjcplFHaSueIZvP3hghnOYiNG6r6OHp6+J3YbLN8vfxjaPC
         GpOLXghdmdn10RPFBRKbqTuW7mwRe9kzqS1v/WhsjES7iemf8ATPKo4ki0WdmvXaYFEE
         n5l896zbk4januGBKgxy13wloI1GDrjg1ozXhbfqQWeErmREborejMzBSJb8c+NG0R/X
         cJOwONE6acshseZ5Z8MEXlADhwQXWHhMhzNL/J3EJQgTk8zlVrbxvqwni14Cfj26uG81
         pDHwnYBRl6vjekiAJfeJJeLPFKGSsjw+1Bl2w8zI0p/ayKJpC/j9GPTYT8u4yKYSaXNz
         kMiQ==
X-Gm-Message-State: AOJu0YzFq94r2wGNMTBdpMgbQI5s3VfMOKY7R3VVpboVBTTSVz6pWnMy
	MqQ+62+C+EDEv5PzdSq3CClfYMW/VdUknZ1A4MtEMZX0kk6FcSWRDAkDu98gMwbqpx3KCYMM9tX
	juV1ooTU=
X-Gm-Gg: Acq92OEZv/dlzdy7/nGg9mdysGkSDqe8MWVVvBMTHeORh39XpyHvYGpg8mj28C6x30h
	SJXr9T18fJLaeKktz/AdHdFstxA2js4TbkDtgcq9Nt8bmIwZmNyriWMQ7nQDscPqXnfB1nbqeKX
	/TpHgA8p/uGcosrp+9ADMU4b+BjohhQEtBQPcyfpPHEY3HXZGnyN4dqdycy9AaAgFmnkmRCn2ct
	dx4h7IUeGfOqk5kM+zlDfnW4MUVxlpCSGnOs+hGJzdQBHNfnp04PM6CIRKrsljFCoRXzX6Yrv/5
	SAWFjhhFX352s8b2eu5i9s/1SRoSBcfdrDbmqkpYvdqixHNgyRjj1J9IQokKxK2gC93PckWx5hP
	Y/qM0OFm/uwfVI456UIiQiZbVsYGBIJR2hsuYRD+m4FY+b/PBxfG4qRPl5xPSKbWWBhYvJZy2J6
	6H3GpJXAOkOAk5zjrSEQ8d5DCN4BETLyeiy5NJzezYAA==
X-Received: by 2002:a05:600c:468c:b0:490:469c:556b with SMTP id 5b1f17b1804b1-490c257c3c8mr60453765e9.12.1780665424977;
        Fri, 05 Jun 2026 06:17:04 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm177946265e9.9.2026.06.05.06.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:17:04 -0700 (PDT)
Message-ID: <cc572a34-52d7-42b9-980e-2fb93b7cec20@linaro.org>
Date: Fri, 5 Jun 2026 16:17:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] mtd: spi-nor: rework flash parameter
 initialization
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260601125438.3481722-1-mwalle@kernel.org>
 <20260601125438.3481722-4-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260601125438.3481722-4-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_061707_135855_82E83DE1 
X-CRM114-Status: GOOD (  32.94  )
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



On 6/1/26 3:52 PM, Michael Walle wrote:
> Rework how the flash parameters are initialized. It used to make a
> difference whether a flash is in the in-kernel database, whether it
> supports multi I/O and so on. Recently, that makes more and more
> problems because flash IDs are reused among legacy flashes (w/o SFDP
> support) and newer flashes [1,2,3,4].
> 
> Simplify the whole parameter initialization, by starting with the
> parameters we have in the in-kernel database and the try to parse SFDP
> (and let it override any settings).

You need to specify here as well about the potential problem of issuing
an unsupported command (rdsfdp), although practice showed us it's okay.

I can't remember who raised first the potential of issuing unsupported
commands. Was it macronix, sst?
> 
> [1] https://lore.kernel.org/linux-mtd/CAAyq3SYX9UPwhC_Ume_S2yxhQwimRvB=Y6O_+FFqokhNmw7jQg@mail.gmail.com/
> [2] https://lore.kernel.org/linux-mtd/DGB4745HRCFI.1DRYTHXURWZJO@kernel.org/
> [3] https://lore.kernel.org/linux-mtd/DD10GE4EOCD7.CPTN7198QFUV@kernel.org/
> [4] https://lore.kernel.org/linux-mtd/DD6SI06QNEE4.2YCRTWJHEAAQM@kernel.org/
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mtd/spi-nor/core.c | 65 +++++++++++++-------------------------
>  drivers/mtd/spi-nor/core.h |  1 -
>  2 files changed, 22 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index fbf8c2d9c6b5..67e0377b606f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2868,11 +2868,10 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
>  
>  /**
>   * spi_nor_no_sfdp_init_params() - Initialize the flash's parameters and
> - * settings based on nor->info->sfdp_flags. This method should be called only by
> - * flashes that do not define SFDP tables. If the flash supports SFDP but the
> - * information is wrong and the settings from this function can not be retrieved
> - * by parsing SFDP, one should instead use the fixup hooks and update the wrong
> - * bits.
> + * settings based on nor->info->sfdp_flags.
> + * If the flash supports SFDP but the information is wrong and the settings from
> + * this function can not be retrieved by parsing SFDP, one should instead use
> + * the fixup hooks and update the wrong bits.
>   * @nor:	pointer to a 'struct spi_nor'.
>   */
>  static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
> @@ -3053,43 +3052,25 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
>  }
>  
>  /**
> - * spi_nor_sfdp_init_params_deprecated() - Deprecated way of initializing flash
> - * parameters and settings based on JESD216 SFDP standard.
> + * spi_nor_try_parse_sfdp() - Tries to parse flash parameters based
> + * on JESD216 SFDP standard.
>   * @nor:	pointer to a 'struct spi_nor'.
>   *
>   * The method has a roll-back mechanism: in case the SFDP parsing fails, the
> - * legacy flash parameters and settings will be restored.
> + * flash parameters and settings will be restored.
>   */
> -static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
> +static int spi_nor_try_parse_sfdp(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter sfdp_params;
> +	int ret;
>  
>  	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
>  
> -	if (spi_nor_parse_sfdp(nor))
> +	ret = spi_nor_parse_sfdp(nor);
> +	if (ret)
>  		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
> -}
> -
> -/**
> - * spi_nor_init_params_deprecated() - Deprecated way of initializing flash
> - * parameters and settings.
> - * @nor:	pointer to a 'struct spi_nor'.
> - *
> - * The method assumes that flash doesn't support SFDP so it initializes flash
> - * parameters in spi_nor_no_sfdp_init_params() which later on can be overwritten
> - * when parsing SFDP, if supported.
> - */
> -static void spi_nor_init_params_deprecated(struct spi_nor *nor)
> -{
> -	spi_nor_no_sfdp_init_params(nor);
>  
> -	spi_nor_manufacturer_init_params(nor);
> -
> -	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
> -					SPI_NOR_QUAD_READ |
> -					SPI_NOR_OCTAL_READ |
> -					SPI_NOR_OCTAL_DTR_READ))
> -		spi_nor_sfdp_init_params_deprecated(nor);
> +	return ret;
>  }
>  
>  /**
> @@ -3152,7 +3133,8 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>   *
>   * 1/ Default flash parameters initialization. The initializations are done
>   *    based on nor->info data:
> - *		spi_nor_info_init_params()
> + *		spi_nor_init_default_params()
> + *		spi_nor_no_sfdp_init_params()
>   *
>   * which can be overwritten by:
>   * 2/ Manufacturer flash parameters initialization. The initializations are
> @@ -3163,7 +3145,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>   * which can be overwritten by:
>   * 3/ SFDP flash parameters initialization. JESD216 SFDP is a standard and
>   *    should be more accurate that the above.
> - *		spi_nor_parse_sfdp() or spi_nor_no_sfdp_init_params()
> + *		spi_nor_try_parse_sfdp()
>   *
>   *    Please note that there is a ->post_bfpt() fixup hook that can overwrite
>   *    the flash parameters and settings immediately after parsing the Basic
> @@ -3189,17 +3171,14 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  		return -ENOMEM;
>  
>  	spi_nor_init_default_params(nor);
> +	spi_nor_no_sfdp_init_params(nor);
> +	spi_nor_manufacturer_init_params(nor);
>  
> -	if (spi_nor_needs_sfdp(nor)) {
> -		ret = spi_nor_parse_sfdp(nor);
> -		if (ret) {
> -			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
> -			return ret;
> -		}
> -	} else if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) {
> -		spi_nor_no_sfdp_init_params(nor);
> -	} else {
> -		spi_nor_init_params_deprecated(nor);
> +	ret = spi_nor_try_parse_sfdp(nor);

I find it fine. I'm concerned about the inconsistent rollback
mechanism, but this is a preexisting problem.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>


> +	if (ret && spi_nor_needs_sfdp(nor)) {
> +		dev_err(nor->dev,
> +			"SFDP parsing failed. You need to manually declare the flash parameters.\n");
> +		return ret;
>  	}
>  
>  	ret = spi_nor_late_init_params(nor);
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 2ebc5c3caca1..3d7c31bff5cb 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -548,7 +548,6 @@ struct flash_info {
>  #define SPI_NOR_HAS_CMP			BIT(10)
>  
>  	u8 no_sfdp_flags;
> -#define SPI_NOR_SKIP_SFDP		BIT(0)

sashiko says you need to grep this further and remove all instances.

>  #define SECT_4K				BIT(1)
>  #define SPI_NOR_DUAL_READ		BIT(3)
>  #define SPI_NOR_QUAD_READ		BIT(4)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
