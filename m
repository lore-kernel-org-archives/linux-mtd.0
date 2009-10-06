Date: Tue, 6 Oct 2009 14:56:40 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Should flash hardware look like UBI?
In-Reply-To: <1254830713.14541.1195.camel@macbook.infradead.org>
Message-ID: <alpine.LFD.2.00.0910061442530.2638@localhost.localdomain>
References: <1254751504.13096.725.camel@macbook.infradead.org>
	<alpine.LFD.2.00.0910061302350.2638@localhost.localdomain>
	<1254830713.14541.1195.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

On Tue, 6 Oct 2009, David Woodhouse wrote:
> On Tue, 2009-10-06 at 13:21 +0200, Thomas Gleixner wrote:
> > On Mon, 5 Oct 2009, David Woodhouse wrote:
> > >  
> > > We don't _necessarily_ mind if the device hides bad blocks for us, and
> > > if it maintains a logical<->physical mapping of eraseblocks. That kind
> > > of thing has been done by hard drives for years, and it's simple enough
> > > that they _ought_ to be able to get it right. Although the reliability
> > > testing on Toshiba LBA-NAND shows that it's obviously possible to screw
> > > it up too :)
> > 
> > Hmm, we have seen in the past how poorly implemented the logical <->
> > physical mappings have been and how naive the wear levelling approach
> > was in such devices. I'm not too confident that the manufacturers
> > actually have improved that in a significant way.
> 
> True, but if we keep it _simple_ then maybe they're less likely to screw
> it up so comprehensively. I think that practically speaking, we're going
> to have to let them do _something_. We can't just revoke their licence
> to write code, much as we'd like to.

I guess the bad block hiding might work, but I'm concerned about the
wear levelling aspect. That's what they usually fail to do in a
sensible way. When the resulting carefully hidden and obscured
algorithm is just contrary to what the filesystem expects you are
again digging holes in your device within no time.
 
> > > It occurs to me that the interface that UBI presents to the higher
> > > layers is actually a fairly close fit to what we want from hardware.
> > >
> > > And where it _isn't_, there's something to be said for changing UBI to
> > > match what we want. With notifications for 'block recycle needed', for
> > > reading blocks without actually returning the data, just to check if the
> > > ECC shows any bitflips, etc.)
> > 
> > Which makes me wonder whether we could have access to the CPU which
> > runs inside of SSDs and just implement UBI on it. :) 
> >
> > Open Source Firmware for SSDs would allow us to optimize the
> > filesystem <-> storage device interaction even better.
> 
> Yeah, but they have a fit if you even hint at that. It's stupid, but
> they think there's something special in the code that we're all swearing
> about and trying to get _out_ of the way.

Gah, they should concentrate on implementing useful and functional
hardware. I'm not convinced that companies who fail to implement a
working timer for more than 10 years might write code which is not a
complete desaster.

> But getting _them_ to implement something UBI-like might be possible.
> It's much simpler than pretending to be a disk, so it's more likely that
> they'll be able to get it right. And it gives us the capability to do
> decent file systems which don't share the disadvantages of the SSD
> model.

>From your mouth to God's ear !

     tglx
