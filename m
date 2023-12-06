Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9599C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 14:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vG7FMbEPQcEJMCXYD8inUg3o3nnNa9ZGi6YqC5g9xF4=; b=w3PgFf9jAHWg31
	5Qsz8R0hYe0pUyxnA2Yoxak9mkyTZaONBJRD/WbYMo4cjo0M6rYdU2bEmyJ1C9DndEpGUavZtBQwq
	DZV/k0z2UdLvOOpnuu0avrQfOR6zCGSMijZVrz1mNiqCKDFctPZlrxhcDYTJlZg/+1zOpuljZ3TSx
	FQIay/6J+yDH4hotbVaR8OcIPaB2Lln36sZCQC0UTrTwZqFNQB/GoM8vztPa1AF1gnWYIlRo7Y+tW
	9VNb72BSCARVLtN+k6sZJubqnQ8DAkW2DqsQJOycoeVHzMSDxG62SgBeZ8mU/jP3gno/cmyIo20q6
	GRYebKf2iZ1wLwvnJ4Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsup-00AUmc-1E;
	Wed, 06 Dec 2023 14:30:19 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsul-00AUl2-2y
	for linux-mtd@lists.infradead.org;
	Wed, 06 Dec 2023 14:30:17 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9f85eff28so61864171fa.3
        for <linux-mtd@lists.infradead.org>; Wed, 06 Dec 2023 06:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701873013; x=1702477813; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ecDK9XgOWPDwKNtXxUXDKXSM0zmyupQJGPO18jvHP6A=;
        b=fOHJDcaLQHj/UDWMhqkLXJDsu/wyJWyPjGhN2+7ycH6bTnVedhFl9sK0NzwynEh/Ug
         eyWqC/fGkx2xUtBWjNjiNjT2YDNjaoSf8+/VfSwr4VIc2Lc62wpuzXEpiyoE6Tj0G8t9
         51y26i84aJwlPD6bAZX9U2dETVBFrfm4Uzd79Oec/EA/qvU8lcmiHu5NVpmiR2DobFrK
         kPiniKzURfrQBnSeJVfI93LhH6p5G1FXBXWXAqMA118mrGWfprN6OsH7dolRfLsSdhtX
         reG6w6LuZ1JHkaKpADz1CdibuO7WMy7+yxlcrCUnSP8BjX1Jrmsw2P6niy9W4heRFL5S
         Aa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701873013; x=1702477813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ecDK9XgOWPDwKNtXxUXDKXSM0zmyupQJGPO18jvHP6A=;
        b=kmlDpaM+H1SuGswzDBmHEqMwxHnl/701LiB7seNAdnEcWBewFzTI1irpgntFj4sxuP
         +ttLYrV2OPJ1IN1i99ndb+lo3Ank3B1+RxdoteUlCXcVXbFoSlRz41UiwxV/jkuIbNzO
         rYi0zglAvSByfGJGWbRXTgFBfLeqpszr80hTt7citypiMhgboBQqWJHVcjkT2fn3EFEY
         dWUM0R/txnxXSqacBt5rqi/A/8Ad/y9EjL2QB/4pLgdzCrrjCw2HjAdNWqQKvElFc6ED
         Zd/APH6FF/dZZk7T0XSdVedtMWXQrYD5I4SbTi9l3YypeYWrH+NVFmFTXj/t7MqFg2e/
         eIPw==
X-Gm-Message-State: AOJu0Yw/3Zw9+/WBqtgEfKlnCCx9WVn4kETqihPNPEoNz4Aa2MXTlIh+
	qGOtf3vMywMMXxvlhJ4yA6rCDw==
X-Google-Smtp-Source: AGHT+IFFLwb6J1kg4M4UnYbam4jWK0loSvNCLNafUtgmro7h6iWF18QP/GUyGS9AQ5j9Y3MfsdsiMQ==
X-Received: by 2002:a05:6512:29a:b0:50c:d30:3a05 with SMTP id j26-20020a056512029a00b0050c0d303a05mr695875lfp.25.1701873013467;
        Wed, 06 Dec 2023 06:30:13 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id gs20-20020a170906f19400b00a18374ade6bsm8391001ejb.67.2023.12.06.06.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 06:30:12 -0800 (PST)
Message-ID: <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
Date: Wed, 6 Dec 2023 14:30:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, broonie@kernel.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sbinding@opensource.cirrus.com, lee@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael@walle.cc, linux-mtd@lists.infradead.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, git@amd.com,
 amitrkcian2002@gmail.com
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_063015_987096_BFCB4343 
X-CRM114-Status: GOOD (  25.91  )
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

Hi, Amit,

On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
> Each flash that is connected in stacked mode should have a separate
> parameter structure. So, the flash parameter member(*params) of the spi_nor
> structure is changed to an array (*params[2]). The array is used to store
> the parameters of each flash connected in stacked configuration.
> 
> The current implementation assumes that a maximum of two flashes are
> connected in stacked mode and both the flashes are of same make but can
> differ in sizes. So, except the sizes all other flash parameters of both
> the flashes are identical.

Do you plan to add support for different flashes in stacked mode? If
not, wouldn't it be simpler to have just an array of flash sizes instead
of duplicating the entire params struct?

> 
> SPI-NOR is not aware of the chip_select values, for any incoming request
> SPI-NOR will decide the flash index with the help of individual flash size
> and the configuration type (single/stacked). SPI-NOR will pass on the flash
> index information to the SPI core & SPI driver by setting the appropriate
> bit in nor->spimem->spi->cs_index_mask. For example, if nth bit of
> nor->spimem->spi->cs_index_mask is set then the driver would
> assert/de-assert spi->chip_slect[n].
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 272 +++++++++++++++++++++++++++++-------
>  drivers/mtd/spi-nor/core.h  |   4 +
>  include/linux/mtd/spi-nor.h |  15 +-
>  3 files changed, 240 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 93ae69b7ff83..e990be7c7eb6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c

cut

> @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
>  static int spi_nor_late_init_params(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
> -	int ret;
> +	struct device_node *np = spi_nor_get_flash_node(nor);
> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
> +	u32 idx = 0;
> +	int rc, ret;
>  
>  	if (nor->manufacturer && nor->manufacturer->fixups &&
>  	    nor->manufacturer->fixups->late_init) {
> @@ -2937,6 +3042,44 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
>  	if (params->n_banks > 1)
>  		params->bank_size = div64_u64(params->size, params->n_banks);
>  
> +	nor->num_flash = 0;
> +
> +	/*
> +	 * The flashes that are connected in stacked mode should be of same make.
> +	 * Except the flash size all other properties are identical for all the
> +	 * flashes connected in stacked mode.
> +	 * The flashes that are connected in parallel mode should be identical.
> +	 */
> +	while (idx < SNOR_FLASH_CNT_MAX) {
> +		rc = of_property_read_u64_index(np, "stacked-memories", idx, &flash_size[idx]);

This is a little late in my opinion, as we don't have any sanity check
on the flashes that are stacked on top of the first. We shall at least
read and compare the ID for all.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
