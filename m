Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5BFC07545
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3OobfdiM08VLyDKBPjI9fkzFmCpxpwGomLjA9+VVnw=; b=rbbAk/JoGXMTN9Dsw7OGU0Vy/Y
	9ujMFesGMjc8asQBLrSqPxnTgrwq1xG9CbtqiU2agBquXBlR9piCdxrYlVAPs7zSgm8jLAbrqMGfC
	QIpYrKuXHdh5mRprLGQltPtmKmbQYgqeb5Ej1kCnvewrHZfcZRd6YRVLRKZUxC7VUW1xrN6VeTXVv
	dpDscjZ6n4shXhr8xZww2LXuEHpQIha5tzKLC6bllzpdL4Si7lhwetChtaJgDqxuJwQ3Ic0Od4CUV
	wh6CvuFkhaTu8bMQpHGArX910Rj3E892BlfmazdMN5KmHOj6ZH0Kr/Lmh0V1unChOEndhnkcVl7CE
	y619n0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDgM-009JOs-0U;
	Tue, 24 Oct 2023 09:26:38 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDgA-009JHZ-19
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 09:26:30 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1E892133;
	Tue, 24 Oct 2023 11:26:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1698139582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cW/Nu8xCpsmWx8bkWy5LI9VZEvCuisXpJdaca8yclc8=;
	b=eF9T3B6kBE+cXOgDVH8ip8p1TxrdBrdMam4daCbC3Us/DvRwh0QwBluuSwRlmTsDxDqX8n
	sAUP1JX7XVEjqal9hKL6URKXLyfsBJyHyCSBFQ0UU9C8yIfHmxPqsppCCj0l5reCOScutu
	qSEeR1VWD0F34Ph/XZaExrDPECpPKrAce9eD7Qd1Eoe27MgCM5OxVL7RmmniAua54flssf
	C/VbVLwHHuFZaGHBF5qyL9sMbBkRb1R7x4oG2DwDSqfmzyv76Fc+aEcXxudGzppARJunt7
	avMDyEb8lEY+/nZSUDZ/iXZfkZScAlyEDmBFDBxkPWmRdOCD4NHqhslV//Abdg==
MIME-Version: 1.0
Date: Tue, 24 Oct 2023 11:26:21 +0200
From: Michael Walle <michael@walle.cc>
To: Fabio Estevam <festevam@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, Fabio Estevam <festevam@denx.de>,
 tkuw584924@gmail.com
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
In-Reply-To: <20231023213800.2599704-1-festevam@gmail.com>
References: <20231023213800.2599704-1-festevam@gmail.com>
Message-ID: <6183891066787b6c24df11e0d601ed26@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_022626_544009_F04C2F4D 
X-CRM114-Status: GOOD (  14.85  )
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

[+ Takahiro]

> Add support for the MT25QU01G 128MB Micron Serial NOR Flash Memory
> model.
> 
> Datasheet:
> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_01g_bbb_0.pdf

As a "Link:" tag please.

Please also include a SFDP dump, see [1].

> Tested on a i.MX8MP based board:
> 
>  # dmesg | grep spi-nor
> [    1.854474] spi-nor spi0.0: mt25qu01g (131072 Kbytes)
> 
>  # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 08000000 00001000 "30bb0000.spi"
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index 8920547c12bf..da2f8992bbc0 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -429,6 +429,13 @@ static const struct flash_info st_nor_parts[] = {
>  			 SPI_NOR_BP3_SR_BIT6,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
>  		.mfr_flags = USE_FSR,
> +	}, {
> +		.id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
> +		.name = "mt25qu01g",
> +		.size = SZ_128M,

Not needed, parsed by SFDP.

> +		.flags = NO_CHIP_ERASE,

Is it fair to assume that this is the usual case for multi die chips?
See also,
https://lore.kernel.org/linux-mtd/cover.1680849425.git.Takahiro.Kuwano@infineon.com/

So "if n_dice > 1" will implicitly be NO_CHIP_ERASE. n_dice should be
parsed from SFDP.

> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,

.no_sfdp_flags are legacy and shouldn't be used with new flashes.

> +		.mfr_flags = USE_FSR,
>  	}, {
>  		.id = SNOR_ID(0x20, 0xbb, 0x21),
>  		.name = "n25q00a",

-michael

[1] 
https://lore.kernel.org/all/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
