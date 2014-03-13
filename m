Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WO1Nm-00081M-E8
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 08:52:55 +0000
Date: Thu, 13 Mar 2014 16:04:27 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140313080426.GA19311@shlinux2.ap.freescale.net>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20140312080605.GB30808@shlinux2.ap.freescale.net>
 <20140313045519.GP31517@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20140313045519.GP31517@norris-Latitude-E6410>
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 12, 2014 at 09:55:19PM -0700, Brian Norris wrote:
> Hi Huang,
> 
> On Wed, Mar 12, 2014 at 04:06:07PM +0800, Huang Shijie wrote:
> > On Tue, Mar 11, 2014 at 02:11:51AM -0700, Brian Norris wrote:
> > > +	/* Check each ECC step individually */
> > > +	for (i = 0; i < chip->ecc.steps; i++) {
> 
> [...]
> 
> > The gpmi uses a NAND layout like this:
> > 
> > 	 *    +---+----------+-+----------+-+----------+-+----------+-+
> > 	 *    | M |   data   |E|   data   |E|   data   |E|   data   |E|
> > 	 *    +---+----------+-+----------+-+----------+-+----------+-+
> > 
> >         M : The metadata, which is 10 by default.	 
> >  	E : The ECC parity for "data" or "data + M".
> > 
> > If you want to count each sector, it makes the code very complicated. :(
> 
> I see. That does make things complicated.
> 
> But I'm curious: why does GPMI's ecc.read_page_raw() implementation (the
> default) have to give such a different data/spare layout than its
> ecc.read_page() implementation? There seems to be no benefit to this,
> except that it means gpmi-nand doesn't have to implement its own
> read_page_raw() callback...

The raw data of the NAND is like the diagram above.

Do you mean i should implement the ecc.read_page_raw to read out all
the "data"s in the diagram above, and concatenate them together? 

What is the "raw" data meaning? I feel confused now.


> 
> Look, for instance, at nand_base's nand_read_page_raw_syndrome(). It
> actually bothers to untangle a layout like yours and place it into the
> appropriate places in the data and OOB buffers. I think this is the
> ideal implementation for read_page_raw(), at which point my patch makes
> more sense; all NAND drivers should have a (reasonably) similar layout
> when viewed from nand_base, without any mixed data/OOB striping like in
> your diagram.
We'd better add more comment in the:
 * @read_page_raw:	function to read a raw page without ECC

Make it clear that the @read_oob_raw read out the data which do not contain
the ECC parity. 

> 
> Side topic: did you plan on looking at this FIXME in gpmi-nand.c?
> 
>  * FIXME: The following paragraph is incorrect, now that there exist
>  * ecc.read_oob_raw and ecc.write_oob_raw functions.
> 
I should remove these stale comments.

> It might be worth addressing at the same time, since the stale comments
> near the FIXME talk about a difference between a raw and an ECC-based
> "view" of the page. IMO, there should be no difference between these
The difference is caused by the block marker swap. That is maybe a different
topic from this one.

> types of "view", if at all possible. The only difference should be that
> one tries to apply ECC and the other doesn't.
> 
> > > @@ -1554,6 +1610,18 @@ read_retry:
> > >  				break;
> > >  			}
> > >  
> > > +			/* Check an ECC error for 0xff + bitflips? */
> > > +			if ((chip->options & NAND_ECC_NEED_CHECK_FF) &&
> > > +					mtd->ecc_stats.failed - ecc_failures) {
> > > +				ret = nand_verify_erased_page(mtd, bufpoi,
> > > +						page);
> > I think we can merge this code into the read-retry check like:
> 
> There's some very specific ordering requirements for some of the steps,
> so we'd have to be careful about moving this code downward (max_bitflips
> checks; the !aligned buffer copy; nand_transfer_oob()). I'm not sure
> your suggestion is possible. And now that I mention it, I think the
> NAND_NEED_READRDY check might already be a bit misplaced in my patch...

okay.


> 
> > 	---------------------------------------------
> > 			if (mtd->ecc_stats.failed - ecc_failures) {
> > 
> > 				// step 1: count the bitflips, assume N.
> > 				N = bitflips_count();
> > 				// step 2:  
> > 				if (N < ecc_strength) {
> > 					do the erase-page-check;
> > 				} else
> > 					do the read-retry.
> 
> I'm not 100% clear on the pseudocode here, but it looks like you're
> saying erased-page checks and read-retry would be mutually exclusive. I
> believe that is wrong. In fact, they may *both* be required; we should

yes, that is what i meant. they both are required.
But could we find a way to know that it is _NOT_ an erased-page-ECC-fail?

> first check if the ECC failure was just an erased page, and if not, we
> should retry the page.
My pseudocode code is not accurate enough.
Maybe it should like this:
                    if (is_NOT_an_erase_page_failure()) {
			    do the read-retry;
		    } else {
			   if (check_erase_page_ok())
				   /* nothing */;
			   else
				do the read-retry;
		    }

thanks
Huang Shijie
