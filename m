Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA95C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbSYfvZUHpMHPOFhICUFaf630bqXyTvYIlmCmdI2bTE=; b=sOnqxOctfzY1lU5fmp+cIIUOWS
	Us3i6+Y7+uqLmTFpAALMR/ZJvsDB0IT5L3hDrho/+bnAesFC8omnp6mNJx2U5JpHYLsWYPY2u2aJK
	gcb0UVhBXKQbjWNqviaoXFBrnKSB5OHgffR/+fSuPp5QbFIfax6DHnCx/AwdjZBIvK8opnwMlj3Ek
	/xPy0gWgt/WotrGj7vka1ECUIWMdSUK5W4j6K3dYu7PoDvzHqF4stb+58E6sv60GGcne66rSkyVZt
	qA5TSa0QirMsbTzepuuYbN9yeMie2itCcy1n7XubC1aksiUoU8+YeXCJlDewxIxvd4782vvKg9Pvx
	y96M0XoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngkwf-002lgo-EN; Tue, 19 Apr 2022 10:18:53 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngkwc-002leR-QR
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 10:18:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0976C2223A;
 Tue, 19 Apr 2022 12:18:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650363523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mrEeMN9hF7GCeakXOW/eAFY+DlHb48AaOGpylclP/cU=;
 b=H4k0m1LY19571X2FaPU2N8jIeRtOGOovVkCIVDb2sDorgEJmNe7SBEcKhTOhrHux25ggwS
 56lRUMJkEw0whQOA5rKr77p/fXFakpHdpPOWDP3VV7WbdYzFcRoOCymJkZtalTDG4xUa/m
 7itzCKp+W2vxUxU7KJA1tOPFHmOF/OY=
MIME-Version: 1.0
Date: Tue, 19 Apr 2022 12:18:42 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v3 3/9] mtd: spi-nor: core: Use auto-detection only once
In-Reply-To: <20220411091033.98754-4-tudor.ambarus@microchip.com>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
 <20220411091033.98754-4-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <8a12e7d841827388d1f8839d8afdfe5c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_031851_029415_E67E93E1 
X-CRM114-Status: GOOD (  18.22  )
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

Am 2022-04-11 11:10, schrieb Tudor Ambarus:
> In case spi_nor_match_name() returned NULL, the auto detection was
> issued twice. There's no reason to try to detect the same chip twice,
> do the auto detection only once.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> v3:
> - caller of spi_nor_get_flash_info now handles NULL and translates it 
> to
> ENOENT.
> 
>  drivers/mtd/spi-nor/core.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b9cc8bbf1f62..b55d922d46dd 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2896,13 +2896,14 @@ static const struct flash_info
> *spi_nor_get_flash_info(struct spi_nor *nor,
>  {
>  	const struct flash_info *info = NULL;
> 
> -	if (name)
> +	if (name) {
>  		info = spi_nor_match_name(nor, name);
> +		if (IS_ERR(info))
> +			return info;
> +	}

That is unnecessary, as spi_nor_match_name() doesn't
return an error code, just NULL or a valid pointer.

Apart from that:
Reviewed-by: Michael Walle <michael@walle.cc>

>  	/* Try to auto-detect if chip name wasn't specified or not found */
>  	if (!info)
> -		info = spi_nor_read_id(nor);
> -	if (IS_ERR_OR_NULL(info))
> -		return ERR_PTR(-ENOENT);
> +		return spi_nor_read_id(nor);
> 
>  	/*
>  	 * If caller has specified name of flash model that can normally be
> @@ -2994,7 +2995,9 @@ int spi_nor_scan(struct spi_nor *nor, const char 
> *name,
>  		return -ENOMEM;
> 
>  	info = spi_nor_get_flash_info(nor, name);
> -	if (IS_ERR(info))
> +	if (!info)
> +		return -ENOENT;
> +	else if (IS_ERR(info))
>  		return PTR_ERR(info);
> 
>  	nor->info = info;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
