Received: from [2002:d412:e8ba::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bbc4R-0003KX-3Q
	for linux-mtd@lists.infradead.org; Sat, 19 Jun 2004 05:23:32 -0400
Date: Sat, 19 Jun 2004 10:23:22 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20040619102322.A24396@flint.arm.linux.org.uk>
References: <20040613214329.GA2282@buici.com>
	<200406190216.29671.tglx@linutronix.de>
	<20040619003818.GB21609@buici.com>
	<200406191019.09268.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200406191019.09268.tglx@linutronix.de>;
	from tglx@linutronix.de on Sat, Jun 19, 2004 at 10:19:09AM +0200
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Marc Singer <elf@buici.com>
Subject: Re: [PATCH] MTD Maps driver for Sharp LH7a40x
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 19, 2004 at 10:19:09AM +0200, Thomas Gleixner wrote:
> On Saturday 19 June 2004 02:38, Marc Singer wrote:
> > > The common case can just be solved by using the physmap driver and the
> > > command line partition parser. Maybe we should think about an extension
> > > to physmap so the board support code can supply an appropriate
> > > partitioning scheme along with the chip description.
> > >
> > > I was thinking about simliar support for the NAND driver too, but there
> > > it turns out that the anomalities are given per design, although it
> > > should not be an unsolvable problem.
> >
> > I've chatted with Russell King about this, too.  I think we agree that
> > board-specific code would be a bad idea.  The better solution appears
> > to be something on the command line.  I'm going to look into it.  For
> > now, consider this PATCH discarded.
> 
> Yes, for the common case where we dont have special functions neccecary the 
> commandline resp. ATAG (unfortunately only for ARM) is the right place.

ATAG is only ARM because Linux doesn't like binary interfaces - and
that's one of the reasons I don't want to see it expanding more and
more.  See the "IDE support for lh7a40x" on the linux-arm-kernel list
for a discussion on this topic.

> This works if the only information which is neccecary is
> 
> base address, size and buswidth. 
> 
> Russell, can you please give define two ATAG numbers for this purpose ? 
> ATAG_MTD_PHYSMAP and 
> ATAG_MTD_PARTITION
> I would be happy to provide the data structures and parsers to make this work.

I've already thrown out passing partition information via ATAGs years
ago, and the solution which came from that was the mtdparts= command
line argument.  Now that we have that, there is no reason for
ATAG_MTD_PARTITION.

> For chips which need Vpp setting for programming and erasing this is rather 
> impossible. Same applies to NAND drivers, as the NAND interface can hardly be 
> specified board independent on the commandline.

You may want to take a look at how integrator-flash.c handles this
aspect.  The handling of VPP and write enables is platform specific
and requires some code to do it, so obviously we can't encode that
into an ATAG or command line argument.

Note how integrator-flash.c is used on the Integrator/AP, Integrator/CP
and Versatile/PB platforms, and notice the way the platform support code
is separate in arch/arm/mach-integrator/integrator_*.c and
arch/arm/mach-versatile/core.c.  I think this is a good model for
what you're trying to achieve.

Also note that the size of the flash doesn't have to exactly match the
size of flash fitted to the device - it just has to be of sufficient
size to cover the largest flash which may be fitted to your device.
(or, if you have a way to discover the fitted flash size without too
much hastle, then you could use that.)

> #define BOARD_SPECIFIC_MTD_FUNCTIONS
> #include <asm/hardware.h>
> 
> asm/hardware.h includes board_hardware.h if available.

Eww, no thanks.  We've recently killed that in the PXA tree.  hardware.h
is included by 99% of the kernel include files which means any modification
to it or included files causes the whole kernel to rebuild - which takes
long enough on x86 with gcc 3 already.

> I know it looks weird in the first place, but it could be one of the possible 
> solutions to solve the board support mess. Russell uses a similar approach 
> for the timer init and interrupt handler for the various subarchs of ARM 
> since long.

The timer init is a mess and Deepak's been cleaning that up, so please
don't use the current structure as a justification.

I think you're better off using integrator-flash.c as is, and just
supplying the relevent platform device structure and associated code.
