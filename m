Received: from mailout10.sul.t-online.com ([194.25.134.21])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bbcbg-0003ZR-JE
	for linux-mtd@lists.infradead.org; Sat, 19 Jun 2004 05:57:54 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Sat, 19 Jun 2004 11:51:53 +0200
References: <20040613214329.GA2282@buici.com>
	<200406191019.09268.tglx@linutronix.de>
	<20040619102322.A24396@flint.arm.linux.org.uk>
In-Reply-To: <20040619102322.A24396@flint.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406191151.53437.tglx@linutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Marc Singer <elf@buici.com>
Subject: Re: [PATCH] MTD Maps driver for Sharp LH7a40x
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 19 June 2004 11:23, Russell King - ARM Linux wrote:
>
> ATAG is only ARM because Linux doesn't like binary interfaces - and
> that's one of the reasons I don't want to see it expanding more and
> more.  See the "IDE support for lh7a40x" on the linux-arm-kernel list
> for a discussion on this topic.

Ok, sounds reasonable. I did not follow this thread, as the topic was out o=
f=20
my primary interest.

> > For chips which need Vpp setting for programming and erasing this is
> > rather impossible. Same applies to NAND drivers, as the NAND interface
> > can hardly be specified board independent on the commandline.
>
> You may want to take a look at how integrator-flash.c handles this
> aspect.  The handling of VPP and write enables is platform specific
> and requires some code to do it, so obviously we can't encode that
> into an ATAG or command line argument.
>
> Note how integrator-flash.c is used on the Integrator/AP, Integrator/CP
> and Versatile/PB platforms, and notice the way the platform support code
> is separate in arch/arm/mach-integrator/integrator_*.c and
> arch/arm/mach-versatile/core.c.  I think this is a good model for
> what you're trying to achieve.

Yep. I was not aware of this. But it would have been my first choice too to=
=20
put this into the board support files / directories which are available /=20
neccecary for embedded systems anyway.

> Also note that the size of the flash doesn't have to exactly match the
> size of flash fitted to the device - it just has to be of sufficient
> size to cover the largest flash which may be fitted to your device.
> (or, if you have a way to discover the fitted flash size without too
> much hastle, then you could use that.)

I know. For NAND we use the chip ID to do that anyway.

> Eww, no thanks.  We've recently killed that in the PXA tree.  hardware.h
> is included by 99% of the kernel include files which means any modificati=
on
> to it or included files causes the whole kernel to rebuild - which takes
> long enough on x86 with gcc 3 already.
> The timer init is a mess and Deepak's been cleaning that up, so please
> don't use the current structure as a justification.
> I think you're better off using integrator-flash.c as is, and just
> supplying the relevent platform device structure and associated code.

I just said that ist possible, but weird. You're definitly right to make th=
is=20
go away.

So a final conclusion would be:

1. Add commandline parsing for flashbase,size,buswidth which covers the cas=
e=20
where no special code is neccecary to access the chips.

2. Use the already existing platform model, which can be retrieved from you=
r=20
work in arch/arm/mach-xxxx

3. Extend the generic NAND driver to provide a simple mechanism to make 2.)=
=20
work for NAND too

4. Obsolete the board specific mapping drivers in drivers/mtd/maps and=20
drivers/mtd/nand when this is done.

Did I miss(understand) anything ?

=2D-=20
Thomas
_____________________________________________________________________
=46rom slash dot org
"When customers are visiting, engineers are not allowed to wear ties.=20
That way the customer can tell who is the engineer and who is the=20
salesman (and therefore whom to believe.). Ties cut off blood flow=20
to the brain, making it easier for the salesmen to do their jobs."=20
_____________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
