Received: from n22b.bullet.mail.mud.yahoo.com ([68.142.206.159])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LotbB-0001gP-S9
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 06:07:01 +0000
From: David Brownell <david-b@pacbell.net>
To: dedekind@infradead.org
Subject: Re: [patch/rfc 2.6.29 2/2] MTD: support driver model updates
Date: Tue, 31 Mar 2009 22:57:37 -0700
References: <200903260039.34013.david-b@pacbell.net>
	<200903260042.50236.david-b@pacbell.net>
	<1238564771.20906.26.camel@localhost.localdomain>
In-Reply-To: <1238564771.20906.26.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200903312257.37434.david-b@pacbell.net>
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 31 March 2009, Artem Bityutskiy wrote:
> > --- a/drivers/mtd/nand/mxc_nand.c
> > +++ b/drivers/mtd/nand/mxc_nand.c
> > @@ -866,6 +866,7 @@ static int __init mxcnd_probe(struct pla
> >       mtd = &host->mtd;
> >       mtd->priv = this;
> >       mtd->owner = THIS_MODULE;
> > +     mtd->dev.parent = &pdev->dev;
> 
> Could this be done for all NANDs in nand_base.c instead?

By adding the device as a parameter to nand_scan(),
and presumably nand_scan_ident() ... which is a more
invasive API change, and would require a "flag day"
to convert all drivers.

My default assumption for API changes is to avoid
flag days.  They can be done, yes, but I don't see
a compelling reason to choose one here.

- Dave
