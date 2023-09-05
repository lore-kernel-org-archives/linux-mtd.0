Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49351C83F3E
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Sep 2023 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylfGjSYEgxC7RuNPOTLHK/CwG8KxlAcBCzQoiFiKLsU=; b=XvVSH+stmToJVP
	zsaHV0Z2Q372mkWo8kfGdktlsoxwuIKvnayHbYe4CyXB8EM9Zm7EBSIEuFn5sXPBRh+9xfBl5zasa
	pY2cgqIe9H1ga1hMBnp+EhWLYER9sTNvhUgx0QOOo5oVZq+pvUrSdTtfAmVol/6HajG4QB98eqUPi
	Av/SLL4dZuDttu9eWarD6RGb2/TrVqSKHWjGXYxNfX5vB6aH71uleKqpPgVV5T1qGsFvc9wEYw7JQ
	teWeMvjCeRagCT7tp8J++1kwDf8DF5bV2ijp+73nnfIh83wNEikWYqk2HbhP3bhUoPjvpaehz9x+l
	vGOBHcUJ/JyWL41/vU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXWh-006E1g-1e;
	Tue, 05 Sep 2023 14:59:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXWe-006E0w-16
	for linux-mtd@lists.infradead.org;
	Tue, 05 Sep 2023 14:59:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3ff7d73a6feso24631065e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 05 Sep 2023 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693925966; x=1694530766; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+/C4sBAc43xlqJ9sKWleFnJzWTNOcSlUbtOWwEmgUw=;
        b=ZPnU76R1F9y9ojtEl0x9ZRdY8wC0Gm4S9m3ukRiwymTEbs5/VxqKkBopJE7y5ZPRu3
         amxP46F+2hpte0uuXsq14dwowdNYnd0mBwt+YW32uYsvEn88DpbzfquUO0SPJ+4qalRF
         bci9z1wlOdg4PPMUaPcdEopYfCL4r8fAznukZ4uuSKg9B4LQY8FMhku1I4WR2VARjiSP
         VIgJXhCUjqnOrZWoVoFDJ6ezsJFE5FQbl9/UKBob3k+NViksH4GAuhP7W7JUIlGi2s4k
         p8+TDrFjqWzPMcLYBuH75WYfOZ9KUsmMxivtKW0JBbBb2Lta8aqeHoYxlyZVj1nnyyy8
         Y6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693925966; x=1694530766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+/C4sBAc43xlqJ9sKWleFnJzWTNOcSlUbtOWwEmgUw=;
        b=LAb6Jty3GI0IxPiINKepJNtGi9Bfe45eu2zdm/okNbN8PfAeOHWJL1ti98B1R+oIMQ
         jIhor7f23mwAgXUEI9/PxYmskUvL8CwS7mEGWBXFMrOb+fMFjpT4r+iNTkrU0lLydd+F
         ZPcFuLBkBwFwXtSda+Xsmdo7xT/ZWJmakKytns7aQAARt0Y4OJS0H7fzcK2u0Ywexa/f
         CvRAJ133wuM+gKPEKZlkW1ckXmcku9wTQ4NUCaJWarN0xe4qLAXh5tSGRS8/ZlVZ/sMn
         def/+uZoLEvh0KSiKUsC8YogvIqSwa4O0SsY1rC6FzavWGMQnJVQDom+4qZhzl0T9rxE
         doow==
X-Gm-Message-State: AOJu0YwKrNdznx4EI32/GKzbm7+W3ClPBHlVASzn/+VuKBEE9Mx5g1QP
	3xyDDpZHDlYwPZESrc0mQN2zmg==
X-Google-Smtp-Source: AGHT+IEo8Dl6nAcvlUSaa3+JvoJD/69d925ILCme1cl7K+K9bVqK8D6YG1fHOuZMniVf4Wx+vw8xRQ==
X-Received: by 2002:a05:600c:364c:b0:401:d803:6243 with SMTP id y12-20020a05600c364c00b00401d8036243mr10478167wmq.32.1693925966360;
        Tue, 05 Sep 2023 07:59:26 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id x15-20020a1c7c0f000000b003feef82bbefsm17037987wmc.29.2023.09.05.07.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 07:59:25 -0700 (PDT)
Message-ID: <1d7e0f90-fad2-42c3-b07d-e7659a8b6ac5@linaro.org>
Date: Tue, 5 Sep 2023 15:59:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/41] mtd: spi-nor: push 4k SE handling into
 spi_nor_select_uniform_erase()
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-9-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-9-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_075932_381325_708D83F4 
X-CRM114-Status: GOOD (  32.26  )
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
> 4k sector erase sizes are only a thing with uniform erase types. Push
> the "we want 4k erase sizes" handling into spi_nor_select_uniform_erase().
> 
> One might wonder why the former sector_size isn't used anymore. It is
> because we either search for the largest erase size or if selected
> through kconfig, the 4k erase size. Now, why is that correct? For this,
> we have to differentiate between (1) flashes with SFDP and (2) without
> SFDP. For (1), we just set one (or two if SECT_4K is set) erase types
> and wanted_size is exactly one of these.
> 
> For (2) things are a bit more complicated. For flashes which we don't

:)

> have in our flash_info database, the generic driver is used and
> sector_size was already 0, which in turn selected the largest erase
> size. For flashes which had SFDP and an entry in flash_info, sector_size
> was always the largest sector and thus the largest erase type.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mtd/spi-nor/core.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 68baf6032639..c84be791341e 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2512,13 +2512,6 @@ static int spi_nor_select_pp(struct spi_nor *nor,
>  /**
>   * spi_nor_select_uniform_erase() - select optimum uniform erase type
>   * @map:		the erase map of the SPI NOR
> - * @wanted_size:	the erase type size to search for. Contains the value of
> - *			info->sector_size, the "small sector" size in case
> - *			CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is defined or 0 if
> - *			there is no information about the sector size. The
> - *			latter is the case if the flash parameters are parsed
> - *			solely by SFDP, then the largest supported erase type
> - *			is selected.
>   *
>   * Once the optimum uniform sector erase command is found, disable all the
>   * other.
> @@ -2526,13 +2519,16 @@ static int spi_nor_select_pp(struct spi_nor *nor,
>   * Return: pointer to erase type on success, NULL otherwise.
>   */
>  static const struct spi_nor_erase_type *
> -spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
> -			     const u32 wanted_size)
> +spi_nor_select_uniform_erase(struct spi_nor_erase_map *map)
>  {
>  	const struct spi_nor_erase_type *tested_erase, *erase = NULL;
>  	int i;
>  	u8 uniform_erase_type = map->uniform_erase_type;
>  
> +	/*
> +	 * Search for the biggest erase size, except for when compiled
> +	 * to use 4k erases.
> +	 */
>  	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
>  		if (!(uniform_erase_type & BIT(i)))
>  			continue;
> @@ -2544,10 +2540,11 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
>  			continue;
>  
>  		/*
> -		 * If the current erase size is the one, stop here:
> +		 * If the current erase size is the 4k one, stop here,
>  		 * we have found the right uniform Sector Erase command.
>  		 */
> -		if (tested_erase->size == wanted_size) {
> +		if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS) &&

one difference is that the is enabled check may now be evaluated for
each erase type, but looks cleaner and I can live with that as this is
set at probe time anyway.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> +		    tested_erase->size == SZ_4K) {
>  			erase = tested_erase;
>  			break;
>  		}
> @@ -2575,7 +2572,6 @@ static int spi_nor_select_erase(struct spi_nor *nor)
>  	struct spi_nor_erase_map *map = &nor->params->erase_map;
>  	const struct spi_nor_erase_type *erase = NULL;
>  	struct mtd_info *mtd = &nor->mtd;
> -	u32 wanted_size = nor->info->sector_size;
>  	int i;
>  
>  	/*
> @@ -2586,13 +2582,8 @@ static int spi_nor_select_erase(struct spi_nor *nor)
>  	 * manage the SPI flash memory as uniform with a single erase sector
>  	 * size, when possible.
>  	 */
> -#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
> -	/* prefer "small sector" erase if possible */
> -	wanted_size = 4096u;
> -#endif
> -
>  	if (spi_nor_has_uniform_erase(nor)) {
> -		erase = spi_nor_select_uniform_erase(map, wanted_size);
> +		erase = spi_nor_select_uniform_erase(map);
>  		if (!erase)
>  			return -EINVAL;
>  		nor->erase_opcode = erase->opcode;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
