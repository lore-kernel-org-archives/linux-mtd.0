Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4DDC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 21:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4AoQDldkNXfAXvYJlWBBeKNIwnt5N9qUnrgPcgQxsw=; b=F5Euu/gxx4ouemuzTvBvdgV3AF
	foW669psg69sOSlntoHWlHHQXUv2W9V+yWHyZkRfyTpysghHj3OLL34vY5XmDH3nmBZqinwhLlomd
	oxVT2nFBOiO7H9uwiaetvu023bSlFMmQ67s6zFR6OhJ8/Y2vwcGudXa4AUw/qCfz59+HL21fgnnEo
	GCFJC186EZWXTyYV3illo3JxXZ+5fwmBf8rpm/3VzvrY1k+L+BT0xwgva/OHNqaVG6YipaEVI+Ho6
	u/uCC8qJa/Vi2SX+aUJagyp54lhOpAMYU2o3EUgHvqrV0O2OnfsIbd4SBgBHmP+6Obt04UPBlL9xn
	NtmXwp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPAQZ-000gp0-LH; Tue, 01 Mar 2022 21:53:03 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPAQO-000go4-2L; Tue, 01 Mar 2022 21:52:53 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id F3E4022239;
 Tue,  1 Mar 2022 22:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646171570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hlUSUME+O97a/40JzOs9K3N4ZZr9txK48/y6AXqQWwg=;
 b=ja3B4yFKmh1aB8ENpPJ+Wwd7rt1r+PAgAVvpwc43E5LNb54Hzy+At340ObFW9EJtUn47Hx
 3K5ASav9d9T08zq+T1CKjez/YbeLr6LTUj9VOYa3482D5HZnGbF9TNiNsH4msBEYSH/7ar
 y7Cd5vDf0JyN3M5f0sYodY9OssOgLsM=
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 22:52:45 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 2/6] mtd: spi-nor: core: Handle ID collisions between
 SFDP & non-SFDP flashes
In-Reply-To: <20220228134505.203270-3-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-3-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <328762851786f1158505f9159ba3e5bc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_135252_322969_CE03E6B6 
X-CRM114-Status: GOOD (  22.02  )
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
> A typical differentiator between flashes whose ID collide is whether 
> they
> support SFDP or not. For such a collision there will be a single
> flash_info entry where the developer should specify:
> 1/ PARSE_SFDP - so that the flash that supports SFDP to initialize its
>    parameters by parsing the SFDP tables
> 2/ any of the no_sfdp_flags less SPI_NOR_SKIP_SFDP, to initialize the
>    flash parameters via the static no_sfdp_flags for the flash that
>    doesn't support SFDP.
> Use the logic the above to handle ID collisions between SFDP & non-SFDP
> flashes.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index fbf3278ba29a..aef00151c116 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2639,8 +2639,17 @@ static int spi_nor_init_params(struct spi_nor 
> *nor)
>  	if (nor->info->parse_sfdp) {
>  		ret = spi_nor_parse_sfdp(nor);

Can we return -ENOENT here if sfdp isn't supported, so we
can differentiate between "no sfdp present" and other errors?

>  		if (ret) {
> -			dev_err(nor->dev, "BFPT parsing failed. Please consider using
> SPI_NOR_SKIP_SFDP when declaring the flash\n");
> -			return ret;
> +			/*
> +			 * Handle ID collisions between flashes that support
> +			 * SFDP and flashes that don't. Initialize parameters
> +			 * for the flash that doesn't support SFDP.
> +			 */
> +			if (nor->info->no_sfdp_flags & ~SPI_NOR_SKIP_SFDP) {

Shouldn't this be
if (!(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))

> +				spi_nor_no_sfdp_init_params(nor);
> +			} else {
> +				dev_err(nor->dev, "BFPT parsing failed. Please consider using
> SPI_NOR_SKIP_SFDP when declaring the flash\n");
> +				return ret;
> +			}
>  		}
>  	} else if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) {
>  		spi_nor_no_sfdp_init_params(nor);

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
