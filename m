Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdXSW-0006UU-GF
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 03:37:41 +0000
Received: by mail-ie0-f175.google.com with SMTP id aq17so13750064iec.20
 for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2013 19:37:17 -0800 (PST)
Date: Mon, 4 Nov 2013 19:37:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 4/5] mtd: m25p80: remove M25PXX_USE_FAST_READ Kconfig
Message-ID: <20131105033713.GK20061@ld-irv-0074.broadcom.com>
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <201310311021.42620.marex@denx.de>
 <20131031145520.GA4700@norris.computersforpeace.net>
 <201311011326.15201.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201311011326.15201.marex@denx.de>
Cc: sourav.poddar@ti.com, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On Fri, Nov 01, 2013 at 01:26:15PM +0100, Marek Vasut wrote:
> Hi Brian,
> 
> > Hi Marek,
> > 
> > On Thu, Oct 31, 2013 at 10:21:42AM +0100, Marek Vasut wrote:
> > > Dear Brian Norris,
> > > 
> > > > On Sun, Oct 27, 2013 at 05:32:42PM +0100, Marek Vasut wrote:
> > > > > Hi Brian,
> > > > > 
> > > > > > --- a/drivers/mtd/devices/m25p80.c
> > > > > > +++ b/drivers/mtd/devices/m25p80.c
> > > > > > @@ -1055,13 +1055,14 @@ static int m25p_probe(struct spi_device *spi)
> > > > > > 
> > > > > >  	flash->page_size = info->page_size;
> > > > > >  	flash->mtd.writebufsize = flash->page_size;
> > > > > > 
> > > > > > -	flash->fast_read = false;
> > > > > > -	if (np && of_property_read_bool(np, "m25p,fast-read"))
> > > > > > +	if (np)
> > > > > > +		/* If we were instantiated by DT, use it */
> > > > > > +		flash->fast_read = of_property_read_bool(np, "m25p,fast-read");
> > > > > > +	else
> > > > > > +		/* If we weren't instantiated by DT, default to fast-read */
> > > > > > 
> > > > > >  		flash->fast_read = true;
> > > > > 
> > > > > We should default to FALSE , unless explicitly requested by DT, am I
> > > > > wrong? Otherwise this might break the old chips.
> > > > 
> > > > I believe my patch is simply a refactoring of the existing code with
> > > > the assumption that M25PXX_USE_FAST_READ=y.
> > 
> > Ah, my statement was wrong: for DT-instantiated devices, my patch
> > "defaulted" as if M25PXX_USE_FAST_READ=n; for devices without a DT node,
> > it defaulted as if M25PXX_USE_FAST_READ=y.
> 
> I'd say old devices (which are not DT capable even) might actually be less able 
> to support the FAST READ opcode. But I think we're reaching a point where we 
> cannot clearly tell and either way we will break some devices here. If that's 
> the case, let's do it ;-)

I agree, let's just do it.

> > > > (In my experience, everyone has
> > > > it set to y. Perhaps I'm wrong.)
> > > 
> > > OK, this is where we diverged. I always set FAST_READ to =n and only
> > > enabled it via this DT prop if I was dead sure the chip could do it.
> > 
> > Right, that actually makes sense, and your mode is not affected by my
> > patch. For DT-enabled devices, we default to the DT property.
> > 
> > The only mode that has less flexibility is for platform devices
> > (non-DT), where we only use normal read for devices that can't handle
> > FAST READ.
> 
> And there we should disable it by default to play safe, no ?

Unless the device table M25P_NO_FR flag is imprecisely-used (which it
may be), I don't think we need a "play-it-safe" option here. The current
code seems to have the right level of precision.

> > > My understanding of FAST_READ is that after you send FAST_READ opcode,
> > > you can read all you want until CS is toggled, only then you can send
> > > another opcode. The "slow" READ opcode on the other hand has to be sent
> > > for each block.
> > 
> > As Sourav said in his response, I don't believe this is true. AIUI, the
> > only differences are the dummy cycles and the maximum clock frequency.
> 
> Aka. "slow" READ can also read as many bytes as seen fit ?

Yes, according to the data sheet I read.

> > > > If you still object to this patch, I can drop the patch from l2-mtd.git
> > > > for now. Then Sourav will need to rebase his patch again.
> > 
> > So what do you think? I feel like my current patch is the right way to
> > go, but I think I could update the description to be more verbose, since
> > there are obviously a few other issues coming into play here.
> 
> Yes, I won't hold it any longer. If someone complains, we will know where the 
> wind blows from anyway and then we can fix his platform properly.

Sounds good. I'm updating the commit to include the following
description (no code changes, so no need to rebase, Sourav):

------------------ BEGIN DESCRIPTION ------------------
Remove the compile-time option for FAST_READ, since we have run-time
support for detecting it. This refactors the logic for enabling
fast-read, such that for DT-enabled devices, we honor the 
"m25p,fast-read" property but for non-DT devices, we default to using 
FAST_READ whenever the flash device supports it according to our
m25p_ids[] table.

Normal READ and FAST_READ differ only in the following:

  * FAST_READ supports SPI higher clock frequencies [1]

  * number of dummy cycles; FAST_READ requires 8 dummy cycles (whereas 
    READ requires 0) to allow the flash sufficient setup time, even when
    running at higher clock speeds

Thus, for flash chips which support FAST_READ, there is otherwise no
limiting reason why we cannot use the FAST_READ opcode instead of READ.
It simply allows the SPI controller to run at higher clock rates. So 
theoretically, nobody should be needing the compile-time option anyway.

  [1] I have a Spansion S25FL128S datasheet which says:

    "The maximum operating clock frequency for the READ command is 50
    MHz."

  And:

    "The maximum operating clock frequency for FAST READ command is 133
    MHz."
-------------------- END DESCRIPTION ------------------

Brian
