Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPaH9-0007wq-K7
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 16:20:32 +0000
Received: by mail-pb0-f50.google.com with SMTP id md12so5878321pbc.37
 for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2014 09:20:07 -0700 (PDT)
Date: Mon, 17 Mar 2014 09:20:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V4] mtd: gpmi: fix the bitflips for erased page
Message-ID: <20140317162000.GW31517@norris-Latitude-E6410>
References: <1389602838-25212-1-git-send-email-b32955@freescale.com>
 <20140308033238.GD5232@ld-irv-0074>
 <20140312072654.GA30808@shlinux2.ap.freescale.net>
 <20140313054118.GR31517@norris-Latitude-E6410>
 <20140313071223.GA7807@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140313071223.GA7807@shlinux2.ap.freescale.net>
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

On Thu, Mar 13, 2014 at 03:12:59PM +0800, Huang Shijie wrote:
> On Wed, Mar 12, 2014 at 10:41:18PM -0700, Brian Norris wrote:
> > On Wed, Mar 12, 2014 at 03:26:57PM +0800, Huang Shijie wrote:
> > > On Fri, Mar 07, 2014 at 07:32:38PM -0800, Brian Norris wrote:
> > > > > 
> > > > > This patch does a check for the uncorrectable failure in the following steps:
> > > > > 
> > > > >    [0] set the threshold.
> > > > >        The threshold is set based on the truth:
> > > > >          "A single 0 bit will lead to gf_len(13 or 14) bits 0 after the BCH
> > > > >           do the ECC."
> > > > > 
> > > > >        For the sake of safe, we will set the threshold with half the gf_len, and
> > > > >        do not make it bigger the ECC strength.
> > > > 
> > > > This threshold looks wrong here.
> > > 
> > > I shrink the threshold on purpose. The ECC strength can be 40 some times.
> > 
> > I see. I suppose the threshold could be smaller, but I definitely
> > believe it should be correlated with the ECC strength, not just capped
> > at 6 or 7.
> 
> could you suggest a better threshold? I am not confident to use the
> ECC strength. 

I am fairly convinced it should be correlated with the ECC strength, but
I'm flexible on the specifics. Maybe:

	max(ecc_strength / 2, 1)

?

> > > > > +
> > > > > +	/* Count the bitflips for the no ECC buffer */
> > > > > +	for (i = 0; i < mtd->writesize / 8; i++) {
> > 
> > I believe I misread this loop the first time; you're not actually
> > checking the entire page.
> > 
> > Why divide by 8?
> I use the hweight64 here.

I see. I was right the first time...

> > > > > +		flip_bits_noecc += hweight64(~buf[i]);
> > > > > +		if (flip_bits_noecc > threshold)
> > > > > +			return false;
> > > > > +	}

Brian
