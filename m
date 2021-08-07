Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3EAC4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 08:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E88F26115C
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 08:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E88F26115C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eX+jaZCIuuJ3FQE021XCDlnhhjdshcqpSrjP7yleHIk=; b=RSpk6/SymEUCzt
	dNZeK5wZRjbq8VCwRNqmzLwfmxwQVcKoPdroWww7cR/8d7n1/AXuo5eFPP0HIw+/7YXiBSj0BJ5bU
	RwJgmlXfjz7h1iYBp+Lh1NR3hNDCDi0It1OX3oeMSrO4jxUtxafPmz+WswAjczllMKKPwfGJIoAze
	DgnhQBhMkk7j0irWgOqf0M2Z2CSLcvYQwHh0WiakiiChXO0b+Y12O5ZAyyiGoGwYyyWNy3m8c9J+F
	XqrlUdrKr9qv5f0nUFg8qUPQxUZqW8q45vE/Xg/NrfUPC5VEQL9Koid3R4S3a++gSKAtsN8BkQowX
	D1BNCJqG+Y5VqI/8iftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCHLr-00EN2x-Gq; Sat, 07 Aug 2021 08:06:39 +0000
Received: from gofer.mess.org ([88.97.38.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCHLn-00EN2L-95
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 08:06:38 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 8E80CC63FB; Sat,  7 Aug 2021 09:06:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1628323593; bh=Wn7NQqygIK4Qmx31NCAE5MCGCntHY3zz5QE5kBTbTKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HJOqCOT6VVBgJ8CMli7tfBZA9EIjACSvDlmfJRSr8W6XcqbhxPjCj/w2gqrBwH1RR
 PMw0qqLL/2PrwoZNX6y0ohAoXvX7Rt7uqqlKl0HZRsX+eMGQgMUEo3TkpZCoH7sfOu
 5oR/MyM22krQ8linquwykUdd2gN6mXMGh3DLe5wzjnjig2FympLRfLWiqViZMCmTUp
 xsyXer3yxMMs0wa4NXuqVqJyc2kBrHIXhBtquJ7yPyxRgBYcDGdjOcphOpZ0XN4Ona
 Q1lKQpCAlxVi78fCIVlKTEhKU0cx+R6BiX3ZBOszra9W++dCdLacfrqt48wyo8qu/o
 AW9UV2KrpsIbQ==
Date: Sat, 7 Aug 2021 09:06:33 +0100
From: Sean Young <sean@mess.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/4] mtd: rfd_ftl: add discard support
Message-ID: <20210807080633.GC2522@gofer.mess.org>
References: <cover.1626169090.git.sean@mess.org>
 <cdc2b33790398d42f310af350298c1e781a50991.1626169090.git.sean@mess.org>
 <20210806201820.512beda8@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806201820.512beda8@xps13>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_010635_510400_7528EB93 
X-CRM114-Status: GOOD (  24.06  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 06, 2021 at 08:18:20PM +0200, Miquel Raynal wrote:
> Hi Sean,
> =

> Sean Young <sean@mess.org> wrote on Tue, 13 Jul 2021 10:44:01 +0100:
> =

> > I proposed this change 16 years ago before discard was a feature in
> > the block layer: https://lwn.net/Articles/162776/
> > =

> > Now that the block layer has discard, we can finally merge this change.
> =

> Can you explain why this is needed here?

Because discard is a huge win. This is also known as trim.

By implementing discard, both fstrim and the discard filesystem option
can be used.

Implementing discard in the ftl means that when files are removed, there
is less data in the ftl mapping. This means less stuff to move around for
erasing and also less erasing to do. This means better wear levelling.

There is also a wikipedia page on trim here:

	https://en.wikipedia.org/wiki/Trim_(computing)

Thanks,

Sean

> (also please add the maintainers in Cc: for the v2)
> =

> > Signed-off-by: Sean Young <sean@mess.org>
> > ---
> >  drivers/mtd/rfd_ftl.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > =

> > diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
> > index 7b243f2b2fa3..7f5f6d247cae 100644
> > --- a/drivers/mtd/rfd_ftl.c
> > +++ b/drivers/mtd/rfd_ftl.c
> > @@ -705,6 +705,34 @@ static int rfd_ftl_writesect(struct mtd_blktrans_d=
ev *dev, u_long sector, char *
> >  	return rc;
> >  }
> >  =

> > +static int rfd_ftl_discardsect(struct mtd_blktrans_dev *dev,
> > +			       unsigned long sector, unsigned int nr_sects)
> > +{
> > +	struct partition *part =3D (struct partition *)dev;
> > +	u_long addr;
> > +	int rc;
> > +
> > +	while (nr_sects) {
> > +		if (sector >=3D part->sector_count)
> > +			return -EIO;
> > +
> > +		addr =3D part->sector_map[sector];
> > +
> > +		if (addr !=3D -1) {
> > +			rc =3D mark_sector_deleted(part, addr);
> > +			if (rc)
> > +				return rc;
> > +
> > +			part->sector_map[sector] =3D -1;
> > +		}
> > +
> > +		sector++;
> > +		nr_sects--;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int rfd_ftl_getgeo(struct mtd_blktrans_dev *dev, struct hd_geom=
etry *geo)
> >  {
> >  	struct partition *part =3D (struct partition*)dev;
> > @@ -786,6 +814,7 @@ static struct mtd_blktrans_ops rfd_ftl_tr =3D {
> >  =

> >  	.readsect	=3D rfd_ftl_readsect,
> >  	.writesect	=3D rfd_ftl_writesect,
> > +	.discard	=3D rfd_ftl_discardsect,
> >  	.getgeo		=3D rfd_ftl_getgeo,
> >  	.add_mtd	=3D rfd_ftl_add_mtd,
> >  	.remove_dev	=3D rfd_ftl_remove_dev,
> =

> =

> =

> =

> Thanks,
> Miqu=E8l
> =

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
