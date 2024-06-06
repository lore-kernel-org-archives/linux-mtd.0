Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2638FC27C54
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiKiD5fJk1Lht/+MHG9k41pXJA7zCxhmhZhTPZq4vuU=; b=uR9HlLJKLjbObH
	717L363R1vrkgb8Wp1WrmjDBmQqU69YiZk8z2nLge2Tfi5UKdRDkfaJYFbbj201PXPPKVXfY7j8xq
	oSVlCgp1vcqbxtmnHUsXkkNLyh38HJWLDUK04pM1S0tDUv7uCjBi7HlAr77p2ZNw0J09fVwvQKFnt
	113/lBi5Ev3JiY7BWnBRKTlScXZXXMa7EjS6kqQyPZd/y1ODlmmSqIDNjaxji4uwNZeOHqcQ2g7EL
	EA7fWM9APmMP+ExaAWp5THwk5vqBPn1Nf/A2YizW9PVEgc+uUoHetgX2gUK8Ks5LoUIgJoPICWFv1
	D6OU15jKY4FsVYFkmrrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDDF-00000009tYA-1uX4;
	Thu, 06 Jun 2024 13:31:29 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDDC-00000009tWt-1loL
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 13:31:27 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52b9af7a01bso1231196e87.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717680684; x=1718285484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zmsP1MNZwY5lN3l4HikogMd/Cj+hwxphgWW3D3oRNE=;
        b=JCE6Q7hQFEg8BwAcbAmwqIwMx78gka6KT5gNyXO8nl8Rlf9IJfGSF3F67Y7yKzmkby
         h0RvSu2y+GuR0pbEV/xlocCvhZ34sBAtY1ODW5PLdos4hD6wm5fKITR9TnqOnpezkf0j
         Ag0juTQLHeAv5tB33+EcbeDkFgBmjgknEiNMQa7YbPoTznBhO6rYOS5DE2zRnGjjoLhJ
         RJ5YTs1RGNZRQlCeAuB2My9e/36BhQzTzCLvysv0fHhHM5tlJJ+Opk3wR9jZ84hRnNzP
         pRJN9pONEOGG/+PKWW6yAIPUejE3dVW1ehrvYAFkQrZSHZ6Khk4KfkZJ+mZ1NAnhOw/a
         qetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717680684; x=1718285484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zmsP1MNZwY5lN3l4HikogMd/Cj+hwxphgWW3D3oRNE=;
        b=cC1s3tcXTOC1psNHM4SiguBLcFP1QDNAsg8+0iS2h1cpRBplE3jxYeo3b77MYPVlvd
         zp48u3QCXBfUbbuOvlT5An55RMCPToyFUG9lwFWbeFxUXYG1ldmNW895MibVmJOWPWSc
         Y/6+YRV6Kena6FwEgxrxydnHgV9zcGdqq12dAfr4BRdTL0aVbIZYK6n7gNzKz1qvga5n
         /LVoCE202ORaxnKs13M/9HFjUKUio2c7aeZ5EdwcoJ8v0noZCnChtkkM2nheNVirkITc
         p3HjoSYEtP899J1zX3zaFl3r76L3vZNCQ9zys44DMJc8qz13G8ideyF8jJMnowcCKFck
         oQUg==
X-Gm-Message-State: AOJu0YwwpvH/rIDG1AG80UfI8Un3fMtCU4cVtS3v0SQPeuqRC5RcIN+K
	TS61X+SDBVxdNDFhqyWPiAXFzqCQ9ktRBueNRGBBgWFglsPR68Lj2v1nku7/Fz6LExrmoiMcGvI
	6
X-Google-Smtp-Source: AGHT+IE+sRUqnMl9LYBdQjKLK+TsMvxU650LaPvKzR0ViFP7J0QmNGczcpsl7tjNVr8GlgDc5ZvASA==
X-Received: by 2002:a05:6512:3189:b0:52b:885b:aacd with SMTP id 2adb3069b0e04-52bab4b808dmr3849492e87.14.1717680684478;
        Thu, 06 Jun 2024 06:31:24 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805c421esm98277666b.48.2024.06.06.06.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 06:31:23 -0700 (PDT)
Message-ID: <a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org>
Date: Thu, 6 Jun 2024 14:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: core: add flag for doing optional
 SFDP
To: Esben Haabendal <esben@geanix.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
 <20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_063126_514263_E6C69506 
X-CRM114-Status: GOOD (  18.15  )
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



On 6/3/24 14:09, Esben Haabendal wrote:
> A dedicated flag for triggering call to
> spi_nor_sfdp_init_params_deprecated() allows enabling optional SFDP read
> and parse, with fallback to legacy flash parameters, without having dual,
> quad or octal parameters set in the legacy flash parameters.
> 
> With this, spi-nor flash parts without SFDP that is replaced with a
> different flash NOR flash part that does have SFDP, but shares the same
> manufacturer and device ID is easily handled.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  drivers/mtd/spi-nor/core.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 3e1f1913536b..1c4d66fc993b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2933,7 +2933,8 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
>  
>  	spi_nor_manufacturer_init_params(nor);
>  
> -	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
> +	if (nor->info->no_sfdp_flags & (SPI_NOR_TRY_SFDP |

I don't like that we update deprecated methods. The solution though is
elegant.

> +					SPI_NOR_DUAL_READ |
>  					SPI_NOR_QUAD_READ |
>  					SPI_NOR_OCTAL_READ |
>  					SPI_NOR_OCTAL_DTR_READ))
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 442786685515..77f61a984cb3 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -535,6 +535,7 @@ struct flash_info {
>  	u8 no_sfdp_flags;
>  #define SPI_NOR_SKIP_SFDP		BIT(0)
>  #define SECT_4K				BIT(1)
> +#define SPI_NOR_TRY_SFDP		BIT(2)
>  #define SPI_NOR_DUAL_READ		BIT(3)
>  #define SPI_NOR_QUAD_READ		BIT(4)
>  #define SPI_NOR_OCTAL_READ		BIT(5)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
