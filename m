Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUttN-0007ek-RU
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 16:32:39 -0500
Date: Thu, 18 Nov 2004 22:32:32 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Nicolas Pitre <nico@cam.org>
Message-ID: <20041118213232.GG4943@stusta.de>
References: <20041118021538.5764d58c.akpm@osdl.org>
	<20041118154110.GE4943@stusta.de>
	<1100793112.8191.7315.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0411181132440.12260@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0411181132440.12260@xanadu.home>
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 18, 2004 at 11:34:56AM -0500, Nicolas Pitre wrote:
> On Thu, 18 Nov 2004, David Woodhouse wrote:
> 
> > On Thu, 2004-11-18 at 16:41 +0100, Adrian Bunk wrote:
> > > Let's put the dependencies from the #error into the Kconfig file:
> > 
> > Looks sane to me. Nico?
> 
> And why is the current arrangement actually a problem?

If you are able to select an option, it should also compile (and work).

At least on i386, this is usually true for every single option.

> Nicolas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
