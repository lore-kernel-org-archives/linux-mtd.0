Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEF4C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 24 May 2022 22:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvBqB3siTu+1SpEzBLum0JaO/qRc51zHq9vXy9qrVHc=; b=WmmJ7WoctI/03/MtY1fi5ImfB4
	/3dYIJpcnFQ3wPt5KRi3Sqp4aDitLGNn5YrLapFg0uekf2PYsttq2jxC3Ri9P+DnKZfncDUPw7qgq
	wzoA1/+QOETNmHUSqlrg17Lh2P/HnvorOitWbISYlEsz9bLJhL+i5olOc5g3ntVXzF+KgY+6Sr/K7
	lkvmoehNPrTIfL+dPx6rdFSwMNFYSq4022G55LV7P26ewSzXQIpyfD9Zso6GqsCJkHjasYZtQ4RC6
	e9DrKy/peJhQzIrnBoSD/ahiet1a0wvLLSjHzvcdm5p7yZMAZc3z7ycTP34zA6m1Er5L6ZGt/Q1Sh
	ECWjNkpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntd9f-009LmI-MR; Tue, 24 May 2022 22:37:31 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntd9U-009LjF-7n; Tue, 24 May 2022 22:37:21 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 53AF4221D4;
 Wed, 25 May 2022 00:37:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1653431836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BCs0HAhZARemmsGo2G3uYjUYYZKrxsWqOtnmQSTd4i4=;
 b=qPSxEn4u8PQszAO0bIWyhCcQ2fFkT1WRWKaFop4Ned9HNlrWohdTRSlwViw9Uw2wVywxYD
 QA9m0ZXsWTsfY/HgMqkRqQesg5m2Ej4NQpUxSUhqGLoSPPf+RjlcYl8+MADAad+IFX/c3p
 sOy3B/P1jOT4sO8fNi2cQ6ZhXg5xtBs=
MIME-Version: 1.0
Date: Wed, 25 May 2022 00:37:16 +0200
From: Michael Walle <michael@walle.cc>
To: chf.fritz@googlemail.com
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, ClaudiuBeznea
 <claudiu.beznea@microchip.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: atmel: Add at25ql641 support
In-Reply-To: <48b49de3712267780916b665d3b2a3323e6f10ce.camel@googlemail.com>
References: <48b49de3712267780916b665d3b2a3323e6f10ce.camel@googlemail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0123ee0e70df13b340230a38cb44548f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_153720_488730_92B7D982 
X-CRM114-Status: GOOD (  14.67  )
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

Am 2022-05-24 21:20, schrieb Christoph Fritz:
> This patch adds AT25QL641 to the list of supported nor flashs.

Please mention on which spi host controller this flash was
tested.

> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> ---
>  drivers/mtd/spi-nor/atmel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 656dd80a0be7..dfbc12071093 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -186,6 +186,8 @@ static const struct flash_info atmel_nor_parts[] = 
> {
>  		.fixups = &atmel_nor_global_protection_fixups },
>  	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "at25ql641",	INFO(0x1f4317, 0, 64 * 1024, 128)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

This flash supports SFDP, please use either SNOR_ID3() (you'll
have to pick my pending patches first [1]) or use
   { "at25ql641", INFO(0x1f4317, 0, 0, 0) PARSE_SFDP },
which will then be replaced with SNOR_ID3() once it is available.

>  	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
>  		NO_SFDP_FLAGS(SECT_4K) },
>  	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)

-michael

[1] https://lore.kernel.org/r/966de7ad5f563f9a29db91c5309a71c6@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
