Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUupY-0007tB-LQ
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 17:32:45 -0500
Date: Thu, 18 Nov 2004 17:31:32 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20041118213232.GG4943@stusta.de>
Message-ID: <Pine.LNX.4.61.0411181727010.12260@xanadu.home>
References: <20041118021538.5764d58c.akpm@osdl.org>
	<20041118154110.GE4943@stusta.de>
	<1100793112.8191.7315.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0411181132440.12260@xanadu.home>
	<20041118213232.GG4943@stusta.de>
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

On Thu, 18 Nov 2004, Adrian Bunk wrote:

> On Thu, Nov 18, 2004 at 11:34:56AM -0500, Nicolas Pitre wrote:
> > On Thu, 18 Nov 2004, David Woodhouse wrote:
> > 
> > > On Thu, 2004-11-18 at 16:41 +0100, Adrian Bunk wrote:
> > > > Let's put the dependencies from the #error into the Kconfig file:
> > > 
> > > Looks sane to me. Nico?
> > 
> > And why is the current arrangement actually a problem?
> 
> If you are able to select an option, it should also compile (and work).
> 
> At least on i386, this is usually true for every single option.

Fine.  I thought the #error would encourage people to add the missing 
bits to that file.  No?  ;-)

Can we make it conditional on CONFIG_XIP_KERNEL instead?
It would be less messy IMHO.


Nicolas
