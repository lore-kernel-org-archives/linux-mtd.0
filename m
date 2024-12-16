Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E711E7717F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khYckqKGm2b5LcMx7UZXK8tTwqcrwMRMLfTBSQZsqxo=; b=knZQiDe6IZU6UG
	jBOUes4CW3pIVbJFKhAxTJZA5BjnOOwkQCGmxQ+oO4XsskJtsxEuFlLuAXaazRDs4wfF2VF44Gv9R
	8Nfd0ev6GphYTyEF3Hby5IDXGqzv1FNNp2FW5W8mdi9RpHku9npp53+nqvZViyf1qbwiv03KvNGlr
	gZ436DddxX5BnTbPy1PZiR0AgBrV4z6W0EgDE8wdymkLvag6xKoc+tQqzBBgh85lnJktCozWt/Q+2
	RJXkUrSf9B1W06kKCksJk4BWQL3kxnYg+hzIKmtG5D5m9mO+ArCqEOYnjjivproIcqkfYOy2bQ1Ln
	dlnyf3qMRso3DGCWRvmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDxo-0000000AapD-2I7b;
	Mon, 16 Dec 2024 16:28:56 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDxl-0000000AanU-0z1F
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 16:28:54 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B37D5240101
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 17:28:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1734366530; bh=PlkCynOL3Tsz0T6YmkOwC6mC4N5qaMSRrMx4zGvxwQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=irEwUR0mqb/qElctoztoRtGR7jzW/oP8ZJ+DKulDYgNWd9nOgF8dqXlsDVsdq6oC2
	 fpnKeDDktanSnpO/y+foz7lPktVPLrJZ2u93oKAJkb0oBBNU9qKxTC+/zpeqAwUJ8L
	 9sHC3XLEm2WKcpkQLaq8QxDEdcLjuoK6TL2yAfaYkVL/d4FTYKPmen8Bq7Z3c/TMwj
	 fEKPpYkia+B1QzqUNf/bBXHRfP1UbBqMzBbnlmgt+JxYrme6Gk3vjbp3mdbH/UEXId
	 E1xBWHj0ia1FmBy6pNsRCa8b9ZB/WZhZNK1P5zJlvCktKgFtJVBBQeVeqP3NeGeXqL
	 ieQ4IDJnwdTfg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YBlkT22nTz9rxB;
	Mon, 16 Dec 2024 17:28:49 +0100 (CET)
Date: Mon, 16 Dec 2024 16:28:48 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: add w25q01jv flash chip
Message-ID: <20241216172848.1d7308b4@posteo.net>
In-Reply-To: <mafs0y10f230m.fsf@kernel.org>
References: <Z2AOeyPwYWaam_lX@monster.localdomain>
	<mafs0y10f230m.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_082853_420324_D7895083 
X-CRM114-Status: GOOD (  20.31  )
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

On Mon, 16 Dec 2024 13:03:53 +0000
Pratyush Yadav <pratyush@kernel.org> wrote:

> Hi Wilken,
> 
> On Mon, Dec 16 2024, Wilken Gottwalt wrote:
> 
> > Add Winbond W25Q01JV 128 MiB SPI NOR flash chip, verified working on the
> > Zynq-7000 platform QSPI controller. The flash chip has quite high read
> > speeds (about 60+ MiB/s), but erasing is very slow. The slow erasing is
> > by design.
> 
> Does the flash have support SFDP? If so, you likely don't need specify
> the no_sfdp_flags, name, or size. Try the entry only with ID and flags,
> and see if the flash continues to work fine for you.
> 
> Also see [0] for additional testing requirements.
> 
> [0] https://docs.kernel.org/driver-api/mtd/spi-nor.html

We use this flash in that way in production systems for a while now. But yeah,
you are right. I will do the checks, but it may take a while. Currently I'm at
vaccation and have no access to this machine until January.

> >
> > Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> > ---
> >  drivers/mtd/spi-nor/winbond.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> > index 8d0a00d69e12..e2caf299d19a 100644
> > --- a/drivers/mtd/spi-nor/winbond.c
> > +++ b/drivers/mtd/spi-nor/winbond.c
> > @@ -146,6 +146,12 @@ static const struct flash_info winbond_nor_parts[] = {
> >  		.name = "w25q512jvq",
> >  		.size = SZ_64M,
> >  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> > +	}, {
> > +		.id = SNOR_ID(0xef, 0x40, 0x21),
> > +		.name = "w25q01jv",
> > +		.size = SZ_128M,
> > +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> > +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> >  	}, {
> >  		.id = SNOR_ID(0xef, 0x50, 0x12),
> >  		.name = "w25q20bw",
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
