Return-Path: <SRS0=gTFy=RC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB54C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 14:30:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 111922133D
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 14:30:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rAHjigpI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 111922133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4shAlzjgJ+8mdlu3if2OXgYnmDf9mQ70VU0/xSZdyo=; b=rAHjigpIIAZ57R
	A383j+E6ySd6J0FdNzR3XP6Js7LSlV6iFYWs3QIdNA2KEXld+UyGxShIbld9mZYqu18J7xhIrajyN
	LhfFVqjFpStEb/kJ0EM/H9vS4yNmuCC98XLF5n/D7+tZhIHlCC+iybtRvfCjbjYI+WMcnCacftwsH
	zYQn6/0fsWyoqptb3MbaiWmVWx20KfyidjLrL0uHYWVjFBdt+F9xqdiLZ5qmpCT2aoQmADRYvw1li
	pGOSScmfJjbXMIMkNL8diwMs1TZYqs/GU7JzfZ6hoZdAjzvM860CnzzOwct4G1E4iOq+PAGym1cGV
	lCnVYtq4fYTMCgTlF8Aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz0E8-000728-Up; Wed, 27 Feb 2019 14:30:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz0Dy-0006sl-Ir; Wed, 27 Feb 2019 14:30:20 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 870C22806C1;
 Wed, 27 Feb 2019 14:30:16 +0000 (GMT)
Date: Wed, 27 Feb 2019 15:30:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RFC PATCH 25/27] mtd: nand: Add helpers to manage ECC engines
 and configurations
Message-ID: <20190227153013.6f2ac471@collabora.com>
In-Reply-To: <20190227150713.116a0ad3@xps13>
References: <20190221125806.28875-1-miquel.raynal@bootlin.com>
 <20190221125806.28875-13-miquel.raynal@bootlin.com>
 <20190222154431.66c6911f@kernel.org>
 <20190227150713.116a0ad3@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_063018_885910_8FD704B8 
X-CRM114-Status: GOOD (  31.82  )
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
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 27 Feb 2019 15:07:13 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <bbrezillon@kernel.org> wrote on Fri, 22 Feb 2019
> 15:44:31 +0100:
> 
> > On Thu, 21 Feb 2019 13:58:04 +0100
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Add the logic in the NAND core to find the right ECC engine depending
> > > on the NAND chip requirements and the user desires. Right now, the
> > > choice may be made between (more will come):
> > > * software Hamming
> > > * software BCH
> > > * on-die (SPI-NAND devices only)
> > > 
> > > Once the ECC engine has been found, the ECC engine must be
> > > configured.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  drivers/mtd/nand/core.c  | 107 +++++++++++++++++++++++++++++++++++++++
> > >  include/linux/mtd/nand.h |   4 ++
> > >  2 files changed, 111 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
> > > index 872d46b5fc0f..9feb118c9f68 100644
> > > --- a/drivers/mtd/nand/core.c
> > > +++ b/drivers/mtd/nand/core.c
> > > @@ -207,6 +207,113 @@ int nanddev_mtd_max_bad_blocks(struct mtd_info *mtd, loff_t offs, size_t len)
> > >  }
> > >  EXPORT_SYMBOL_GPL(nanddev_mtd_max_bad_blocks);
> > >  
> > > +/**
> > > + * nanddev_find_ecc_engine() - Find a suitable ECC engine
> > > + * @nand: NAND device
> > > + */
> > > +static int nanddev_find_ecc_engine(struct nand_device *nand)    
> > 
> > Can we pass the conf in argument instead of reading it from
> > nand->ecc.user_conf?  
> 
> I just changed the root structures, there is a
> 
>        struct nand_ecc_conf defaults;
> 
> entry now in the nand_ecc_engine structure, which every layer/driver
> can overwrite to inform the NAND core of a default value.
> 
> Later in this function, I check user_conf (which I might call
> "desires" now that we have a "defaults" and a "requirements" entries),
> but if the value is missing I fallback to the "defaults" one if filled.
> Having all these structures being passed as parameters does not make
> sense to me so I would prefer sticking to the single "nand" parameter.
> 
> >   
> > > +{
> > > +	bool is_spinand = mtd_type_is_spinand(&nand->mtd);    
> > 
> > And here is the reason for the SPINAND type.  
> 
> This does not exist anymore as you suggested.
> 
> >   
> > > +
> > > +	/* Read the user desires in terms of ECC engine/configuration */
> > > +	nand_ecc_read_user_conf(nand);
> > > +
> > > +	/* No ECC engine requestedn, let's return without error */
> > > +	if (nand->ecc.user_conf.mode == NAND_ECC_NONE)
> > > +		return 0;
> > > +
> > > +	/* Raw NAND default mode is hardware */
> > > +	if (!is_spinand && nand->ecc.user_conf.mode < 0)
> > > +		nand->ecc.user_conf.mode = NAND_ECC_HW;    
> > 
> > We should let the raw NAND layer take this decision (actually, it's
> > even a raw NAND controller driver decision). Please complain if
> > user_conf.mode is invalid.
> > This way you won't need the SPINAND type you added in one of your
> > previous patch.  
> 
> See above for the solution I choose.
> 
> >   
> > > +
> > > +	/* SPI-NAND default mode is on-die */
> > > +	if (is_spinand && nand->ecc.user_conf.mode < 0)
> > > +		nand->ecc.user_conf.mode = NAND_ECC_ON_DIE;
> > > +
> > > +	switch (nand->ecc.user_conf.mode) {
> > > +	case NAND_ECC_SOFT:
> > > +		nand->ecc.engine = nand_ecc_sw_get_engine(nand);
> > > +		break;
> > > +	case NAND_ECC_ON_DIE:
> > > +		if (is_spinand)
> > > +			nand->ecc.engine = spinand_ondie_ecc_get_engine();    
> > 
> > So, maybe it's worth having the ondie ECC engine instance directly
> > embedded in nand_device instead of spinand, or maybe just a pointer, so
> > that you don't reserve extra space when the NAND device does not have
> > on-die ECC.  
> 
> It is now: the nand_ecc_engine structure features a *engine and a
> *ondie_engine pointer.
> 
> The nand_ecc_get_ondie_engine(nand) helper just
> returns nand->ecc.ondie_engine.

Ack to all of this.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
