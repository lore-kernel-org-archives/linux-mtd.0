Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E42C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbQ7JAAaO+RSptpIEqXvNnH7Vr7HyR+5O6t717UVGb8=; b=Td4AFSSLH1gXP/yKtHwyL1BzsQ
	/M0KBhJBmcebifouqH2trw7chA7LqRbLXWFdqfeF9fIK7McrtCSoJJF/gLYTvfyM/9rt3IWAJzk9I
	4u+dS66kco1L/gk2CDcJlQHh4ylDSDnA7ZTzPQnzzHTML7OYnylXK6Mmpr/s+cHBK4XdQvyVnOLqx
	MSGRxLaOm7IDNGV8QRpD2OnYGzexzReyxsxABbEEZoOd32JPfBewXuybRDCel5x8NNTWc/wJ1GQMA
	JlNaaGaisWapRcUglSrwbXlVnRi2zfQQ02c8J6K9vGtGbz8xpAHXf7R68WDMrQSHsHk3i4maB8fKz
	0U4+gxoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ruu-00BMme-TW; Thu, 01 Dec 2022 22:20:28 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rnO-00BLSs-AF
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 22:12:43 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1EFA911C;
	Thu,  1 Dec 2022 23:12:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1669932760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2HyuiWb9CSRxQhFtA9qePcq+AZj4yl2L9uNfDxE/SMM=;
	b=vougSaIvKYcrIvIq5ZgHtUrJLns2tFLfJSfhDyUhdkvKCrxP5iZS9p+iqbZNQ7EtZaI+di
	qauQwLoJPdDOP1m6OrwRcitqIPCIcaNwh6GPUOT2fR0YEEpLygbZrDrSLC3+ddovUbGBAj
	yyR26PAF40hg//T446tym81mhDCheKNp/sIxWoTQc2v/PBPQ0JcwP9jvEixnKhs1VVIISf
	ufnAAIRn01k7i6xQ+jXTQjLLo9LNDpDJZlR87puxkq9ayX/rGuZflzMKI02zwaX+PKPxJe
	7XEK2KQDXXTXsdarmGUmjeeXeZkxn44QcOoKWq30UEB6GYurIWjID6yQjTUlnw==
MIME-Version: 1.0
Date: Thu, 01 Dec 2022 23:12:39 +0100
From: Michael Walle <michael@walle.cc>
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mtd: spi-nor: Add support for IS25LX256 operating
 in 1S-8S-8S octal read mode
In-Reply-To: <20221201212750.267721-4-nathan.morrison@timesys.com>
References: <20221201212750.267721-1-nathan.morrison@timesys.com>
 <20221201212750.267721-4-nathan.morrison@timesys.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <3f51282076fb3e209aa4cae7bc0a4c46@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_141242_540288_8F6E97DD 
X-CRM114-Status: GOOD (  12.64  )
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

Am 2022-12-01 22:27, schrieb Nathan Barrett-Morrison:
> This adds the IS25LX256 chip into the ISSI flash_info parts table
> 
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> ---
>  drivers/mtd/spi-nor/issi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 89a66a19d754..98cc5e1d9c18 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -74,6 +74,9 @@ static const struct flash_info issi_nor_parts[] = {
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		.fixups = &is25lp256_fixups },
> +	{ "is25lx256", INFO(0x9d5a19, 0, 128 * 1024, 256)

Please use INFO(0x9d5a19, 0, 0, 0)

> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_4B_OPCODES |
> +			      SPI_NOR_OCTAL_READ_1_8_8) },

Neither of these flags should be needed. As mentioned before,
you'd need a fixups for the missing 1-1-8 and 1-8-8 fast read ops.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
