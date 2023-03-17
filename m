Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D579C6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 03:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxF3+EKSqWoHYruyE+yevqU5wTCPAV8ei0m25+1sf5g=; b=HcTRP9gAZY1/Jr
	dAjsm3ul8Ml97jWIFF2ozYfCF9ZhRnr5gAQqJjNVoZMCooWlGxG+4Ps6XuW+8wIk3mNBkxcdI5CTo
	oQgU309TXVv1AEtTNIjTFyxLE361+ZO1aCrMshVxWhZZ93tiLdEP+Z9p0xbwaOj+Yic5EpzjRQYSX
	d/8KaobExfZL6ILzmNwk/PC6tnSryOY/QCADZqF53mZ/RwHxdJ87In9Gxu9YU12PSGSFES5hUf7xK
	qnBi2JE5ioVA6c9qUDV2gyjWitYGv1pxCMCCnAVCpDIfFbvgwjRk3cpuDdYwfO0LbvuRkmt3pu0iR
	pGDwwfIqVjxreZt+iCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd0ts-000ocT-2E;
	Fri, 17 Mar 2023 03:37:04 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd0tp-000obZ-15
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 03:37:02 +0000
Received: by mail-ed1-x530.google.com with SMTP id eh3so15396374edb.11
        for <linux-mtd@lists.infradead.org>; Thu, 16 Mar 2023 20:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679024216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGVFBnLGW48ofq0f9WXStcjPontbYbsyDgiftQkwDrY=;
        b=p+agg5DIDwgcsDyAJ+8gsuQlSFP+Nru68efe0Dj5FU6+BVScznwGIHnFo3dYL6ynX6
         OMK8JXRf+J8eehL4rh9i2aL7sW9euHElTfp99mzToPhrSRHQG7LczRGcauXRk0s2W20I
         GrGHFR39bJXty9QwipMcYq4ZME9fcrQ3wmw/Z6Pyn+Ner4ucCe2dfIhhCqqmZ0uW0tWB
         M667lLlb4nDiVV5x4GtlBnO9uL2Xc0LIfepU9JScvHJvoDjZo5xgrT3DHlaFxkoBs4N8
         LoC//Po/5qOAqfExajJiPBdIkpKKFTgqyh40vWFvKub/gMM/F8L1L6ij2TlChO7Qvjkz
         UAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679024216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGVFBnLGW48ofq0f9WXStcjPontbYbsyDgiftQkwDrY=;
        b=0sJ3uf8CpyADivJI9ZrJOmL70JoduHR0oGQ08tAIXs+j6vIh2320DdTKtc6x5/34uZ
         VJTMROsULY+S1xXx9tW/qY5wjADTcP56fWIH68cUSV+pagM2H0WWvV8ARliyqb5x6GSA
         wJ4oe9BQc1UdJ284mLK4o/nwuU4cVE3oRtK6zSAmiEfloKEIW7lyVjZHIZTCH2A3vapy
         CymMBekPKVOUmi88b5cVAl+ZonzKx4NgY4MMZDOO3aASsWKnhLk1FE+QVqUsAA4u/ue6
         UspQOIfqXL7wdH/dLnCmlujn00npJ48bT1aOjBXuUH4paLhhRO0KtqZmDnwdcklUCaM4
         7+9Q==
X-Gm-Message-State: AO0yUKUaA6MABTalfWjZYYjr2RlUjNmCjuhkZo59TH66Z9kgZa4b3imn
	j1Dio2x8Xs0TFuBC2osLXQendA==
X-Google-Smtp-Source: AK7set/7DjQlJcUNOu8b96zVvsyzrTKMd38N74U0g4BAzL1RU7FhaceIaBuABEme3QBLfUqAjoe+OQ==
X-Received: by 2002:a17:906:dfe6:b0:930:831f:6744 with SMTP id lc6-20020a170906dfe600b00930831f6744mr4763705ejc.45.1679024216391;
        Thu, 16 Mar 2023 20:36:56 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id cd11-20020a170906b34b00b0093009bc5825sm408050ejb.2.2023.03.16.20.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 20:36:55 -0700 (PDT)
Message-ID: <431af678-9b5c-1cf5-7745-fb000366e039@linaro.org>
Date: Fri, 17 Mar 2023 03:36:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/8] mtd: spi-nor: Introduce the concept of bank
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
 <20230201113603.293758-2-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230201113603.293758-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_203701_400709_8E94A002 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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



On 2/1/23 11:35, Miquel Raynal wrote:
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b500655f7937..3845de9c874c 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2574,7 +2574,8 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>  
>  	/* Set SPI NOR sizes. */
>  	params->writesize = 1;
> -	params->size = (u64)info->sector_size * info->n_sectors;
> +	params->bank_size = (u64)info->sector_size * info->n_sectors;
> +	params->size = params->bank_size * info->n_banks;

Please keep the n_sectors per flash, not per bank, you'll break the
block protection support for these flashes. See the email thread on your
v3 2/9.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
