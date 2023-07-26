Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0220CC001DE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 09:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzhSRcyE+tUaEofil3SFpN0+/ZFEyuL/ibGOJU37gso=; b=Biz21KUNWsC92P
	/IuQ10yVojwXAud9973JSOcvZcP0ug57eZZ7DNKKBLD+FFB7xHUsnAC0od4zVikhqgM0NwBH0lVqn
	9PrR1HeGL/OI0UAupPb97t0Z3djMEAIC1y5fl6Wy7Xi8NwLYFdFuArsxF/4CnstwuxjILfxdo+bIR
	BKTGAFTZhEqI9ezDGK0s/TmaOrzmpXTlapzBKIiOxjjbod+AmESmPmjYXHqYVrP5G53vOf4+OGnkx
	ArjlUT2i4hc+nRPgg7A1cj1DwUrUBPoYX66CRBk9TFmg1BtGVmosuSvdBJnAaaiR/y7JOaNrN8XcH
	cLN5sZwTt7xib55TKRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOawh-009kzi-0s;
	Wed, 26 Jul 2023 09:36:39 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOawe-009kyH-16
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 09:36:37 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-666ecb21f86so6075633b3a.3
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 02:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690364195; x=1690968995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nk61oX1/MYUdyW6PNrc230vTitw/FwpBYWVnoTlWaUA=;
        b=No2cHOzQ7eUv+boiODVr0cWIKqjTwcXftOWUG+y1SDZfTYGHtNZzoesK5eIoc2R+gR
         AyBug9ruIOHc0gRXqoYy6jcvfoWcntvDLEOyVp5YMRFAsd0JQu+6+Hr16oq0EapmcygN
         J2iuyp8oY4RbCWlWzft4k/sq/vjH9y2ktsztnnEpaHcg1TNQGXj0brbP9Yp7CMhvAfvH
         /6/Vg1oW+5ZFEmOYT+BJGhxuT82yj0wbfYifkkt15HFRwU/qpPEIurYPDlqAi6TPZ23G
         Zo/7Xi9VsQUAydvnBd3acC+Emk2yrkHe2DFaBlzAYTKjfgjJyOZm2pcbUBdmLapFj9B0
         s6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690364195; x=1690968995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nk61oX1/MYUdyW6PNrc230vTitw/FwpBYWVnoTlWaUA=;
        b=EAhsZCPp6vMyL/+KKOsbJyUVk71FFI9ol2+c/Wsy9gke/ZKniNdo9bKzg6Bwkypje9
         2Uam1h1yyHBQ1cPjKRO6p1H2IvvyCVrHvcR2G6HoQFAmzTJwa9ovgNY3IIdqWStzSrAG
         Khvv4rJ+JlOu1INsZdRa9gN9o2IWgQGGhDltV5YK6QWFO4smz8JP068BFyzKUFUMs1n9
         z/YNSRDUGf46ebCIC8/dl1MlLsSl9tqh6Kvf2KjZrDr6EGpzpS+gk4nwwTEFWV6jK5Fh
         /ehk4ucSHu3tGFaDZqX3Ur+LpoJ/BU3GpAjUnhJoFugD9u8kK1R/dpFdIG4vmxjGgOLW
         tsLQ==
X-Gm-Message-State: ABy/qLZN90O2fFhbPxYufrx+uhd6LZgBej6sH0KdWSrZS9SRaEepoxPx
	CTl7xzDVK31LV6RmxjJ6wbA=
X-Google-Smtp-Source: APBJJlErSx6YYmSKdDYLYtHeTkpzTtINxCEcSouXrYVFjm+IbJc5RiimhEkKxn72ZFv3PcO0Rijecg==
X-Received: by 2002:a05:6a00:2e23:b0:67e:6269:6ea8 with SMTP id fc35-20020a056a002e2300b0067e62696ea8mr2280925pfb.22.1690364194780;
        Wed, 26 Jul 2023 02:36:34 -0700 (PDT)
Received: from [192.168.0.11] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id f13-20020aa78b0d000000b006815fbe3245sm11043330pfd.37.2023.07.26.02.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:36:34 -0700 (PDT)
Message-ID: <16f29fd8-ae31-bb93-3ccf-e722faf033ba@gmail.com>
Date: Wed, 26 Jul 2023 18:36:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 10/11] mtd: spi-nor: spansion: switch s25hx_t to use
 vreg_offset for quad_enable()
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, takahiro.kuwano@infineon.com,
 michael@walle.cc
Cc: pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
 <20230726075257.12985-11-tudor.ambarus@linaro.org>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20230726075257.12985-11-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_023636_381231_5735BFFB 
X-CRM114-Status: GOOD (  18.52  )
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

On 7/26/2023 4:52 PM, Tudor Ambarus wrote:
> All s25hx_t flashes have single or multi chip flavors and already use
> n_dice and vreg_offset in cypress_nor_sr_ready_and_clear. Switch s25hx_t
> to always use vreg_offset for the quad_enable() method, so that we use
> the same code base for both single and multi chip package flashes.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/spansion.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 30a3ffbfa381..6abef5b515a1 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -24,8 +24,6 @@
>  #define SPINOR_REG_CYPRESS_STR1V					\
>  	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_STR1)
>  #define SPINOR_REG_CYPRESS_CFR1			0x2
> -#define SPINOR_REG_CYPRESS_CFR1V					\
> -	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR1)
>  #define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2			0x3
>  #define SPINOR_REG_CYPRESS_CFR2V					\
> @@ -348,10 +346,6 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>  	u8 i;
>  	int ret;
>  
> -	if (!params->n_dice)
> -		return cypress_nor_quad_enable_volatile_reg(nor,
> -						SPINOR_REG_CYPRESS_CFR1V);
> -
>  	for (i = 0; i < params->n_dice; i++) {
>  		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR1;
>  		ret = cypress_nor_quad_enable_volatile_reg(nor, addr);
> @@ -657,15 +651,17 @@ static int s25hx_t_late_init(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = nor->params;
>  
> +	if (!params->n_dice || !params->vreg_offset) {
> +		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
> +			__func__);
> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Fast Read 4B requires mode cycles */
>  	params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
> -
> +	params->ready = cypress_nor_sr_ready_and_clear;
>  	cypress_nor_ecc_init(nor);
>  
> -	/* Replace ready() with multi die version */
> -	if (params->n_dice)
> -		params->ready = cypress_nor_sr_ready_and_clear;
> -
>  	return 0;
>  }
>  

Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
