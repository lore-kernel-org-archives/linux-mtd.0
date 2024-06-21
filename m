Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B856DC27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 12:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+zlxNUKbI2eYcSWz/M74PmqKBwUMPTGASXUthIbsv8=; b=jU+mZbjZpb4sBI
	2PG5aOxN8O20f+bwypwQ02IX0MA5IySYDGClSsaHk5qnI5MMhzTtpqiPiNxzXBQi8tfbEUlgDtnyK
	WeNyukhk3NBO6W2OM4WJbzu8ajtRBcEIa2wQUTUdMbaTy5W0s7z1k9sn4XNr/MTXBtlZBFdYscgHz
	zVwjyS+b0si0Nrdc2+1TaVAo+bNDO/H4IsKqitScHdEN+3Q8fJP8tsvf2a9XqBtmcyc0w1Q9rETuD
	dPs+4iIGfV/Y760k4VilPFvzJsmUgeBeT+XsWn4MZ167fX7pxAJDaNGzDsVb556qoOcT9ZJpW+JDM
	axi1VR/zYStgkSi0fLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdeI-00000009D3b-1fbD;
	Fri, 21 Jun 2024 12:45:50 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdeF-00000009D0s-2r4I
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jun 2024 12:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=L8yrHVsxWDH2FoC1Mf/LumUyyPNxnkuSsKX0JVFnSLs=; b=LI5Fi8CIqHGk5NPzr8o6CPTndY
	4Ozmj32DSyAwa/mCoz92cGmhYl9hH5sQPh/+CFiFZY9xvHFv0mM6HhTFNjlqrQ6iaCh2C56CuK4Dj
	kGCG3kcNu3bm+bysPynf0aCorDfFfb962S4D+NnSeaS0ML76kd/MgeC41xxgSbrgtq30aQGKRqyJ9
	XVw2Bi+A9Ye1fOk7fs5QwdUraGbLwwsjb4MUZsd2iK1RKeRhKQNHvNvy13Q3RemSpU8fh/HYfXJ89
	45DS4BRRgoDgdRPOl79okVeWCml3wvPespksYcSPOm4KS8RagpdoFneWoAx+2wOMu+f7VdxF5LozU
	dwdSHsIQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sKde7-000KRb-8W; Fri, 21 Jun 2024 14:45:39 +0200
Received: from [80.62.116.144] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sKde7-0009LS-0d;
	Fri, 21 Jun 2024 14:45:38 +0200
From: Esben Haabendal <esben@geanix.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Linus Walleij <linus.walleij@linaro.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Hartmut
 Birr <e9hack@gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: fix w25q128 regression
In-Reply-To: <20240621120929.2670185-1-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 21 Jun 2024 14:09:29 +0200")
References: <20240621120929.2670185-1-mwalle@kernel.org>
Date: Fri, 21 Jun 2024 14:45:38 +0200
Message-ID: <8734p679cd.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27313/Fri Jun 21 10:28:08 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_054548_050408_69D39A8A 
X-CRM114-Status: GOOD (  18.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Michael Walle <mwalle@kernel.org> writes:

> Commit 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
> removed the flags for non-SFDP devices. It was assumed that it wasn't in
> use anymore. This wasn't true. Add the no_sfdp_flags as well as the size
> again.
>
> We add the additional flags for dual and quad read because they have
> been reported to work properly by Hartmut using both older and newer
> versions of this flash, the similar flashes with 64Mbit and 256Mbit
> already have these flags and because it will (luckily) trigger our
> legacy SFDP parsing, so newer versions with SFDP support will still get
> the parameters from the SFDP tables.
>
> Reported-by: Hartmut Birr <e9hack@gmail.com>
> Closes: https://lore.kernel.org/r/CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com/
> Fixes: 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Esben Haabendal <esben@geanix.com>

> ---
> As mentioned this is for fixing the regression and a proper fix will
> make use of the TRY_SFDP (or whatever it will be named) mechanism.
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index ca67bf2c46c3..6b6dec6f8faf 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -105,7 +105,9 @@ static const struct flash_info winbond_nor_parts[] = {
>  	}, {
>  		.id = SNOR_ID(0xef, 0x40, 0x18),
>  		.name = "w25q128",
> +		.size = SZ_16M,
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x40, 0x19),
>  		.name = "w25q256",

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
