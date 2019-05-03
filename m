Return-Path: <SRS0=RfYw=TD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A69AC43219
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 12:51:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EDB72081C
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 12:51:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WTtuGqR1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EDB72081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajmPSXeegnuq0yDtAc1n6hoxUIuKQPPHdVpwmpMbBOo=; b=WTtuGqR1ROnV5x
	0uUrqDDzqPkWHoxvQY0hEzSglOgux8jSGQrgM7oOOL6OVabc3+59nuWuFQx4+BccjuQsSzgMTqys4
	D72T0xEgIrJW1ApyJ7b5k1yrH1UlGIcYZF1dQC6+Nzb4P1VAFZsIl9dolm2Ojj8SwEuwQfBNs9fIR
	hjiC0Miu8Z6t/X37GczX19ApEDUa+UFmbpxHSspOwBLgGg8Hv9oA7EMOAlEU3rlPit/dGv+tTezKu
	lJCxjNZx2R9WSeD/rVMVS0BVFzoWlSLCcSWbjhw9eJHRdMUozkJU0RElOQ8vgjFugmBRoxVUAzALq
	xWlh1OVJ8yfvvlwaFnFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMXei-0003mY-BQ; Fri, 03 May 2019 12:51:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMXdk-0002Jb-K9; Fri, 03 May 2019 12:50:15 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 350BB260BE4;
 Fri,  3 May 2019 13:50:09 +0100 (BST)
Date: Fri, 3 May 2019 14:50:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 07/36] mtd: rawnand: Avoid a typedef
Message-ID: <20190503145006.574af442@collabora.com>
In-Reply-To: <20190503144030.7fbbc0d4@xps13>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
 <20190304222841.13899-8-miquel.raynal@bootlin.com>
 <20190331135513.59257c1d@collabora.com>
 <20190503144030.7fbbc0d4@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190503_055013_109536_172D1B03 
X-CRM114-Status: GOOD (  27.07  )
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
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 3 May 2019 14:40:30 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 31 Mar
> 2019 13:55:13 +0200:
> 
> > On Mon,  4 Mar 2019 23:28:12 +0100
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > In new code, the use of typedef is discouraged. Before moving this
> > > section out of the raw NAND base, let's switch the nand_ecc_modes_t
> > > type into a regular nand_ecc_mode enumeration.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  drivers/mtd/nand/raw/nand_base.c               | 4 ++--
> > >  include/linux/mtd/rawnand.h                    | 6 +++---
> > >  include/linux/platform_data/mtd-davinci.h      | 2 +-
> > >  include/linux/platform_data/mtd-nand-s3c2410.h | 2 +-
> > >  4 files changed, 7 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > > index e14f02a01efd..05174c6a3099 100644
> > > --- a/drivers/mtd/nand/raw/nand_base.c
> > > +++ b/drivers/mtd/nand/raw/nand_base.c
> > > @@ -4881,8 +4881,8 @@ static int of_get_nand_ecc_mode(struct device_node *np)
> > >  
> > >  	/*
> > >  	 * For backward compatibility we support few obsoleted values that don't
> > > -	 * have their mappings into nand_ecc_modes_t anymore (they were merged
> > > -	 * with other enums).
> > > +	 * have their mappings into the nand_ecc_mode enum anymore (they were
> > > +	 * merged with other enums).
> > >  	 */
> > >  	if (!strcasecmp(pm, "soft_bch"))
> > >  		return NAND_ECC_SOFT;
> > > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > > index 14748183508b..c5bf6bb49329 100644
> > > --- a/include/linux/mtd/rawnand.h
> > > +++ b/include/linux/mtd/rawnand.h
> > > @@ -87,14 +87,14 @@ struct nand_chip;
> > >  /*
> > >   * Constants for ECC_MODES
> > >   */
> > > -typedef enum {
> > > +enum nand_ecc_mode {
> > >  	NAND_ECC_NONE,
> > >  	NAND_ECC_SOFT,
> > >  	NAND_ECC_HW,
> > >  	NAND_ECC_HW_SYNDROME,
> > >  	NAND_ECC_HW_OOB_FIRST,
> > >  	NAND_ECC_ON_DIE,
> > > -} nand_ecc_modes_t;
> > > +};    
> > 
> > Hm, I'm really not a big fan of this enum because it's mixing 2
> > different concepts: the type of ECC engine to use (on-die,
> > hw-controller-side, software, no-ECC) and the layout of
> > ECC/FREE bytes (_SYNDROME, _OOB_FIRST).
> > 
> > I'd recommend creating a nand_ecc_engine_type enum:
> > 
> > enum nand_ecc_engine_type {
> > 	NAND_NO_ECC_ENGINE,
> > 	NAND_SOFT_ECC_ENGINE,
> > 	NAND_HW_ECC_ENGINE,
> > 	NAND_ON_DIE_ECC_ENGINE,
> > };
> > 
> > and then convert the raw NAND layer to this enum when the time comes.  
> 
> I started something but this goes way too far from what I want to
> achieve. I know it would be nice to have it but it has an
> increasingly number of side effects which scared me. The way the
> series is organized does not allow to easily ignore the raw NAND layer
> first and then convert it. I am giving up on this one for now, sorry.

I don't think that's a wise choice. Why not focusing on
nand_device/spinand with a clean implementation that does not try to
convert the rawnand layer to this approach? The reason I initially
started over with a new generic NAND layer instead of copying things
from nand_base is that I wanted to avoid having to deal with stuff that
were not so great in there, and clearly nand_ecc_mode is one of them.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
