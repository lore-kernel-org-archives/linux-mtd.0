Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUvee-00087F-TX
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 18:25:35 -0500
Date: Fri, 19 Nov 2004 00:25:27 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Nicolas Pitre <nico@cam.org>
Message-ID: <20041118232527.GI4943@stusta.de>
References: <20041118021538.5764d58c.akpm@osdl.org>
	<20041118154110.GE4943@stusta.de>
	<1100793112.8191.7315.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0411181132440.12260@xanadu.home>
	<20041118213232.GG4943@stusta.de>
	<Pine.LNX.4.61.0411181727010.12260@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0411181727010.12260@xanadu.home>
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

On Thu, Nov 18, 2004 at 05:31:32PM -0500, Nicolas Pitre wrote:
>...
> Can we make it conditional on CONFIG_XIP_KERNEL instead?
> It would be less messy IMHO.

I copied the dependency from the #ifdef before the #error.

The #error should either go or be the same than the Kconfig dependency.

> Nicolas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
