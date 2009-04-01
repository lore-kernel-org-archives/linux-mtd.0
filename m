Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LoteP-0004Cr-Jl
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 06:10:20 +0000
Subject: Re: [patch/rfc 2.6.29 2/2] MTD: support driver model updates
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200903312257.37434.david-b@pacbell.net>
References: <200903260039.34013.david-b@pacbell.net>
	<200903260042.50236.david-b@pacbell.net>
	<1238564771.20906.26.camel@localhost.localdomain>
	<200903312257.37434.david-b@pacbell.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2009 09:10:03 +0300
Message-Id: <1238566203.20906.31.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-03-31 at 22:57 -0700, David Brownell wrote:
> On Tuesday 31 March 2009, Artem Bityutskiy wrote:
> > > --- a/drivers/mtd/nand/mxc_nand.c
> > > +++ b/drivers/mtd/nand/mxc_nand.c
> > > @@ -866,6 +866,7 @@ static int __init mxcnd_probe(struct pla
> > >       mtd = &host->mtd;
> > >       mtd->priv = this;
> > >       mtd->owner = THIS_MODULE;
> > > +     mtd->dev.parent = &pdev->dev;
> > 
> > Could this be done for all NANDs in nand_base.c instead?
> 
> By adding the device as a parameter to nand_scan(),
> and presumably nand_scan_ident() ... which is a more
> invasive API change, and would require a "flag day"
> to convert all drivers.
> 
> My default assumption for API changes is to avoid
> flag days.  They can be done, yes, but I don't see
> a compelling reason to choose one here.

OK. MTD long needs sysfs, and I'm very happy with this
patches, even though they are not 100% complete. Good
start anyway.

Acked-by: Artem Bityutskiy <dedekind@infradead.org>

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
