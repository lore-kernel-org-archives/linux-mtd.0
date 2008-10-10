Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KoPvo-0004EM-Ff
	for linux-mtd@lists.infradead.org; Fri, 10 Oct 2008 21:53:57 +0000
Date: Fri, 10 Oct 2008 22:48:28 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
Message-ID: <20081010214827.GP435@flint.arm.linux.org.uk>
References: <48EF3291.5040000@compulab.co.il>
	<20081010141916.GB16934@shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081010141916.GB16934@shareable.org>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mike Frysinger <vapier.adi@gmail.com>, Russ Dill <russ.dill@gmail.com>,
	Ben Dooks <ben-linux-arm@fluff.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Mike Rapoport <mike@compulab.co.il>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 10, 2008 at 03:19:16PM +0100, Jamie Lokier wrote:
> Mike Rapoport wrote:
> > +#ifdef CONFIG_ARM
> > +/* gpio_nand_dosync()
> > + *
> > + * needed due to bus-reordering within the PXA itself (see section on
> > + * I/O ordering in PXA manual (section 2.3, p35)
> > + */
> 
> Is CONFIG_ARM the same as "is a PXA"?

It's good enough.

> > +		/*
> > +		 * Linux memory barriers don't cater for what's required here.
> > +		 * What's required is what's here - a read from a separate
> > +		 * region with a dependency on that read.
> > +		 */
> 
> It would be nice if this comment explained _why_ it's needed here, not
> just what it's doing but why this MTD device in particular needs it -
> for the benefit of someone using this driver on another architecture.
> 
> If the problem is that "readl" alone doesn't force a read cycle on
> PXA, it sounds like "readl" on PXA contains a bug which may affect
> other drivers on that architecture too, and that the right place to
> fix it is in "readl".

The problem is that a write to GPIO may pass a write to the static
memory regions, or vice versa.  So, what we do is we insert a read
with a dependency in the execution to ensure that we stall the
pipeline until that read - and therefore the preceding write has
completed.

> > +static inline void gpio_nand_dosync(struct gpiomtd *gpiomtd) {}
> 
> Is this dummy implementation likely to be correct on non-ARM
> architectures, or is this just faking it so the code will compile?

I suspect what's required for various architectures has yet to be
ascertained.  To ask ARM folk to work out what's required for other
architectures is just like asking you what's required for ARM - I'd
guess that you've no idea what ARM would require.  In the same way,
we have no idea what other architectures require to ensure that the
NAND chip sees GPIO changes before actually accessing the NAND.
