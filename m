Date: Tue, 3 Jan 2017 11:47:46 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Richard Weinberger <richard@nod.at>, Sylvain Lemieux
 <slemieux.tyco@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: lpc32xx: fix invalid error handling of a
 requested irq
Message-ID: <20170103114746.141d7d7d@bbrezillon>
In-Reply-To: <72ab91ec-a919-af42-8a82-f5d99b245edf@mleia.com>
References: <20161205014710.2015-1-vz@mleia.com>
 <20170103101259.0ec123df@bbrezillon>
 <72ab91ec-a919-af42-8a82-f5d99b245edf@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 3 Jan 2017 12:16:26 +0200
Vladimir Zapolskiy <vz@mleia.com> wrote:

> Hi Boris,
> 
> On 01/03/2017 11:12 AM, Boris Brezillon wrote:
> > Hi Vladimir
> > 
> > On Mon,  5 Dec 2016 03:47:10 +0200
> > Vladimir Zapolskiy <vz@mleia.com> wrote:
> >   
> >> Semantics of NR_IRQS is different on machines with SPARSE_IRQ option
> >> disabled or enabled, in the latter case IRQs are allocated starting
> >> at least from the value specified by NR_IRQS and going upwards, so
> >> the check of (irq >= NR_IRQ) to decide about an error code returned by
> >> platform_get_irq() is completely invalid, don't attempt to overrule
> >> irq subsystem in the driver.
> >>
> >> The change fixes LPC32xx NAND MLC driver initialization on boot.  
> > 
> > Do you need to backport this fix to stable releases? If that's the
> > case, I'll add the Cc: stable tag when applying.  
> 
> that will be great if you can add
> 
> Cc: stable@kernel.org # v4.7+
> 
> Please feel free to add also the tag
> 
> Fixes: 8cb17b5ed017 ("irqchip: Add LPC32xx interrupt controller driver")

Applied to nand/next (this patch will appear in 4.11).

Thanks,

Boris

> 
> --
> With best wishes,
> Vladimir
> 
