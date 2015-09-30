Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhPDC-0002qS-3s
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 21:47:10 +0000
Received: by pacex6 with SMTP id ex6so52104512pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 14:46:33 -0700 (PDT)
Date: Wed, 30 Sep 2015 14:46:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH 1/5] mtd: nand: lpc32xx_slc: fix calculation of timing
 arcs from given values
Message-ID: <20150930214631.GM143959@google.com>
References: <1443458338-23552-1-git-send-email-vz@mleia.com>
 <20150930211253.GK143959@google.com> <560C5185.5050106@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <560C5185.5050106@mleia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 01, 2015 at 12:17:57AM +0300, Vladimir Zapolskiy wrote:
> Hi Brian,
> 
> On 01.10.2015 00:12, Brian Norris wrote:
> > + Roland, who authored the driver
> > 
> > On Mon, Sep 28, 2015 at 07:38:58PM +0300, Vladimir Zapolskiy wrote:
> >> According to LPC32xx User's Manual all values measured in clock cycles
> >> are programmable from 1 to 16 clocks (4 bits) starting from 0 in
> >> bitfield. Correctness of 0 bitfield value (i.e. programmed 1 clock
> >> timing) is proven with actual NAND chip devices.
> >>
> >> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> >> ---
> >>  drivers/mtd/nand/lpc32xx_slc.c | 12 ++++++------
> >>  1 file changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
> >> index abfec13..5a3c6e0 100644
> >> --- a/drivers/mtd/nand/lpc32xx_slc.c
> >> +++ b/drivers/mtd/nand/lpc32xx_slc.c
> >> @@ -240,13 +240,13 @@ static void lpc32xx_nand_setup(struct lpc32xx_nand_host *host)
> >>  
> >>  	/* Compute clock setup values */
> >>  	tmp = SLCTAC_WDR(host->ncfg->wdr_clks) |
> >> -		SLCTAC_WWIDTH(1 + (clkrate / host->ncfg->wwidth)) |
> >> -		SLCTAC_WHOLD(1 + (clkrate / host->ncfg->whold)) |
> >> -		SLCTAC_WSETUP(1 + (clkrate / host->ncfg->wsetup)) |
> >> +		SLCTAC_WWIDTH(clkrate / host->ncfg->wwidth) |
> >> +		SLCTAC_WHOLD(clkrate / host->ncfg->whold) |
> >> +		SLCTAC_WSETUP(clkrate / host->ncfg->wsetup) |
> >>  		SLCTAC_RDR(host->ncfg->rdr_clks) |
> >> -		SLCTAC_RWIDTH(1 + (clkrate / host->ncfg->rwidth)) |
> >> -		SLCTAC_RHOLD(1 + (clkrate / host->ncfg->rhold)) |
> >> -		SLCTAC_RSETUP(1 + (clkrate / host->ncfg->rsetup));
> >> +		SLCTAC_RWIDTH(clkrate / host->ncfg->rwidth) |
> >> +		SLCTAC_RHOLD(clkrate / host->ncfg->rhold) |
> >> +		SLCTAC_RSETUP(clkrate / host->ncfg->rsetup);
> >>  	writel(tmp, SLC_TAC(host->io_base));
> >>  }
> >>  
> > 
> > Hmm, I'm guessing this was done to ensure we didn't round down too much.
> > Perhaps this should be using DIV_ROUND_UP() instead, so we can get an
> > exact match where possible, but not set too low of a clock rate by
> > rounding down?
> 
> unfortunately bare DIV_ROUND_UP() can not help here, because 0 is a
> valid resulting bitfield value here, if some timing is lower than clkrate.

OK, so if I understand it correctly, you're saying that 0 means 1
period, 1 means 2 periods, etc.? Then I guess your patch would be OK but
still conservative. I can take it, if you'd like. I'd like an ack from
Roland if possible though.

According to my reading, you still look convservative for some clock
rates. What if clock rate is exactly divisible by W_WIDTH, for instance?
Then you have:

  clkrate / wwidth = X periods

But programming a value of "X" would mean "X + 1" periods, which is 1
too much.

Maybe you actually need something like this?

	tmp = SLCTAC_WDR(DIV_ROUND_UP(clkrate, host->ncfg->wwidth) - 1) | 
		...;

Brian
