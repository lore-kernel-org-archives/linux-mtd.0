Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B156EC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Nov 2022 08:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUaHIS641WnZieSXP1cNnMBV9oVaot7BneKAXRajTW4=; b=VK35pwcKncAoWzTbJU02tfTWrw
	otaFkwYcXVj6XkqciVzFRK598Wav6NdiCHqnwVKwy+lyug3pKThKUwtf4NdYt/nDjdxkzPaTuRUk5
	mlbEeX1hzXtRqtorxB1EgNu/2NFPi94IbmnIPbSFbtJ8zIoB+VTXIiULPJZvmw/qLgQ5pvuS6rOtX
	fqGVh2E4jfat2gtsjOTjx60ZBVKAXMj2dbt3EBj+zJNhRmUC2z1B6slA8d4QkXZXmOwaNyNJ0ZN8Y
	wlcNWAxfJomuqug+jh/LXcA1ifmLLqE1bS/qWAbPxyfiw/kwNMalq6TvmYNjVTIWgytz/pvZ2wqVy
	C6/x1Iug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IiV-00Eg3H-KH; Wed, 30 Nov 2022 08:45:19 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IiR-00Efxf-DV
	for linux-mtd@lists.infradead.org; Wed, 30 Nov 2022 08:45:17 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4614F124D;
	Wed, 30 Nov 2022 09:45:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1669797907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUiquKgXaXWZX/knROtvM3ke86lnOfB8epY4uKc9fSo=;
	b=kcA9YG/PY3aaR974uQrPVIQm2RuWkqhocmwaI0R2r4WgVXebIJ+el9mfHRwootzMo1m1Rm
	jkmTzK37heS+OmCQFGUBQMT5GC0oUNO/Xpr2c3HC9qznLD/0/jHFqWKX2mh300kLgprKjI
	4+tFDlX8xSMD9qvei46L0cP+/DDN3M9nUmtueWJ0Zxr2vv3Wm2mTpoT8EaymCTNn/74/6p
	wcZ2kCv6UWQnJJ/il/HKMPV1ip4Gv0GhIc7AX69FyooyCS+572NBszXSWqPFj59yr8QvLQ
	+5c75MqlQJVXbqrFhmo1CCVchkclyXArYOHzi+eFt9cQQypL6vGg4Q9EzOdYyw==
MIME-Version: 1.0
Date: Wed, 30 Nov 2022 09:45:07 +0100
From: Michael Walle <michael@walle.cc>
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: issi: Add in support for IS25LX256 chip,
 operating in 1S-1S-8S mode.
In-Reply-To: <20221128172455.159787-1-nathan.morrison@timesys.com>
References: <20221128172455.159787-1-nathan.morrison@timesys.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <2acae3be377a5d8c3df66f860d944dbb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_004515_640345_69FE863B 
X-CRM114-Status: GOOD (  19.03  )
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

Am 2022-11-28 18:24, schrieb Nathan Barrett-Morrison:
> Adds the is25lx256 entry to the nor_parts table along with the 
> additional
> fixup logic to operate in 1S-1S-8S mode while programming.
> 
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> ---
>  drivers/mtd/spi-nor/issi.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 89a66a19d754..e9b32b726bf3 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -29,6 +29,21 @@ static const struct spi_nor_fixups is25lp256_fixups 
> = {
>  	.post_bfpt = is25lp256_post_bfpt_fixups,
>  };
> 
> +static void is25lx256_post_sfdp_fixup(struct spi_nor *nor)
> +{
> +	/* Fixup page program command to 1S-1S-8S */
> +	nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_8;
> +	spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_1_1_8],
> +				SPINOR_OP_PP_1_1_8, SNOR_PROTO_1_1_8);

Does this flash have SFDP data? If possible, this should be
derived from that. Could you dump the SFDP table and
post it here [1].

> +
> +	/* Disable quad_enable */
> +	nor->params->quad_enable = NULL;

why?

> +}
> +
> +static struct spi_nor_fixups is25lx256_fixups = {
> +	.post_sfdp = is25lx256_post_sfdp_fixup,
> +};
> +
>  static void pm25lv_nor_late_init(struct spi_nor *nor)
>  {
>  	struct spi_nor_erase_map *map = &nor->params->erase_map;
> @@ -74,6 +89,10 @@ static const struct flash_info issi_nor_parts[] = {
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		.fixups = &is25lp256_fixups },
> +	{ "is25lx256",  INFO(0x9d5a19, 0, 128 * 1024, 256)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ)
> +		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> +		.fixups = &is25lx256_fixups },
> 
>  	/* PMC */
>  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)

-michael

[1] 
https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
