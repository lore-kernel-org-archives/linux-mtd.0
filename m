Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F54C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 22:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/ugmD6dNbgqhrJQJFZHO38Kk8Cs4V5osFUR0tUPHhA=; b=AdT0d8JUNMOcGy/zbcGULlIzUc
	ptTb36YCvjs4npHc9WMK9ZeiM64tUue0tjMV0THnK7jHsXPLyCLxQAh3eTiDs7slMZBtMTF+f+Ger
	ATYHc7Ksj72BRHNsPuUI9DqYITQImkIv9T3lSNYVIghxV1uqp+/3Ncl+rWmkioNiyG5ArLtBiFNI8
	nAdF3rlqYwzCbXOR2xZZh+nqX3N0KOcXqyo2XjDJ36Z7KU4pVBk5lG2CdhJMcdf1iCs7zjfLJswSY
	co/N5+4MsmfoGIdNCAMcwr5HYtYbBn4xE/lwjJ+mIEwQkBlZZqfLMoKrSNJ+vTP6A2qVmVAPzt96l
	Do8j9Hsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rpV-00BMHZ-Mr; Thu, 01 Dec 2022 22:14:53 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rjf-00BKhe-Es
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 22:08:53 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6063811C;
	Thu,  1 Dec 2022 23:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1669932522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PCoKb4GGFgwOloHgPPyLK39clFt7P0eA0h+X5bcYVQY=;
	b=WPQXKu+uq7XQ+WmL/YQWOO1lBsrRZDdiVn0jwZaAIisQpB558jnb6+InWVM6UqnEz2yIeO
	SvEEnER0haqoGklkh/KEiXOJAKUG9ErM2zfKvGGIpbJUgGwNlCFJ1osGj7wzQkE7bnKo+3
	TAR7ZeQYrkUfy9K6slBElIyuV+7saTPTgup1u4QzohAt3gRuowN4RahXBtXxgwLr8JV6l4
	tDzRLcLq9NhJW6sxBTzEcQDu4NRsvfIAv5L2OrdOnf2W68XCzcxEBjGCEcWhNI+zhLpfha
	x9dGoq998agypYDG/jXpEpDCNVB23l0MEDn1iAXXohyq9AwvJa+zcrPZbNlVMg==
MIME-Version: 1.0
Date: Thu, 01 Dec 2022 23:08:42 +0100
From: Michael Walle <michael@walle.cc>
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: Add additional octal-mode flags to
 be checked during SFDP
In-Reply-To: <20221201212750.267721-3-nathan.morrison@timesys.com>
References: <20221201212750.267721-1-nathan.morrison@timesys.com>
 <20221201212750.267721-3-nathan.morrison@timesys.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0537b888aa4e6b7ce4194e8242a231fd@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_140851_700701_375B07F8 
X-CRM114-Status: GOOD (  22.44  )
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

[In general, please post new versions after a reasonable
amount of time for reviews. Like a day or so.]

Am 2022-12-01 22:27, schrieb Nathan Barrett-Morrison:
> This adds some support for searching a chips SFDP table for:
> 
> read commands: 1S-8S-8S
> program commands: 1S-1S-8S, 1S-8S-8S
> 
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> ---
>  drivers/mtd/spi-nor/core.c | 8 ++++++++
>  drivers/mtd/spi-nor/core.h | 5 +++--
>  drivers/mtd/spi-nor/sfdp.c | 8 ++++++++
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index bee8fc4c9f07..2f882608abc6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2359,6 +2359,13 @@ static void spi_nor_no_sfdp_init_params(struct
> spi_nor *nor)
>  					  SNOR_PROTO_1_1_8);
>  	}
> 
> +	if (no_sfdp_flags & SPI_NOR_OCTAL_READ_1_8_8) {
> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_8_8;
> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_8_8],
> +					  0, 16, SPINOR_OP_READ_1_8_8,
> +					  SNOR_PROTO_1_8_8);
> +	}

This should only be done for flashes which doesn't support
SFDP at all (see the comment for spi_nor_no_sfdp_init_params()).

Yours supports SFDP, has the correct flags in the
4BAIT table but doesn't have the 17th DWORD in the BFPT. I'm not
sure if this is correct or if it's a mistake in the SFDP of this
flash device.

If it's correct, we would need to somehow call
spi_nor_set_read_settings() in sfdp.c; but we don't know the
mode or wait clocks. If it's a mistake in the SFDP, we'd need
to add a fixup for this particular flash which sets the read
settings. I'd go with the second because we just haven't enough
information.

-michael

> +
>  	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_READ) {
>  		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
>  		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
> @@ -2514,6 +2521,7 @@ static void
> spi_nor_init_params_deprecated(struct spi_nor *nor)
>  	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
>  					SPI_NOR_QUAD_READ |
>  					SPI_NOR_OCTAL_READ |
> +					SPI_NOR_OCTAL_READ_1_8_8 |
>  					SPI_NOR_OCTAL_DTR_READ))
>  		spi_nor_sfdp_init_params_deprecated(nor);
>  }
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 85b0cf254e97..7bc1cde049b7 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -514,8 +514,9 @@ struct flash_info {
>  #define SPI_NOR_DUAL_READ		BIT(3)
>  #define SPI_NOR_QUAD_READ		BIT(4)
>  #define SPI_NOR_OCTAL_READ		BIT(5)
> -#define SPI_NOR_OCTAL_DTR_READ		BIT(6)
> -#define SPI_NOR_OCTAL_DTR_PP		BIT(7)
> +#define SPI_NOR_OCTAL_READ_1_8_8	BIT(6)
> +#define SPI_NOR_OCTAL_DTR_READ		BIT(7)
> +#define SPI_NOR_OCTAL_DTR_PP		BIT(8)
> 
>  	u8 fixup_flags;
>  #define SPI_NOR_4B_OPCODES		BIT(0)
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index e4e87815ba94..e1b7547bf81e 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1089,6 +1089,14 @@ static int spi_nor_parse_4bait(struct spi_nor 
> *nor,
>  		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_4_4],
>  					SPINOR_OP_PP_1_4_4_4B,
>  					SNOR_PROTO_1_4_4);
> +	if (pp_hwcaps & SNOR_HWCAPS_PP_1_1_8)
> +		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_1_8],
> +					SPINOR_OP_PP_1_1_8_4B,
> +					SNOR_PROTO_1_1_8);
> +	if (pp_hwcaps & SNOR_HWCAPS_PP_1_8_8)
> +		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_8_8],
> +					SPINOR_OP_PP_1_8_8_4B,
> +					SNOR_PROTO_1_8_8);
> 
>  	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
>  		if (erase_mask & BIT(i))

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
