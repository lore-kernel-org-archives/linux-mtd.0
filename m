Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VcDoF-00069o-Cz
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 12:26:40 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 4/5] mtd: m25p80: remove M25PXX_USE_FAST_READ Kconfig
Date: Fri, 1 Nov 2013 13:26:15 +0100
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <201310311021.42620.marex@denx.de>
 <20131031145520.GA4700@norris.computersforpeace.net>
In-Reply-To: <20131031145520.GA4700@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201311011326.15201.marex@denx.de>
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

Hi Brian,

> Hi Marek,
> 
> On Thu, Oct 31, 2013 at 10:21:42AM +0100, Marek Vasut wrote:
> > Dear Brian Norris,
> > 
> > > On Sun, Oct 27, 2013 at 05:32:42PM +0100, Marek Vasut wrote:
> > > > Hi Brian,
> > > > 
> > > > > Remove the compile-time option for FAST_READ, since we have
> > > > > run-time support for detecting it.
> > > > > 
> > > > > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > > > > ---
> > > > > 
> > > > >  drivers/mtd/devices/Kconfig  |  7 -------
> > > > >  drivers/mtd/devices/m25p80.c | 11 ++++++-----
> > > > >  2 files changed, 6 insertions(+), 12 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/mtd/devices/m25p80.c
> > > > > b/drivers/mtd/devices/m25p80.c index 7e3ec7a..d6c5c57 100644
> > > > > --- a/drivers/mtd/devices/m25p80.c
> > > > > +++ b/drivers/mtd/devices/m25p80.c
> > > > > @@ -1055,13 +1055,14 @@ static int m25p_probe(struct spi_device
> > > > > *spi)
> > > > > 
> > > > >  	flash->page_size = info->page_size;
> > > > >  	flash->mtd.writebufsize = flash->page_size;
> > > > > 
> > > > > -	flash->fast_read = false;
> > > > > -	if (np && of_property_read_bool(np, "m25p,fast-read"))
> > > > > +	if (np)
> > > > > +		/* If we were instantiated by DT, use it */
> > > > > +		flash->fast_read = of_property_read_bool(np, "m25p,fast-
read");
> > > > > +	else
> > > > > +		/* If we weren't instantiated by DT, default to fast-
read */
> > > > > 
> > > > >  		flash->fast_read = true;
> > > > 
> > > > We should default to FALSE , unless explicitly requested by DT, am I
> > > > wrong? Otherwise this might break the old chips.
> > > 
> > > I believe my patch is simply a refactoring of the existing code with
> > > the assumption that M25PXX_USE_FAST_READ=y.
> 
> Ah, my statement was wrong: for DT-instantiated devices, my patch
> "defaulted" as if M25PXX_USE_FAST_READ=n; for devices without a DT node,
> it defaulted as if M25PXX_USE_FAST_READ=y.

I'd say old devices (which are not DT capable even) might actually be less able 
to support the FAST READ opcode. But I think we're reaching a point where we 
cannot clearly tell and either way we will break some devices here. If that's 
the case, let's do it ;-)

> > > (In my experience, everyone has
> > > it set to y. Perhaps I'm wrong.)
> > 
> > OK, this is where we diverged. I always set FAST_READ to =n and only
> > enabled it via this DT prop if I was dead sure the chip could do it.
> 
> Right, that actually makes sense, and your mode is not affected by my
> patch. For DT-enabled devices, we default to the DT property.
> 
> The only mode that has less flexibility is for platform devices
> (non-DT), where we only use normal read for devices that can't handle
> FAST READ.

And there we should disable it by default to play safe, no ?

> > > Now, it's unclear to me what this Kconfig was used for. It's the wrong
> > > approach for controlling fast read on a per-controller or
> > > per-flash-device basis, as it provides a blunt hammer to disable it for
> > > ALL systems which might use the same kernel (think multiplatform
> > > kernels). And now we have a better alternative: the M25P_NO_FR flag for
> > > flash which do not support fast-read.
> > 
> > This Kconfig was entirely wrong. I suspect it was there from the old
> > times to force-enable the fast read and was meant for simple systems
> > with one SPI NOR. Multiplatform kernels weren't taken into consideration
> > here, the thing was added 5 years ago.
> 
> Sure, I agree.
> 
> > commit 2230b76b3838a37167f80487c694d8691248da9f
> > Date:   Fri Apr 25 12:07:32 2008 +0800
> > 
> >     [MTD] m25p80: add FAST_READ access support to M25Pxx
> > > 
> > > However, if we come across SPI controllers which can't handle this,
> > > then we might have a problem. Such a situation would really suggest
> > > that we need to identify whether a SPI controller supports fast-read,
> > > not just the flash device.
> > 
> > The FAST_READ is entirely flash-device thing, it has nothing to do with
> > the controller. I wonder why there's this 50 MHz limit in the kernel
> > config at all.
> 
> I have a Spansion S25FL128S datasheet which says:
> 
>   "The maximum operating clock frequency for the READ command is 50
>   MHz."
> 
> And:
> 
>   "The maximum operating clock frequency for FAST READ command is 133
>   MHz."
> 
> But this does suggest, as you say, that the controller provides no
> limitation on using FAST READ. However, the extra dummy cycles would be
> a *slight* penalty for using FAST READ instead of (normal) READ when run
> at a frequency under which either would suffice. But this likely isn't a
> significant problem.

Certainly. All we need to know is whether or not does the chip support FAST READ 
and if so, we can use it.

> > My understanding of FAST_READ is that after you send FAST_READ opcode,
> > you can read all you want until CS is toggled, only then you can send
> > another opcode. The "slow" READ opcode on the other hand has to be sent
> > for each block.
> 
> As Sourav said in his response, I don't believe this is true. AIUI, the
> only differences are the dummy cycles and the maximum clock frequency.

Aka. "slow" READ can also read as many bytes as seen fit ?

> > > (Side note: IMO, given the fact that we have to have an ID table for
> > > these flash anyway, the DT property simply provides redundant
> > > information.
> > 
> > Side note: I wonder how we should handle exotic chips like the N25Q256A
> > which recycle the ID for different chips with different capabilities
> > though. We might need to have some DT props.
> 
> Cross that bridge when/if we come to it, I guess? :) Do you know of any
> current problems with this device?

This particular one? Not in this context, but there are many otherwise.

> > > In the case of the quad-read patch, we were able to
> > > identify this early to avoid an unnecessary DT binding. But in this
> > > case, we also have an indication of controller support for quad I/O...)
> > 
> > Yes. I see your point why the fast-read might be redundant.
> > 
> > > If you still object to this patch, I can drop the patch from l2-mtd.git
> > > for now. Then Sourav will need to rebase his patch again.
> 
> So what do you think? I feel like my current patch is the right way to
> go, but I think I could update the description to be more verbose, since
> there are obviously a few other issues coming into play here.

Yes, I won't hold it any longer. If someone complains, we will know where the 
wind blows from anyway and then we can fix his platform properly.
