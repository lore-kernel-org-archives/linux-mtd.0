Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0472EEB8FA5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 06:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvLUgZ89HFIUHZgvt0nBKNVumiCrvM6zKS87D/h9w5g=; b=mzzPd4kPD2AX29
	eyy0AgjTpzczVB9BnQjb93o3KrOSK8lpNyFhafQv7QzVSG53R1Aq5vao6iE6yN3U8BHaOBxWJ6qAL
	p7zdwg3s20BG8AnOoJxUORoU1Sy6pAJAOOpC3vh5eCOaSVirNLXajB2PCS/b0I2nyhSn7wPadrJlD
	AzIH4p7xnXiQsAlfsuoGC6YPGgs9X0tlf4zIdfw4IYeYf8VhTpD8BJZZZvt9FeotmChW+GX4wzdXo
	aEQtB78+hDk6D9fymTajLDsIzXGA3c22TUrDvcxodDqD6MVSJtznMJzBwGiTK9jVIA4jZ5xZP+ZpG
	LWLXSToKmYhdnF5DvLrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdlc3-007KNM-0x;
	Wed, 06 Sep 2023 06:02:03 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdlc0-007KMf-0W
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 06:02:01 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so4661940a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 05 Sep 2023 23:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693980117; x=1694584917; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fmkd8VP9gXsmjmbSn6l4vGzj4ilqsiP27iDHTTduH9k=;
        b=vce5kph9wRIUA17lW8sphHx0DkykjyFy1XRQYdUFQ5UWWmVwKg91GCFMFUgR9Skuuh
         +EbMGFiwMusLy1K/atfNPCditGIeUX0jOFbX2Hd5RG49t6cZS2I98UzkdG0vy8sHPU1f
         u9MQnt0PcjUeoABqbr0rLjibRXJjgHKjJSMwzSYvtKa8qbetBor+EE0OPy3mMY2PEOWp
         9SrDxPEsGS8FYYrhKJ7Igc/x+ZufSbXVvRJahVPqnPFVjJrZfh+x+1LLtKyT645axOAt
         UAe+FsPzgyjXowPAJqyKKciv5ECDM4EZZVNMoAtCIcp+Nyj8aaSRmMSjoSGyUSIOkSSH
         WXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693980117; x=1694584917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fmkd8VP9gXsmjmbSn6l4vGzj4ilqsiP27iDHTTduH9k=;
        b=Ts3ob4LVLuhf322jaVKCE3fWw6eT6UvscrhbrlZ8+TnQw0W6GGKCAZZlYctmNl4sHB
         +OyPXY9IUEe2YQcFNp/yjCFZaVdHIRMt1COIopRa9NzBZ1frDtqhKYX0uAOSZuXrMGji
         4UvIgzyZV72MBDz/lO39BxQdbRnTzybq5abE8ID3WuJhf1KFwScyIFoGlJsiTna3ykwA
         lEKSlO7rNUKj8Y3opE1kOtce5dWk6ZyDlUAn0YY2d/6lgjpi0LyV61qIhdcDD7UVCs1c
         s57Q9blb4Y5kFQzN6C0YCwap99xUzrmywz/j90AUeHhZ581ZUiXvgor0o7ydVWZHA+fC
         OwXg==
X-Gm-Message-State: AOJu0YxAU9BdGfRxOcfJJ12eWpnR6epeUtdU58byn9KtYlv5P00H7ioH
	4gXNqR8XN+lx0B8F7QR6+/uQ4g==
X-Google-Smtp-Source: AGHT+IGxzsBJntuV2GhRqANudW/cEQMqixad9U6PRWIX16cjg27INOw+GO5ulnYLrYQKUACni/sXBg==
X-Received: by 2002:aa7:cf09:0:b0:522:cb97:f196 with SMTP id a9-20020aa7cf09000000b00522cb97f196mr1439220edy.36.1693980117219;
        Tue, 05 Sep 2023 23:01:57 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id r9-20020aa7d589000000b0052a1c0c859asm8032172edq.59.2023.09.05.23.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 23:01:56 -0700 (PDT)
Message-ID: <e7387e77-0397-4d1f-99d5-d465c63951d9@linaro.org>
Date: Wed, 6 Sep 2023 07:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/41] mtd: spi-nor: drop .parse_sfdp
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-11-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-11-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_230200_225569_E4A38607 
X-CRM114-Status: GOOD (  30.66  )
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
> Drop the size parameter to indicate we need to do SFDP, we can do that
> because it is guaranteed that the size will be set by SFDP and because
> PARSE_SFDP forced the SFDP parsing it must be overwritten.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/mtd/spi-nor/core.c       |  3 +--
>  drivers/mtd/spi-nor/core.h       | 23 ++++++++++++++++-------
>  drivers/mtd/spi-nor/eon.c        |  3 +--
>  drivers/mtd/spi-nor/gigadevice.c |  3 +--
>  drivers/mtd/spi-nor/issi.c       |  4 +---
>  drivers/mtd/spi-nor/macronix.c   |  1 -
>  drivers/mtd/spi-nor/spansion.c   | 12 ------------
>  drivers/mtd/spi-nor/sst.c        |  1 -
>  drivers/mtd/spi-nor/winbond.c    |  7 ++-----
>  9 files changed, 22 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 368851ff9f40..4ba1778eda4b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2017,7 +2017,6 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>  
>  static const struct flash_info spi_nor_generic_flash = {
>  	.name = "spi-nor-generic",
> -	.parse_sfdp = true,
>  };
>  
>  static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
> @@ -3069,7 +3068,7 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  
>  	spi_nor_init_default_params(nor);
>  
> -	if (nor->info->parse_sfdp) {
> +	if (spi_nor_needs_sfdp(nor)) {
>  		ret = spi_nor_parse_sfdp(nor);
>  		if (ret) {
>  			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index fba3ea8536a5..9e6ad02b03b0 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -460,9 +460,6 @@ struct spi_nor_fixups {
>   * @page_size:      (optional) the flash's page size. Defaults to 256.
>   * @addr_nbytes:    number of address bytes to send.
>   *
> - * @parse_sfdp:     true when flash supports SFDP tables. The false value has no
> - *                  meaning. If one wants to skip the SFDP tables, one should
> - *                  instead use the SPI_NOR_SKIP_SFDP sfdp_flag.
>   * @flags:          flags that indicate support that is not defined by the
>   *                  JESD216 standard in its SFDP tables. Flag meanings:
>   *   SPI_NOR_HAS_LOCK:        flash supports lock/unlock via SR
> @@ -521,7 +518,6 @@ struct flash_info {
>  	u8 n_banks;
>  	u8 addr_nbytes;
>  
> -	bool parse_sfdp;
>  	u16 flags;
>  #define SPI_NOR_HAS_LOCK		BIT(0)
>  #define SPI_NOR_HAS_TB			BIT(1)
> @@ -598,9 +594,6 @@ struct flash_info {
>  			.n_regions = (_n_regions),			\
>  		},
>  
> -#define PARSE_SFDP							\
> -	.parse_sfdp = true,						\
> -
>  #define FLAGS(_flags)							\
>  		.flags = (_flags),					\
>  
> @@ -740,6 +733,22 @@ static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
>  	return container_of(mtd, struct spi_nor, mtd);
>  }
>  
> +/**
> + * spi_nor_needs_sfdp() - returns true if SFDP parsing is used for this flash.
> + *
> + * Return: true if SFDP parsing is needed
> + */
> +static inline bool spi_nor_needs_sfdp(const struct spi_nor *nor)
> +{
> +	/*
> +	 * The flash size is one property parsed by the SFDP. We use it as an
> +	 * indicator whether we need SFDP parsing for a particular flash. I.e.
> +	 * non-legacy flash entries in flash_info will have a size of zero iff
> +	 * SFDP should be used.
> +	 */
> +	return nor->info->size;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  void spi_nor_debugfs_register(struct spi_nor *nor);
>  void spi_nor_debugfs_shutdown(void);
> diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
> index 50a11053711f..434aaf155856 100644
> --- a/drivers/mtd/spi-nor/eon.c
> +++ b/drivers/mtd/spi-nor/eon.c
> @@ -25,8 +25,7 @@ static const struct flash_info eon_nor_parts[] = {
>  	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256) },
> -	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512)
> -		PARSE_SFDP },
> +	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  0) },
>  	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128)
>  		NO_SFDP_FLAGS(SECT_4K) },
>  };
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
> index d57ddaf1525b..7cf142c75529 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -62,8 +62,7 @@ static const struct flash_info gigadevice_nor_parts[] = {
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> -	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512)
> -		PARSE_SFDP
> +	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 0)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		.fixups = &gd25q256_fixups },

We might get in trouble here if SFDP advertises a wrong flash size. And
this is because in BP, instead of relying on the info->sector_size, we
now compute locally the sector size based on the size advertised by
SFDP. And if the SFDP flash size is wrong, we'll break BP for this
flash. I'm ok taking this risk, but please update the commit message and
inform readers about what they may hit, and what would be the fix. With
that feel free to add:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
