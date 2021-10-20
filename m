Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C59C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 12:14:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628956135E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 12:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 628956135E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frCiNm4zk68zfM3pTtrE4wewH3RWxGxasXmkhWP9lHo=; b=yriRY/UOynvPVP
	uL9x6G8QMGBjcIPESZ4vk4UjFz1bQvk0LOq1iGn3YPaf0UxfwT+alSoPolgaXwvOZCjoS7nbz1NmQ
	r7DYdWYKLqiTT/zNlDo93jccFAaruFtiZBXO5UwwggD8sTWCQ4brCQ//+0SdDQDRFuJ3McPXWWe9s
	oZNDYCmB98T8X7bUw5CiftVV/Ww/pWwi5m580GBILzgTgHnxZZ3MUyhijowI2kaZdNJysCMB77dwI
	DP9brEHoNqMzuhcHy+2BpvMxAdYo4skfXBQlPe6GEM/2z1yyzBRYwA7I2Xg6SP4XDmz8Ro8fFrOc9
	mPH7l3PO1m6nTpLUcJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdATx-004SsM-E0; Wed, 20 Oct 2021 12:14:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdATu-004Sq2-1z
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 12:14:08 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 305651F440BF;
 Wed, 20 Oct 2021 13:14:01 +0100 (BST)
Date: Wed, 20 Oct 2021 14:13:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Mark Brown <broonie@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Michael Walle <michael@walle.cc>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>, Mauro Lima
 <mauro.lima@eclypsium.com>, Alexander Sverdlin
 <alexander.sverdlin@nokia.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <20211020141357.3559ca95@collabora.com>
In-Reply-To: <20211020115913.uzo3ogkmrltnb26y@ti.com>
References: <20211013114432.31352-1-mika.westerberg@linux.intel.com>
 <20211013114432.31352-3-mika.westerberg@linux.intel.com>
 <20211020114153.0f99c5df@collabora.com>
 <20211020115913.uzo3ogkmrltnb26y@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_051406_296122_CB6B3603 
X-CRM114-Status: GOOD (  26.96  )
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

On Wed, 20 Oct 2021 17:29:15 +0530
Pratyush Yadav <p.yadav@ti.com> wrote:

> On 20/10/21 11:41AM, Boris Brezillon wrote:
> > On Wed, 13 Oct 2021 14:44:31 +0300
> > Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> >   
> > > The preferred way to implement SPI-NOR controller drivers is through SPI
> > > subsubsystem utilizing the SPI MEM core functions. This converts the
> > > Intel SPI flash controller driver over the SPI MEM by moving the driver
> > > from SPI-NOR subsystem to SPI subsystem and in one go make it use the
> > > SPI MEM functions. The driver name will be changed from intel-spi to
> > > spi-intel to match the convention used in the SPI subsystem.
> > >   
> > 
> > I skimmed over the driver changes, and I'm skeptical about this "let's
> > convert all spi-nor controller drivers into spi-mem drivers even if
> > they don't fit the spi-mem model" strategy. Clearly, the intel
> > controller is much more limited than any other spi-mem controller (I
> > mean feature-wise not perf-wise of course). The fact that you have to
> > check the opcode to decide whether the operation is supported or not,
> > or the way you deduce when to issue an erase vs a regular read/write is
> > kind of hack-ish. Not saying we shouldn't support this case in spi-mem,
> > but it should at least be done in a more controlled way. Maybe with an
> > explicit array of supported spi_mem operations, and driver specific
> > hooks for each of these operations so anything falling outside is
> > clearly identified and rejected (we have this sort of things in the raw
> > NAND framework).  
> 
> I am curious about how we can solve this. Any pointers to 
> functions/drivers in raw NAND framework that follow this model?

It's not quite what you'd need, but nand_op_parser_pattern follows the
same philosophy: describe a pattern and attach a hook to be executed
when this pattern is found. Then you pass this pattern table to a helper
that tries to match the operation against the supported patterns. If it
finds one that matches, the operation is reported as supported and/or
executed, otherwise it's rejected.

In this particular case, the pattern must be very specific:

* matching opcode
* matching direction
* matching number of address cycles
* matching number of dummy cycles?
* max/min number of data cycles?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
