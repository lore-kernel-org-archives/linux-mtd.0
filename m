Received: from smtp115.sbc.mail.sp1.yahoo.com ([69.147.64.88])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KrpkS-000667-OQ
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 08:04:21 +0000
From: David Brownell <david-b@pacbell.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: goofy mtd m25p80 patches in GIT ...
Date: Mon, 20 Oct 2008 01:04:17 -0700
References: <200810191535.05617.david-b@pacbell.net>
	<1224488403.6770.1517.camel@macbook.infradead.org>
In-Reply-To: <1224488403.6770.1517.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200810200104.18112.david-b@pacbell.net>
Cc: Chen Gong <g.chen@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 20 October 2008, David Woodhouse wrote:
> On Sun, 2008-10-19 at 15:35 -0700, David Brownell wrote:
> > [resend cc'ing linux-mtd, sorry]
> > 
> > I noticed a couple goofy patches in MTD GIT, while poking around
> > wondering what happened to some patches that I expected would
> > already have gotten upstream.  Details below.
> 
> Did you find the patches you expected to be going upstream?

Yes, sorry to have not made that explicit.
The were the mtd_dataflash.c patches.

(And I'm hoping we'll see an MTD "pull" request
for 2.6.28-rc0 ... )


> 
> > First:
> > 
> >  http://git.kernel.org/?p=linux/kernel/git/dwmw2/mtd-2.6.git;a=commitdiff;h=faff37508a104e9ec5285d5adecaab7e8dde472a
> > 
> > That patch is goofy because the command in question is *NOT* a block
> > erase command.  It's a chip-erase command ... entirely unlike the
> > existing *real* block erase commands used in the driver.
> > 
> > Could we get a fix that provides the correct name for the operations?
> > Having real block commands, and this new thing, is at the very least
> > confusing...
> 
> Makes sense. Chen Gong?
> 
> > 
> > Second:
> > 
> >  http://git.kernel.org/?p=linux/kernel/git/dwmw2/mtd-2.6.git;a=commitdiff;h=75d0ee2202b5740e94e913d8a52f91c6557c4c81
> > 
> > That's just plain wrong ... the original code is correct, but the
> > patch changed it to be incorrect.  (DMA from the stack is never
> > legal.)
> 
> Ah, so spi_write() uses DMA, but spi_write_then_read() does not? 
> Not entirely intuitive :)

Maybe not ... but documented.
(More info in response to Chen Gong.)


> 
> -- 
> David Woodhouse                            Open Source Technology Centre
> David.Woodhouse@intel.com                              Intel Corporation
> 
> 
