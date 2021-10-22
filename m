Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA65AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 11:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C707610CF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 11:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C707610CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLY5kozGOTpFnYD4Bl1aq9ZEmm/hop3NzoV9HDr/19k=; b=AFQVFK15Ay1NILNFuSsRDoUjNk
	3l4aCL3We0tZx8byuK4W4YIoPQCr+THOgu0H0gbedJI8TlK6ndjSfI0FInCTL07w4NAMNwi2BC6PD
	l9vC/ujyaEjZV81Pe85ebPsqvKqC1VuKX3QTMcUwnT3Z6QwincaKevHSHtOFpSX5b5TgfQX1ZJTvA
	sKdLphHAkB4EUKIiyEpMsn/PP0Ip22ObbW43yyNX1ZkeVeIUG7767OUpPXhL+PiXdlS/ME8lilQw3
	Wm2efd6H39fRkcNKJo77+zXDARRmlxsS+0K9JwSgKmdZwinkzFpLDJdoA+71F/Gb1t1XmGjRXl988
	xI8wm3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdt7t-00AhXp-Oq; Fri, 22 Oct 2021 11:54:21 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdt76-00AhEy-AM; Fri, 22 Oct 2021 11:53:33 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 71C47221E1;
 Fri, 22 Oct 2021 13:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1634903609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUjOIVy5pNLb/oV3NERZEhg56uq5fvObtJZLhy8s8u0=;
 b=plov+hualbLe3QyRnEYary7ynLpkOQkxeBYZuKhl+8zdm3vMnYS6fjcyz43Ds7xM3EtsKL
 g1LvAq7yNbe/NtQZu3A9+LoiKrj0dlVDF0s3ItPryZ84XPplpXBbJP2wf2VapBiO9x6syr
 nQtDnS0Kj4BiwpxkjgPECDr1Tmfx8xI=
MIME-Version: 1.0
Date: Fri, 22 Oct 2021 13:53:28 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 21/35] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
In-Reply-To: <20210727045222.905056-22-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-22-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <d68a7324a38c42ffb3add4d7c7bf0906@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_045332_591310_B0370601 
X-CRM114-Status: GOOD (  15.83  )
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

Am 2021-07-27 06:52, schrieb Tudor Ambarus:
> Used to init all the mtd_info fields. Move the mtd_info init
> the last thing in the spi_nor_scan(), so that we avoid superfluous
> initialization of the mtd_info fields in case of errors.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 55 +++++++++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5c8cffb5e6f2..26acfc9901db 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3124,6 +3124,36 @@ static const struct flash_info
> *spi_nor_get_flash_info(struct spi_nor *nor,
>  	return info;
>  }
> 
> +static void spi_nor_set_mtd_info(struct spi_nor *nor)
> +{
> +	struct mtd_info *mtd = &nor->mtd;
> +	struct device *dev = nor->dev;
> +
> +	spi_nor_register_locking_ops(nor);
This ..

> +
> +	/* Configure OTP parameters and ops */
> +	spi_nor_otp_init(nor);

.. this looks odd here now.

The first could be renamed to express that it only registers
mtd ops.

spi_nor_otp_init() does more - strictly speaking. That is,
it does also check that the otp region length is a power of 2.

At least it should also be renamed. But then I wonder, if in the
future there is more to do in spi_nor_otp_init(), where do we put
that then?

So mhh. I don't know. spi_nor_otp_init() is a more fitting name,
but calling it in spi_nor_set_mtd_info() is odd.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
