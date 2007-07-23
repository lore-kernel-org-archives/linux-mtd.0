Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ICyEx-0007nq-9K
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2007 09:46:24 -0400
Received: from ben by aeryn.fluff.org.uk with local (Exim 4.63)
	(envelope-from <ben@fluff.org.uk>) id 1ICyEr-0007VK-Sp
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2007 14:46:17 +0100
Date: Mon, 23 Jul 2007 14:46:17 +0100
From: Ben Dooks <ben@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] S3C24XX large page NAND support
Message-ID: <20070723134617.GA19071@fluff.org.uk>
References: <20070709231147.GA30072@fluff.org.uk> <4695FC93.7040800@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4695FC93.7040800@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 12, 2007 at 12:04:03PM +0200, Matthieu CASTET wrote:
> Ben Dooks wrote:
> > This adds support for using large page NAND devices
> > with the S3C24XX NAND controllers. This also adds the 
> > file Documentation/arm/Samsung-S3C24XX/NAND.txt to
> > describe the differences.
> > 
> > The basic stratergy is to maintain 3 bytes of ECC for
> > each 256 byte block read from the NAND which is similar
> > to the default kernel layout (altough we are using the
> > hardware ECC generator to make our ECC calculations).
> > 
> > Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> > 

[snip]
> >  
> > -		nmtd->scan_res = nand_scan(&nmtd->mtd, (sets) ? sets->nr_chips : 1);
> > +		nmtd->scan_res = nand_scan_ident(&nmtd->mtd,
> > +						 (sets) ? sets->nr_chips : 1);
> >  
> >  		if (nmtd->scan_res == 0) {
> > +			s3c2410_nand_update_chip(info, nmtd);
> > +			nand_scan_tail(&nmtd->mtd);
> >  			s3c2410_nand_add_partition(info, nmtd, sets);
> >  		}
> Shouldn't nand_scan_ident and nand_scan_tail be used here ?

Sorry, do you mean that they should be used here (and they are
being used in this code) or do you mean that you do not think
that these two are to be used here?

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
