Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD259EB8FAF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6eUMY0FzZFPvBk6BgPBsjOJav/sxcQzgxa2FBVULJc=; b=03C4ZJ1De8/my5
	uvczlW5gxf1IiZb11E32W0yeVMqMLftTLq0ct+odgrXAvJILQVdJseUb3opG3m1nvqqoA85lWZM83
	Jp/cCbpDBA1zQZcHM5ollmqSgs/dTbbYZbFGNBGhDaePqb81pFFnA2vY9VyOpDWNFzbsk74W4KHcV
	Mw7fBCpNq2LQp+/x86IHScdfbsITjAbv7UQvkoNa8v9yOlwrqS+vpvBMRbqzVk/QnxWJoTISkaxtT
	8wtaygtYKES4cZf4Uq5UUh2tomR4LbwCBbxydi4paCh3u1Fe2bBr/F3+T+iz4OnRsXPY8bJFUYw5M
	uo/lnv6CONlm2fCT/eYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmxM-007V0v-1z;
	Wed, 06 Sep 2023 07:28:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmxJ-007Uzp-35
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:28:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31aeef88a55so2864612f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 00:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693985284; x=1694590084; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9bMJBXttHvX9K+/BKiatIe6dYjJgBiOa9KYUzMQlv8I=;
        b=blK07nBYIHAIumqA8M2HPun1MMiS7t69bJa2+i7R3KNMr/IaoxVdvpvCIb0xnxHNnt
         1AQGrd9P5EhPySx9bUMCah5zvdXlPwystKhkBQem0egA7fkAgEEwPxEQGXBVy7E/kDbp
         9PVXVtP6MMyOI5DTh/8eJgLYwPKo+FF8phGUOkrjlXyCmECVkR/nKWDm7v1VNtMa2pj8
         WBsAhk9/1fpVxiagIX3dkHR3o4x+HkOi5sMU+9RY6mRCs6PwD9ObkADEZv42a/GDBTXv
         pPNELpjuGtz7Fez0OaqyCIbmOLJJJTGqMcQrTrp+pLRmr57LmEbhl4abPI75NmjBxNYk
         XzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693985284; x=1694590084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9bMJBXttHvX9K+/BKiatIe6dYjJgBiOa9KYUzMQlv8I=;
        b=WedW8L5pbcbFakqY9I1vAJuTQNKMAyglQpp3JZR1xb7EwWnSgrjiJJgEaW1P1LpJs/
         4vNunwD6zjYD233E7QYsY6GOiyCxiwZPf5VYHFsFYubrV1Cvt3iMPQwrpxWJFjW/Lxdr
         T7oHHUZfXJHOL0SptZmV/nEqiyYr7AOvhMw9ro22b+aF47/Xf9lrqFkOMIDzE1Hq/Fug
         lenAlZY2WDKd9df7/G7mO04apiNuaUvWUh4JZmzz1qb9wyHXhLnPvfxFuyBywOniTbq3
         WBnjEIww3AGx38cA1/BomBQ9nF1biIyFF8tilJZ0iAycCVeXuD+735yQ/SzlKp+hI33m
         NOEQ==
X-Gm-Message-State: AOJu0YxQHx2y3NlWZG0J/YuDg/qpbV0ngFEHOzPdqUG0BqbEmocKwXlY
	H+OdgjuJ/hRY891oM7mffvBdYQ==
X-Google-Smtp-Source: AGHT+IESEKh+11MBHDIR/LJxJuSsWfHYFkkQFFN6Z0HotRF5rCUy1y4iVUbnOMUtvc2XvCpzMZP+9g==
X-Received: by 2002:adf:ed88:0:b0:31a:e3ad:f30e with SMTP id c8-20020adfed88000000b0031ae3adf30emr1607176wro.68.1693985284438;
        Wed, 06 Sep 2023 00:28:04 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id x9-20020adfdd89000000b003196b1bb528sm19688413wrl.64.2023.09.06.00.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:28:04 -0700 (PDT)
Message-ID: <863ba1a1-ebd0-b544-705c-72295316140c@linaro.org>
Date: Wed, 6 Sep 2023 10:28:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 15/41] mtd: spi-nor: add SNOR_ID() and SNOR_OTP()
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-15-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-15-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_002806_030582_923D2521 
X-CRM114-Status: GOOD (  15.25  )
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



On 22.08.2023 10:09, Michael Walle wrote:
> After all the preparation, it is now time to introduce the new macros to
> specify flashes in our database: SNOR_ID() and SNOR_OTP(). An flash_info
> entry might now look like:
>     {
>         .id = SNOR_ID(0xef, 0x60, 0x16),
>         .otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
>         .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>     }
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>


> ---
>  drivers/mtd/spi-nor/core.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index c22f5cf65a58..420e5ca2cfe1 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -559,6 +559,20 @@ struct flash_info {
>  	const struct spi_nor_fixups *fixups;
>  };
>  
> +#define SNOR_ID(...)							\
> +	(&(const struct spi_nor_id){					\
> +		.bytes = (const u8[]){ __VA_ARGS__ },			\
> +		.len = sizeof((u8[]){ __VA_ARGS__ }),			\
> +	})
> +
> +#define SNOR_OTP(_len, _n_regions, _base, _offset)			\
> +	(&(const struct spi_nor_otp_organization){			\
> +		.len = (_len),						\
> +		.base = (_base),					\
> +		.offset = (_offset),					\
> +		.n_regions = (_n_regions),				\
> +	})
> +
>  #define SPI_NOR_ID_2ITEMS(_id) ((_id) >> 8) & 0xff, (_id) & 0xff
>  #define SPI_NOR_ID_3ITEMS(_id) ((_id) >> 16) & 0xff, SPI_NOR_ID_2ITEMS(_id)
>  
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
