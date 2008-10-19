Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KrNG0-0003ZE-1E
	for linux-mtd@lists.infradead.org; Sun, 19 Oct 2008 01:39:00 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0K8Y00DURPWZMQ00@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Sat, 18 Oct 2008 21:38:59 -0400 (EDT)
Date: Sat, 18 Oct 2008 21:38:59 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
In-reply-to: <6934efce0810181747u1631b72dpbae3a430c2e6e270@mail.gmail.com>
Message-id: <alpine.LFD.2.00.0810182113160.26244@xanadu.home>
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<20081017010643.GE14569@xi.wantstofly.org>
	<6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
	<alpine.LFD.1.10.0810171828560.24182@casper.infradead.org>
	<6934efce0810171058g7ea41c72icb9c9e91a697b394@mail.gmail.com>
	<alpine.LFD.2.00.0810171411210.26244@xanadu.home>
	<6934efce0810171954g106c2cb8l3a8166c1f1769a76@mail.gmail.com>
	<20081018154644.GD4129@xi.wantstofly.org>
	<6934efce0810181120q719d946du5be98150d70abfb9@mail.gmail.com>
	<alpine.LFD.2.00.0810181529360.26244@xanadu.home>
	<6934efce0810181747u1631b72dpbae3a430c2e6e270@mail.gmail.com>
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

> >> The platform data requires adding a .c file to arch/arm/mach-pxa/ and
> >> tweaks to arch/arm/mach-pxa/Kconfig and arch/arm/mach-pxa/Makefile,
> >> no?
> >
> > Of course.  That's the case for every different hardware platforms.
> 
> I think that is pushing it.  There would be tens of thousands of x86
> "platforms" if you took that argument to it's extreme.

Not really, because all x86 platforms are rather "all the same" 
otherwise they wouldn't be compatible.  Where differences are to be 
found, usually they can be discovered at run time.

On ARM, many of those differences cannot be found at run time, so 
they're statically defined and bundled on a "platform" basis.

> A lot of PXA270 hardware out there is pretty similar, there's only a
> couple of registered platforms but there are thousands of different
> boards.  Do we want thousands of platforms defined for the trivial
> differences?

Depends how trivial the differences are.  For those differences that 
cannot be probed at run time then yes we want a different platform 
defined.  You have to describe those differences somehow _anyway_, and 
for hardware it is often better to encode them in the source directly 
instead of relying on the user properly configuring the kernel cmdline 
argument in the bootloader each time, especially with hardware which is 
not expected to change.

> We have basically a respin of Mainstone with socket cards for Flash.
> So we  alter the physmap to look at one chipselect or the other,
> depending on what we are doing.  It's great for testing stuff.
> 
> That's why physmap is so important to me, I can test a stock kernel
> for Mainstone with all kinds of unholy Flash configs without ever
> touching the kernel.  This is very cool for us.
> 
> So you guys think of soldering irons when I talk about altering the
> Flash layout, I think of swapping a card out.

Still, those chip select lines where flash can be found certainly aren't 
that many?  So why not always let physmap know about them all and probe 
whatever flash that might (or might not) be connected there?

> > If you moved the flash then either you 1) modified the hardware in which
> > case it strictly speaking can't be called under the existing name, or 2)
> > platform data for that platform didn't acurately reflect the physical
> > capabilities of the hardware.
> 
> So if I do a mild hack or revision of a board that should trigger a
> new machine registration?  Really?  Even though today I can just tweak
> the command line's physmap entry?

Probably in your case the ability to override a default setting with the 
kernel cmdline is perfectly appropriate.  But most people simply want to 
configure their kernel for machine X and Y, and expect the kernel to 
know the difference between those already.

> Okay.... 2) is a pretty interesting argument.  So how do we do
> platform data for my board that has socketable Flash?

Have physmap always probe CS0 and CS1.  And if you have a way to know 
what flash bank is first then you can even have proper names for them 
(see lubbock_init() for an example of bus width and flash bank ordering 
determined at run time).

> I don't know.  We have this cool ability to autodetect the Flash but
> it seems like the direction we're going doesn't take advantage of
> that.  I probably just don't see something.

Actual flash autodetection is one thing.  Possible flash location is 
another.


Nicolas
