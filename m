Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73BCC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:01:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94CE920723
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tWXg70vT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94CE920723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLOJSgPk4IJ5KqmRTf7sLZrcmqCeCLju58z/sZ5DKB4=; b=tWXg70vTW3tcTz
	gPr5o+ytyo8x2HCdldiusHzUpo+064SJBzC7v1Pa4qyBBE84XC06wDtr0fgdUWNInHPRZpmfn3uWL
	GU2hkKzb/+R0C3EokCWIkOP5zZKYeMaWyGVmvRbK+BXFBdKxOLs47DcqVLa92zqux93SPAYvClli+
	Nda4ymyahi726E+uYirCe94FpXtWpm+FlPWHbzzYuWEoegCD5wFceOasYVvLETyvV/tk47gKVdEKS
	f+/dhQ5hHtC7VdTVdTmfdnU7EPRhRwCOLXnfwUmt1XQxedz3QIZ7/UiQKNiHTw9Kr44TH/E8lCDzV
	eBOhecVMZErvQbmUsNHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdqzl-0004KI-MZ; Wed, 27 May 2020 08:01:01 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdqzj-0004JO-8Q
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 08:01:00 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 26CED200013;
 Wed, 27 May 2020 08:00:52 +0000 (UTC)
Date: Wed, 27 May 2020 10:00:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RESEND v5 07/21] mtd: rawnand: Create a new enumeration to
 describe OOB placement
Message-ID: <20200527100050.7e54713a@xps13>
In-Reply-To: <20200527003904.362e59e4@collabora.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
 <20200526195633.11543-8-miquel.raynal@bootlin.com>
 <20200527003904.362e59e4@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_010059_434502_923BA54F 
X-CRM114-Status: GOOD (  20.52  )
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

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 27 May
2020 00:39:04 +0200:

> On Tue, 26 May 2020 21:56:19 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > There is currently a confusion between the ECC type/mode/provider
> > (eg. hardware, software, on-die or none) and the ECC bytes placement.
> > 
> > Create a new enumeration to describe this placement.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c |  4 ++++
> >  include/linux/mtd/rawnand.h      | 12 ++++++++++++
> >  2 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index ef70ca0828c3..a4470a19c805 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -5018,6 +5018,10 @@ static const char * const nand_ecc_modes[] = {
> >  	[NAND_ECC_ON_DIE]	= "on-die",
> >  };
> >  
> > +static const char * const nand_ecc_placement[] = {
> > +	[NAND_ECC_PLACEMENT_INTERLEAVED] = "interleaved",
> > +};
> > +
> >  static int of_get_nand_ecc_mode(struct device_node *np)
> >  {
> >  	const char *pm;
> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index 8187056dd3a0..6eb4d91b07eb 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -92,6 +92,18 @@ enum nand_ecc_mode {
> >  	NAND_ECC_ON_DIE,
> >  };
> >  
> > +/**
> > + * enum nand_ecc_placement - NAND ECC placement
> > + * @NAND_ECC_PLACEMENT_FREE: The driver can decide where to put ECC bytes.  
> 
> Can we name that one UNDEFINED instead of FREE, and it's not really the
> driver that decides (unless you have a choice or use SW ECC), more the ECC
> engine itself.

Ack.

> 
> > + *                           Default behavior is to put them at the end of the
> > + *                           OOB area.  
> 
> I wouldn't even define a default behavior here, but instead add a value for
> OOB/TAIL placement.

This is for legacy reasons, maybe I should not say it is a default, but
rather a common location (or say nothing).

> 
> > + * @NAND_ECC_PLACEMENT_INTERLEAVED: Syndrome layout: interleave data and OOB.  
> 
> 
> 									     ^ECC bytes
> 
> > + */
> > +enum nand_ecc_placement {
> > +	NAND_ECC_PLACEMENT_FREE,
> > +	NAND_ECC_PLACEMENT_INTERLEAVED,
> > +};
> > +
> >  enum nand_ecc_algo {
> >  	NAND_ECC_UNKNOWN,
> >  	NAND_ECC_HAMMING,  
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
