Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FC2C25B48
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 06:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5CVTDTfrEF956BtbsBFFSWoEpoINx7GYnm5kpGJgV0=; b=sIys0oXgFJ53fz
	MKOpvNCfCukXDcYVh4o5No55cNaj5xm30ILbpVpe6m7lGE62y4Y7OirI93gxUspy0pq9QgXzEmY54
	oT+MIgn34Mmjo15s/+dC/4KBvC4J6OqS+wwOWOx8tyQQUV+C/NEr/J0F+QlCPr/wYXBn9irZaYI9L
	SzjNyF+KL6zzUbvFCaftHc1mqP4W8V8vQi0bnc18I7zkJ8cdRvnSUf3pA5HFnfpNWElnqj1peDviX
	FZNK+Dr27TjxPy2TeSN+bw4kldvvcoApSWoHXYncnbB4K1IIXe/xwgsvJU5NymJGlLntklUd2TslJ
	H3+AC2sT5otxbaQvZJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwG8Z-00Ff3u-0S;
	Fri, 27 Oct 2023 06:16:03 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwG8U-00Ff2r-38
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 06:16:00 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso265915866b.2
        for <linux-mtd@lists.infradead.org>; Thu, 26 Oct 2023 23:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698387354; x=1698992154; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nk6invS/97xVzJJXbXMS0Fy8t31tPj17WYj5osixQ5I=;
        b=cRvwak3Ffs/5//q+jNwtRatgNfkQ5s6XrCf7QSpHKj8ciNnKlMjJKoeMf3i9Ru+AEU
         nZbjxlDcP6DhEFbFIwjYcBOhPx3WIjJFdCOTgkwSpDlOYlrPc/l0IQ0I7tiLiF26H2wQ
         4/xFiMFuikMNoA/bMOL31RjIVyufdkwIXTa4Abmoh1lM6LHjPFLtTVoiFWhXOrqq0aYW
         iQCXgTL9y6G+J3J/Xy3ug2S2RM4681sf72zY4+U+T567Gu7UBv9lF0XPxCRJ5Z28q9Kl
         ICXhzOLJPa2O6rKwO9naxk2YoebNPlDvYaIFw/uYSt4khXcwZBxz68gydnzi+f9TDtdP
         0JUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698387354; x=1698992154;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nk6invS/97xVzJJXbXMS0Fy8t31tPj17WYj5osixQ5I=;
        b=F/dtYezxsMSc6JbAFVzH+do/qkPzve4RJRpQetaq+LUgl2f/UA26v0bDrWLiq5mXJu
         4L2xSqn4TPBj01ZcrmXL6t3gZENKbQpFLRfDumFnlC5qxjiA9SzKAJJ66f6x8yE24j8w
         SFvctwCOATxp/hRFM0+cD5E5K+NN2XgA8RzQkQLD1Ksff5hPAewjhshDPip99Q5nw+lJ
         zELbev2uNL4zaQ8djEKPyhukgKVqAHN17NIzIdl/I1TBW7IB0Rs0KTzrMjf7rhyp8fx7
         Mzqkl47nKOLw1Yi1pxM3wNxc//iLO+GVvsv4HxYxpGCDnDxn59svT7U0gVz38vJknz+B
         YrOw==
X-Gm-Message-State: AOJu0Yxjw6ykuUu3r1ol3zMxgXZ5oNTEZXeA5UJmV8Be/sms2FlPc5w5
	m+niLztidLJNZsZN3PfvbXJ/yA==
X-Google-Smtp-Source: AGHT+IFR4kj6UvkJPXiOZbG1y2R0acBOQfLxo1qjbbjG3udmsmALEaE8E7FannglYcvTtXpqSBQufg==
X-Received: by 2002:a17:907:3e20:b0:9c3:cd12:1927 with SMTP id hp32-20020a1709073e2000b009c3cd121927mr1334601ejc.5.1698387354608;
        Thu, 26 Oct 2023 23:15:54 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id bq14-20020a170906d0ce00b009920a690cd9sm656284ejb.59.2023.10.26.23.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 23:15:53 -0700 (PDT)
Message-ID: <44a19b4d-2bda-4088-b0b6-a60b3598621f@linaro.org>
Date: Fri, 27 Oct 2023 09:15:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Set the erase flag for multi-die
To: Fabio Estevam <festevam@gmail.com>
Cc: michael@walle.cc, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 tkuw584924@gmail.com, Fabio Estevam <festevam@denx.de>
References: <20231026112312.3217502-1-festevam@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20231026112312.3217502-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_231559_071731_28A9D584 
X-CRM114-Status: GOOD (  16.18  )
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



On 26.10.2023 14:23, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Instead of manually passing the .flags = NO_CHIP_ERASE in the case
> of multi-die SPI NOR flash, retrieve the information about the number of
> dies directly from SFDP and set the SNOR_F_NO_OP_CHIP_ERASE flag in the
> multi-die case.

We don't have enough data from manufacturers to make such an assumption.
And since this is not backed up by a standard, I'd like to stick to the
.flags = NO_CHIP_ERASE for now.

> 
> Suggested-by: Michael Walle  <michael@walle.cc>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Newly introduced.
> 
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1c443fe568cf..f85ea57534ba 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2850,7 +2850,7 @@ static void spi_nor_init_flags(struct spi_nor *nor)
>  			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
>  	}
>  
> -	if (flags & NO_CHIP_ERASE)
> +	if (flags & NO_CHIP_ERASE || nor->params->n_dice > 1)
>  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>  
>  	if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
