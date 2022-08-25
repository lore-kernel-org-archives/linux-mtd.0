Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606B7C04AA5
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 07:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98bcWgDyMjAlBaDIORn3Wv5SvWrpHzq6VirmfhaauQg=; b=HNQ3du6YW5nGwj2ACFXLWjkQol
	FB70W/HSQ158ekf994kVuFtgqcmeT6y2y6326R2rjlGwEj10/87vPJDZSdeONsj0AcKRnuRrsSIE9
	qSF4AuH1Wh/QkJQW8BG9tCQJiL0nhLxOIYWVVYoDoI7aPs0mmxW+7mEQUHGb66RJmkuJY2KQzuocj
	Yyws4QMAfkWOouOLQZOyzY1B3rKtlSDrYkoxCycgAd5whw1ZxAwwtPxCDkUthCVuvZE6uFD2SXuTQ
	j1DG7CbORiiHrBHJol99Q6poXN6cE08GgDaLd1Euc518BCsTmSHd0+jx9f3PDteW6EpNw2glaKmoH
	8za+IZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7k1-009mk8-NA; Thu, 25 Aug 2022 07:57:29 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7jv-009mMK-8V
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2022 07:57:28 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 33A6722D9;
	Thu, 25 Aug 2022 09:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661414229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+gt/+fjpoTSYvaJwO+tOv7S5dM1z8v8w6Ekwn7RTDE=;
	b=kfb7TrlgXmj3cHB/+Bokgn55VATeWxlLOn/KMU862wrKdQnVQ3LeRZYW/h06Uu27fg/F+r
	pyaA+S3kmbV2QX1n8tdgoZLGmXfkvmOwv0Mu4tSQmtFwYo9o1RX+OUHyvHsGkBydO2F6q8
	c3xMimUufovHxn9W4zc9Q0s5ifpGFUhjDr5mnYSbyhXOPzoXH8O2z2ENUQnc4pyTE3wahY
	r9vSS95DJnrEEchbQDkE4icr/UNC0ulk9kGkLEFl2tOTdfsj4g4e6X3et07viDizlEeXHV
	R5vh0AREYwR+arfa/AhTW7JM7gptNCfXxVNCYeS4psr3E8Ra3xk3oakPrj8DmQ==
MIME-Version: 1.0
Date: Thu, 25 Aug 2022 09:57:08 +0200
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Add s28hl512t, s28hl01gt, and
 s28hs01gt info
In-Reply-To: <475bdde1b012af8b36f266bca3230c3262f78700.1661392740.git.Takahiro.Kuwano@infineon.com>
References: <cover.1661392740.git.Takahiro.Kuwano@infineon.com>
 <475bdde1b012af8b36f266bca3230c3262f78700.1661392740.git.Takahiro.Kuwano@infineon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f0457fd85a363653e6b4b2e27c58e473@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_005723_544863_ACD9D522 
X-CRM114-Status: GOOD (  13.24  )
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

Am 2022-08-25 04:20, schrieb tkuw584924@gmail.com:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Add flash info table entries for s28hl512gt, s28hl01gt, and s28hs01gt.
> These devices have the same functionality as s28hs512t.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c 
> b/drivers/mtd/spi-nor/spansion.c
> index 03f361089a05..76a0e31c8323 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -459,11 +459,26 @@ static const struct flash_info 
> spansion_nor_parts[] = {
>  		.fixups = &s25hx_t_fixups },
>  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
>  		FLAGS(SPI_NOR_NO_ERASE) },
> +	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> +			      SPI_NOR_OCTAL_DTR_PP)

Do you really need the NO_SFDP_FLAGS here? And then the usual:
could you test with
	{ "s28hl512t",   INFO(0x345a1a,      0, 0, 0)
		.fixups = &s28hx_t_fixups,
	},

You might need
https://lore.kernel.org/linux-mtd/20220810220654.1297699-6-michael@walle.cc/

-michael


> +		.fixups = &s28hx_t_fixups,
> +	},
> +	{ "s28hl01gt",   INFO(0x345a1b,      0, 256 * 1024, 512)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> +			      SPI_NOR_OCTAL_DTR_PP)
> +		.fixups = &s28hx_t_fixups,
> +	},
>  	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
>  			      SPI_NOR_OCTAL_DTR_PP)
>  		.fixups = &s28hx_t_fixups,
>  	},
> +	{ "s28hs01gt",   INFO(0x345b1b,      0, 256 * 1024, 512)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> +			      SPI_NOR_OCTAL_DTR_PP)
> +		.fixups = &s28hx_t_fixups,
> +	},
>  };
> 
>  /**

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
