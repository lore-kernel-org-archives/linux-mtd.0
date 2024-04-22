Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DE1C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2024 06:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xn+qwCP14rxLNJ1mwP30VqdkRXO7cdgSPJT6YfMTRJ0=; b=liKGpPNAQ/2cQr
	eRstYSqnCYjBjP+XvOKnhTs23oYOqfXTTugOA4BH9P9XbwnCOq+kSvma+YbIUmegHWIPz665WuHpi
	wkmujNC4ZRlMW/OU7O1O++Rhi8wh0HoTe+w1pnOsdYIWg6eWvgnnItuSeNdLV/MdlHsvT5gxQO/FJ
	r7MdVHTVaneAHmX9Tk6tZqGc9SD+we+c143icc/LPpfMbItYUcFAPdwEPxUJe1xMN7ZHy1/zH5xvI
	OSYD/ndbXZe6f+h9DB6mck88KGEZqBxlECQv0+uxeraZ76g1KAH6sX48CU4Ivl924hPlxQwSBmk99
	it5oiGC/z7P/0ljbfdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymik-0000000CC7n-2YpB;
	Mon, 22 Apr 2024 06:00:06 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymig-0000000CC6p-3UwV
	for linux-mtd@lists.infradead.org;
	Mon, 22 Apr 2024 06:00:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a4715991c32so406826066b.1
        for <linux-mtd@lists.infradead.org>; Sun, 21 Apr 2024 23:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713765599; x=1714370399; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTIk2hkxt9Gsft4fGJNtwxU+haKYdo2o58nLmGxDOIE=;
        b=JKEVkqnRLO14YZHhYxFwFAlqUBIqhcElTVoqMDp4TvgW5mf5M9Hq4exO8GAYbQ4rEv
         DmZ46kYUuYlMhd0peGaw8sY3Qbew1FE9Syn0i6M3I1b6tGoPH8QBDuoAlbsqNz6eUgWZ
         G58M3S23q5B2kLns+hMYPTsGFuzshg+G5fQxIevRCFc9Zik9UeDrLsj/I/lCcU62mqcK
         LQNFNUlldg35CAnvk+xgHDPO6y7ji13WYMgTDNJMcsoLOkaYngudrvIptI7GN7qcFARN
         +Jfv7M8H1R06Bht155X9+fedTCis6iuFUOLMXd8qTIuEpa6IkHEseuAZAihM515177t3
         ASGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713765599; x=1714370399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTIk2hkxt9Gsft4fGJNtwxU+haKYdo2o58nLmGxDOIE=;
        b=P6jPvre3yrOM8ljRVfol5VHiC4XLiwtHKAoG4WzRZvSwcGWEBukqDxTBIcqr/a97yf
         ud6ilmzxWUv0aCHRQMjRS9x/1gTU8Ttl/fBQyiaWRE5B/MQLLo4L8oPYoo6lpQxIhwxj
         jGLWMlfGiYf5va9lMom9BqVSrV7iRNBZTJhJGGkD5DsdQTEQjVN6UuHtlzKRBfx947lU
         ccfI/dKehYPZckQKM8yd/tuSPiHlbnbDeSbVCSKIILYnmHvH55y8exyxMI0XbzYhoG8N
         tgXmrHM1h72wU+2Lh94lu79W3BHNbObn/8X7147s3Z4WdF0Q/5u7TSIw7aaZNn861Ncf
         m4+A==
X-Forwarded-Encrypted: i=1; AJvYcCUJan92BnmzKjzmVf2tPj53YjVVNPWSmF0LkyBDGxuwHbg0AxFKLDpeEOhpc3Zo289rgwgI5Zo/qPlFR1TfzCekk2OJeMTkKSIHHK/aXg==
X-Gm-Message-State: AOJu0Yw0X6YXPPy6UI9b/huHNX0uUXe2TNNzgvNCabIVEhOBW9BtSmkO
	sxfBL+qYCeimYGzXVDfpDkfujGAJgRWxzOsvc2+6eD7yJsiymTRzwF4jl52zlpY=
X-Google-Smtp-Source: AGHT+IG7f3ifbTeMgZnG7rk32T3DsVAkEUJPoKtCdKMlkL6tqRi+EelXsEJKjxibUYG/0MKJtMxVEg==
X-Received: by 2002:a17:906:2a4b:b0:a52:1770:965 with SMTP id k11-20020a1709062a4b00b00a5217700965mr4928859eje.42.1713765599507;
        Sun, 21 Apr 2024 22:59:59 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.100])
        by smtp.gmail.com with ESMTPSA id bi14-20020a170907368e00b00a5588ed8fa2sm3785331ejc.113.2024.04.21.22.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 22:59:59 -0700 (PDT)
Message-ID: <494daaab-a93c-44cd-a437-d306a8269251@linaro.org>
Date: Mon, 22 Apr 2024 06:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20240419141249.609534-1-mwalle@kernel.org>
 <20240419141249.609534-5-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240419141249.609534-5-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_230003_088321_3FFFC371 
X-CRM114-Status: GOOD (  21.18  )
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



On 4/19/24 15:12, Michael Walle wrote:
> The evervision FRAM devices are the only user of the NO_FR flag. Dro

everspin is evervision?

> the global flag and instead use a manufacturer fixup for the evervision
> flashes to drop the fast read support.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> Please note, that the fast read opcode will still be set in
> spi_nor_init_default_params(), but the selection of the read opcodes
> just depends on the mask.
> 
> That is also something I want to fix soon: the opcodes can always
> be set and the drivers/SFDP will only set the mask. Opcodes then can be
> switched between 3b and 4b ones if necessary.
> ---
>  drivers/mtd/spi-nor/core.c     |  9 ++-------
>  drivers/mtd/spi-nor/core.h     |  2 --
>  drivers/mtd/spi-nor/everspin.c | 19 +++++++++++++++----
>  3 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f4c0b5185818..4e2ae6642d4c 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2923,15 +2923,10 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>  	params->page_size = info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;
>  	params->n_banks = info->n_banks ?: SPI_NOR_DEFAULT_N_BANKS;
>  
> -	if (!(info->flags & SPI_NOR_NO_FR)) {
> -		/* Default to Fast Read for DT and non-DT platform devices. */
> +	/* Default to Fast Read for non-DT and enable it if requested by DT. */
> +	if (!np || of_property_read_bool(np, "m25p,fast-read"))
>  		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>  
> -		/* Mask out Fast Read if not requested at DT instantiation. */
> -		if (np && !of_property_read_bool(np, "m25p,fast-read"))
> -			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> -	}
> -

You could do this in a dedicated patch, but I'm fine either way.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
