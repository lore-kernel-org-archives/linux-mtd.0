Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB1EC4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQDRNTWt5R/UiO9PGP0ghxLYpYtvQRD+RMq2fkvIO6s=; b=B2BFsxIVa18Dj8
	gslstI7BeAVf/0WFRH6kpqUYnjli0406lJ6i+I1NijOLauZFpf+S5p5sA8nbbQx67MIL63r0w48Lm
	JI+52OhNM9YQqEMJkGujZUj4qfJnkUi1zLI+ARAfmTSwVU7qtjo9H5EvpOzMIhwCZ/+19HcF4WIHJ
	sI7PNgBnKD4GbESDqVmNrDuj4HG22BgdDBr+/QoxxiaLnp0Yfl6NiMM1f519aaq3/2a3ujCNkQ5P8
	Tbprxoz5VmHtub+bdmmOMyirbg1jCYjStgMwJJ+fD4+/pPEBIVQSzii3fIXz3j69wLZv8k8eKxOfL
	7cvs93DKoYIn8R/fZ+hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAt88-00AWYx-2z;
	Wed, 06 Dec 2023 14:44:04 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAt84-00AWXJ-3C
	for linux-mtd@lists.infradead.org;
	Wed, 06 Dec 2023 14:44:03 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54bfa9b3ffaso8933745a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 06 Dec 2023 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701873839; x=1702478639; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/sUNB5ZgX1IJ9770bfc42rc11+iIaUcvTzWeH8l1S8=;
        b=Ymv3gcWs/OiCxa7tca/WMLb+ystU1tfahbSKtK5fk7ZNgltWlDNm4LJGUfPiVDR2Sr
         2/IAUNdmbK5qB+FcW71FGQZABfoe06PbaKNTjktdbdeQalJPk3AckVCfdTcf1RJJyuOU
         VxcwsHFHZOx+bZiBBS82ZF2zwT8oKTWyi4WgK1TR6wEWlO5DZ78aJr4i3xgNgtqN/0up
         JnXTjKgcm6PnaDkrb5odwWlvflRIAjJQxpVj6RbdEJizb9hk27qrnvbfH5PznipMYAV5
         atj9be3QzV7RGDkpuIoGc4brCYPq7/QTofdPgSyM+yy5woUHL/RCuSsmSi6MH0VTh/6h
         Dzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701873839; x=1702478639;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/sUNB5ZgX1IJ9770bfc42rc11+iIaUcvTzWeH8l1S8=;
        b=tf5DgFBkv7kW6U32ZAGrRZil5GJb/fFXPTfZuwUBBpOItTYcGXh1wrNPMgGbmnUIJ5
         ZnOhwbcDeAAnUCeTktAowOprnxNodE3ywEDkX3UiH0y9wbuoFjUpyvCI54srALOMUptu
         NZdX9GL0J5EIJ1k4zJt5OU2MPi9Dstw1uYDCr+b2Et7nES12oi/OOXOLW2DNvbdxxbVn
         7O3LrtMObIGYCjfDjM6YA2lhgaG3HmWBfUEoL+lZl8gd22d7aO7Uz/TtRZf7c4mC55AG
         c/K+X8eFG5fdwuPBpG2DoaNf5r4U2X6BtwT1kivbBSR4Zi+U6MqBYWEIWQzlec7NZkwO
         OKww==
X-Gm-Message-State: AOJu0Yy1XniYd62AKo57svfdIgESIUW6jXwlnvS5uHfCrCK+dYHVUAgI
	Acaly4kmasWdodH4K9mpY4Ynlg==
X-Google-Smtp-Source: AGHT+IHDAvptVLTEL9dhcaG+Hbai6J369y6guW1ZLyEztJsP78iBp+Sc57pMqBtc7BIzBcb9a1OzXg==
X-Received: by 2002:a50:d0cc:0:b0:54c:4837:9a9c with SMTP id g12-20020a50d0cc000000b0054c48379a9cmr758869edf.67.1701873838794;
        Wed, 06 Dec 2023 06:43:58 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id bo24-20020a0564020b3800b0054cc22af09esm49861edb.46.2023.12.06.06.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 06:43:58 -0800 (PST)
Message-ID: <9f577482-30d9-4e1d-9469-812d323b18c6@linaro.org>
Date: Wed, 6 Dec 2023 14:43:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
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
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
In-Reply-To: <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_064401_027603_C7427ACB 
X-CRM114-Status: GOOD (  26.48  )
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



On 12/6/23 14:30, Tudor Ambarus wrote:
> Hi, Amit,
> 
> On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
>> Each flash that is connected in stacked mode should have a separate
>> parameter structure. So, the flash parameter member(*params) of the spi_nor
>> structure is changed to an array (*params[2]). The array is used to store
>> the parameters of each flash connected in stacked configuration.
>>
>> The current implementation assumes that a maximum of two flashes are
>> connected in stacked mode and both the flashes are of same make but can
>> differ in sizes. So, except the sizes all other flash parameters of both
>> the flashes are identical.
> 
> Do you plan to add support for different flashes in stacked mode? If
> not, wouldn't it be simpler to have just an array of flash sizes instead
> of duplicating the entire params struct?
> 
>>
>> SPI-NOR is not aware of the chip_select values, for any incoming request
>> SPI-NOR will decide the flash index with the help of individual flash size
>> and the configuration type (single/stacked). SPI-NOR will pass on the flash
>> index information to the SPI core & SPI driver by setting the appropriate
>> bit in nor->spimem->spi->cs_index_mask. For example, if nth bit of
>> nor->spimem->spi->cs_index_mask is set then the driver would
>> assert/de-assert spi->chip_slect[n].
>>
>> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
>> ---
>>  drivers/mtd/spi-nor/core.c  | 272 +++++++++++++++++++++++++++++-------
>>  drivers/mtd/spi-nor/core.h  |   4 +
>>  include/linux/mtd/spi-nor.h |  15 +-
>>  3 files changed, 240 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 93ae69b7ff83..e990be7c7eb6 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
> 
> cut
> 
>> @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
>>  static int spi_nor_late_init_params(struct spi_nor *nor)
>>  {
>>  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
>> -	int ret;
>> +	struct device_node *np = spi_nor_get_flash_node(nor);
>> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
>> +	u32 idx = 0;
>> +	int rc, ret;
>>  
>>  	if (nor->manufacturer && nor->manufacturer->fixups &&
>>  	    nor->manufacturer->fixups->late_init) {
>> @@ -2937,6 +3042,44 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
>>  	if (params->n_banks > 1)
>>  		params->bank_size = div64_u64(params->size, params->n_banks);
>>  
>> +	nor->num_flash = 0;
>> +
>> +	/*
>> +	 * The flashes that are connected in stacked mode should be of same make.
>> +	 * Except the flash size all other properties are identical for all the
>> +	 * flashes connected in stacked mode.
>> +	 * The flashes that are connected in parallel mode should be identical.
>> +	 */
>> +	while (idx < SNOR_FLASH_CNT_MAX) {
>> +		rc = of_property_read_u64_index(np, "stacked-memories", idx, &flash_size[idx]);

also, it's not clear to me why you read this property multiple times.
Have you sent a device tree patch somewhere? It will help me understand
what you're trying to achieve.

> 
> This is a little late in my opinion, as we don't have any sanity check
> on the flashes that are stacked on top of the first. We shall at least
> read and compare the ID for all.
> 
> Cheers,
> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
