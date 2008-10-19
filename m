Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KrMRr-0000sm-1O
	for linux-mtd@lists.infradead.org; Sun, 19 Oct 2008 00:47:11 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1283396wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Oct 2008 17:47:09 -0700 (PDT)
Message-ID: <6934efce0810181747u1631b72dpbae3a430c2e6e270@mail.gmail.com>
Date: Sat, 18 Oct 2008 17:47:09 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Nicolas Pitre" <nico@cam.org>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
In-Reply-To: <alpine.LFD.2.00.0810181529360.26244@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

> there is always platform data telling the driver
> _where_ the controller is to be found.  In that case the controller
> itself falls into category (3).  That's also the case for physmap.

Right, we need to tell the system where potential CFI Flash buses are
with some kind of data.  Physmap decouples that data from the platform
data.

> No, that's not true.  In fact we're actively working towards the
> possibility for a single defconfig, hence a single kernel binary, to
> support many different platforms at once.

Okay, that's good.

>> The platform data requires adding a .c file to arch/arm/mach-pxa/ and
>> tweaks to arch/arm/mach-pxa/Kconfig and arch/arm/mach-pxa/Makefile,
>> no?
>
> Of course.  That's the case for every different hardware platforms.

I think that is pushing it.  There would be tens of thousands of x86
"platforms" if you took that argument to it's extreme.

>> >  But in practice, the platform
>> > data approach has a bunch of advantages over the .config approach,
>> > such as that with the platform data approach it's still possible to
>> > build a single kernel image that supports booting on multiple different
>> > boards (which is important e.g. for distributors),'
>>
>> Yes there are places where platform data approach is very useful, I
>> totally agree.  Yet there are also places where it is annoying.
>
> Could you elaborate?

A lot of PXA270 hardware out there is pretty similar, there's only a
couple of registered platforms but there are thousands of different
boards.  Do we want thousands of platforms defined for the trivial
differences?

>> Also I'm not sure that totally accurate.  Here you can use the kernel
>> command line to alter the physmap.
>
> Why would you ever want to do that?

We have basically a respin of Mainstone with socket cards for Flash.
So we  alter the physmap to look at one chipselect or the other,
depending on what we are doing.  It's great for testing stuff.

That's why physmap is so important to me, I can test a stock kernel
for Mainstone with all kinds of unholy Flash configs without ever
touching the kernel.  This is very cool for us.

So you guys think of soldering irons when I talk about altering the
Flash layout, I think of swapping a card out.

> If you moved the flash then either you 1) modified the hardware in which
> case it strictly speaking can't be called under the existing name, or 2)
> platform data for that platform didn't acurately reflect the physical
> capabilities of the hardware.

So if I do a mild hack or revision of a board that should trigger a
new machine registration?  Really?  Even though today I can just tweak
the command line's physmap entry?

Okay.... 2) is a pretty interesting argument.  So how do we do
platform data for my board that has socketable Flash?

I don't know.  We have this cool ability to autodetect the Flash but
it seems like the direction we're going doesn't take advantage of
that.  I probably just don't see something.
