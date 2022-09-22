Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9A8C6FA82
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9TG6Ytsgf76MXjBHtKhFHSx/0robHsZmOqBSI2CT1s=; b=f4MeofIXoFfHRdfURHTRtufBye
	xLc2rgm5B5t1oYjCD0NtrYywXkmgtu/3Z64itOD6SE2JolSbEwh6+3coZ/AphHg5vjBAX7ykP5gbx
	b7tqrzC/U2HDP6tjpTbD8Uw2+Naexvxz2NrLLpHAxuo9rr8OMpn0EhYEIACnUPNBekOLBW4x9fB0/
	IW4XOYraxKuT1QbebKx+K1N6s372a5Ww1Idnb1o8SdEeakvlPHeZhmgQIfjcxo/zz35VDedqimJgX
	AKG15ukPSnCzGQ2czsZ5VAUF8MmAgNoqyeY+Rm29yhtiTczWBO6UvGt0p8vQqiKSKkQ9MguIUdrEm
	q64MEvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obN2y-00FxAY-Je; Thu, 22 Sep 2022 14:19:24 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obN2v-00Fx8l-N0
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 14:19:23 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9F2711D4A;
	Thu, 22 Sep 2022 16:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1663856359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AauVWltcSpfrIG4GiR/ILpgSYrrVzj7d64kjUXfFDp0=;
	b=0KcVU38HiTtBViW2cgpNdonzzwPAsMjeKN2HGf++0HHEPjtquMr5PwCSDR1muiRNiIegFV
	LagLGb10JN2a4BoOgA4dgTf0jPceHX9zM2Km/vaSmwmj9Cp6s5n5tlQitqk/ZqtSJOkPjc
	bCj3L3NgdgnOqL1VOnb3gLIDYxlKHWQA4OXzU2d1o6tD3mS8FELjwFi/EIfDm3wjIrf71j
	6oun+jjlnN5061w3XRcERDTq4/eN/4HADUJnlSO7GpV7Zpj+tIKj0tezV1lUQtEbJfBFIT
	rJew8M5eLnznPubdm4J5NHE3fKsfp6s+wdOFWqWWrFPjM2mbVS+PPR0mGO38ow==
MIME-Version: 1.0
Date: Thu, 22 Sep 2022 16:19:19 +0200
From: Michael Walle <michael@walle.cc>
To: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 greentime.hu@sifive.com, jude.onyenegecha@sifive.com,
 william.salmon@sifive.com, adnan.chowdhury@sifive.com, ben.dooks@sifive.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: issi: is25wp256: Init flash based on
 SFDP
In-Reply-To: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
References: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1b62d0d80d3680e94172149946c936a0@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_071921_935111_DDC38F9D 
X-CRM114-Status: GOOD (  17.33  )
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

Am 2022-09-20 20:48, schrieb Sudip Mukherjee:
> The datasheet of is25wp256 says it supports SFDP. Get rid of the static
> initialization of the flash parameters and init them when parsing SFDP.
> 
> Testing showed the flash using SPINOR_OP_READ_1_1_4_4B 0x6c,
> SPINOR_OP_PP_4B 0x12 and SPINOR_OP_BE_4K_4B 0x21 before enabling SFDP.
> After this patch, it parses the SFDP information and still uses the
> same opcodes.
> 
> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
> ---
> 
> No change from v2, just resending again with the next patch.
> Results from the tests given by Tudor in the following mail.
> 
> 
>  drivers/mtd/spi-nor/issi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 89a66a19d754f..8b48459b5054c 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -71,7 +71,7 @@ static const struct flash_info issi_nor_parts[] = {
>  	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)

I'm curious, does it also work with:
   	{ "is25wp256", INFO(0x9d7019, 0, 0, 0)
		PARSE_SFDP
-michael

> -		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		PARSE_SFDP
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		.fixups = &is25lp256_fixups },

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
