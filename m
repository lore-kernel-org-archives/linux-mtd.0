Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KrGQ1-0006ut-7Q
	for linux-mtd@lists.infradead.org; Sat, 18 Oct 2008 18:20:53 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1181745wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Oct 2008 11:20:51 -0700 (PDT)
Message-ID: <6934efce0810181120q719d946du5be98150d70abfb9@mail.gmail.com>
Date: Sat, 18 Oct 2008 11:20:51 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Lennert Buytenhek" <buytenh@wantstofly.org>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
In-Reply-To: <20081018154644.GD4129@xi.wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Nicolas Pitre <nico@cam.org>, Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> ARM is not a platform that supports (2), and I guess the part of the
> discussion is whether a flash bus is (1) or not.

CFI Flash chips fall in the (1) category as a rule.

> I don't think there is enough info to do full reliable autodetection
> of flash chips on any random platform

I think (1) applies if you consider PHYSMAP as an analog of the USB
Host Controller driver, no?

Once you configure a physaddr as a "CFI Flash bus" using PHYSMAP, the
"full reliable autodetection" occurs.

> and then there are things like
> platforms using partition tables that aren't stored on the flash chip
> itself

I haven't used a system that stored the partition tables on Flash for
at least 6 years.  The partition tables can be configured on the
kernel command line.

> conceptually, using platform data or setting
> .config are entirely the same thing.

I can see why you would say that and how from a certion POV it's quite
true.  However, I think there is a big distinction.  The .config
method requires a different defconfig entry to support a platform.
The platform data requires adding a .c file to arch/arm/mach-pxa/ and
tweaks to arch/arm/mach-pxa/Kconfig and arch/arm/mach-pxa/Makefile,
no?

>  But in practice, the platform
> data approach has a bunch of advantages over the .config approach,
> such as that with the platform data approach it's still possible to
> build a single kernel image that supports booting on multiple different
> boards (which is important e.g. for distributors),'

Yes there are places where platform data approach is very useful, I
totally agree.  Yet there are also places where it is annoying.

> whereas with the
> .config approach of configuring physmap you're forcing every board
> type that you want to support with your kernel image to have a flash
> chip at that address.

Also I'm not sure that totally accurate.  Here you can use the kernel
command line to alter the physmap.

And besides even if I did hardcode the physmap address.  I'm not
forcing boards to have Flash there, I'm requiring that it be safe to
probe for a Flash chip there.  Okay that's splitting hairs but we are
autodetecting....

I'm not arguing that having dozens of CONFIG_PHYSMAP_X options is the
way to do this.  Perhaps changing CONFIG_PHYSMAP to be a commandline
string that can be extended as needed.  Maybe a PPC style device
tree....  What I don't like is adding .c files and Kconfig options
because I took an existing platform moved the Flash and called it a
new platform.

> (In fact, there are no advantages of the .config method over the
> platform data method, only disadvantages,

That's just not true.  1 file change to support a "platform" versus 3....

> which is why I still want
> to kill the CONFIG_MTD_PHYSMAP_* options one day.)

You misunderstand me.  I'm okay with killing CONFIG_MTD_PHYSMAP_*.  I
just want to make sure in the process we don't kill physmap or cripple
it.

I just want to make sure we keep the functionality those options hold.
 For example we could simply move them to the kernel commandline.  We
can't just pull the functionality, and expect everyone will be happy
to create a new board file because we tweak the Flash config a bit.

> What your argument _appears_ to be is that it's okay to use an
> inferior method of configuring peripherals (.config) over a superior
> method (instantiating platform devices from platform code)

Thats it, you got me.  I just _love_ inferior methods, can't get
enough of them.  :)

For what I do with the kernel instantiating platform devices from
platform code is not the superior method.  For what I do this is too
much overhead, and complicated.

> because we
> should really be using an entirely different third method (autodetect
> the device or pass the info in from the firmware) in the first place.
> I don't really see how that conclusion follows.

I argue we already DO the autodetect (CFI probing) and pass info in
from the firmware (kernel commandline).

> "You can run the same zImage on a Core 2 and an Opteron machine, but
> if I take out my soldering iron and re-route my onboard network card's
> PCI IRQ line to a different interrupt pin on my southbridge I have to
> rebuild my ACPI table??" :-)

Ummm.  I think what I am arguing is more like moving the location of
the NIC from one PCI slot to another.  Most chips have several
chipselects where CFI Flash can be placed, does using one chipselect
or the other really constitute a different platform?

> Anyway, doesn't changing your .config involve recompiling as well?

right.  But not if you use the kernel commandline.

> If what you are trying to say is that ARM should support a method
> such as (2) above, I wouldn't immediately disagree.

Well I think we have a little of both.  (1) applies as CFI chips can
be autodetected.  (2) could apply to what we hard code if we had a
more full featured physmap commandline or device tree or something.

>  But I don't see
> what that has to do with platform data versus .config -- they are
> conceptually the same thing.

Like I said above I don't quite agree here.  But I can't argue that
the .config route is ideal, but has served a purpose that the platform
data can not.

Nevertheless, I over used .config to include the kernel commandline at
times which is confusing.
