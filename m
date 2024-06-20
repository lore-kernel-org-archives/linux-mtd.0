Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C40C27C79
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGSFoUvW+rpa/Uo7SSsOGrfFFGy4hxqjRvJbl+t+hv0=; b=t7AatKOf2+VskUsxzref/UVV2K
	V1DNGSihtPNhbI199c5SXDBKcul4ph+MEWcDNq0U01VrAydtg0up9ydbnZj4Y/gpgkZAh9ajx/tIb
	qllgttUi8mHoaUkB4lBAgWEMllga5gaXxtk5dI2N+EfUcDZ8SPfuMg2Lx/2/u79bv/ElJnaH10r/5
	Byy6g8d2SzP3nZbMVZH1Gdeyot/4aRZB+dHwXCtvk9sX9Sdmpv2EMHm8k5f2GUwR4I8eJlaa0Zn4E
	x/zJVwSlg4El5raUJuXHNdERr1FTmlvDiOFW1nvmXAuvSAsaqD0uRi+oQli+gdGjA62rsk7wcA2pu
	KbfjIpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKITZ-00000005Mmd-0Fmi;
	Thu, 20 Jun 2024 14:09:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKITW-00000005Mkq-3geC
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 14:09:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB1AB6210D;
	Thu, 20 Jun 2024 14:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78886C2BD10;
	Thu, 20 Jun 2024 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718892557;
	bh=Mb47V/TtEOTke3i6u+2FiWov3PpilA3tj3biR8NUCHE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qNW5f+4bhHEwW0qLaY3V4ZmgpgyPR/5voNTZycSXO3vvzj5v2O7pi7do0PvO5xcog
	 IKZe2IHTWQ0Utcz725ZsO+fZSuJOJMOiIcqpETafnUNoTHf9ZRvAuhu2QHBtaJ+lWt
	 uinsRk4bnZO88HEpWZOb6PCy+rVeRrU0dR9885KDqrk6yDCzuHO2Dr/NDNybWKFK3G
	 3iuvsyc4fJVvzYIZGZI445r4QotmSA1hBOkZR0d017Os/lP0FKHGrn5Em35KAvroZp
	 2r+g2MSfTcocKi1Qn57px9yjInEFICuzBZxx1egp2AY/zVAjcV7Ec/xjKF1Z2vijBD
	 H2YrHzj+UZCYw==
MIME-Version: 1.0
Date: Thu, 20 Jun 2024 16:09:13 +0200
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, e9hack
 <e9hack@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: fix w25q128 regression
In-Reply-To: <mafs04j9ng1ay.fsf@kernel.org>
References: <20240610074809.2180535-1-mwalle@kernel.org>
 <76f8be4e-3050-4ae6-93b4-9524a0689022@linaro.org>
 <D233KUGR81P5.1BJ8JSACE7C6A@kernel.org> <mafs04j9ng1ay.fsf@kernel.org>
Message-ID: <91d155ab7526c14e882f7b88a129fbcd@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_070919_088765_0B55FBC9 
X-CRM114-Status: GOOD (  21.87  )
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

>>> > Commit 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
>>> 
>>> That commit did:
>>> -       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
>>> -               NO_SFDP_FLAGS(SECT_4K) },
>>> +       { "w25q128", INFO(0xef4018, 0, 0, 0)
>>> +               PARSE_SFDP
>>> +               FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>> 
> [...]
>>> > diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
>>> > index ca67bf2c46c3..6b6dec6f8faf 100644
>>> > --- a/drivers/mtd/spi-nor/winbond.c
>>> > +++ b/drivers/mtd/spi-nor/winbond.c
>>> > @@ -105,7 +105,9 @@ static const struct flash_info winbond_nor_parts[] = {
>>> >  	}, {
>>> >  		.id = SNOR_ID(0xef, 0x40, 0x18),
>>> >  		.name = "w25q128",
>>> > +		.size = SZ_16M,
>>> >  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>>> > +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>>> 
>>> and here you add dual and quad to trigger SFDP parsing I guess. All 
>>> fine
>>> if the old flash supports dual and quad read. But please update the
>>> commit message describing the intention. With that ACK. Would be good 
>>> to
>>> have this merged soon.
>> 
>> Right. It's not because it will trigger the SFDP parsing, but
>> because that what was tested by Esben. We're lucky that this will
>> trigger the SFDP parsing ;) I'll explain that in more detail and add
>> a Link: to the bug report mail.
> 
> Should we treat this flash similar to the Macronix ones Esben sent out
> patches for [0]? It seems that there are some old parts without SFDP
> support and new ones with SFDP support. From your comment in [1]:
> 
>> This is an entry matching various flash families from Winbond, see my
>> reply in v1. I'm not sure we should remove these as we could break the
>> older ones, which might or might not have SFDP tables. We don't know.
> 
> Since the entry matches multiple families, do _all_ of them support 
> dual
> and quad read? If not, attempting to enable dual or quad reads on them
> can cause problems.

I rely on the information Helmut provided. Also the w25q64 and the 
w25q256
both have these flags set. So I'd say it's less likely the 128 doesn't
support it.

> Also, for parts that _do_ have SFDP available, won't it be better to 
> use
> the information in SFDP instead of our hard-coded ones anyway? Using
> SPI_NOR_TRY_SFDP here would let us do that.

Sure, but this is about fixing the referenced commit. A later patch will
then move that to TRY_SFDP. We can't fix this regression by introducing
new code IMHO. This seems to be the easiest fix.

-michael

> 
> [0] 
> https://lore.kernel.org/linux-mtd/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/
> [1] 
> https://lore.kernel.org/linux-mtd/0525440a652854a2a575256cd07d3559@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
