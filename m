Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KnTdf-0006my-7u
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 07:39:20 +0000
Date: Wed, 8 Oct 2008 08:28:43 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
Message-ID: <20081008072843.GA19401@flint.arm.linux.org.uk>
References: <48EC4CC5.5030809@compulab.co.il>
	<8bd0f97a0810072320h5361c7d3q219aeaf9407a5293@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bd0f97a0810072320h5361c7d3q219aeaf9407a5293@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Russ Dill <russ.dill@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
	Ben Dooks <ben-linux-arm@fluff.org>, David Woodhouse <dwmw2@infradead.org>,
	Mike Rapoport <mike@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 08, 2008 at 02:20:13AM -0400, Mike Frysinger wrote:
> On Wed, Oct 8, 2008 at 02:01, Mike Rapoport wrote:
> > +/* gpio_nand_dosync()
> > + *
> > + * needed due to bus-reordering within the PXA itself (see section on
> > + * I/O ordering in PXA manual (section 2.3, p35)
> > + */
> > +static void gpio_nand_dosync(struct gpiomtd *gpiomtd)
> > +{
> > +       unsigned long tmp;
> > +
> > +       if (gpiomtd->io_sync) {
> > +               /*
> > +                * this should generate the read, followed by
> > +                * something that depends on the read
> > +                */
> > +               tmp = readl(gpiomtd->io_sync);
> > +               asm volatile("mov %1, %0\n" : "=r" (tmp) : "r" (tmp));
> > +       }
> > +}
> 
> there isnt much point in attempting to write a generic solution if
> you're just going to turn around and stick straight assembly in the
> middle of it.  why not use a real arch-generic method like a memory
> barrier.

Linux memory barriers don't cater for what's required here.  What's
required is what's there - a read from a separate region with a
dependency on that read.  Linux has no such barrier.
