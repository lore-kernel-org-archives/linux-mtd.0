Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCD5C6FA82
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 15:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3YKaaCcs9P+MTdZrBRap9ONLXx70oKCSLOcjR88H+s=; b=PbIdp4e+jOpfds9FNvWcA6zd86
	M2DD/F8m79s3bvJ5vruoc1Cwck1FoFMtBbpkn5vV+i9Jq0yfI8mZcDn4He5KNdDVPSLnImaREBjSE
	Zraw+s8HjXZZwwvByJ6U7k4v1CBQl1Tb3mgQXxWOGdua94Lqun2FPIwSFtfJXjg7jb/bVXtFAppOH
	gWGCL97jWxra/PzWNkI5AggTTgx2UXv+xvOuFzFIj0/iB9YQAbOxNw9d+sRSXrbqq2lhGehacdmQL
	/BaBEqEE3z+0vLPTYmNYkstRk6GlBz5KB45U15jv7A3ZBTlNBUrJyaiTC1nVDrpxEDXXJ91XWzdX6
	phSTG9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obOHR-00GUSV-9U; Thu, 22 Sep 2022 15:38:25 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obOHO-00GUQI-DE
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 15:38:24 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 00DD71250;
	Thu, 22 Sep 2022 17:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1663861098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ayjl2muafUrIBrP43RiugPdW33oXvMBnSFuRnjjdjE=;
	b=1E7dv4Pmapk29Q1flKOPhkxwXg/Cic/3m4n2yj9Oah90ShIcymje5SLxqV3LbKxi1y8hj5
	v5iT3JY0mb/FAynNaHMY9FRKIbnddZgt5pP4S8dtk6EY6POSboUWMw5mUGL6oq4sEiJ8Lu
	t05ejFMFgN3zHPJRZ7/g7EeXkzUHRGFtpt33S2wMXWmYUljIKycC/wdvZ8SKZTl83fXu+S
	VqkJuumsvSxJ+MpJLFv41h7VHkUMe4gcCH92OFZbnRkfcBB4Xx+Mshfxbat9bLQ1gInfvl
	U8dYgYZvZRMsazYfg22SMzMZJkAUZOxUwzmEifyM6MrtvzJslvW9ViFJ6isp/g==
MIME-Version: 1.0
Date: Thu, 22 Sep 2022 17:38:17 +0200
From: Michael Walle <michael@walle.cc>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lr256e
In-Reply-To: <Yyx7FwIPM19UPK+H@black.fi.intel.com>
References: <20220922135646.49906-1-mika.westerberg@linux.intel.com>
 <88d096d0c5efe43bc50f3c547634eb8b@walle.cc>
 <YyxxlSscwnWSyfy3@black.fi.intel.com> <Yyx7FwIPM19UPK+H@black.fi.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <2971d64c8719811c27b653bc5293d975@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_083822_624359_D9C201FA 
X-CRM114-Status: GOOD (  20.26  )
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

Am 2022-09-22 17:11, schrieb Mika Westerberg:
> On Thu, Sep 22, 2022 at 05:30:45PM +0300, Mika Westerberg wrote:
>> On Thu, Sep 22, 2022 at 04:15:37PM +0200, Michael Walle wrote:
>> > Am 2022-09-22 15:56, schrieb Mika Westerberg:
>> > > Add support for this 32MB serial flash.
>> > >
>> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> > > ---
>> > >  drivers/mtd/spi-nor/gigadevice.c | 4 ++++
>> > >  1 file changed, 4 insertions(+)
>> > >
>> > > diff --git a/drivers/mtd/spi-nor/gigadevice.c
>> > > b/drivers/mtd/spi-nor/gigadevice.c
>> > > index 119b38e6fc2a..7a7f5cb67a9e 100644
>> > > --- a/drivers/mtd/spi-nor/gigadevice.c
>> > > +++ b/drivers/mtd/spi-nor/gigadevice.c
>> > > @@ -57,6 +57,10 @@ static const struct flash_info gigadevice_nor_parts[]
>> > > = {
>> > >  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
>> > >  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>> > >  		.fixups = &gd25q256_fixups },
>> > > +	{ "gd25lr256e", INFO(0xc86719, 0, 64 * 1024, 512)
>> >
>> > There doesn't seem to be a public datasheet. Does this flash support SFDP?
>> >
>> > In that case, please just use
>> > 	{ "gd25lr256e", INFO(0xc86719, 0, 0, 0),
>> > 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>> > 		PARSE_SFDP
>> > 	}
>> >
>> 
>> Sure, let me check this one works and update the patch accordinglly.
> 
> Tried this now (I did not find the datasheet either anymore) but I get:
> 
>   spi-nor spi0.0: BFPT parsing failed. Please consider using
> SPI_NOR_SKIP_SFDP when declaring the flash
> 
> So I suspect SFDP is not supported by this chip?

According to https://www.gigadevice.com/flash-memory/gd25lr256e/
it has SFDP. Could you debug what is going wrong here?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
