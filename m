Received: from emailhub.stusta.mhn.de ([141.84.69.5]
	helo=mailout.stusta.mhn.de)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CV8uo-0002Jg-EF
	for linux-mtd@lists.infradead.org; Fri, 19 Nov 2004 08:35:07 -0500
Date: Fri, 19 Nov 2004 14:35:00 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Nicolas Pitre <nico@cam.org>
Message-ID: <20041119133500.GF22981@stusta.de>
References: <20041118021538.5764d58c.akpm@osdl.org>
	<20041118154110.GE4943@stusta.de>
	<1100793112.8191.7315.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0411181132440.12260@xanadu.home>
	<20041118213232.GG4943@stusta.de>
	<Pine.LNX.4.61.0411181727010.12260@xanadu.home>
	<20041118232527.GI4943@stusta.de>
	<Pine.LNX.4.61.0411182041130.12260@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0411182041130.12260@xanadu.home>
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 18, 2004 at 08:58:26PM -0500, Nicolas Pitre wrote:
> On Fri, 19 Nov 2004, Adrian Bunk wrote:
> 
> > On Thu, Nov 18, 2004 at 05:31:32PM -0500, Nicolas Pitre wrote:
> > >...
> > > Can we make it conditional on CONFIG_XIP_KERNEL instead?
> > > It would be less messy IMHO.
> > 
> > I copied the dependency from the #ifdef before the #error.
> > 
> > The #error should either go or be the same than the Kconfig dependency.
> 
> And on what basis?  This just doesn't make sense.
> 
> CONFIG_MTD_XIP is there to be compatible with kernels which are made 
> XIP.  This currently means _all_ ARM flavours the kernel currently 
> supports.  Yet there is only SA11x0 and PXA2xx which have proper MTD_XIP 
> primitives ence the #error.
> 
> My position is therefore that the CONFIG_MTD_XIP should depend on 
> CONFIG_XIP_KERNEL since this is what it is for, and the #error stay as 
> is.  If ever you make x86 kernel XIPable you'll need to add the missing 
> bits guarded by the #error anyway.
> 
> And no, allyesconfig makes little sense on ARM as it has been discussed 
> on lkml before.

I'm not talking about allyesconfig.

The Kconfig file should express all dependencies of a driver.
If a driver doesn't compile, it should not be selectable - and not 
#error at compile time.

Rethinking it, perhaps the following expresses the dependencies best:

  depends on ... && XIP_KERNEL && (ARCH_SA1100 || ARCH_PXA || BROKEN)

This would push the #error as a dependency on BROKEN to the Kconfig 
file.

> Nicolas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
