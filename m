Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNxnU-0004Ff-PK
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 05:03:13 +0000
Received: by mail-pd0-f169.google.com with SMTP id fp1so547134pdb.14
 for <linux-mtd@lists.infradead.org>; Wed, 12 Mar 2014 22:02:49 -0700 (PDT)
Date: Wed, 12 Mar 2014 21:55:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140313045519.GP31517@norris-Latitude-E6410>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20140312080605.GB30808@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140312080605.GB30808@shlinux2.ap.freescale.net>
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

Hi Huang,

On Wed, Mar 12, 2014 at 04:06:07PM +0800, Huang Shijie wrote:
> On Tue, Mar 11, 2014 at 02:11:51AM -0700, Brian Norris wrote:
> > +	/* Check each ECC step individually */
> > +	for (i = 0; i < chip->ecc.steps; i++) {

[...]

> The gpmi uses a NAND layout like this:
> 
> 	 *    +---+----------+-+----------+-+----------+-+----------+-+
> 	 *    | M |   data   |E|   data   |E|   data   |E|   data   |E|
> 	 *    +---+----------+-+----------+-+----------+-+----------+-+
> 
>         M : The metadata, which is 10 by default.	 
>  	E : The ECC parity for "data" or "data + M".
> 
> If you want to count each sector, it makes the code very complicated. :(

I see. That does make things complicated.

But I'm curious: why does GPMI's ecc.read_page_raw() implementation (the
default) have to give such a different data/spare layout than its
ecc.read_page() implementation? There seems to be no benefit to this,
except that it means gpmi-nand doesn't have to implement its own
read_page_raw() callback...

Look, for instance, at nand_base's nand_read_page_raw_syndrome(). It
actually bothers to untangle a layout like yours and place it into the
appropriate places in the data and OOB buffers. I think this is the
ideal implementation for read_page_raw(), at which point my patch makes
more sense; all NAND drivers should have a (reasonably) similar layout
when viewed from nand_base, without any mixed data/OOB striping like in
your diagram.

Side topic: did you plan on looking at this FIXME in gpmi-nand.c?

 * FIXME: The following paragraph is incorrect, now that there exist
 * ecc.read_oob_raw and ecc.write_oob_raw functions.

It might be worth addressing at the same time, since the stale comments
near the FIXME talk about a difference between a raw and an ECC-based
"view" of the page. IMO, there should be no difference between these
types of "view", if at all possible. The only difference should be that
one tries to apply ECC and the other doesn't.

> > @@ -1554,6 +1610,18 @@ read_retry:
> >  				break;
> >  			}
> >  
> > +			/* Check an ECC error for 0xff + bitflips? */
> > +			if ((chip->options & NAND_ECC_NEED_CHECK_FF) &&
> > +					mtd->ecc_stats.failed - ecc_failures) {
> > +				ret = nand_verify_erased_page(mtd, bufpoi,
> > +						page);
> I think we can merge this code into the read-retry check like:

There's some very specific ordering requirements for some of the steps,
so we'd have to be careful about moving this code downward (max_bitflips
checks; the !aligned buffer copy; nand_transfer_oob()). I'm not sure
your suggestion is possible. And now that I mention it, I think the
NAND_NEED_READRDY check might already be a bit misplaced in my patch...

> 	---------------------------------------------
> 			if (mtd->ecc_stats.failed - ecc_failures) {
> 
> 				// step 1: count the bitflips, assume N.
> 				N = bitflips_count();
> 				// step 2:  
> 				if (N < ecc_strength) {
> 					do the erase-page-check;
> 				} else
> 					do the read-retry.

I'm not 100% clear on the pseudocode here, but it looks like you're
saying erased-page checks and read-retry would be mutually exclusive. I
believe that is wrong. In fact, they may *both* be required; we should
first check if the ECC failure was just an erased page, and if not, we
should retry the page.

> 
> 
> 				if (retry_mode + 1 <= chip->read_retries) {
> 					retry_mode++;
> 					ret = nand_setup_read_retry(mtd,
> 							retry_mode);
> 					if (ret < 0)
> 						break;
> 
> 					/* Reset failures; retry */
> 					mtd->ecc_stats.failed = ecc_failures;
> 					goto read_retry;
> 				} else {
> 					/* No more retry modes; real failure */
> 					ecc_fail = true;
> 				}
> 			}
> 	---------------------------------------------

Brian
