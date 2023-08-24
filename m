Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29C9C27C40
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKlC5qn56ZyLvsCBtpsZ2Nzlm8yAjhxvJnlfYgeqpII=; b=sUPaaiUmj9Q3+V
	0vmeGXQIW2wEyBzH5yjfjOSiWf3hVdTbQQwneG4zDfh0pLpiXascu92FWE3HyfmGrcUVt3JgSAu/h
	XR2qNdibKmIrclUKjRrvOjW1ax6ddvN/VLVSzu4dLIp1m4ar6dlsB6/VXbjIDAk2IgjHgdJGVs2Lc
	40ynnXLrvmYGMAhkjaAZn8UztwuIEIFE6Scsb4PSvp1ztWo88lnLyaO55FXqDpUVFqGHQK2cBHfvZ
	Kz/RXlaPbpwDh2UDC9Y79OEC+YfFokLji0Ie6vGJd06+U+eR4UM1rgzNAuef7xADhq+UGE357ONuf
	Lq6CbDQszqufV7gsQU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5Cg-002Tph-0m;
	Thu, 24 Aug 2023 07:56:30 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5Cd-002To2-1N
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 07:56:28 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so10276429e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2023 00:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692863785; x=1693468585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PynNwQCUX3wPzw5dhP2cH8FHvUX1+YwHm6lT7fEr4Fk=;
        b=Q583OY567Bl90SHbnnP8GzT0CrUcmo7WHAL1aezYrO1e0h3Vx9t6IyOXR4eOv9A7jZ
         VAz8x8FiVxxeCc7r+omdb7yfqtOa1oG+lQdtR9wDyz7nYO2K80R2Nauvl5Nv8hqLKFKq
         8GX0i+nanDBBNoP5xgiB+VkTGu64nLfPW9BvEd/KYpamN48PAOqU7Og56JuF6ye4QHcj
         org84G0aHZyh7v1cx7wwB6DcaLKIbCtpn2x8KP22ogjPpgL9we7tJRX4JfpI05wZeq4o
         Ai8oyCseik/si85OVXxgPaMrcy2KeucUHnVrJnh1eeHk+KHlwld88xiST/0WN6dJZ9p4
         KCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692863785; x=1693468585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PynNwQCUX3wPzw5dhP2cH8FHvUX1+YwHm6lT7fEr4Fk=;
        b=gkVyeJwBVnJr3DtNPdvNkta6PFBzZMEeIfQvFWyZHDTlxEKc3GKbhVlJvXBAIqRbCp
         gqIn04+KKoAfhSRHq/p7UJsBtG3RDVK/FsUeuePx2LsCGHTNnnjAA22cdDc/aIxQITI8
         g3g+pqOmbtmyLqcFEYl76YHXd3gbZIh7S3rw0eqfLLzFEB6Oc2qw6iLJv3RjajMNgnAN
         jT6ZVtZpkoJv1KRQEbzMXkZkrqQPzhot2MCW82HTIt8FuseP+0TnaOhdh5gbA93uVs8e
         iZJWs4y3fbF/cOAZm5RsRcexASzO4RcDOYjjsr+dSmBHUVlL6PwR885qFNvUaM9Z4A9E
         bHLg==
X-Gm-Message-State: AOJu0YwnqaTGDIoL5NG0L5oHBXkP/PPJMGH5Vpuo4HhuRfbxzbmjzHf+
	W7PMPuWUcS6C2QkbfRi2n5S0mA==
X-Google-Smtp-Source: AGHT+IGogkwj/BkRT7dmk4avq99JLxp+gAOVq9hqdVhkIM2YvZFwShINXNgwOOYe7tblzzn44DMcrg==
X-Received: by 2002:a19:520b:0:b0:4ff:9a75:211e with SMTP id m11-20020a19520b000000b004ff9a75211emr9576748lfb.42.1692863784938;
        Thu, 24 Aug 2023 00:56:24 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.239])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c044a00b003fbe791a0e8sm1926510wmb.0.2023.08.24.00.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 00:56:24 -0700 (PDT)
Message-ID: <ccaf038f-e11a-7669-7f35-5c0405d7ac98@linaro.org>
Date: Thu, 24 Aug 2023 08:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 02/41] mtd: spi-nor: remove Fujitsu MB85RS1MT support
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-2-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-2-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_005627_465719_B2F3E983 
X-CRM114-Status: GOOD (  18.24  )
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



On 8/22/23 08:09, Michael Walle wrote:
> This part is not a flash but an EEPROM like FRAM. It is even has a DT
> binding for the (correct) driver (at25), see
> Documentation/devicetree/bindings/eeprom/at25.yaml. Just remove it.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/spi-nor/Makefile  |  1 -
>  drivers/mtd/spi-nor/core.c    |  1 -
>  drivers/mtd/spi-nor/core.h    |  1 -
>  drivers/mtd/spi-nor/fujitsu.c | 21 ---------------------
>  4 files changed, 24 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 496dae9ca0f3..5e68468b72fc 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -5,7 +5,6 @@ spi-nor-objs			+= atmel.o
>  spi-nor-objs			+= eon.o
>  spi-nor-objs			+= esmt.o
>  spi-nor-objs			+= everspin.o
> -spi-nor-objs			+= fujitsu.o
>  spi-nor-objs			+= gigadevice.o
>  spi-nor-objs			+= intel.o
>  spi-nor-objs			+= issi.o
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index c44de69c4353..286155002cdc 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2002,7 +2002,6 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>  	&spi_nor_eon,
>  	&spi_nor_esmt,
>  	&spi_nor_everspin,
> -	&spi_nor_fujitsu,
>  	&spi_nor_gigadevice,
>  	&spi_nor_intel,
>  	&spi_nor_issi,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 6d31af6c39ed..dfc20a3296fb 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -634,7 +634,6 @@ extern const struct spi_nor_manufacturer spi_nor_atmel;
>  extern const struct spi_nor_manufacturer spi_nor_eon;
>  extern const struct spi_nor_manufacturer spi_nor_esmt;
>  extern const struct spi_nor_manufacturer spi_nor_everspin;
> -extern const struct spi_nor_manufacturer spi_nor_fujitsu;
>  extern const struct spi_nor_manufacturer spi_nor_gigadevice;
>  extern const struct spi_nor_manufacturer spi_nor_intel;
>  extern const struct spi_nor_manufacturer spi_nor_issi;
> diff --git a/drivers/mtd/spi-nor/fujitsu.c b/drivers/mtd/spi-nor/fujitsu.c
> deleted file mode 100644
> index 69cffc5c73ef..000000000000
> --- a/drivers/mtd/spi-nor/fujitsu.c
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Copyright (C) 2005, Intec Automation Inc.
> - * Copyright (C) 2014, Freescale Semiconductor, Inc.
> - */
> -
> -#include <linux/mtd/spi-nor.h>
> -
> -#include "core.h"
> -
> -static const struct flash_info fujitsu_nor_parts[] = {
> -	/* Fujitsu */
> -	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1)
> -		FLAGS(SPI_NOR_NO_ERASE) },
> -};
> -
> -const struct spi_nor_manufacturer spi_nor_fujitsu = {
> -	.name = "fujitsu",
> -	.parts = fujitsu_nor_parts,
> -	.nparts = ARRAY_SIZE(fujitsu_nor_parts),
> -};
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
