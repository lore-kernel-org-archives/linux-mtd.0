Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AE8C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 13:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcUQoTklHzdQSmi31oWODqAtD0/jF84x8y/u4XtVKFk=; b=pwcFuRQnxh3w/Splvu7BrtCsIa
	4Rb+YSHPwv0zKptm/OdCG7MlJszIJq7Wxj6dm3n7UWXjth9jOeoMt4V1g32uE+qIL1/UGR4qyZLSW
	ZGtu2yLHPH6kjBRlzxKEaU+VV4q6bhXmxC5C9yqhcLzLq/1jQjTb316kDfZTED+mTMXf6K7sHWilC
	yINmm2HKzKySMwue6dtd7QNxZcObj0gFHQR5YItHRUvSN+HIJRdGsCqJbUmuFrOXRJjTEVVhzdR/+
	8ywT/KZZPxczo1nsrlrncvzgYioKyUpJ3Yjca4Z3MRJJ8cG1ll0arhqYOiZ3ci94jtgHGQzPPk9tP
	n8eNpVpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgX5-00Cixg-8g; Mon, 28 Feb 2022 13:57:48 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgUy-00Ci9D-EA; Mon, 28 Feb 2022 13:55:38 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 45B772223A;
 Mon, 28 Feb 2022 14:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646056534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xYY15JhHG1Pd6Pptft58rg+kWLeEOSKxEiUdTaG6k5A=;
 b=gcmPAkF7xXCCVEW/EfPNBOtnEWIcHUtQwo5ssWqoollq/tkPzgCt9c4XkcJ8TcDRKkZmpn
 MSPyAJUJeCj/UlCI3YWiKfo+ITlkmvJu17KwyFke9hxRGbeeakmBeSueLJA0MKqaL1Nt9K
 kT6/ls4nTsQP8KUyhOZsYNK2YQkaKAc=
MIME-Version: 1.0
Date: Mon, 28 Feb 2022 14:55:32 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 0/6] mtd: spi-nor: Handle ID collisions
In-Reply-To: <20220228134505.203270-1-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <fead645197b0cb6534c04a665938a8d5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_055536_695563_21F038E1 
X-CRM114-Status: GOOD (  12.56  )
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

Am 2022-02-28 14:44, schrieb Tudor Ambarus:
> Tested with MX25L3233F. I need sysfs dumps where there aren't.
> 
> v4:
> - adapt core to handle collisions between SFDP and non-SFDP flashes
> - rebase on latest spi-nor/next
> 
> v3:
> - report correct manufacturer name in ID collisions driver
> - use fixup name of the first flash, not of the one that collide
> - use xxd to dump sfdp (where I had the flash)
> - drop locking support on xt25f128b
> - constify flash_info fixups hook
> 
> Tudor Ambarus (6):
>   mtd: spi-nor: core: Report correct name in case of ID collisions
>   mtd: spi-nor: core: Handle ID collisions between SFDP & non-SFDP
>     flashes
>   mtd: spi-nor: macronix: Handle ID collision b/w MX25L3233F and
>     MX25L3205D
>   mtd: spi-nor: macronix: Handle ID collision b/w MX25L12805D and
>     MX25L12835F
>   mtd: spi-nor: Introduce Manufacturer ID collisions driver
>   mtd: spi-nor: manuf-id-collisions: Add support for xt25f128b
> 
>  drivers/mtd/spi-nor/Makefile              |  1 +
>  drivers/mtd/spi-nor/core.c                | 21 +++++++++--
>  drivers/mtd/spi-nor/core.h                |  1 +
>  drivers/mtd/spi-nor/macronix.c            | 46 ++++++++++++++++++++++-
>  drivers/mtd/spi-nor/manuf-id-collisions.c | 46 +++++++++++++++++++++++
>  drivers/mtd/spi-nor/sysfs.c               |  4 +-
>  include/linux/mtd/spi-nor.h               |  6 +++
>  7 files changed, 118 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/mtd/spi-nor/manuf-id-collisions.c

drivers/mtd/spi-nor/xmc.c should probably be moved into
manuf-id-collisions as it actually reusing the micron/st
vendor id (?!).

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
