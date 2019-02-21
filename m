Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB32C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 11:14:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE6FD2086C
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 11:14:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ao5vL6Nz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufh6WSip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE6FD2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUfGOEfJfMCzmko440uIHSyOwDrn/k2AUd8GiCRIp/4=; b=Ao5vL6NzFD050Y
	kSNMjwmmzxOkHPy0yepfQC+DVUYlKzEwQDmUduJyDa/bSB4wQoxJDb0ZtOX68RjhLoncbqHpiLwP1
	nnJibz2w9p5SEd5IPpC5/VzBZWOvxt9SI5pLguLTFIZYQcsbk2J8ZN9Zp4RvhGRiqeUZSP0F1b0gB
	uP6sNOokJsB7JiU65Tle5DOBdcb9jrw9tzlYNNojtma/4+RDAe2HQqcye6Y4Z8Ua7gmxW9yE7JWpO
	cXyF4yr6Qkshf3CWsTspgRI0wZwKX9lMMYB4/I7IxjLDD8cZoaZ5dy+ZWkBug4frzy6798TslZENq
	S0AuBLKY2dBB4DTpJKyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwmJY-0002u9-Jc; Thu, 21 Feb 2019 11:14:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwmJQ-0002mW-0a; Thu, 21 Feb 2019 11:14:45 +0000
Received: from localhost (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A2862084F;
 Thu, 21 Feb 2019 11:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550747683;
 bh=iSxXfZoLOysfKcCozEmie9SwX3ZktmKo9HSy0fUFQDQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ufh6WSipYdYZdXuBWUy8RiNW1+l7hosZ9ZTdxfM98EJr8GHQl6+vgXj3pr6gyKnv/
 Js3Jw2g1F9Z8OGSPh29gCvasMo45uRIgf1snSAInVo0Bly3FVVUyDoditgRAT8LHkr
 EEOCqvG/cqWEkTl7ggG0L5jdkZVjqUDADOuPxE5w=
Date: Thu, 21 Feb 2019 12:14:37 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RFC PATCH 02/27] mtd: nand: Compile in the NAND core by default
Message-ID: <20190221121437.7c551bc5@kernel.org>
In-Reply-To: <20190221120610.5abb49ae@xps13>
References: <20190221100216.25255-1-miquel.raynal@bootlin.com>
 <20190221100216.25255-3-miquel.raynal@bootlin.com>
 <20190221115554.315fbd9b@kernel.org>
 <20190221120610.5abb49ae@xps13>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_031444_091275_A57D6E59 
X-CRM114-Status: GOOD (  22.62  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 21 Feb 2019 12:06:10 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <bbrezillon@kernel.org> wrote on Thu, 21 Feb 2019
> 11:55:54 +0100:
> 
> > On Thu, 21 Feb 2019 11:01:51 +0100
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Force the NAND core be compiled-in when using any kind of NAND.    
> > 
> > Why?  
> 
> Because all the logic that comes later in the series relies on this
> change. I need the NAND core to be compiled-in,

Hm, not exactly compiled-in as it can still be selected as a module.

> as well the ECC engine
> core, as well as everything that is shared between raw NAND and
> SPI-NAND which I move in the NAND core.

Yes, the core is required for SPI NAND and soon will be for RAW NAND,
but I still don't see the problem with the "select NAND_CORE" approach,
sorry.

> 
> >   
> > > 
> > > Also remove the redundant dependencies on MTD which is enforced by the
> > > game of the if/endif blocs.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  drivers/mtd/nand/Kconfig         | 12 ++++++++++--
> > >  drivers/mtd/nand/onenand/Kconfig |  1 -
> > >  drivers/mtd/nand/raw/Kconfig     |  1 -
> > >  drivers/mtd/nand/spi/Kconfig     |  1 -
> > >  4 files changed, 10 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> > > index 495751ed3fd7..e8d26a715922 100644
> > > --- a/drivers/mtd/nand/Kconfig
> > > +++ b/drivers/mtd/nand/Kconfig
> > > @@ -1,6 +1,14 @@
> > > -config MTD_NAND_CORE
> > > -	tristate
> > > +menuconfig MTD_NAND_CORE
> > > +	tristate "NAND"    
> > 
> > Definitely not something we want to expose in menuconfig.  
> 
> I considered the NAND core as essential when using raw NAND and
> SPI-NAND.

It is needed for SPI NAND, and will be for raw NAND for sure, but I
still see no reasons for turning it into a user-visible option.

> Hence, turning it into a menuconfig option make the whole
> NAND subsystem available (or not) and will appear in a different
> "menuconfig page", which really enhances the readability.

That's a different thing, and I have no problem with adding an extra
level in the Kconfig hierarchy.

> 
> >   
> > > +	default y    
> > 
> > I don't see what's the problem with letting SPINAND, RAWNAND and
> > ONENAND select this options if they actually need it.  
> 
> See the reason above, hence having it "default y" is needed to do not
> break existing defconfigs.

Not if you make RAW_NAND select NAND_CORE.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
