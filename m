Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13E0C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 22:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/DLwsGoc6sAkwKIB5H/9i2cYhXsUePvDIb559jvOns=; b=eFXLQjCx4ATZEaxPSAwBtxfEwG
	6V9VGQmEl3wfZyCipzGaMvXbHcQfg84TyHQNEn+iFP99cUNU1UpFpUjfz8ytwje1WGFvtUnHP/eKT
	wG7YHHzmYf2TW3hRTu0DqdIuxGyFLdjDkkfUjGkgziDkpZ3rnrWQ95RCL1Q0NQwBh8FQqXVqKxF8t
	4nbTpPQ6NZrgRZJhK0nNaomaWEr3Ro8D7y4Cz+48GMmoq19bgthoyVtUbRs63K+lxC1w5vE+Bc1Aj
	/jc4JPSef8i53HzTclZgyZWeb9t0xkWenT29zyHdS54SDBvNigczGemTJcujHoVca5gjXdtjv9qbi
	AYmErd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPAqj-000kus-SE; Tue, 01 Mar 2022 22:20:05 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPAqX-000kt8-1Q; Tue, 01 Mar 2022 22:19:55 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 113B0223ED;
 Tue,  1 Mar 2022 23:19:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646173191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1fDOjEQnFzJwkYaGq8Ii67GyVWsBniR4OXNJnFVPiI=;
 b=nk5rU6Y8vm6LYxxDcooRg3/5usUfiYVDadgK6Vq/VDekNT9xbuwffJSwss+py0l0XfpKmy
 n7djKB1tmyYycH3ecB/7DdM5cZCztT7B59RWlxR1LR7I/5REicNLNtDp3tXiw5v4BEh49E
 6GsahiKOVKOGwTxkgU7+VQNokEga2ko=
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 23:19:50 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 5/6] mtd: spi-nor: Introduce Manufacturer ID collisions
 driver
In-Reply-To: <20220228134505.203270-6-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-6-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <0edfa6e267995a127181173496b471ea@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_141953_443148_7F0E0C84 
X-CRM114-Status: GOOD (  37.62  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 nicolas.ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-02-28 14:45, schrieb Tudor Ambarus:
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
>  drivers/mtd/spi-nor/core.c                |  3 +++
>  drivers/mtd/spi-nor/core.h                |  1 +
>  drivers/mtd/spi-nor/manuf-id-collisions.c | 32 +++++++++++++++++++++++
>  drivers/mtd/spi-nor/sysfs.c               |  2 +-
>  include/linux/mtd/spi-nor.h               |  6 ++++-
>  6 files changed, 43 insertions(+), 2 deletions(-)
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
> index aef00151c116..80d6ce41122a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1610,6 +1610,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor 
> *nor)
>  }
> 
>  static const struct spi_nor_manufacturer *manufacturers[] = {
> +	&spi_nor_manuf_id_collisions,

I'm still not convinced it should be the first entry here. We will
put other vendors at a disadvantage who play fair. I doubt we will
always checking any new IDs for duplications - or some might slip
through. Putting it as the last entry will make sure, legitimate
users will always come first.

Esp. because xmc reuses vendor id whose flashes we also support
making a collision very likely. Unlike boya who reuses "convex
computers" where we will probably never see an SPI flash from.

That being said. I'd also suggest to only allow flashes with
SFDP here, so we have at least some clue to differentiate
between flashes. If there will ever be a flash without SFDP
and which is using a non-legitimate vendor id, then we'll
need to either deny support for it or specify it by a name
(i.e. device tree compatible or similar). But these should
go into a seperate list then.

>  	&spi_nor_atmel,
>  	&spi_nor_catalyst,
>  	&spi_nor_eon,
> @@ -3037,6 +3038,8 @@ int spi_nor_scan(struct spi_nor *nor, const char 
> *name,
> 
>  	if (!nor->name)
>  		nor->name = info->name;
> +	if (!nor->manufacturer_name)
> +		nor->manufacturer_name = nor->manufacturer->name;
> 
>  	dev_info(dev, "%s (%lld Kbytes)\n", nor->name,
>  			(long long)mtd->size >> 10);
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index b7fd760e3b47..f727e632c0ee 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -500,6 +500,7 @@ struct sfdp {
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
> index 000000000000..75c5ad6480ee
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
> @@ -0,0 +1,32 @@
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
> +static void boya_nor_late_init(struct spi_nor *nor)
> +{
> +	nor->manufacturer_name = "boya";
> +}
> +
> +static const struct spi_nor_fixups boya_nor_fixups = {
> +	.late_init = boya_nor_late_init,
> +};
> +
> +static const struct flash_info id_collision_parts[] = {
> +	/* Boya */
> +	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ)
> +		.fixups = &boya_nor_fixups },

No PARSE_SFDP nor SKIP_SFDP?

> +};
> +
> +const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
> +	.parts = id_collision_parts,
> +	.nparts = ARRAY_SIZE(id_collision_parts),
> +};
> diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
> index 017119768f32..fa0cf1a96797 100644
> --- a/drivers/mtd/spi-nor/sysfs.c
> +++ b/drivers/mtd/spi-nor/sysfs.c
> @@ -14,7 +14,7 @@ static ssize_t manufacturer_show(struct device *dev,
>  	struct spi_mem *spimem = spi_get_drvdata(spi);
>  	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
> 
> -	return sysfs_emit(buf, "%s\n", nor->manufacturer->name);
> +	return sysfs_emit(buf, "%s\n", nor->manufacturer_name);
>  }
>  static DEVICE_ATTR_RO(manufacturer);
> 
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 449496b57acb..3087589d01ac 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -351,7 +351,10 @@ struct spi_nor_flash_parameter;
>   * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
>   *                      layer is not DMA-able
>   * @bouncebuf_size:	size of the bounce buffer
> - * @name:		used to point to correct name in case of ID collisions.
> + * @name:		used to point to correct flash name in case of ID
> + *                      collisions.
> + * @manufacturer_name:	used to point to correct manufacturer name in 
> case of
> + *                      ID collisions.
>   * @info:		SPI NOR part JEDEC MFR ID and other info
>   * @manufacturer:	SPI NOR manufacturer
>   * @addr_width:		number of address bytes
> @@ -382,6 +385,7 @@ struct spi_nor {
>  	u8			*bouncebuf;
>  	size_t			bouncebuf_size;
>  	const char *name;
> +	const char *manufacturer_name;
>  	const struct flash_info	*info;
>  	const struct spi_nor_manufacturer *manufacturer;
>  	u8			addr_width;

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
