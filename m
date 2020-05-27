Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B484C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED5D2084C
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ADnu3T8C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CED5D2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7l/PTOaKj2mvhZ+G/gz3USxzPfyx1t2OCPdM0oiC3M=; b=ADnu3T8CBFHgLL
	8VA+5AFomuXzoKTLpllf4it2m8tNjkM57pvxeSmQqtkbgNwZqb67uDf/y8i34NDOahtNy0XapKngz
	4PYuSeblBN1zD4pEmwj/0URAZdn5W/QVRbhsmv31I0MUm8BWMjwd0GMTH27cJ6iKNUnSMpjMzE5yn
	MK6apuHUP9w0c8TojbvJKXDDODRJKbjp9dg+9Kj31bj6wKGVBrZpye87R0isogu9vOtIGTaX37B98
	Bg1BZyoJGV9V/aEoQ63zWdK257If278pXuMhGfT38TJz297TS+VNdKOsyXpfNaemtDGVxDKvAVx/e
	KzfQ7rwlw4Q2RKm5xskg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdrL7-0001Pz-1c; Wed, 27 May 2020 08:23:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdrL3-0001PV-UN
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 08:23:03 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7867F2A36EB;
 Wed, 27 May 2020 09:23:00 +0100 (BST)
Date: Wed, 27 May 2020 10:22:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RESEND v5 07/21] mtd: rawnand: Create a new enumeration to
 describe OOB placement
Message-ID: <20200527102257.788fc5a0@collabora.com>
In-Reply-To: <20200527100050.7e54713a@xps13>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
 <20200526195633.11543-8-miquel.raynal@bootlin.com>
 <20200527003904.362e59e4@collabora.com>
 <20200527100050.7e54713a@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_012302_112262_DC01A746 
X-CRM114-Status: GOOD (  24.48  )
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

On Wed, 27 May 2020 10:00:50 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 27 May
> 2020 00:39:04 +0200:
> 
> > On Tue, 26 May 2020 21:56:19 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > There is currently a confusion between the ECC type/mode/provider
> > > (eg. hardware, software, on-die or none) and the ECC bytes placement.
> > > 
> > > Create a new enumeration to describe this placement.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > >  drivers/mtd/nand/raw/nand_base.c |  4 ++++
> > >  include/linux/mtd/rawnand.h      | 12 ++++++++++++
> > >  2 files changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > > index ef70ca0828c3..a4470a19c805 100644
> > > --- a/drivers/mtd/nand/raw/nand_base.c
> > > +++ b/drivers/mtd/nand/raw/nand_base.c
> > > @@ -5018,6 +5018,10 @@ static const char * const nand_ecc_modes[] = {
> > >  	[NAND_ECC_ON_DIE]	= "on-die",
> > >  };
> > >  
> > > +static const char * const nand_ecc_placement[] = {
> > > +	[NAND_ECC_PLACEMENT_INTERLEAVED] = "interleaved",
> > > +};
> > > +
> > >  static int of_get_nand_ecc_mode(struct device_node *np)
> > >  {
> > >  	const char *pm;
> > > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > > index 8187056dd3a0..6eb4d91b07eb 100644
> > > --- a/include/linux/mtd/rawnand.h
> > > +++ b/include/linux/mtd/rawnand.h
> > > @@ -92,6 +92,18 @@ enum nand_ecc_mode {
> > >  	NAND_ECC_ON_DIE,
> > >  };
> > >  
> > > +/**
> > > + * enum nand_ecc_placement - NAND ECC placement
> > > + * @NAND_ECC_PLACEMENT_FREE: The driver can decide where to put ECC bytes.    
> > 
> > Can we name that one UNDEFINED instead of FREE, and it's not really the
> > driver that decides (unless you have a choice or use SW ECC), more the ECC
> > engine itself.  
> 
> Ack.
> 
> >   
> > > + *                           Default behavior is to put them at the end of the
> > > + *                           OOB area.    
> > 
> > I wouldn't even define a default behavior here, but instead add a value for
> > OOB/TAIL placement.  
> 
> This is for legacy reasons, maybe I should not say it is a default, but
> rather a common location (or say nothing).

I wouldn't even mention what the most common pattern is. But I think
defining @NAND_ECC_PLACEMENT_OOB is a good thing.

> 
> >   
> > > + * @NAND_ECC_PLACEMENT_INTERLEAVED: Syndrome layout: interleave data and OOB.    
> > 
> > 
> > 									     ^ECC bytes
> >   
> > > + */
> > > +enum nand_ecc_placement {
> > > +	NAND_ECC_PLACEMENT_FREE,
> > > +	NAND_ECC_PLACEMENT_INTERLEAVED,
> > > +};
> > > +
> > >  enum nand_ecc_algo {
> > >  	NAND_ECC_UNKNOWN,
> > >  	NAND_ECC_HAMMING,    
> >   


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
