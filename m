Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WO0Zp-0006wF-4Z
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 08:01:18 +0000
Date: Thu, 13 Mar 2014 15:12:59 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V4] mtd: gpmi: fix the bitflips for erased page
Message-ID: <20140313071223.GA7807@shlinux2.ap.freescale.net>
References: <1389602838-25212-1-git-send-email-b32955@freescale.com>
 <20140308033238.GD5232@ld-irv-0074>
 <20140312072654.GA30808@shlinux2.ap.freescale.net>
 <20140313054118.GR31517@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20140313054118.GR31517@norris-Latitude-E6410>
Cc: eliedebrauwer@gmail.com, bpringlemeir@nbsps.com,
 Vikram.Narayanan@in.bosch.com, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 12, 2014 at 10:41:18PM -0700, Brian Norris wrote:
> On Wed, Mar 12, 2014 at 03:26:57PM +0800, Huang Shijie wrote:
> > On Fri, Mar 07, 2014 at 07:32:38PM -0800, Brian Norris wrote:
> > > > 
> > > > This patch does a check for the uncorrectable failure in the following steps:
> > > > 
> > > >    [0] set the threshold.
> > > >        The threshold is set based on the truth:
> > > >          "A single 0 bit will lead to gf_len(13 or 14) bits 0 after the BCH
> > > >           do the ECC."
> > > > 
> > > >        For the sake of safe, we will set the threshold with half the gf_len, and
> > > >        do not make it bigger the ECC strength.
> > > 
> > > This threshold looks wrong here.
> > 
> > I shrink the threshold on purpose. The ECC strength can be 40 some times.
> 
> I see. I suppose the threshold could be smaller, but I definitely
> believe it should be correlated with the ECC strength, not just capped
> at 6 or 7.

could you suggest a better threshold? I am not confident to use the
ECC strength. 


> > > > +
> > > > +	/* Count the bitflips for the no ECC buffer */
> > > > +	for (i = 0; i < mtd->writesize / 8; i++) {
> 
> I believe I misread this loop the first time; you're not actually
> checking the entire page.
> 
> Why divide by 8?
I use the hweight64 here.

> 
> > > > +		flip_bits_noecc += hweight64(~buf[i]);
> > > > +		if (flip_bits_noecc > threshold)
> > > > +			return false;
> > > > +	}
> > > 
> > > ^^^ this loop should be broken up into sectors, so that you actually
> > > count max_bitflips per sector, not for the whole page.
> > count the max_bitflips per sector make the code more complicated.
> 
> It's only prohibitively complex because your 'raw' layout is so much
> different than your 'read with ECC' layout. If your driver conformed to
The gpmi uses the HW ECC, not software ECC. So the raw layout is a 
a little strange.



> > > > +
> > > > +	/* Tell the upper layer the bitflips we corrected. */
> > > > +	mtd->ecc_stats.corrected += flip_bits;
> > > > +	*max_bitflips = max_t(unsigned int, *max_bitflips, flip_bits);
> > > 
> > > This is wrong. You don't want to use the existing *max_bitflips value
> > > from the previous read (remember, you're re-reading the data). You
> > > should be doing a max() over each sector in the raw page, as mentioned
> > > above.
> > yes, I just tell the upper layer the max_bitflips for the ECC read, not the
> > raw read.
> 
> If you're at this point, then you have a mostly-0xff page anyway, and
> *max_bitflips should already be 0 (since your BCH can't correct such a
> page), so that's not a big deal I guess. But it still doesn't make sense
> to use the old value, if you're counting the bitflips yourself.
ok, i agree to use the new bitflips from the raw data now.

thanks
Huang Shijie
