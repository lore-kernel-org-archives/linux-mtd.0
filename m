Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OiE5B-0004KR-0D
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2010 22:11:06 +0000
Date: Sun, 8 Aug 2010 23:10:42 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 6/8] mxc_nand: fix correct_data function
Message-ID: <20100808221042.GE23623@n2100.arm.linux.org.uk>
References: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
	<1281102791-8089-7-git-send-email-s.hauer@pengutronix.de>
	<20100808081955.GB8687@n2100.arm.linux.org.uk>
	<20100808083244.GC21128@jasper.tkos.co.il>
	<20100808204341.GA20065@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100808204341.GA20065@pengutronix.de>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, Baruch Siach <baruch@tkos.co.il>,
	linux-mtd@lists.infradead.org, John Ogness <john.ogness@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 08, 2010 at 10:43:41PM +0200, Sascha Hauer wrote:
> On Sun, Aug 08, 2010 at 11:32:44AM +0300, Baruch Siach wrote:
> > Hi Russell,
> > 
> > On Sun, Aug 08, 2010 at 09:19:56AM +0100, Russell King - ARM Linux wrote:
> > > On Fri, Aug 06, 2010 at 03:53:09PM +0200, Sascha Hauer wrote:
> > > > +		err = ecc_stat & ecc_bit_mask;
> > > > +		if (err > err_limit) {
> > > > +			printk(KERN_WARNING "UnCorrectable RS-ECC Error\n");
> > > > +			return -1;
> > > 
> > > Someone's being lazy.
> > 
> > The code at nand_read_subpage() (drivers/mtd/nand/nand_base.c) expects the 
> > .correct callback to return -1 on an uncorrectable error:
> > 
> >                 stat = chip->ecc.correct(mtd, p, &chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
> >                 if (stat == -1)
> >                         mtd->ecc_stats.failed++;
> >                 else
> >                         mtd->ecc_stats.corrected += stat;
> 
> Then this should be changed to check for stat < 0. I found some drivers
> in the tree returning an errno value in their .correct function instead
> of -1.

That's the whole danger of the whole 'return -1' evilness in the kernel.
The long established convention in the kernel is that negative numbers
returned from functions are negative errno codes.

As soon as you decide that you want a function to return -1 to indicate
an error rather than a real errno code, you lose clarity on which
functions need '-1' and which are proper negative errno codes, and then
you end up with people returning negative errno codes for functions
which should be -1, and people returning -1 for functions which should
be negative errno codes.

If you want a function to return -1 for error, then it probably makes
sense to create a ECC_CORRECT_FAILED definition which happens to be -1.
Or some other number.  But don't use plain '-1' - it looks far too much
like "I was lazy, I couldn't be bothered to look up a proper errno."

We know full well that _lots_ of people submit stuff with 'return -1'
statements where they should be proper negative errno codes, so it's
something people are having a great deal of trouble with already.  Let's
not further confuse everyone by having functions expecting called methods
to do a plain "return -1;" on error.
