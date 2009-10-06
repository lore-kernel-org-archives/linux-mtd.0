Subject: Re: Should flash hardware look like UBI?
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <alpine.LFD.2.00.0910061302350.2638@localhost.localdomain>
References: <1254751504.13096.725.camel@macbook.infradead.org>
	<alpine.LFD.2.00.0910061302350.2638@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 06 Oct 2009 13:05:13 +0100
Message-Id: <1254830713.14541.1195.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-10-06 at 13:21 +0200, Thomas Gleixner wrote:
> David,
> 
> On Mon, 5 Oct 2009, David Woodhouse wrote:
> 
> > I just posted http://www.advogato.org/person/dwmw2/diary/211.html which
> > laments the common view that future flash storage will just look like a
> > disk (SSD/eMMC/etc.). I don't think we want that, for the reasons given
> > there.
> 
> You forgot to mention that the pre SSD FLASH storage (USB sticks, CF
> Cards ...) already have provided a proven track record of
> unreliability. I still have the recommendation of keeping the power
> supply stable for min. 400ms after the last access to the device which
> I got from a well known "industrial grade" manufacturer.

Right. I don't think anyone who's been paying _any_ attention to the
situation can fail to be aware of how unreliable the existing technology
is.

> I admit that certain SSD manufacturers seem to have slightly more
> clue, but that does not change the fact that we need to implement a
> filesystem on top of another filesystem.
> 
> > But I've also been thinking about exactly what we _do_ want. We
> > certainly want something a little more capable than the raw interface to
> > NAND flash that ONFI provides.
> > 
> > For a start, we want ECC to be built-in. We don't want to have to do
> > correction in software, and we want a 'copy page' command that's
> > actually useful -- we want it to apply ECC corrections rather than
> > copying any flipped bits faithfully. Although we probably do want the
> > _option_ to read the raw data still, without attempting to correct it.
> 
> Ack.
>  
> > We _also_ want the capability to do GC and block replacement for
> > ourselves, taking the opportunity to optimise the file system layout as
> > we do so. So we want to be _told_ about how many errors were fixed when
> > we read a block, and we also probably want to be told if we have to
> > recycle an eraseblock for other reasons (write disturb, etc.)
> > 
> > However, it's acceptable for the device to automatically move data for
> > us, if the OS lacks that capability or doesn't want to bother.
> 
> Hmm, that's going to be a nightmare. Either let the OS sort it out or
> let the Firmware deal with it.

I'd definitely prefer to let the OS do it -- as long as there's a decent
ECC-safe copy command where the data never leave the device, of course.

I was just anticipating that some people won't _want_ to push that
requirement up to the OS, so I was prepared to concede and allow them
the _option_ of letting the device do it, as long as the OS could do it
for itself when it wants to.

But you're probably right. They'll only screw it up, and it's not
exactly hard for the OS to do it. So I'll retract my reluctant "it's
acceptable for the device to..." above.

> > We don't _necessarily_ mind if the device hides bad blocks for us, and
> > if it maintains a logical<->physical mapping of eraseblocks. That kind
> > of thing has been done by hard drives for years, and it's simple enough
> > that they _ought_ to be able to get it right. Although the reliability
> > testing on Toshiba LBA-NAND shows that it's obviously possible to screw
> > it up too :)
> 
> Hmm, we have seen in the past how poorly implemented the logical <->
> physical mappings have been and how naive the wear levelling approach
> was in such devices. I'm not too confident that the manufacturers
> actually have improved that in a significant way.

True, but if we keep it _simple_ then maybe they're less likely to screw
it up so comprehensively. I think that practically speaking, we're going
to have to let them do _something_. We can't just revoke their licence
to write code, much as we'd like to.

> > It occurs to me that the interface that UBI presents to the higher
> > layers is actually a fairly close fit to what we want from hardware.
> >
> > And where it _isn't_, there's something to be said for changing UBI to
> > match what we want. With notifications for 'block recycle needed', for
> > reading blocks without actually returning the data, just to check if the
> > ECC shows any bitflips, etc.)
> 
> Which makes me wonder whether we could have access to the CPU which
> runs inside of SSDs and just implement UBI on it. :) 
>
> Open Source Firmware for SSDs would allow us to optimize the
> filesystem <-> storage device interaction even better.

Yeah, but they have a fit if you even hint at that. It's stupid, but
they think there's something special in the code that we're all swearing
about and trying to get _out_ of the way.

But getting _them_ to implement something UBI-like might be possible.
It's much simpler than pretending to be a disk, so it's more likely that
they'll be able to get it right. And it gives us the capability to do
decent file systems which don't share the disadvantages of the SSD
model.

-- 
dwmw2
