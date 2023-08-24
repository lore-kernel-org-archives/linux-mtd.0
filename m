Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51194C6FA8F
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 07:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Np1D60T7QSEL0Sb7Kq6QMWN0cyd1OpKMMNUfipzLelM=; b=ZLUIRXPNUeIQLF
	COr+54BK4Ft4ogzv2jCUXxGYMFN/tKfq66l8Nkbd6Lz8HD7E/AdPBmcoToeC/2p2IgDaAhrLeox0K
	Wv5qXM8ofhfes/OxPxYjwkaoVScjjypjv1A10Lj/QisXSVQXdGRp+M63J7ldsD8K8Ws51RWPEWj/U
	7OqBNCa+vPIGs1GwhQER+B4ph5xad8jWtRHSlWZV8lItjkwa14VbsyY5EZLT5BkcLuFkTlvE9ZYi6
	8QbW7PsmnUy9vyuBDurR78lIxGccWZ7nD3g+dJ9E5TavUEn/d6uX8ZzDISVhqDajBPYAATq3pKLXd
	GHoedcsZiSFAWTj2CEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5CI-002TjD-12;
	Thu, 24 Aug 2023 07:56:06 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5CF-002TiL-2f
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 07:56:05 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bbbda48904so81127841fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2023 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692863761; x=1693468561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JQ5a+a+DLZL8fu5vhZ5y8OBXDunDyHqp9ifQiH1QL7M=;
        b=UXVnHFfpZFq1LJb4ZWf/G2cEwHw+fJVt2zhM9hthVbvLSfgNUnFRRKuzQbqHWqTZUt
         zyZV06LRm9mSepyh2x4tcee3gcX5iSEPUzds0KZQ88tqlul76wcAPl/njtcmG1PTIewf
         jQv/7eiFCVnH9/1Y/ZaExN3P3UGKOonjHBuRzkvV7cChbTrwNv3ZLq5m+d42h+eEM7Su
         02spk8Fiw2aapuArfNPP0VzmuLyhY5aWfuirgv7kIMws9nbzIlMv2Q6BdaPdB5nFmWse
         6IOSTLxytvNT/ypw1wd0KJScxYpCn52VcoABWf/izxOnqkyMBlTj0yUEkaR/8L+P4ysF
         XVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692863761; x=1693468561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQ5a+a+DLZL8fu5vhZ5y8OBXDunDyHqp9ifQiH1QL7M=;
        b=OiiYKr7xboLjHdbf1/FFV+QaRkTF9IOsmLUc7CyKlPIXhncQX9XyDi46N9LOZWZ3P5
         B4mTpOm/Pvq8ROwMnFV/EPF37WiuvuXwUgXShBGhAFzreoTzPbYCD7AguhXRl2zFDnhW
         75sAGDn7NlJRUIBqq0WurSe954h43wGJ2sY9eMN5P+E428FEzBY5445PKTVdIszyubzQ
         bq02FZ9eHpdGUYuNLJ/4GjijK4VvoYSaZVE1VZTcRyeB3W5W272xYO4IuK/6cDeuu4dL
         pr27G9Gx+UIasgWJlQ9gkviE3G2lnS7DkxEfnzi1+dSMgSipJSkx39clw925Q0DDWfyc
         hPeg==
X-Gm-Message-State: AOJu0Yx5KS1L6H7+eyg0tvbhTMor9fhuQvWUbjD7V0sJZRvWMuPOp7Xv
	tUIfc4O6B9EVfEaziVR8WdUc+w==
X-Google-Smtp-Source: AGHT+IGC3XPafzP8NSdZ/hKJK7JbKy8UmB1lqAkMbRmd7SW14rIMO8s8arGdy0cESCpEpD7z2iRdQQ==
X-Received: by 2002:a2e:9185:0:b0:2bc:bb46:4fc7 with SMTP id f5-20020a2e9185000000b002bcbb464fc7mr8746839ljg.24.1692863760980;
        Thu, 24 Aug 2023 00:56:00 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.239])
        by smtp.gmail.com with ESMTPSA id y11-20020a05600c364b00b003fe2a40d287sm1837211wmq.1.2023.08.24.00.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 00:56:00 -0700 (PDT)
Message-ID: <ea44da10-c9bd-22ba-576b-109670e3a63e@linaro.org>
Date: Thu, 24 Aug 2023 08:55:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 01/41] mtd: spi-nor: remove catalyst 'flashes'
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-1-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-1-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_005603_864297_1BF10C69 
X-CRM114-Status: GOOD (  18.18  )
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
> CAT25xx are actually EEPROMs manufactured by Catalyst. The devices are
> ancient (DS are from 1998), there are not in-tree users, nor are there
> any device tree bindings. Remove it. The correct driver is the at25.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/spi-nor/Makefile   |  1 -
>  drivers/mtd/spi-nor/catalyst.c | 24 ------------------------
>  drivers/mtd/spi-nor/core.c     |  1 -
>  drivers/mtd/spi-nor/core.h     |  1 -
>  4 files changed, 27 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index e347b435a038..496dae9ca0f3 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -2,7 +2,6 @@
>  
>  spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
>  spi-nor-objs			+= atmel.o
> -spi-nor-objs			+= catalyst.o
>  spi-nor-objs			+= eon.o
>  spi-nor-objs			+= esmt.o
>  spi-nor-objs			+= everspin.o
> diff --git a/drivers/mtd/spi-nor/catalyst.c b/drivers/mtd/spi-nor/catalyst.c
> deleted file mode 100644
> index 6d310815fb12..000000000000
> --- a/drivers/mtd/spi-nor/catalyst.c
> +++ /dev/null
> @@ -1,24 +0,0 @@
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
> -static const struct flash_info catalyst_nor_parts[] = {
> -	/* Catalyst / On Semiconductor -- non-JEDEC */
> -	{ "cat25c11", CAT25_INFO(16, 8, 16, 1) },
> -	{ "cat25c03", CAT25_INFO(32, 8, 16, 2) },
> -	{ "cat25c09", CAT25_INFO(128, 8, 32, 2) },
> -	{ "cat25c17", CAT25_INFO(256, 8, 32, 2) },
> -	{ "cat25128", CAT25_INFO(2048, 8, 64, 2) },
> -};
> -
> -const struct spi_nor_manufacturer spi_nor_catalyst = {
> -	.name = "catalyst",
> -	.parts = catalyst_nor_parts,
> -	.nparts = ARRAY_SIZE(catalyst_nor_parts),
> -};
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1b0c6770c14e..c44de69c4353 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1999,7 +1999,6 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
>  
>  static const struct spi_nor_manufacturer *manufacturers[] = {
>  	&spi_nor_atmel,
> -	&spi_nor_catalyst,
>  	&spi_nor_eon,
>  	&spi_nor_esmt,
>  	&spi_nor_everspin,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 9217379b9cfe..6d31af6c39ed 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -631,7 +631,6 @@ struct sfdp {
>  
>  /* Manufacturer drivers. */
>  extern const struct spi_nor_manufacturer spi_nor_atmel;
> -extern const struct spi_nor_manufacturer spi_nor_catalyst;
>  extern const struct spi_nor_manufacturer spi_nor_eon;
>  extern const struct spi_nor_manufacturer spi_nor_esmt;
>  extern const struct spi_nor_manufacturer spi_nor_everspin;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
