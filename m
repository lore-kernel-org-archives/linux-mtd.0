Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C07C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Feb 2022 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAaCFgT/6XKotEX/lhdcLRq/ANBTWZX9ZTcWxm6budY=; b=BjoK/QBLTzVs8GkLyYsIVuoFw7
	oHV/4zx6pwLO0s+aWJQiBojYIVI7xS8lWnP+npH25IkdVm9C9QJTTk4IwLJQwK21z0p0EyVRJvbZb
	pHsOD3bx+CXGSX1cp+A+SOYGkDvX1YOQ2LBC1VLHKOWYOfIpNXf0cfKqM1xFMtAtFPxSyYw3pF4tH
	ujUMT3jxG+Q6RsKJAKWlGgqEhCextsjkuAIOQV5XaBgWvExxxWSc537dryB88PDlbDHh04KJaec06
	2X9KLewpBN0aqK6CWpmWT0rRK8tEvExIunWCPLa50ZEAsg80fn44nDWDV5xpZ7vPd2zZdezZjz2g/
	ie2ZJQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFaoT-00168e-Gr; Thu, 03 Feb 2022 12:02:09 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFaoP-001673-OD
 for linux-mtd@lists.infradead.org; Thu, 03 Feb 2022 12:02:08 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 79D392222E;
 Thu,  3 Feb 2022 13:02:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643889723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NTKbcBpoiYDkOsEDeKtcGrOMlbvfpxDBPFpxqLdDLUk=;
 b=Gm32dI471/sgaP/AKInSH3IndMBaEUWcOSdGNPjN/nREMDvXC9KGysXp/JPTbVIR8KDNx7
 gHEkgEoi14WBzENrhzmRoFyr6JM7EFZ2rQ9tQIsHIaPTPMnZ8NlfRuUW9sHTtXh1tU7IcE
 6n1eov/X/yMVu7o/RCnemWAlfoHSdPE=
MIME-Version: 1.0
Date: Thu, 03 Feb 2022 13:02:02 +0100
From: Michael Walle <michael@walle.cc>
To: Carl Richard Theodor Schneider <dev.linux@crtified.me>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 microcaicai@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Init xtx flash xt25f32b, xt25f128b
In-Reply-To: <20220201002535.2186484-1-dev.linux@crtified.me>
References: <20220201002535.2186484-1-dev.linux@crtified.me>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <28b2114224604fcc673b000e15a9e3cd@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_040206_144203_311CF8BE 
X-CRM114-Status: GOOD (  25.96  )
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

Hi,

Am 2022-02-01 01:25, schrieb Carl Richard Theodor Schneider:
> Add the JEDEC identifiers for xt25f32b and xt25f128b.
> Based on the referenced previous patch from microcai.
> 
> Only xt25f32b was verified in hardware (On both Radxa RockPi 4A and 
> 4C),
> but the ID of the xt25f128b can also be found in u-boot patches from
> Armbian.

We require SFDP dumps of new flashes. Therefore, you can only add
flashes which you actually have (and have tested). See [1] how to
provide such a dump.

> Link:
> https://lore.kernel.org/lkml/CAMgqO2y9MYDj6antOaWLBRKU8vGEwqCB-Y1TkXTSWsmsed+W6A@mail.gmail.com/
> Link:
> https://datasheet.lcsc.com/szlcsc/2005251035_XTX-XT25F32BSOIGU-S_C558851.pdf
> Link:
> https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT25F128BSSIGT_C558844.pdf
> Link:
> https://github.com/armbian/build/blob/master/patch/u-boot/u-boot-rockchip64/general-add-xtx-spi-nor-chips.patch
> 
> Signed-off-by: Carl Richard Theodor Schneider <dev.linux@crtified.me>
> ---
>  drivers/mtd/spi-nor/Makefile |  1 +
>  drivers/mtd/spi-nor/core.c   |  1 +
>  drivers/mtd/spi-nor/core.h   |  1 +
>  drivers/mtd/spi-nor/xtx.c    | 25 +++++++++++++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/xtx.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile 
> b/drivers/mtd/spi-nor/Makefile
> index 6b904e439372..e344077e3054 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -17,6 +17,7 @@ spi-nor-objs			+= sst.o
>  spi-nor-objs			+= winbond.o
>  spi-nor-objs			+= xilinx.o
>  spi-nor-objs			+= xmc.o
> +spi-nor-objs			+= xtx.o
>  obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
> 
>  obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 04ea180118e3..44017ab54726 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1846,6 +1846,7 @@ static const struct spi_nor_manufacturer
> *manufacturers[] = {
>  	&spi_nor_winbond,
>  	&spi_nor_xilinx,
>  	&spi_nor_xmc,
> +	&spi_nor_xtx,
>  };
> 
>  static const struct flash_info *
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 2afb610853a9..8adac5da6851 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -536,6 +536,7 @@ extern const struct spi_nor_manufacturer 
> spi_nor_sst;
>  extern const struct spi_nor_manufacturer spi_nor_winbond;
>  extern const struct spi_nor_manufacturer spi_nor_xilinx;
>  extern const struct spi_nor_manufacturer spi_nor_xmc;
> +extern const struct spi_nor_manufacturer spi_nor_xtx;
> 
>  extern const struct attribute_group *spi_nor_sysfs_groups[];
> 
> diff --git a/drivers/mtd/spi-nor/xtx.c b/drivers/mtd/spi-nor/xtx.c
> new file mode 100644
> index 000000000000..2c9028e5d719
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/xtx.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2005, Intec Automation Inc.
> + * Copyright (C) 2014, Freescale Semiconductor, Inc.
> + */

Can this be dropped? I don't think there is any of the
original code left here. no?

> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static const struct flash_info xtx_parts[] = {
> +	/* XTX (Shenzhen Xin Tian Xia Tech) */
> +	{ "xt25f32b", INFO(0x0b4016, 0, 64 * 1024, 64)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			SPI_NOR_QUAD_READ) },

You'd either need to specify SPI_NOR_SKIP_SFDP or PARSE_SFDP
and drop the NO_SFDP_FLAGS if there is SFDP support.

But more importantly, xtx is missing the continuation bytes
and is probably reusing the manufacturer id from another
vendor. So, this would have to be rebased on Tudors id
collision patchset [2]. There is already support for the
xt25f128b btw.

> +	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			SPI_NOR_QUAD_READ) },
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_xtx = {
> +	.name = "xtx",
> +	.parts = xtx_parts,
> +	.nparts = ARRAY_SIZE(xtx_parts),
> +};

[1] 
https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/
[2] https://patchwork.ozlabs.org/project/linux-mtd/list/?series=270725
-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
