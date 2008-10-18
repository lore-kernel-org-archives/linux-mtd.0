Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KrHxQ-0007iQ-08
	for linux-mtd@lists.infradead.org; Sat, 18 Oct 2008 19:59:29 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0K8Y004FFA6126Q0@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Sat, 18 Oct 2008 15:58:49 -0400 (EDT)
Date: Sat, 18 Oct 2008 15:59:26 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
In-reply-to: <6934efce0810181120q719d946du5be98150d70abfb9@mail.gmail.com>
Message-id: <alpine.LFD.2.00.0810181529360.26244@xanadu.home>
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
	<6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
	<20081017010643.GE14569@xi.wantstofly.org>
	<6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
	<alpine.LFD.1.10.0810171828560.24182@casper.infradead.org>
	<6934efce0810171058g7ea41c72icb9c9e91a697b394@mail.gmail.com>
	<alpine.LFD.2.00.0810171411210.26244@xanadu.home>
	<6934efce0810171954g106c2cb8l3a8166c1f1769a76@mail.gmail.com>
	<20081018154644.GD4129@xi.wantstofly.org>
	<6934efce0810181120q719d946du5be98150d70abfb9@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 18 Oct 2008, Jared Hulbert wrote:

> > ARM is not a platform that supports (2), and I guess the part of the
> > discussion is whether a flash bus is (1) or not.
> 
> CFI Flash chips fall in the (1) category as a rule.

No.  They clearly are (3), unless you have a special PCI controller or 
the like on which flash memory is hooked to.  CFI flash _type_ is 
autodetectable of course, but there is usually nothing at a higher level 
telling the system where the flash is on the memory bus in any automated 
way.  OTOH' the PCI and USB buses are self describing with device IDs, 
etc.

> I think (1) applies if you consider PHYSMAP as an analog of the USB
> Host Controller driver, no?

No.  You may have a USB controller on a PCI bus, in which case (1) 
applies, but on those platforms where the USB host controller is not 
found on a PCI bus, there is always platform data telling the driver 
_where_ the controller is to be found.  In that case the controller 
itself falls into category (3).  That's also the case for physmap.

> Once you configure a physaddr as a "CFI Flash bus" using PHYSMAP, the
> "full reliable autodetection" occurs.

For the flash part themselves, just like USB _devices_.  But that's not 
the issue here.

> I haven't used a system that stored the partition tables on Flash for
> at least 6 years.  The partition tables can be configured on the
> kernel command line.

Indeed, and they can be provided by platform data too.  But flash 
partition information is completely orthogonal to the actual physical 
flash location.  You may have, say, 2 Mainstone boards and they will 
both have the same set of physical chip select lines for possible flash, 
but their partition definitions might be completely different.

> > conceptually, using platform data or setting
> > .config are entirely the same thing.
> 
> I can see why you would say that and how from a certion POV it's quite
> true.  However, I think there is a big distinction.  The .config
> method requires a different defconfig entry to support a platform.

No, that's not true.  In fact we're actively working towards the 
possibility for a single defconfig, hence a single kernel binary, to 
support many different platforms at once.

> The platform data requires adding a .c file to arch/arm/mach-pxa/ and
> tweaks to arch/arm/mach-pxa/Kconfig and arch/arm/mach-pxa/Makefile,
> no?

Of course.  That's the case for every different hardware platforms.

> >  But in practice, the platform
> > data approach has a bunch of advantages over the .config approach,
> > such as that with the platform data approach it's still possible to
> > build a single kernel image that supports booting on multiple different
> > boards (which is important e.g. for distributors),'
> 
> Yes there are places where platform data approach is very useful, I
> totally agree.  Yet there are also places where it is annoying.

Could you elaborate?

> > whereas with the
> > .config approach of configuring physmap you're forcing every board
> > type that you want to support with your kernel image to have a flash
> > chip at that address.
> 
> Also I'm not sure that totally accurate.  Here you can use the kernel
> command line to alter the physmap.

Why would you ever want to do that?

> And besides even if I did hardcode the physmap address.  I'm not
> forcing boards to have Flash there, I'm requiring that it be safe to
> probe for a Flash chip there.

Sure.  But that's not the issue, is it?

> I'm not arguing that having dozens of CONFIG_PHYSMAP_X options is the
> way to do this.  Perhaps changing CONFIG_PHYSMAP to be a commandline
> string that can be extended as needed.  Maybe a PPC style device
> tree....  What I don't like is adding .c files and Kconfig options
> because I took an existing platform moved the Flash and called it a
> new platform.

If you moved the flash then either you 1) modified the hardware in which 
case it strictly speaking can't be called under the existing name, or 2) 
platform data for that platform didn't acurately reflect the physical 
capabilities of the hardware.



Nicolas
