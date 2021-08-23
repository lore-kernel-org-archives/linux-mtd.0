Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973C2C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 22:48:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54B2A613AD
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 22:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54B2A613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cunCXRUBdWlo0alOpmpQBy1zRf4sGxKY9SDRmkmqLUg=; b=z4wDzz18c3AKGIken2TMBaFsLi
	MmdlrhzYXRLWvqkBD+Fvd19fnRZP1kgbFoSc46shkNuqadh1tL4f0XiiTcqzoOUKvnwUEDQRG1Lxn
	lOyQ5/INHeI5ge2ImLDXwPDoR2Z1fmqkb34fb3p/Heaba0a7Mo3BNBSNeyYGh4MnlUxorjZAAsJGT
	3NNWrUL9PS+V65KcZtUmcuITcLBpOSV9E7z4+Xcrvt9K4GTTnEYTQUO78RTG/aptHr/wLmD1aBuML
	xmeopctmxZ94zwBlxRd9WVLZLyxlgbDytGaUINbwq4A3hs4/Ur0h1J5HpW4/bfm1QNINJYn2/7cCY
	dOdV3mMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIIjS-000ueK-KW; Mon, 23 Aug 2021 22:47:54 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIIj9-000uaC-Jv; Mon, 23 Aug 2021 22:47:39 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 588F422205;
 Tue, 24 Aug 2021 00:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1629758853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xk23VbY+XdZ7FqMSTM0PnS6pphcBIiMJCdL1XyWroo=;
 b=krveEmOMCUZ+6zBDkjXWbScsra28NsfVGld4/YnY1EI/k7rtCiH1RUN1jiZJuT1nPDzmVs
 k7WJh23Y+dvhiCvNed4WI4EP+ODmCmQqL/x6qKoQnXMHF7erBIIAjiHKr9kYhst6P9Xow+
 9BNYm6y8Lv8o0I4mqO2ZtUwKUeM43kg=
MIME-Version: 1.0
Date: Tue, 24 Aug 2021 00:47:33 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 05/35] mtd: spi-nor: Introduce Manufacturer ID
 collisions driver
In-Reply-To: <20210727045222.905056-6-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-6-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <fb581e64c1af72f30fdd10157e7275d4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_154736_028088_04F190C3 
X-CRM114-Status: GOOD (  26.53  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-07-27 06:51, schrieb Tudor Ambarus:
> Some manufacturers completely ignore the manufacturer's identification 
> code
> standard (JEP106) and do not define the manufacturer ID continuation
> scheme. This will result in manufacturer ID collisions.
> 
> An an example, JEP106BA requires Boya that it's manufacturer ID to be
> preceded by 8 continuation codes. Boya's identification code must be:
> 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x68. But Boya ignores 
> the
> continuation scheme and its ID collides with the manufacturer defined 
> in
> bank one: Convex Computer.
> 
> Introduce the manuf-id-collisions driver in order to address ID 
> collisions
> between manufacturers. flash_info entries will be added in a first 
> come,
> first served manner. Differentiation between flashes will be done at
> runtime if possible. Where runtime differentiation is not possible, new
> compatibles will be introduced, but this will be done as a last resort.
> Every new flash addition that define the SFDP tables, should dump its 
> SFDP
> tables in the patch's comment section below the --- line, so that we 
> can
> reference it in case of collisions.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/Makefile              |  1 +
>  drivers/mtd/spi-nor/core.c                |  1 +
>  drivers/mtd/spi-nor/core.h                |  1 +
>  drivers/mtd/spi-nor/manuf-id-collisions.c | 22 ++++++++++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/manuf-id-collisions.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile 
> b/drivers/mtd/spi-nor/Makefile
> index 6b904e439372..48763d10daad 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
> 
>  spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
> +spi-nor-objs			+= manuf-id-collisions.o
>  spi-nor-objs			+= atmel.o
>  spi-nor-objs			+= catalyst.o
>  spi-nor-objs			+= eon.o
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1a278d33b02d..d30c8f350dc1 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1829,6 +1829,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor 
> *nor)
>  }
> 
>  static const struct spi_nor_manufacturer *manufacturers[] = {
> +	&spi_nor_manuf_id_collisions,

Intentionally at the beginning of all the flashes? So these
might take precedence over "normal" ones? Shouldn't it be
the other way around?

>  	&spi_nor_atmel,
>  	&spi_nor_catalyst,
>  	&spi_nor_eon,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 55fceb0ec894..e9896cd60695 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -476,6 +476,7 @@ struct sfdp {
>  };
> 
>  /* Manufacturer drivers. */
> +extern const struct spi_nor_manufacturer spi_nor_manuf_id_collisions;
>  extern const struct spi_nor_manufacturer spi_nor_atmel;
>  extern const struct spi_nor_manufacturer spi_nor_catalyst;
>  extern const struct spi_nor_manufacturer spi_nor_eon;
> diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c
> b/drivers/mtd/spi-nor/manuf-id-collisions.c
> new file mode 100644
> index 000000000000..bf7dba34f018
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Used to handle collisions between manufacturers, where 
> manufacturers are
> + * ignorant enough to not implement the ID continuation scheme 
> described in the
> + * JEP106 JEDEC standard.
> + */
> +
> +#include <linux/mtd/spi-nor.h>
> +#include "core.h"
> +
> +static const struct flash_info id_collision_parts[] = {
> +	/* Boya */
> +	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
> +	.name = "manufacturer ID collisions",

mhh, so we loose the manufacturer name. Doh. Can we do better?

-michael

> +	.parts = id_collision_parts,
> +	.nparts = ARRAY_SIZE(id_collision_parts),
> +};

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
