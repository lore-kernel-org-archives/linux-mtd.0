Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUy3m-00005m-O9
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 20:59:40 -0500
Date: Thu, 18 Nov 2004 20:58:26 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20041118232527.GI4943@stusta.de>
Message-ID: <Pine.LNX.4.61.0411182041130.12260@xanadu.home>
References: <20041118021538.5764d58c.akpm@osdl.org>
	<20041118154110.GE4943@stusta.de>
	<1100793112.8191.7315.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0411181132440.12260@xanadu.home>
	<20041118213232.GG4943@stusta.de>
	<Pine.LNX.4.61.0411181727010.12260@xanadu.home>
	<20041118232527.GI4943@stusta.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 19 Nov 2004, Adrian Bunk wrote:

> On Thu, Nov 18, 2004 at 05:31:32PM -0500, Nicolas Pitre wrote:
> >...
> > Can we make it conditional on CONFIG_XIP_KERNEL instead?
> > It would be less messy IMHO.
> 
> I copied the dependency from the #ifdef before the #error.
> 
> The #error should either go or be the same than the Kconfig dependency.

And on what basis?  This just doesn't make sense.

CONFIG_MTD_XIP is there to be compatible with kernels which are made 
XIP.  This currently means _all_ ARM flavours the kernel currently 
supports.  Yet there is only SA11x0 and PXA2xx which have proper MTD_XIP 
primitives ence the #error.

My position is therefore that the CONFIG_MTD_XIP should depend on 
CONFIG_XIP_KERNEL since this is what it is for, and the #error stay as 
is.  If ever you make x86 kernel XIPable you'll need to add the missing 
bits guarded by the #error anyway.

And no, allyesconfig makes little sense on ARM as it has been discussed 
on lkml before.


Nicolas
