Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KrE0w-0001so-UT
	for linux-mtd@lists.infradead.org; Sat, 18 Oct 2008 15:46:51 +0000
Date: Sat, 18 Oct 2008 17:46:44 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
Message-ID: <20081018154644.GD4129@xi.wantstofly.org>
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
	<6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
	<20081017010643.GE14569@xi.wantstofly.org>
	<6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
	<alpine.LFD.1.10.0810171828560.24182@casper.infradead.org>
	<6934efce0810171058g7ea41c72icb9c9e91a697b394@mail.gmail.com>
	<alpine.LFD.2.00.0810171411210.26244@xanadu.home>
	<6934efce0810171954g106c2cb8l3a8166c1f1769a76@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6934efce0810171954g106c2cb8l3a8166c1f1769a76@mail.gmail.com>
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

On Fri, Oct 17, 2008 at 07:54:41PM -0700, Jared Hulbert wrote:

> On a x86 system you don't have to hack .c files for every "machine"
> out there.  We don't have to tweak a device-map .c file to use a SATA
> vs a SCSI vs an IDE drive.  Why do we put up with that for Flash?

You are confusing a bunch of orthogonal issues here.


There's a couple of mechanisms to describe/list peripherals in a
system:
1. The peripheral sits on the PCI or USB bus or another type of bus
   that supports autodetection or autoconfiguration.
2. The peripheral isn't autodetectable and is described in an ACPI
   table or in OF or a similar type of mechanism where the bootloader/
   firmware/BIOS/whatever-you-want-to-call-it provides a list of
   peripherals to the kernel so that the kernel can instantiate the
   right drivers.  (x86/ppc?)
3. The kernel has some kind of way of detecting which platform it is
   running on, and contains built-in tables that describe which
   non-autodetectable peripherals are present on a given platform.  (ARM)

ARM is not a platform that supports (2), and I guess the part of the
discussion is whether a flash bus is (1) or not.

I don't think there is enough info to do full reliable autodetection
of flash chips on any random platform, and then there are things like
platforms using partition tables that aren't stored on the flash chip
itself, so I don't think (1) holds and we're stuck with (3) in the
general case.  IOW, I think NOR chips fall in the same category as
AC97 codecs or I2C devices or SPI ROMs.


But (orthogonal to this), the discussion was about instantiating
platform devices in per-platform code versus using .config to describe
peripherals to the kernel.

Both of these methods to describe peripherals to the kernel fall into
category (3) above, and conceptually, using platform data or setting
.config are entirely the same thing.  But in practice, the platform
data approach has a bunch of advantages over the .config approach,
such as that with the platform data approach it's still possible to
build a single kernel image that supports booting on multiple different
boards (which is important e.g. for distributors), whereas with the
.config approach of configuring physmap you're forcing every board
type that you want to support with your kernel image to have a flash
chip at that address.

(In fact, there are no advantages of the .config method over the
platform data method, only disadvantages, which is why I still want
to kill the CONFIG_MTD_PHYSMAP_* options one day.)


What your argument _appears_ to be is that it's okay to use an
inferior method of configuring peripherals (.config) over a superior
method (instantiating platform devices from platform code) because we
should really be using an entirely different third method (autodetect
the device or pass the info in from the firmware) in the first place.
I don't really see how that conclusion follows.


> You can run the same zImage on PXA250/270/320 but if I dare move Flash
> around I have to recompile?

"You can run the same zImage on a Core 2 and an Opteron machine, but
if I take out my soldering iron and re-route my onboard network card's
PCI IRQ line to a different interrupt pin on my southbridge I have to
rebuild my ACPI table??" :-)

Anyway, doesn't changing your .config involve recompiling as well?

If what you are trying to say is that ARM should support a method
such as (2) above, I wouldn't immediately disagree.  But I don't see
what that has to do with platform data versus .config -- they are
conceptually the same thing.
