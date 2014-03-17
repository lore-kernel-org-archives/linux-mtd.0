Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPago-0000EX-9N
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 16:47:03 +0000
Received: by mail-pb0-f48.google.com with SMTP id md12so5936494pbc.35
 for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2014 09:46:39 -0700 (PDT)
Date: Mon, 17 Mar 2014 09:46:35 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140317164635.GX31517@norris-Latitude-E6410>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20140312080605.GB30808@shlinux2.ap.freescale.net>
 <20140313045519.GP31517@norris-Latitude-E6410>
 <20140313080426.GA19311@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140313080426.GA19311@shlinux2.ap.freescale.net>
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

On Thu, Mar 13, 2014 at 04:04:27PM +0800, Huang Shijie wrote:
> On Wed, Mar 12, 2014 at 09:55:19PM -0700, Brian Norris wrote:
> > On Wed, Mar 12, 2014 at 04:06:07PM +0800, Huang Shijie wrote:
> > > On Tue, Mar 11, 2014 at 02:11:51AM -0700, Brian Norris wrote:
> > > > +	/* Check each ECC step individually */
> > > > +	for (i = 0; i < chip->ecc.steps; i++) {
> > 
> > [...]
> > 
> > > The gpmi uses a NAND layout like this:
> > > 
> > > 	 *    +---+----------+-+----------+-+----------+-+----------+-+
> > > 	 *    | M |   data   |E|   data   |E|   data   |E|   data   |E|
> > > 	 *    +---+----------+-+----------+-+----------+-+----------+-+
> > > 
> > >         M : The metadata, which is 10 by default.	 
> > >  	E : The ECC parity for "data" or "data + M".
> > > 
> > > If you want to count each sector, it makes the code very complicated. :(
> > 
> > I see. That does make things complicated.
> > 
> > But I'm curious: why does GPMI's ecc.read_page_raw() implementation (the
> > default) have to give such a different data/spare layout than its
> > ecc.read_page() implementation? There seems to be no benefit to this,
> > except that it means gpmi-nand doesn't have to implement its own
> > read_page_raw() callback...
> 
> The raw data of the NAND is like the diagram above.
> 
> Do you mean i should implement the ecc.read_page_raw to read out all
> the "data"s in the diagram above, and concatenate them together? 

Yes, that is essentially what I'm suggesting. Is there a good reason to
have ecc.read_page() and ecc.read_page_raw() look so different to the
caller? Is it important to see the data exactly as it lays on the flash,
rather than concatenated to how the driver/hardware interprets it?

> What is the "raw" data meaning? I feel confused now.

I did not know there was such a confusion. I simply read this:

 * @read_page_raw:      function to read a raw page without ECC

and I assumed it meant that read_page_raw() was the same as read_page(),
except that there would be no *correction* done on the data. I didn't
previously think too hard about what it should look like for HW ECC that
requires shifting/concatenating data around.

> > Look, for instance, at nand_base's nand_read_page_raw_syndrome(). It
> > actually bothers to untangle a layout like yours and place it into the
> > appropriate places in the data and OOB buffers. I think this is the
> > ideal implementation for read_page_raw(), at which point my patch makes
> > more sense; all NAND drivers should have a (reasonably) similar layout
> > when viewed from nand_base, without any mixed data/OOB striping like in
> > your diagram.
> We'd better add more comment in the:
>  * @read_page_raw:	function to read a raw page without ECC
> 
> Make it clear that the @read_oob_raw read out the data which do not contain
> the ECC parity. 

No, that's not the point; the ECC parity data should still be read out
from the flash, and IMO, they should be placed in the same location as
with read_page(). They just shouldn't be used for correction. How about
this?

 * @read_page_raw:	function to read a page without correcting for
			bitflips

> > Side topic: did you plan on looking at this FIXME in gpmi-nand.c?
> > 
> >  * FIXME: The following paragraph is incorrect, now that there exist
> >  * ecc.read_oob_raw and ecc.write_oob_raw functions.
> > 
> I should remove these stale comments.
> 
> > It might be worth addressing at the same time, since the stale comments
> > near the FIXME talk about a difference between a raw and an ECC-based
> > "view" of the page. IMO, there should be no difference between these
> The difference is caused by the block marker swap. That is maybe a different
> topic from this one.

OK.

> > types of "view", if at all possible. The only difference should be that
> > one tries to apply ECC and the other doesn't.

[...]

> > saying erased-page checks and read-retry would be mutually exclusive. I
> > believe that is wrong. In fact, they may *both* be required; we should
> 
> yes, that is what i meant. they both are required.
> But could we find a way to know that it is _NOT_ an erased-page-ECC-fail?

Yes, I think there are a few small optimizations that Pekon has brought
up, for instance, that wouldn't be too complex and could help to quickly
rule out data which is not an erased-page failure.

> > first check if the ECC failure was just an erased page, and if not, we
> > should retry the page.
> My pseudocode code is not accurate enough.
> Maybe it should like this:
>                     if (is_NOT_an_erase_page_failure()) {
> 			    do the read-retry;
> 		    } else {
> 			   if (check_erase_page_ok())
> 				   /* nothing */;
> 			   else
> 				do the read-retry;
> 		    }

This logic is just a convoluted way of saying we should add a
short-circuit path for quickly detecting "this is not an erased page"
into the "check_erase_page_ok()" routine. I think this could be covered
by doing a bitflip count (with an early-exit path) on the original
buffer, before reading out the full raw page again to do the full check.
I'm not sure what other generic options we have.

I'll look at sending a v2 patch soon. Pekon already sent his own
modifications which address some of this.

Brian
