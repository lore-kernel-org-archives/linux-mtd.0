Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC96C072A2
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 08:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjHVKh3i9sssPvstbJhMUNVPnsUzMELs4/VPBiDsAMU=; b=WCu0sVyCr4HczlEGAIxvEhNvrE
	zSd78Fq8mZtj93dMQJ9IX2pVUFrmFfBzHkEZA5FQfl2sX3SPWqUzUu/UxBPz5RKmOP0VXPX3VYIcO
	xQctWTBvCYfpTKtNT0td3udRk0g+YpRUbTNFvszj0uppwEMCgYfOV1iVhS0wI6Rm8Qh7qk1HKS+jj
	CLa9vdDRhZ2ePkREvLanbmKov7eKS4Vcbp8mJS3jOuC3bLj0wT+yXAKG0nNaW8VhADaa47LE8c/FD
	eLVo5qjm+6JwwC7lJMk2eZPgqVtNyRLA5XtErDTyeaYu2GjDJ+6ACN4qdqfeTPuTTu8XozYGNnZKy
	QecW1lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uf4-00604g-2s;
	Fri, 17 Nov 2023 08:57:14 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uf2-006032-1b
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 08:57:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C49FA2A5;
	Fri, 17 Nov 2023 09:57:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1700211428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MgA8yQoiodyTRL7e3GR/fVJ0EqhGHSYvjgGc7/kmnFA=;
	b=Q3xMoOJmdORcfO2JSb9HY1nvpV27UsoOjAjMlYdy+03ZlHq7oDPb+EdPZHlulxAPwzBXxF
	7PHKLvjBcwF4RDluFCbOsipoVCM9BMkEkz2snjj73TyDa1DFt6Z/mYEOQ+IwNmSB9ey8Ng
	s39xWt1hodrEGOlydcxVxvQcoSq+GUoVRFHK5XeaOh6+/rQhCZ/HxSPBsLcFdKm5DbDI9R
	ACZ7lpQWZJ+ijVc914su5uslwT4EAL4xmBs0Ya18NLla4T8shJOX5mVHHNUyobvVI1YHO1
	ABq2YyQrmmOhIREQFu0xSfIQJlt8h7qZGe4eBCUlxEVrncMPJmpAqFfPUqa2ug==
MIME-Version: 1.0
Date: Fri, 17 Nov 2023 09:57:08 +0100
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v5 6/6] mtd: spi-nor: add support for Macronix Octal flash
In-Reply-To: <20231117083853.33329-7-jaimeliao.tw@gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-7-jaimeliao.tw@gmail.com>
Message-ID: <8eba400c77127b0df74d2a336561a49d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_005712_687314_34E21305 
X-CRM114-Status: GOOD (  12.09  )
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

> diff --git a/drivers/mtd/spi-nor/macronix.c 
> b/drivers/mtd/spi-nor/macronix.c
> index 48e570c04ad9..2115a25b21ce 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -260,6 +260,27 @@ static const struct flash_info 
> macronix_nor_parts[] = {
>  		.name = "mx66uw2g345gx0",
>  		.n_banks = 4,
>  		.flags = SPI_NOR_RWW,
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x83, 0x39),
> +		.name = "mx25um25345g",
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x80, 0x39),
> +		.name = "mx25um25645g",
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x85, 0x39),
> +		.name = "mx25lm25645g",
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x80, 0x3a),
> +		.name = "mx25um51245g",
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x85, 0x3a),
> +		.name = "mx25lm51245g",
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x80, 0x3b),
> +		.name = "mx66um1g45g",
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x85, 0x3b),
> +		.name = "mx66lm1g45g",

You need this because of the manufacturer fixup, correct? I'd like to
avoid these "empty" entries if possible. The name is useless to the 
kernel
and sometimes incorrect. Therefore, at least drop it and just list the
IDs.

Tudor, Pratyush, what do you think about calling the vendor fixups
by just looking at the JEDEC manufacturer ID *iff* there is no
entry in the flashdb? As a fallback so to speak. That would also
help for the chip erase topic, because I'd presume the chip erase
op is the same among the flashes of one vendor. So there could be
a vendor fixup, to set the chip erase op.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
