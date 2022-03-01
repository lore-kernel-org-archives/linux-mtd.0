Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF54C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zeqemxC97Iy98EN0Bad66JMkcHgb705am9RlExmuu8=; b=WoIT6RhP0edb7qtVnuSryG2e0J
	vCgf/f7CbkFzkmsfPnxyUcPNS5SA6iNbim1J45LMANEqA40aMeKLp4PeehV/V1KU3q7Bk97Hk6Omw
	61BtVfsJDkjAuQ9oQ4l/4OQIdM1ZuYMH6T4l/ykk/0imA72Z1v/Ycrgp7h0WyyhN8hCLxcYcZ2CvP
	rMbEF5bv7sq9jz1+W061DH0Of9gUtCXZNJI2f4QlSdQxxoJVfxJuUfOaxd3mj7sQPaa5TwBq+vbIc
	mDrGwnncSZBeGhfrMkLVtfkfTo++qrNop2V7HNsSY1sQjDCCd/1WCx96JWhTA7f1I9E/EThCWD/ET
	AqJjcB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPAuD-000liw-0q; Tue, 01 Mar 2022 22:23:41 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPAty-000ld6-J4; Tue, 01 Mar 2022 22:23:28 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id F135F223ED;
 Tue,  1 Mar 2022 23:23:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646173405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7yqkPVKqWMGiTstc+v/9WBbUBJZhFozGaR1BQG4vPI=;
 b=kLbJVZ3qBcjsYgYFP/UFs73UDB9DhbYBF+y/y4INuXgCRWidjR8bmgZJZTQq4vPWeJ7gdE
 +Fm7u2ZSmQHcI8Qyn2y1s4/LktMrW3LJafdJzC9AQOiBMHYV2WOjZGgjINYpzVJEkODEsd
 gLr9bSfQn+ieblf3lOmsgw3K3CdprTI=
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 23:23:24 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 6/6] mtd: spi-nor: manuf-id-collisions: Add support for
 xt25f128b
In-Reply-To: <20220228134505.203270-7-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-7-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <1a05176e6e2457c1b86035522c3f691b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_142326_824414_3146B677 
X-CRM114-Status: GOOD (  17.66  )
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
> Flash does not support continuation codes and may collide with a flash
> of other manufacturer, Intersil being an example. Add support for
> xt25f128b.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> 0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
> 0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> 0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
> 0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
> 0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
> 0000060 3600 2700 f99f 6477 e8d9 ffff

You don't have this flash no? because the md5sum is
missing.

> 
>  drivers/mtd/spi-nor/manuf-id-collisions.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c
> b/drivers/mtd/spi-nor/manuf-id-collisions.c
> index 75c5ad6480ee..0447e245f4b1 100644
> --- a/drivers/mtd/spi-nor/manuf-id-collisions.c
> +++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
> @@ -17,6 +17,15 @@ static const struct spi_nor_fixups boya_nor_fixups = 
> {
>  	.late_init = boya_nor_late_init,
>  };
> 
> +static void xtx_nor_late_init(struct spi_nor *nor)
> +{
> +	nor->manufacturer_name = "xtx";
> +}
> +
> +static const struct spi_nor_fixups xtx_nor_fixups = {
> +	.late_init = xtx_nor_late_init,
> +};
> +
>  static const struct flash_info id_collision_parts[] = {
>  	/* Boya */
>  	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256)
> @@ -24,6 +33,11 @@ static const struct flash_info id_collision_parts[] 
> = {
>  		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ)
>  		.fixups = &boya_nor_fixups },
> +
> +	/* XTX (XTX Technology Limited) */
> +	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256)
> +		PARSE_SFDP
> +		.fixups = &xtx_nor_fixups },

I'd suggest to order the entries by the id to make it
easier to spot collisions.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
