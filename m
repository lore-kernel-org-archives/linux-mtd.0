Received: from [2002:d412:e8ba::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CUpgI-0006K3-Kk
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 12:02:51 -0500
Date: Thu, 18 Nov 2004 17:02:38 +0000
From: Russell King <rmk+lkml@arm.linux.org.uk>
To: Nicolas Pitre <nico@cam.org>
Message-ID: <20041118170238.B11866@flint.arm.linux.org.uk>
References: <20041118021538.5764d58c.akpm@osdl.org>
	<20041118154110.GE4943@stusta.de>
	<1100793112.8191.7315.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0411181132440.12260@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0411181132440.12260@xanadu.home>;
	from nico@cam.org on Thu, Nov 18, 2004 at 11:34:56AM -0500
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, Adrian Bunk <bunk@stusta.de>
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

because it prevents building with, eg, make allyesconfig

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
