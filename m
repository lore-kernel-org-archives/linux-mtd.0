Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE8CC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:45:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BACA2073B
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:45:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xxj1Bh/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BACA2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MxDq0wfQY5yyATOgN63wFgaG3iP0R7EOMMUSDflnALQ=; b=Xxj1Bh/lGIKYlU
	yfsz0bnkS57LOUHCAzxsEv7+7iujYVwJJjcOo4lVxjasXn7HAYmhpDiqouGDxeyNr2qabhZ4wiod7
	9dD+0mggZhU331UH1a8fRJmGUc2DOVcB2EQkSSVjtzI1u+b2Dbln74NdEdwzxjAdQoC4lvXqlybK5
	Kn7u9K3DtHX4Hwb9N6RrolSEiQQ2MV/DsG3HU3u6QNK0c+ICdvITDQ4/6Kw2aYQXv2zzevbdIaAJG
	nuiUebpEFqcC3+Pw+DNOjIj59KUcLS7M1NQEO9n7yV/wgiEOuo5wVrjURxF2pmLcv+gn09Pz//UhT
	QxyrLF3krxNJJC7w+D1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdrfz-0008RA-Eg; Wed, 27 May 2020 08:44:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdrfv-0008Pw-MX
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 08:44:37 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 773482A3703;
 Wed, 27 May 2020 09:44:33 +0100 (BST)
Date: Wed, 27 May 2020 10:44:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RESEND v5 09/21] mtd: rawnand: Create a new enumeration to
 describe properly ECC types
Message-ID: <20200527104430.187e5feb@collabora.com>
In-Reply-To: <20200527103356.56e145a9@xps13>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
 <20200526195633.11543-10-miquel.raynal@bootlin.com>
 <20200527005928.39c549e2@collabora.com>
 <20200527103356.56e145a9@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_014435_864016_49E8642B 
X-CRM114-Status: GOOD (  24.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 27 May 2020 10:33:56 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 27 May
> 2020 00:59:28 +0200:
> 
> > On Tue, 26 May 2020 21:56:21 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Now that the misleading mix between ECC engine type and OOB placement
> > > has been addressed, add a new enumeration to properly define ECC types
> > > (also called provider or mode).
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > >  drivers/mtd/nand/raw/nand_base.c |  7 +++++++
> > >  include/linux/mtd/rawnand.h      | 16 ++++++++++++++++
> > >  2 files changed, 23 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > > index 515cd4681660..5c6ab5b93270 100644
> > > --- a/drivers/mtd/nand/raw/nand_base.c
> > > +++ b/drivers/mtd/nand/raw/nand_base.c
> > > @@ -5018,6 +5018,13 @@ static const char * const nand_ecc_modes[] = {
> > >  	[NAND_ECC_ON_DIE]	= "on-die",
> > >  };
> > >  
> > > +static const char * const nand_ecc_engine_providers[] = {    
> > 
> > This table is not used here, are you sure it should be introduced now?
> >   
> > > +	[NAND_ECC_ENGINE_NONE] = "none",
> > > +	[NAND_ECC_ENGINE_SOFT] = "soft",
> > > +	[NAND_ECC_ENGINE_CONTROLLER] = "hw",    
> > 
> > 					^ "on-controller" ?  
> 
> This would break DT backward compatibility, I am afraid I cannot do
> that.

You can always keep a translation table for the old prop
(nand-ecc-mode) and have a new one for the new prop
(nand-ecc-engine-type). But maybe you're not introducing a new property
in this series, in which case the translation table here is just fine.

> Honnestly, I find "hw" good enough because "on-controller" is
> also too restrictive.

How about "on-host", it doesn't say anything about where the engine is
on the host (can be embedded in the controller, or an external block),
yet clearly describe the fact that it's not on-die ECC.

> What about an external (non-pipelined) engine
> like the one I am about to introduce?
> 
> >   
> > > +	[NAND_ECC_ENGINE_ON_DIE] = "on-die",

Well, this one is also a HW engine, and that's the problem I have with
the "hw" string.

> > > +};
> > > +
> > >  static const char * const nand_ecc_placement[] = {
> > >  	[NAND_ECC_PLACEMENT_INTERLEAVED] = "interleaved",
> > >  };
> > > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > > index dc909fb977c7..a2078c5f3d21 100644
> > > --- a/include/linux/mtd/rawnand.h
> > > +++ b/include/linux/mtd/rawnand.h
> > > @@ -92,6 +92,22 @@ enum nand_ecc_mode {
> > >  	NAND_ECC_ON_DIE,
> > >  };
> > >  
> > > +/**
> > > + * enum nand_ecc_engine_type - NAND ECC engine type/provider
> > > + * @NAND_ECC_ENGINE_INVALID: Invalid value
> > > + * @NAND_ECC_ENGINE_NONE: No ECC correction
> > > + * @NAND_ECC_ENGINE_SOFT: Software ECC correction
> > > + * @NAND_ECC_ENGINE_CONTROLLER: Hardware controller ECC correction
> > > + * @NAND_ECC_ENGINE_ON_DIE: On chip hardware ECC correction
> > > + */
> > > +enum nand_ecc_engine_type {
> > > +	NAND_ECC_ENGINE_INVALID,
> > > +	NAND_ECC_ENGINE_NONE,
> > > +	NAND_ECC_ENGINE_SOFT,
> > > +	NAND_ECC_ENGINE_CONTROLLER,
> > > +	NAND_ECC_ENGINE_ON_DIE,
> > > +};
> > > +
> > >  /**
> > >   * enum nand_ecc_placement - NAND ECC placement
> > >   * @NAND_ECC_PLACEMENT_FREE: The driver can decide where to put ECC bytes.    
> >   


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
