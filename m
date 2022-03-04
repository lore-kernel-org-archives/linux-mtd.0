Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC0EC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:Date:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCK0meO+S0u5wr6b8XGHklWyrF51R+lcEtP86qct1UY=; b=VVs9IPZ4PAtMKSDeNNJNVdlCYq
	dPntn61zfCiZAUOplPn4vPgCoYmFXmQeb1BxKEWu2ygNehQ+Z5nrGn2vASMPBa47qQroEIPVHfKmL
	eyHmpt/csGSvOShlILIgS15yrZFRAzOHPWeh3tB6LBCX17Emk/3kM7ZUSTvV2o8oTiaJXrI8bt3zY
	+t5R007VxXqBeUFrM4/it6/O7Qy3RN47mKY4cEnjTJWdW9q+iaIyGdJSbK8V3Ul52Asg5GgwhhFrt
	okEUh2eGjKSyQgqGsgyHyv5y0bk6MwadGyjmYPF2gvDuIq4IEBQdKTlHbOUzdeV8Seb+RNTGewLT9
	MKQKSKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQFO5-00C6v9-L5; Fri, 04 Mar 2022 21:22:57 +0000
Received: from mail.figgyc.uk ([2607:f130:0:ea::135c:f1b7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQFNt-00C6sl-8d; Fri, 04 Mar 2022 21:22:47 +0000
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-6-tudor.ambarus@microchip.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=figgyc.uk; s=mail;
 t=1646428962; bh=JMVVkaX9DS1cWSexwzyGeyKwh/srG7McVGVH1yrmb3U=;
 h=References:From:To:Cc:Subject:Date:In-reply-to;
 b=SMVj5TrRE10Dvw/w8Vx8IbocsILdR+k4HjZrh8FsUe4q+q4/MAH9IL49CHn04w2EG
 ZMSOzzKRPGaLgEEA8L5wS6stGy+aUqD/vyH9sgwUyXGO0A9RagmL1D5JCdAHW8bb1g
 TmWCPLK84b8hhgERsbJECdSdD5vlidkhIRiJ0AW0=
From: George Brooke <figgyc@figgyc.uk>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, michael@walle.cc, mail@david-bauer.net,
 esben@geanix.com, heiko.thiery@gmail.com, macromorgan@hotmail.com,
 vigneshr@ti.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 code@reto-schneider.ch, zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw,
 sr@denx.de, miquel.raynal@bootlin.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nicolas.ferre@microchip.com
Subject: Re: [PATCH v4 5/6] mtd: spi-nor: Introduce Manufacturer ID
 collisions driver
Date: Fri, 04 Mar 2022 21:20:04 +0000
In-reply-to: <20220228134505.203270-6-tudor.ambarus@microchip.com>
Message-ID: <86o82lct0l.fsf@figgyc.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_132245_356208_DEA35874 
X-CRM114-Status: GOOD (  37.56  )
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


Hi Tudor,

Tudor Ambarus <tudor.ambarus@microchip.com> writes:

> Some manufacturers completely ignore the manufacturer's 
> identification code
> standard (JEP106) and do not define the manufacturer ID 
> continuation
> scheme. This will result in manufacturer ID collisions.
>
> An an example, JEP106BA requires Boya that it's manufacturer ID 
> to be
> preceded by 8 continuation codes. Boya's identification code 
> must be:
> 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x68. But Boya 
> ignores the
> continuation scheme and its ID collides with the manufacturer 
> defined in
> bank one: Convex Computer.
>
> Introduce the manuf-id-collisions driver in order to address ID 
> collisions
> between manufacturers. flash_info entries will be added in a 
> first come,
> first served manner. Differentiation between flashes will be 
> done at
> runtime if possible. Where runtime differentiation is not 
> possible, new
> compatibles will be introduced, but this will be done as a last 
> resort.
> Every new flash addition that define the SFDP tables, should 
> dump its SFDP
> tables in the patch's comment section below the --- line, so 
> that we can
> reference it in case of collisions.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/Makefile              |  1 +
>  drivers/mtd/spi-nor/core.c                |  3 +++
>  drivers/mtd/spi-nor/core.h                |  1 +
>  drivers/mtd/spi-nor/manuf-id-collisions.c | 32 
>  +++++++++++++++++++++++
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
> diff --git a/drivers/mtd/spi-nor/core.c 
> b/drivers/mtd/spi-nor/core.c
> index aef00151c116..80d6ce41122a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1610,6 +1610,7 @@ int spi_nor_sr2_bit7_quad_enable(struct 
> spi_nor *nor)
>  }
>
>  static const struct spi_nor_manufacturer *manufacturers[] = {
> +	&spi_nor_manuf_id_collisions,
>   &spi_nor_atmel,
>   &spi_nor_catalyst,
>   &spi_nor_eon,
> @@ -3037,6 +3038,8 @@ int spi_nor_scan(struct spi_nor *nor, 
> const char *name,
>
>   if (!nor->name)
>       nor->name = info->name;
> +	if (!nor->manufacturer_name)
> +		nor->manufacturer_name = nor->manufacturer->name;
>
>   dev_info(dev, "%s (%lld Kbytes)\n", nor->name,
>           (long long)mtd->size >> 10);
> diff --git a/drivers/mtd/spi-nor/core.h 
> b/drivers/mtd/spi-nor/core.h
> index b7fd760e3b47..f727e632c0ee 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -500,6 +500,7 @@ struct sfdp {
>  };
>
>  /* Manufacturer drivers. */
> +extern const struct spi_nor_manufacturer 
> spi_nor_manuf_id_collisions;
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
> +		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SECT_4K | 
> SPI_NOR_DUAL_READ |
> +               SPI_NOR_QUAD_READ)
> +		.fixups = &boya_nor_fixups },
> +};
> +
Finally got around to testing v4, and it looks good to me.
Sorry for the delay, I was struggling a bit with device tree
overlays because I lost my old one for this Raspberry Pi.
For v5+ I should be able to test a lot quicker if needed. Thanks
for working on this again.

Tested-by: George Brooke <figgyc@figgyc.uk>

# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
684018
# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
boya
# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
by25q128as
# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
xxd: /sys/bus/spi/devices/spi0.0/spi-nor/sfdp: No such file or 
directory

# dd bs=1M count=6 if=/dev/urandom of=./nor_test
6+0 records in
6+0 records out
6291456 bytes (6.3 MB, 6.0 MiB) copied, 0.158377 s, 39.7 MB/s

# time mtd_debug erase /dev/mtd0 0 6291456
Erased 6291456 bytes from address 0x00000000 in flash

real	1m25.420s
user	0m0.000s
sys	0m56.700s

# time mtd_debug read /dev/mtd0 0 6291456 nor_read
Copied 6291456 bytes from address 0x00000000 in flash to nor_read

real	0m2.472s
user	0m0.001s
sys	0m0.050s

# hexdump nor_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000

# time mtd_debug write /dev/mtd0 0 6291456 nor_test
Copied 6291456 bytes from nor_test to address 0x00000000 in flash

real	0m14.151s
user	0m0.001s
sys	0m7.880s

# time mtd_debug read /dev/mtd0 0 6291456 nor_read
Copied 6291456 bytes from address 0x00000000 in flash to nor_read

real	0m2.580s
user	0m0.001s
sys	0m0.059s

# sha1sum nor_test nor_read
6a4ecd64a21335ade4dd8e329718df6666a8c2e8  nor_test
6a4ecd64a21335ade4dd8e329718df6666a8c2e8  nor_read

> +const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = 
> {
> +	.parts = id_collision_parts,
> +	.nparts = ARRAY_SIZE(id_collision_parts),
> +};
> diff --git a/drivers/mtd/spi-nor/sysfs.c 
> b/drivers/mtd/spi-nor/sysfs.c
> index 017119768f32..fa0cf1a96797 100644
> --- a/drivers/mtd/spi-nor/sysfs.c
> +++ b/drivers/mtd/spi-nor/sysfs.c
> @@ -14,7 +14,7 @@ static ssize_t manufacturer_show(struct device 
> *dev,
>   struct spi_mem *spimem = spi_get_drvdata(spi);
>   struct spi_nor *nor = spi_mem_get_drvdata(spimem);
>
> -	return sysfs_emit(buf, "%s\n", nor->manufacturer->name);
> +	return sysfs_emit(buf, "%s\n", nor->manufacturer_name);
>  }
>  static DEVICE_ATTR_RO(manufacturer);
>
> diff --git a/include/linux/mtd/spi-nor.h 
> b/include/linux/mtd/spi-nor.h
> index 449496b57acb..3087589d01ac 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -351,7 +351,10 @@ struct spi_nor_flash_parameter;
>   * @bouncebuf:		bounce buffer used when the buffer passed 
>   by the MTD
>   *                      layer is not DMA-able
>   * @bouncebuf_size:	size of the bounce buffer
> - * @name:		used to point to correct name in case of ID 
> collisions.
> + * @name:		used to point to correct flash name in case of 
> ID
> + *                      collisions.
> + * @manufacturer_name:	used to point to correct manufacturer 
> name in case of
> + *                      ID collisions.
>   * @info:		SPI NOR part JEDEC MFR ID and other info
>   * @manufacturer:	SPI NOR manufacturer
>   * @addr_width:		number of address bytes
> @@ -382,6 +385,7 @@ struct spi_nor {
>   u8			*bouncebuf;
>   size_t			bouncebuf_size;
>   const char *name;
> +	const char *manufacturer_name;
>   const struct flash_info	*info;
>   const struct spi_nor_manufacturer *manufacturer;
>   u8			addr_width;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
