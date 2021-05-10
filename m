Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE3EC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 08:01:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBED961430
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 08:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBED961430
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qg85abECcHO3YLjtuVYcrrcdLTTHh2mFnlUX7iP3NZw=; b=YTShDAoQhp6qoqSZSKGLP0aZB
	TcDpzyf+I1r5b4H7fwL9omilwZaA0HqUKb4rLxPGxgQb5zumKcYXiBjZYvSlVtJjcokRNz5n9DgSn
	IKjx2wODemYHDudXxq5oHLnmA4oc/cMnsz3QUgRA3PWOStqHxXAyLLp5/Nv+Zhg9jGV8FM7GeFyRB
	GKOE67VbuDXTgKWik9fh7WWWuEObNV0zsvHi1AqkYvCJjV8y9hjymIsp4IhwVNfarr3NpEelGv3TW
	5rTRKQKE0603bxaNOp0uDf0FaHWJvwZZ1LjbpHfXCLyjx+H7V3mOKFlflapqK+JBSVIUCsNqlCDgj
	Yq1CxJ5ow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg0qB-00Da6e-F7; Mon, 10 May 2021 08:00:35 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg0q6-00Da4k-BV
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 08:00:33 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7830B22234;
 Mon, 10 May 2021 10:00:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620633617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qP4yDJBn1yZdlu3gsdOHhla1rWJ9zqtUh4JeElBtkoA=;
 b=VekI2UqGFBUiiWmPRrTF358DQcbEVOi27Ae2RXOx/bF7E+/41KQs7yvSboUjW5pwFabeOs
 3OiX3PxaPLzoRM5bjhrujpMeZZ7uA2gV9OYkJgH3E3TPxBLu7TgOL4q81J9QhzNY4i3jEq
 BC4btNcSAD9yfMMm171o6IB0B3eLVKY=
MIME-Version: 1.0
Date: Mon, 10 May 2021 10:00:13 +0200
From: Michael Walle <michael@walle.cc>
To: David Bauer <mail@david-bauer.net>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
In-Reply-To: <20210509144716.431650-1-mail@david-bauer.net>
References: <20210509144716.431650-1-mail@david-bauer.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_090030_850192_E2C2C193 
X-CRM114-Status: GOOD (  22.15  )
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

Hi David,

Am 2021-05-09 16:47, schrieb David Bauer:
> Add MTD support for the BoHong bh25q128as SPI NOR chip.
> The chip has 16MB of total capacity, divided into a total of 256
> sectors, each 64KB sized. The chip also supports 4KB sectors.
> Additionally, it supports dual and quad read modes.
> 
> Functionality was verified on an Tenbay WR1800K / MTK MT7621 board.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> ---
>  drivers/mtd/spi-nor/Makefile |  1 +
>  drivers/mtd/spi-nor/bohong.c | 21 +++++++++++++++++++++
>  drivers/mtd/spi-nor/core.c   |  1 +
>  drivers/mtd/spi-nor/core.h   |  1 +
>  4 files changed, 24 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/bohong.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile 
> b/drivers/mtd/spi-nor/Makefile
> index 653923896205..de0b2d3bcb1c 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -2,6 +2,7 @@
> 
>  spi-nor-objs			:= core.o sfdp.o
>  spi-nor-objs			+= atmel.o
> +spi-nor-objs			+= bohong.o
>  spi-nor-objs			+= catalyst.o
>  spi-nor-objs			+= eon.o
>  spi-nor-objs			+= esmt.o
> diff --git a/drivers/mtd/spi-nor/bohong.c 
> b/drivers/mtd/spi-nor/bohong.c
> new file mode 100644
> index 000000000000..20aeceb1b2d1
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/bohong.c
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2005, Intec Automation Inc.
> + * Copyright (C) 2014, Freescale Semiconductor, Inc.

I guess this could be dropped. There is no much left from these in this 
file.

> + */
> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static const struct flash_info bohong_parts[] = {
> +	/* BoHong Microelectronics */
> +	{ "bh25q128as", INFO(0x684018, 0, 64 * 1024, 256,

I couldn't find "BoHong" in JEP106BC. 0x68 (without continuation codes)
is "Convex Computer". So this is wrong. OTOH I'm not sure, how many
SPI flashes "convex computer" have, if any ;) This company was brought
by HP in the end.

In any case, this patch depends on how we handle continuation codes or
if we can handle them at all. Or if this flash just lie about its
manufacturer id and don't and CC.

See also:
https://lkml.org/lkml/2021/2/7/223
https://www.spinics.net/lists/kernel/msg3808260.html

> +			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_bohong = {
> +	.name = "bohong",
> +	.parts = bohong_parts,
> +	.nparts = ARRAY_SIZE(bohong_parts),
> +};
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0522304f52fa..03a05bce6231 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2199,6 +2199,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor 
> *nor)
> 
>  static const struct spi_nor_manufacturer *manufacturers[] = {
>  	&spi_nor_atmel,
> +	&spi_nor_bohong,
>  	&spi_nor_catalyst,
>  	&spi_nor_eon,
>  	&spi_nor_esmt,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4a3f7f150b5d..b71323317235 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -409,6 +409,7 @@ struct spi_nor_manufacturer {
> 
>  /* Manufacturer drivers. */
>  extern const struct spi_nor_manufacturer spi_nor_atmel;
> +extern const struct spi_nor_manufacturer spi_nor_bohong;
>  extern const struct spi_nor_manufacturer spi_nor_catalyst;
>  extern const struct spi_nor_manufacturer spi_nor_eon;
>  extern const struct spi_nor_manufacturer spi_nor_esmt;

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
