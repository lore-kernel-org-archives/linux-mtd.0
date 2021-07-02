Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0B1C11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 12:50:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13CDB613C1
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 12:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13CDB613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDAcaWTC6r1kkwrSP9aeTOEaFrDP0gV1hocRWKR0Ovk=; b=P3bG6mXIitEwsGhe95Gmq0Hhcw
	waFshtntJ5veNyzAytuWGoobyjAIQRIRWy8YMcoEgDdAw4gWoZjWuVWuRZiYC2ynIMQ4Pz5e4Xeeg
	6lVLUQD0onSzVdkofkkSo9Fgi/VEEANGsKjJ6/IsDvMmN3AfAE1F/zILnYJUpmlTlczFqO1YNJ/jN
	Z3v5tcVOEiTg2BygAAgRysX/iTFBEFxdArDkBm56OPWNCT3mDq+dZDbA8D0F5uTuFAM7HTA9XHL2Z
	oiV8jPy7uwnKpwTwN1BtX+64NByEPFj3h39C/AGGgYnL+B5DFdhAmKaeNZL8nwqMw29DXmyjIaN+a
	DtTd+RKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzIbh-0032oc-CU; Fri, 02 Jul 2021 12:49:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzIbe-0032ns-2e
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 12:49:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id r3so6615444wmq.1
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jul 2021 05:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g3OtgnCzB0J2RLPwluzilFei82zfgN7iw6OLLhXfZGo=;
 b=IFYrCe9Cf1s479WBILlslfV/+uHycK6O9LJJ6VIv/Fk39IuYE1Y6jMdT1dO3kGZYgv
 BKwNhvbtDIgekIJHGZQWSDyquZSWQc+k3XKDyaM+WpvnRybfmQFYUN/pmXxzsNJoQOPd
 Ugf4PAHyQgSYFk1mPB/pMlQ7fu24hyo6xX8GTS4tut2d/FcCQ0YLg/vDEoR1YhpOmfal
 9A34BGHR+ySKqYtU5aePehTFD5A1Ku0kYXO86nUHaL3Kr8BOmQ4RaCucyS93G6yxPOm8
 lQPu/n+p2nfLD4e5E3+vM3rLmaZqCDg5No4SVR3uPqx+Bn/FPr1JQRbUzxR65JskEc6O
 BVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g3OtgnCzB0J2RLPwluzilFei82zfgN7iw6OLLhXfZGo=;
 b=CJTRm5zw2iMcgYh3QTZbx+5aiiVJpBNFNUYgz+BJvK0j0gjxA30UPltx2fb+FD+zbg
 HhGzSf4dsIwm2hgGMDGXYQqofGx2e/4IeRPbTwz7IZMcLfZs6gPT+KhwmfQjjN1OYerk
 tB6GH/7rbP8hRYKJWfjBClDu6Ig9Aza+77fHScxg9WQ2Jiqr5fuwD2iSgLHJlygtnFuz
 co+WC94Ap4gBkCJu6OhK7m6FDSwIFrhweazicGL0FOkzM5ijOhBclc7o0CCW/OY/4TY8
 7nOpGjbBkT5a8H6tFNbMXMTKIm3vvt1eaJzFn926gwWmCLTtIDZgv3+8xM6SxefEY6Za
 ULPg==
X-Gm-Message-State: AOAM5308GiVoOTjhhb4P6jY0F7GttEcOJw3qhIXW+9KqK+2lpsPTCzpD
 8VL4SJ2sSlDl/Uzd2iZVHw==
X-Google-Smtp-Source: ABdhPJwv7ErbMNyOOSK898g5XrlDXtaBMEsxs0oGM9VeSf4oPqzpCmLG1Xvtet8c2r7jUDMNoBR5/w==
X-Received: by 2002:a7b:c449:: with SMTP id l9mr7620060wmi.98.1625230154557;
 Fri, 02 Jul 2021 05:49:14 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de.
 [91.67.75.139])
 by smtp.gmail.com with ESMTPSA id h9sm2927202wmb.35.2021.07.02.05.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 05:49:14 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: XTX: Add support for XTX XT25F128B
To: Chris Morgan <macromorgan@hotmail.com>, linux-mtd@lists.infradead.org
Cc: vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com,
 tudor.ambarus@microchip.com
References: <SN6PR06MB5342C82F372F37FB8E21B327A57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
From: Alex Bee <knaerzche@gmail.com>
Message-ID: <a31c9949-089c-fae8-b8a4-30055a4833c7@gmail.com>
Date: Fri, 2 Jul 2021 14:49:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <SN6PR06MB5342C82F372F37FB8E21B327A57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_054918_175733_F5C1024C 
X-CRM114-Status: GOOD (  30.63  )
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

Hi Chris, guys


Am 02.04.21 um 22:15 schrieb Chris Morgan:
> Add support for a new vendor (XTX) along with a new chip from the
> vendor (XT25F128B). This chip is used in the Odroid Go Advance,
> and has been tested extensively using the spi-gpio driver, as it
> is connected to a serial flash controller that is not currently
> supported (but the pins can be repurposed to GPIO). Read, write, and
> erase all work as expected.
Once you've figured out how vendor id stuff is read out correctly, would 
you mind also adding the the XT25F32B variant?
 From what I've checked it has all things in common with XT25F128B - 
just has a 64 instead of 256 sectors.

Datasheet can be found at:
https://datasheet.lcsc.com/szlcsc/2005251035_XTX-XT25F32BSOIGU-S_C558851.pdf

> 
> Datasheet can be found here:
> https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT25F128BSSIGT_C558844.pdf
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/mtd/spi-nor/Makefile |  1 +
>   drivers/mtd/spi-nor/core.c   |  1 +
>   drivers/mtd/spi-nor/core.h   |  1 +
>   drivers/mtd/spi-nor/xtx.c    | 24 ++++++++++++++++++++++++
>   4 files changed, 27 insertions(+)
>   create mode 100644 drivers/mtd/spi-nor/xtx.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 653923896205..3f7a52d7fa0b 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -17,6 +17,7 @@ spi-nor-objs			+= sst.o
>   spi-nor-objs			+= winbond.o
>   spi-nor-objs			+= xilinx.o
>   spi-nor-objs			+= xmc.o
> +spi-nor-objs			+= xtx.o
>   obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
>   
>   obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0522304f52fa..9a89ec473e4b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2215,6 +2215,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>   	&spi_nor_winbond,
>   	&spi_nor_xilinx,
>   	&spi_nor_xmc,
> +	&spi_nor_xtx,
>   };
>   
>   static const struct flash_info *
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4a3f7f150b5d..ee0e45eaffcd 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -425,6 +425,7 @@ extern const struct spi_nor_manufacturer spi_nor_sst;
>   extern const struct spi_nor_manufacturer spi_nor_winbond;
>   extern const struct spi_nor_manufacturer spi_nor_xilinx;
>   extern const struct spi_nor_manufacturer spi_nor_xmc;
> +extern const struct spi_nor_manufacturer spi_nor_xtx;
>   
>   void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>   			     struct spi_mem_op *op,
> diff --git a/drivers/mtd/spi-nor/xtx.c b/drivers/mtd/spi-nor/xtx.c
> new file mode 100644
> index 000000000000..4eec737e94c7
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/xtx.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021, Chris Morgan <macromorgan@hotmail.com>
> + * Based on XMC SPI NOR module
> + * Copyright (C) 2005, Intec Automation Inc.
> + * Copyright (C) 2014, Freescale Semiconductor, Inc.
> + */
> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static const struct flash_info xtx_parts[] = {
> +	/* XTX (XTX Technology Limited) */
> +	{ "XT25F128B", INFO(0x0b4018, 0, 64 * 1024, 256,
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_xtx = {
> +	.name = "xtx",
> +	.parts = xtx_parts,
> +	.nparts = ARRAY_SIZE(xtx_parts),
> +};
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
