Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1078DC76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 08:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xd2kHDnKbnYP+k5i5zrjj74kESfLgEXbrKw2QObl0Po=; b=w8EDG4WG9STO+W
	BXXgAhCDGbdDmqJajl4Cl1oCFZMwyB3Nk2OZAFxuYyFaAUXENkPwaf3Z4VE4tSR/4ceCqNN8IO0TE
	PBF6wOBv53NdFFqzlFy8kwx2mTalPH9GVHNuqd0LdRgOajy1QOiEXe/AIO510Y/aVYbWyI4VujXcU
	VzWK9pHlqnbU29G0LRTYqwsnia2epAujrZCVj3xtWUguscIsx3jFdRl2TFOsGXiKdWI+hXHmakCLv
	bgPzPXXV8kSVKLCH0hKxQx9EBJ/z8BnsBuxEDkq9+loH/osUphWiZLmNaO0s9hiKUtuTnQ95uW5LJ
	vDGjQc0TBEdGikTAfIVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFTO-00EWGO-1N;
	Mon, 03 Apr 2023 08:23:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFTM-00EWFW-0c
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 08:23:29 +0000
Received: by mail-ed1-x532.google.com with SMTP id ek18so113965989edb.6
        for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2023 01:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680510206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cL8vP3lyPF1+k3gJEci9eUh3ZxCSJvvNnkojFFsr1RE=;
        b=W2nGCXmrJiP24N9QxPfwfd9zNFEtXSIwDOJ5Bmx5SaW8otP6afH3C6U7GXlTnyw2lD
         oHYcC6eoe0fHkleglQbGRbCAOXo79drah/igRQn1ShgpVmVO5owkLlTz89dlKurtkDoS
         d8WZZF6jNt2sGECACjw5AjVPPXS3e5BoJC2oEY5g+fYXXCDct928+I2YB2qQTKBleLtp
         a48lLMSNj6+zPdcE7t7mE7PzSRbrEQ6kFY/lupx2F9vHnWM3xU5Ii86PnrQoyBFuwiDI
         0EXHr9KKh1VkO7JS1GgThdm2/nsCxExV/brUa2covaIvG4u54NVvaLAoU/rk/mWQz1lv
         t1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680510206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cL8vP3lyPF1+k3gJEci9eUh3ZxCSJvvNnkojFFsr1RE=;
        b=VkE+J6GyWU6f4vo+p1zunFfuw0c2eIJTbpDNOK36D4RAssKI6Vqpm0n18QOGRvHlCl
         Qqz2Dw5FiI1jY117LlHLfAL2EqmtNoXQMmVMyZXzD+piYNEEtU8dyoZUYb+kx2wurSui
         DcNd27tJAuarLjkwsI9Rt3r5cnN3K86LsJiyfFr4brYBFfT1sdCn/31/YUcWHjwL3dsv
         g7Cfs7KQe8BJF1NBOirhAFs5rL45VA3VKbZcmPeR/a3kcjzHUzNnjcoDU8TiHO2MHL4/
         snqEDVLB5MDCinmaaBNb63XVY2zH7ZXk38HmOOT10FRLTz/hi0MsnlWmizsxmzNFiJC6
         2lpQ==
X-Gm-Message-State: AAQBX9ckNLmxCQ242B62o3gNQTEb25d7zXEqoypeOHWEiaYHeU+0Xe7c
	ms7kKT31PONnS8ASRh6hACFGHQ==
X-Google-Smtp-Source: AKy350ZaLIBbPrB4xUI+yJXKume9cUqoxNcDAOOvM3r3J0AT9UaGi0HAyH8Iw3OH9Uj2855hBndvLA==
X-Received: by 2002:a17:907:1612:b0:931:88e8:d470 with SMTP id hb18-20020a170907161200b0093188e8d470mr42363336ejc.23.1680510206541;
        Mon, 03 Apr 2023 01:23:26 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id dx7-20020a170906a84700b008d53ea69227sm4192793ejb.224.2023.04.03.01.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 01:23:26 -0700 (PDT)
Message-ID: <5c851822-1e14-f002-3224-738e10d478d1@linaro.org>
Date: Mon, 3 Apr 2023 09:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 1/2] mtd: spi-nor: Delay the initialization of
 bank_size
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230331194620.839899-1-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230331194620.839899-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_012328_230287_370793C3 
X-CRM114-Status: GOOD (  25.55  )
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



On 3/31/23 20:46, Miquel Raynal wrote:
> Bank size is derived from the chip's size, which in
> spi_nor_init_default_params() can still be zero if the size is not
> hardcoded in a table (eg. sfdp parsing). We need to delay the
> initialization of this field in the "late" helpers.
> 
> Based on the fact that RWW compatible devices will use the bank_size to
> derive in which bank an access is made, we absolutely want to avoid
> divisions by 0. Right now there is no such opportunity between
> spi_nor_init_default_params() and spi_nor_late_init_params() but it is
> probably safer to enforce a default value (assuming 1 bank) as early as
> possible, just in case some day code using this variable is moved
> earlier than expected.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> I made the choice to keep a default value, to be honest this is not
> actually needed today, so feel free to drop the line if you don't like
> it, both choices seem reasonable to me.
> ---
>  drivers/mtd/spi-nor/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 9e6a0730cdb8..f436395ca489 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2882,6 +2882,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>  	 */
>  	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
>  		spi_nor_init_default_locking_ops(nor);
> +
> +	nor->params->bank_size = div64_u64(nor->params->size, nor->info->n_banks);
>  }
>  
>  /**
> @@ -2948,7 +2950,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>  	/* Set SPI NOR sizes. */
>  	params->writesize = 1;
>  	params->size = (u64)info->sector_size * info->n_sectors;
> -	params->bank_size = div64_u64(params->size, info->n_banks);
> +	params->bank_size = params->size;

I'll get rid of this line entirely as you overwrite it anyway in
late_init and it's not used in between.

>  	params->page_size = info->page_size;
>  
>  	if (!(info->flags & SPI_NOR_NO_FR)) {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
