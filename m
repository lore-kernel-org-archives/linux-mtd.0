Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzNuO-0003Rd-Ow
 for linux-mtd@lists.infradead.org; Wed, 26 Oct 2016 13:06:24 +0000
Date: Wed, 26 Oct 2016 15:05:57 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
Message-ID: <20161026150557.587a7387@bbrezillon>
In-Reply-To: <alpine.DEB.2.02.1610261359290.9986@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
 <20160603162207.0688c9e6@bbrezillon>
 <alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com>
 <20160608175018.16c88207@bbrezillon>
 <alpine.DEB.2.02.1606101641050.30757@lnxricardw1.se.axis.com>
 <20160610175454.327f51a2@bbrezillon>
 <alpine.DEB.2.02.1610261152170.9986@lnxricardw1.se.axis.com>
 <20161026135241.63653c4f@bbrezillon>
 <alpine.DEB.2.02.1610261359290.9986@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 26 Oct 2016 14:31:53 +0200
Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:

> Hi Boris,
> 
> On Wed, 26 Oct 2016, Boris Brezillon wrote:
> 
> > On Wed, 26 Oct 2016 13:27:00 +0200
> > Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> >  
> > > > > 
> > > > > evatronix,onfi-timing-mode = <2>;
> > > > >     
> > > [ ... ]
> > > In our products, we use 1, 2 and 4 Gbit SLC NAND flashes, some of which 
> > > are ONFi complient and some not, depending on the manufacturer. For the 
> > > non-ONFi flashes, the ones which we have looked at and which we specify in 
> > > our products actually support ONFi mode 2. However, in practice, as part 
> > > of the nand_scan_ident() procedure, the chip->onfi_timing_mode_default 
> > > value is set to 0, because the EXTENDED_ID_NAND() macro used for these 
> > > flashes doesn't set the timing mode to anything else. There are some full 
> > > ID listings which apparently set a different timing mode for certain 
> > > flashes (such as Toshiba TC58NVG0S3E).
> > > 
> > > What I would like to have in the device tree, either as a general mtd or 
> > > proprietary property, is something like the above, possibly called 
> > > something like force-onfi-timing-mode, which forcibly sets the timing mode 
> > > of the hardware. When this property is not set, the timing mode used will 
> > > default to onfi_timing_mode_default for non-ONFi flashes, or 
> > > onfi_get_async_timing_mode() for ONFi flashes.  
> > 
> > I'm not against the addition of this onfi-timing-mode property, but not
> > for the same reason. Your NAND might be able to support a specific
> > timing mode, but for some reason, the board design prevents using this
> > mode (interferences on the DATA or CONTROL lines for example).
> > 
> > To me, this property would just serve as a limitation: if the chip
> > supports mode 5 but the board says that it supports up to mode 2, then
> > the implementation should stick to mode 2. ITOH, if the 5 is defined in
> > the DT, but the chip only supports up to mode 2, then mode 2 should be
> > used.  
> 
> Yes, I remember you had that suggestion back in June as well. That would 
> be more of a 'restrict-onfi-timing-mode' that sets the maximum speed to be 
> used. I can see the use of that too, but that's not what I'm talking about 
> here of course. Although the reason is the same: it sets up something that 
> cannot be determined by probing.
> 
> > > The reationale behind this is that it is impractical to list all specific 
> > > flash chips which actually support a given timing mode. Say another chip 
> > > comes out on the market either from an existing or a new manufacturer, 
> > > which correctly identifies itself using the ID bytes, but not using the 
> > > full ID. In order to support the speed of this device, we would need to 
> > > upgrade the kernel in the product. If we on the other hand have a hardware 
> > > specification that says that we only use flashes which support a certain 
> > > specified timing mode (because of memory bandwidth requirements), we can 
> > > simply put force-onfi-timing-mode = <2> in the DT, and it will work for 
> > > all flashes that meet the specifications, whether they match the full ID 
> > > or not.  
> > 
> > Well, I don't think this is a good argument. If you want to support
> > advanced features, you'll still have to define some chip/vendor
> > specific implementation, and these will likely be assigned depending on
> > the full ID. So, in the end, if you want to have good support for a
> > NAND chip that is not ONFi or JEDEC compliant, you'll have to update
> > your kernel.  
> 
> It's true that some flashes have advanced features, such as built-in ECC, 
> which would be nice to support, however, our experience has been that such 
> features are very vendor-specific, and we try to avoid avoid using them as 
> it would tie us to a specific flash chip vendor.
> 
> However, mildly accelerated chip timing (i.e. ONFi mode 2) I wouldn't call 
> an advanced feature, and it seems to be supported by all of the chips in 
> the 1..4 Gb range that we've seen, although I wouldn't be so bold and go 
> so far as to say that I know all available flash chips (at least in this 
> size range) support that mode. That's why I'm reluctant to suggest 
> changing the entries for these flashes in the table in nand_ids.c, which 
> would be another alternative. And if we did make that change, it might 
> cause problems in systems which currently use onfi_timing_mode_default if 
> the timing suddenly becomes faster after a kernel update. Although, at 
> least looking at the 4.8 tree I'm using for development, it's only the 
> sunxi NAND driver which uses it, so I guess it would be alright to change 
> as it is not in widespread use yet? [**]

I would definitely prefer this approach.

> 
> I was looking at the timing specs for a range of 2 and 4 Gb flashes from a 
> number of manufacturers a while back, and the timing specificiations were 
> surprisingly similar, even across the non-ONFi manufacturers.

That's not so surprising, NAND vendors try to compete with each others,
and they are pretty much all using the same technology, which explains
why for a given generation of chip (which is usually related to a chip
size), the timings are close.

> 
> > Also note that I'm trying to get rid of the full-id table, and replace
> > it by vendor detection/initialization [1], so that you can tweak
> > different things on a per-chip basis (and this includes the timing
> > mode).  
> 
> I'm assuming [1] refers to https://lkml.org/lkml/2016/5/27/264 which you 
> have referenced before.

Yes.

> Has this patch set been applied yet?

Nope, not yet.

> I did a 
> cursory search for it in the kernel commit log but couldn't find it, so I 
> haven't had a closer look at it since I can't really make use of any 
> features contained therein yet if that is so.

I was waiting for more reviews/tests, but it did not happen. I might
consider applying the last version even if nobody reviewed it, but I
fear it will break some platforms, hence my hesitations to apply it
without any external tests/reviews.

> 
> > > For the case of a .dts file specifying a more general board which can be 
> > > populated with any flash chip, the property can be left out, and the 
> > > timing mode will then be determined using the ID and ONFi parameter page, 
> > > as applicable.  
> > 
> > I'd like to leave as much as possible in the NAND
> > detection/initialization code, and this includes selecting the best
> > timing mode (based on JEDEC, ONFi, or vendor specific ID parsing).
> > 
> > Also remember that DT is supposed to be represent the HW blocks, not
> > their configuration.  
> 
> Well, in the case of the timing mode, it does represent the external chip 
> that is conected, in terms of information that apparently cannot be 
> probed, in a similar manner that there are properties to specify how a 
> given pin on an audio codec is connected, for instance. One minor tweak 
> would be to have the property specify not the specific timing mode to use, 
> but range of timing modes supported by the chip (i.e. a vector of bits 
> like ONFI_TIMING_MODE_0 etc. However, in practice in a given setup, one 
> would only want to use the fastest mode anyway, so there'd be little point 
> in specifying any other (except mode 0 as it is the default).
> 
> [**] A related question is what values this parameter is supposed to have 
> in the ID table. Is it the numeric timing mode (i.e. 2 for mode 2), or is 
> it a bit vector which is an or of ONFI_TIMING_MODE_0, etc ?

It's supposed to be the highest supported mode, not a bitmap
containing all the supported modes.

> The sunxi 
> driver seems to presume the latter, whereas the entries in nand_ids.c 
> would seem to imply the former, with values such as 2 (for the 
> TC58NVG0S3E) and 4 (for the H27UCG8T2ATR-BC) - surely these chips support 
> more than a single timing mode?

Hm, no it's not. As can be seen here [1], if the NAND is not ONFi, then
we're using the onfi_timing_mode_default value, which is encoding the
highest supported mode. The other case is when the chip is ONFi
compliant, and in this case, the timing_mode field in exposing
supported modes as a bitmap.

One last thing, we recently introduced a generic timing selection/setup
infrastructure [2] to avoid duplicating the code pointed here [1] in all
drivers. It's been merged in 4.9, and that'd would be better to use
this infrastructure in your driver.

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/sunxi_nand.c#L1723
[2]https://www.spinics.net/lists/arm-kernel/msg532007.html
