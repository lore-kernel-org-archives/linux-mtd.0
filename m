Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
From: David Woodhouse <dwmw2@infradead.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
In-Reply-To: <20081008072843.GA19401@flint.arm.linux.org.uk>
References: <48EC4CC5.5030809@compulab.co.il>
	<8bd0f97a0810072320h5361c7d3q219aeaf9407a5293@mail.gmail.com>
	<20081008072843.GA19401@flint.arm.linux.org.uk>
Content-Type: text/plain
Date: Wed, 08 Oct 2008 09:30:20 +0100
Message-Id: <1223454620.3145.134.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Russ Dill <russ.dill@gmail.com>, Ben Dooks <ben-linux-arm@fluff.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>, Mike Rapoport <mike@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-10-08 at 08:28 +0100, Russell King - ARM Linux wrote:
> On Wed, Oct 08, 2008 at 02:20:13AM -0400, Mike Frysinger wrote:
> > On Wed, Oct 8, 2008 at 02:01, Mike Rapoport wrote:
> > > +/* gpio_nand_dosync()
> > > + *
> > > + * needed due to bus-reordering within the PXA itself (see section on
> > > + * I/O ordering in PXA manual (section 2.3, p35)
> > > + */
> > > +static void gpio_nand_dosync(struct gpiomtd *gpiomtd)
> > > +{
> > > +       unsigned long tmp;
> > > +
> > > +       if (gpiomtd->io_sync) {
> > > +               /*
> > > +                * this should generate the read, followed by
> > > +                * something that depends on the read
> > > +                */
> > > +               tmp = readl(gpiomtd->io_sync);
> > > +               asm volatile("mov %1, %0\n" : "=r" (tmp) : "r" (tmp));
> > > +       }
> > > +}
> > 
> > there isnt much point in attempting to write a generic solution if
> > you're just going to turn around and stick straight assembly in the
> > middle of it.  why not use a real arch-generic method like a memory
> > barrier.
> 
> Linux memory barriers don't cater for what's required here.  What's
> required is what's there - a read from a separate region with a
> dependency on that read.  Linux has no such barrier.

Perhaps it should have? It can do nothing on other architectures...

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
