Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23099EB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 07:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asYR31EyMeHOG9P/oGoqx4TzbquL+tWwhliAU9cx+uQ=; b=JmkOdmfs1yZa4l0toe1y+zieZs
	RySWrxU7tVjGpalDxGIly/bHh5uvOc18XBRYs97iFMCBO0BgBddyIAY05/ehRLV3QzUwrAl5igdv0
	OvsprVQP2aOceDEX9Db2P1ls2IicPzq+KrQznowBwHAMDxnBcRFJkgP7aTULN7rXwcMdUi5VVaT/F
	+ySuM0JaR9G/SBy3C2OY6IDLIMlAifzOl6nez53XIet4ocFcXzSSgILS/6y2Hk6086Y8oLBs47j6c
	jrNDCbQPSfVk5HFdGV6VTYLCOYKQVwH12RQMlRp7BU+yx6iSZjIRXcGfFWmEDFRedQMLWUhVnaX80
	vZdBIWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTuQ-00GkAM-0T;
	Wed, 12 Jul 2023 07:05:10 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTuN-00Gk89-1I
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 07:05:09 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C9A2081A;
	Wed, 12 Jul 2023 09:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689145496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9iTjSBQ2cpJHR0/fytksLWYvIlt9SMZkZq0e9WtOSg=;
	b=vmi5gQZlxACiaeV0fWn2byFIQWIzZn2z/GpeBZChBrd+vzpmczq1+qYJ/8Ftm/xi5Aj13G
	8Y23dxmxM6RyGnDCAZC4XyUeRr1X6GHXWe8Hcn/4Oa5R2wBwz1PGRPdz4hgqXDGviTxSoZ
	C2GfLvpIlVxAe2Owj0/5cPSrgZyp4qWQ75iw6XoYePUGgGH6TUFHUl2iQ64VyyNnfdxx2R
	xo7ksN3xbUpriRIdg7tMWg1rNahN9X3VBYATJwNXxtSZSQkQoHcrxwo5b/9xRaNE8HZaP8
	N33ETMJThiD3AafqpHWV7wzIi3y2HvsHU+pXlsD8pM0UORn9sA+/8I4L7HnIQQ==
MIME-Version: 1.0
Date: Wed, 12 Jul 2023 09:04:56 +0200
From: Michael Walle <michael@walle.cc>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] mtd: spi-nor: Correct flags for Winbond w25q128
In-Reply-To: <20230712-spi-nor-winbond-w25q128-v1-1-f78f3bb42a1c@linaro.org>
References: <20230712-spi-nor-winbond-w25q128-v1-1-f78f3bb42a1c@linaro.org>
Message-ID: <46d0846850df455901cf3d11c66c5a90@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_000507_635258_F55327DE 
X-CRM114-Status: GOOD (  28.40  )
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

Hi Linus,

Am 2023-07-12 00:02, schrieb Linus Walleij:
> The Winbond W25Q128 (actual vendor name W25Q128JV)

Not necessarily see below. Do you know what part numbers is
written on your flash?

> has exactly the same flags as the sibling device
> w25q128fw. The devices both require unlocking and
> support dual and quad SPI transport.
> 
> The actual product naming between devices:
> 
> 0xef4018: "w25q128"   W25Q128JV-IM/JM
> 0xef7018: "w25q128fw" W25Q128JV-IN/IQ/JQ

Where do you get that string? from winbond.c? Because,
then it's incorrect. For 0xef7018 its actually w25q128jv.

But that being said, Winbond is known to reuse the IDs among its
flashes. From a quick look at various datasheets:

0x60 seems to be DW, FW and NW(Q) series
0x70 seems to be JV(M)
0x80 seems to be NW(M)
0x40 seems to be BV, JV(Q), "V" (probably the first [1])

(Q) denotes the fixed quad enable bit.

Now 0x40 are the first ones who where added back in the days. I'm
not sure, what kind of winbond devices there were and if they
support dual/quad read.

Normally, you'd use a .fixups (see w25q256_fixups for example) to
dynamically detect the newer flash type and then refine the flags.
But because we don't know how the older flashes look like, that
would be just guessing :/ Although, I've once thought about
fingerprinting the SFDP tables eg. by some hash. But that would
assume the SFDP data is not changing a lot on a given device. Not
sure if that is the case, we just began to collect SFDP tables
of various devices.

If it turns out that only SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB
is needed, I'm leaning towards just adding these flags to the
w25q128 entry. According to [1] this was already supported
back in the days.

> The latter device, "w25q128fw" supports features
> named DTQ and QPI, otherwise it is the same.
> 
> Not having the right flags has the annoying side
> effect that write access does not work.

This should only apply to FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB).

I'd guess your flash supports SFDP, then the NO_SFDP_FLAGS should be
automatically detected. Could you please dump the SFDP tables
(described in [2])?

> After this patch I can write to the flash on the
> Inteno XG6846 router.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/spi-nor/winbond.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c
> index 834d6ba5ce70..a67e1d4206f3 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -121,7 +121,9 @@ static const struct flash_info winbond_nor_parts[] 
> = {
>  	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
>  		NO_SFDP_FLAGS(SECT_4K) },
>  	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
> -		NO_SFDP_FLAGS(SECT_4K) },
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ) },

As mentioned above, could you try without the DUAL_READ/QUAD_READ flags.
You can have a look at the debugfs whether the detected capabilities
are still the same with and without these flags.

-michael

[1] https://www.elinux.org/images/f/f5/Winbond-w25q32.pdf
[2] 
https://lore.kernel.org/all/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
