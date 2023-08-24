Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9206FC3DA6F
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CuSN0AZ6bsJDrY5QpDKHMn0JqxerKTUFtzhRNo9unHU=; b=KcqrQDw/WJvcTg
	NRIgi1AvP7pEWgM+vDqfRjTL32ELeSiRmRkNrkXCRbK8oisJAXkT/jJ5OHyx+tIQVwiDT5wW8+BIF
	iL2Q0JUv40bvWGN0mb37UHcC/1labF29BZrPSGGCDF4MLyzry3/pRzJ/TUsmymDJUKloqsmqHtZ+2
	EK5xWo6GXk/hFijhcygv5mnMnUogXNXn0Vp/yh169FEAIuXwFku2u9m9rSJ1+W24BfoFmZCzOGuW6
	sn19WaSAm+eAm6C1y2merswBlombMmcgZi6N11G6g0qkKbmoZTFUkAAkswC+CoiPEu6cx4Xh39Z7j
	KV9euIpSdO3z+AJPOtRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5uX-002b7L-0A;
	Thu, 24 Aug 2023 08:41:49 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5uT-002b6Y-2L
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 08:41:47 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-523d2ef19e4so8415982a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2023 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692866503; x=1693471303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wq0ip0Gqdvj6brH2crnHRblQCGLzB23cq73iMEAyaAA=;
        b=NWFF63qQ/S1kdVdK9DGciU4Ny9ilkHD9sSJ1BgedzuuADOJSJTzrSs1xLOvNO3LGGr
         XelkBJVXTSJFvZUd4WAJryHiCckUtV6qxrNS4yKbN/Uh2dIKDw3CXpB0BXaoGDmDNTuL
         ZnoMMBbhT1FXoc+uGpBCBz7u/JTjAP2vsimXzKOAi7flufghAc6bGRpKGBHAt76HFbW8
         zL0BUKpiOGxNr+dxqsVH0BodGHZnxs93ouj3Jv5L1YG9IJVCJNxYKbJcpy4gBuL6ZtsX
         KVqJDbbV9aWEnbAvcdUI1heAPfMCYGFWRjizxmWv+5T7J/NWw63AcMumWofgV+bSkoMf
         FACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866503; x=1693471303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wq0ip0Gqdvj6brH2crnHRblQCGLzB23cq73iMEAyaAA=;
        b=MaSD/yalIOQW4B6eW8d8ABt8iywRLz++OLTu+H3utQdneyUYJeIkQfrtM/i3XvFYn/
         Z+r/vK+lfgUc/D7jkZ+KcEOesM3dPrzJrU1U37lEj/YEA58hucER+JdVaviDUQkn36FI
         Nl7kQujpGtSlgnPWSuzzgtsdW9FtiFwVLuG1mW7qcMuXkfwmoJdFtiegZSqZ7NqVyM3K
         zhC+vijdW2k80tdNwHzvuq5HcsiGyIq8YjEsPXzDd2Bw0HbCDFQB4BAgvL2kKZ40Hc4g
         Ef6JjjlKvnxBQa4vYxEm1jFWjmesF7Iz9NLrpf33rPRRpKWwl2rTi/5mgApCTdmAgvZb
         MTLg==
X-Gm-Message-State: AOJu0YxWTkYCKS3ujN2HiVYlZsVvZUgSqhuiHSnEs11xJB1QX1kNGcjE
	M9QGTnZgxIWvSOKHDJF3vOxdIg==
X-Google-Smtp-Source: AGHT+IG4nIn8vVWb1lv02CMNTQ6rhDxNZrC5TOgJ583puuk+b5ZooIuUGJdS10m8Ww6z/lu2PNwFMw==
X-Received: by 2002:a17:906:255a:b0:99c:47a:8bcd with SMTP id j26-20020a170906255a00b0099c047a8bcdmr10123732ejb.67.1692866503250;
        Thu, 24 Aug 2023 01:41:43 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.239])
        by smtp.gmail.com with ESMTPSA id jw11-20020a17090776ab00b0099d0a8ccb5fsm10672470ejc.152.2023.08.24.01.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:41:42 -0700 (PDT)
Message-ID: <a6dc9a8e-5225-3768-08f4-0cf7800aa438@linaro.org>
Date: Thu, 24 Aug 2023 09:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 07/41] mtd: spi-nor: store .n_banks in struct
 spi_nor_flash_parameter
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-7-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-7-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_014145_766684_C3EB3AD1 
X-CRM114-Status: GOOD (  22.53  )
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



On 8/22/23 08:09, Michael Walle wrote:
> First, fixups might want to replace the n_banks parameter, thus we need
> it in the (writable) parameter struct. Secondly, this way we can have a
> default in the core and just skip setting the n_banks in the flash_info
> database. Most of the flashes doesn't have more than one bank.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/spi-nor/core.c | 7 ++++---
>  drivers/mtd/spi-nor/core.h | 2 ++
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d27ad1295ee0..e27f1323fa0b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2862,7 +2862,7 @@ static void spi_nor_init_flags(struct spi_nor *nor)
>  	if (flags & NO_CHIP_ERASE)
>  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>  
> -	if (flags & SPI_NOR_RWW && nor->info->n_banks > 1 &&
> +	if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
>  	    !nor->controller_ops)
>  		nor->flags |= SNOR_F_RWW;
>  }
> @@ -2926,8 +2926,8 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
>  	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
>  		spi_nor_init_default_locking_ops(nor);
>  
> -	if (nor->info->n_banks > 1)
> -		params->bank_size = div64_u64(params->size, nor->info->n_banks);
> +	if (params->n_banks > 1)
> +		params->bank_size = div64_u64(params->size, params->n_banks);
>  
>  	return 0;
>  }
> @@ -2997,6 +2997,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>  	params->size = info->size;
>  	params->bank_size = params->size;
>  	params->page_size = info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;
> +	params->n_banks = info->n_banks;
>  
>  	if (!(info->flags & SPI_NOR_NO_FR)) {
>  		/* Default to Fast Read for DT and non-DT platform devices. */
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 25bc18197614..2fc999f2787c 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -358,6 +358,7 @@ struct spi_nor_otp {
>   *			in octal DTR mode.
>   * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
>   *			command in octal DTR mode.
> + * @n_banks:		number of banks.
>   * @n_dice:		number of dice in the flash memory.
>   * @vreg_offset:	volatile register offset for each die.
>   * @hwcaps:		describes the read and page program hardware
> @@ -394,6 +395,7 @@ struct spi_nor_flash_parameter {
>  	u8				addr_mode_nbytes;
>  	u8				rdsr_dummy;
>  	u8				rdsr_addr_nbytes;
> +	u8				n_banks;
>  	u8				n_dice;
>  	u32				*vreg_offset;
>  
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
