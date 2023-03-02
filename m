Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB49FC678D4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 06:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OXVxpzTv2DnlzR3w6y3iMsd9/Lm6HD9bnzMcfKbCWE=; b=mNXJfBogeN7tL5
	5bD65X+c8CiNn0nvrMyUpeshmCgmAyfe5r4StsUSCMEBEfn8DMkPDZkQPTV4k8mKCn38LOvPCCx/P
	mGpBDetPtLxsip7l2qzLQkSWULHi27vf99I99IXI6lVODrkDLqjI0kpP/0yl/cnK+4oq3KuJuLleX
	PbRlYQKqD8/PDZd6G0aMkK4L22VpoK9FPjYI+vBmdeduJauS8CeEBg4X+OQxmEHBrorbxQSRu0f7s
	UVGijseL0tQsGgqTLGhF7Oo0nHt/Dhc5d04scgWri3H9n44o9jBi+G1cebI+vIlpe9qH6lKKBf3ML
	QpT5WuDoGD5r1hDBwQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXck6-0013pp-Gy; Thu, 02 Mar 2023 06:48:42 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXck2-0013pB-N2
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 06:48:40 +0000
Received: by mail-ed1-x534.google.com with SMTP id f13so63568350edz.6
        for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2023 22:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677739715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+1nPB4vOkBUw8ToSzdQ00DgnuHTl/myS9AiY/9rEggw=;
        b=Y+m2lfskttKESbExwqAS6wiDYhmP7BlWsEVJB9UB6c4W+unPrurw0Q2obf6S6vKZBr
         o7sHxqrqjr95gzxuuX0H79BmPP4ynabq4h8f/CKVXMf56Q5f9tLmoz0oh4WK6vo93ywV
         aV7AyF1rAptQJtWDUSyrsAzi1zAlfLM2Yq60lR4BaKMXPKd/ZjiFF+xSgwTdpYhy+t6R
         N6gGJHX1N7bYHtYEgamNXpYnQb1dHWXIz4lnyew0pE+MFtb+TD3jl0O9qtUvmcAnIKuU
         qCeC0AIKy8mQ7wK10pqXFMs0WAqnMPTqgWefsj+KcT5W4uzDSA16xkRjfabGcV3lX//n
         jCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677739715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1nPB4vOkBUw8ToSzdQ00DgnuHTl/myS9AiY/9rEggw=;
        b=KIT1P6edtIFxTeAGzLstlSJ2xSy2cdJSWxdOJWHQwhxoOj3aUaeF3slVhXLTHGZbM9
         z68G8tmeZvjUQt+/sMFKAaSIzyo307rTNWqvMvCgsQGsdGJljbTL7LMISeamBP8CmZHd
         J7f3A7NuOiLmUSlUQ8yYViq5FisjfXtQEsLgvJ3r38mckdxZbr+AKKW1GXTXiTHA3CQk
         L+/b4ahefnyDsycimVAtZqW20ef+XY42a+JPYVUgTBfe8QedFFgZNbTYyivHx4IwfJZ2
         2QoW90xA36hBKSPLjYpQJUJZ58/CpFh1jRHJEMkDrQtTGdRjhq4NhbuSgULQeCoHGZmN
         HfOw==
X-Gm-Message-State: AO0yUKUX8tKBA9sKtX8KqoVXSHnNRIC71y5FtZysUUdy8BupIzaMq1DU
	AEjX+IzAQVE026017nq13aEu7A==
X-Google-Smtp-Source: AK7set+HZNrdgaTTU0ui9LA273R21UUt2xYL+eRtO3lVsxa7rp+Wc951hK7anAPUkkGnrHhtc/oy3Q==
X-Received: by 2002:a17:906:1991:b0:87e:a34b:9e2b with SMTP id g17-20020a170906199100b0087ea34b9e2bmr8599886ejd.28.1677739714860;
        Wed, 01 Mar 2023 22:48:34 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id n15-20020a5099cf000000b004aef147add6sm6456081edb.47.2023.03.01.22.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 22:48:34 -0800 (PST)
Message-ID: <05590349-64cb-da8b-c7b9-41b5ec9ed27a@linaro.org>
Date: Thu, 2 Mar 2023 08:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/8] mtd: spi-nor: core: Introduce number of dice and
 volatile register offset params
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
 <97e4456016d31567649e2a99d6d4daff7ed90e4a.1675835253.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <97e4456016d31567649e2a99d6d4daff7ed90e4a.1675835253.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_224838_811255_DC468B17 
X-CRM114-Status: GOOD (  19.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08.02.2023 07:53, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> In use of mult-chip devices, we need to access registers in each die for
> configuration and status check. The number of dice in the device and
> volatile register offset for each die are essential to iterate register
> access ops.
> 
> The number of dice must be initialized as 1 and may be updated through
> SFDP parse.
> 
> The volatile register offset table is dinamically allocated based on
> the number of dice then filled with offset values collected from SFDP.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>   drivers/mtd/spi-nor/core.c | 1 +
>   drivers/mtd/spi-nor/core.h | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b500655f7937..f18be6283740 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2576,6 +2576,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>   	params->writesize = 1;
>   	params->size = (u64)info->sector_size * info->n_sectors;
>   	params->page_size = info->page_size;
> +	params->num_of_dice = 1;
>   
>   	if (!(info->flags & SPI_NOR_NO_FR)) {
>   		/* Default to Fast Read for DT and non-DT platform devices. */
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index f6d012e1f681..c876ece62f13 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -349,6 +349,8 @@ struct spi_nor_otp {
>    *			in octal DTR mode.
>    * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
>    *			command in octal DTR mode.
> + * @num_of_dice:	number of dice in the flash memory.
> + * @vreg_offset:	volatile register offset for each die.
>    * @hwcaps:		describes the read and page program hardware
>    *			capabilities.
>    * @reads:		read capabilities ordered by priority: the higher index
> @@ -381,6 +383,8 @@ struct spi_nor_flash_parameter {
>   	u8				addr_mode_nbytes;
>   	u8				rdsr_dummy;
>   	u8				rdsr_addr_nbytes;
> +	u8				num_of_dice;

ndice maybe?

> +	u32				*vreg_offset;
>   
>   	struct spi_nor_hwcaps		hwcaps;
>   	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
