Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CW2Ed-0004cz-BY
	for linux-mtd@lists.infradead.org; Sun, 21 Nov 2004 19:39:16 -0500
Date: Sun, 21 Nov 2004 19:38:04 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20041121195617.GB13254@stusta.de>
Message-ID: <Pine.LNX.4.61.0411211932000.3732@xanadu.home>
References: <20041118021538.5764d58c.akpm@osdl.org>
	<20041118154110.GE4943@stusta.de>
	<1100793112.8191.7315.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0411181132440.12260@xanadu.home>
	<20041118213232.GG4943@stusta.de>
	<Pine.LNX.4.61.0411181727010.12260@xanadu.home>
	<20041118232527.GI4943@stusta.de>
	<Pine.LNX.4.61.0411182041130.12260@xanadu.home>
	<20041119133500.GF22981@stusta.de>
	<Pine.LNX.4.61.0411191130190.3732@xanadu.home>
	<20041121195617.GB13254@stusta.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Andrew Morton <akpm@osdl.org>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 21 Nov 2004, Adrian Bunk wrote:

> On Fri, Nov 19, 2004 at 11:35:26AM -0500, Nicolas Pitre wrote:
> 
> > On Fri, 19 Nov 2004, Adrian Bunk wrote:
> > 
> > > The Kconfig file should express all dependencies of a driver.
> > 
> > Absolutely!
> 
> Good that we agree.  :-)

On this very point only.

> > So please would you just ask Andrew to apply the following patch and be 
> > happy?  Thank you.
> 
> A slightly improved patch is below.

But I continue to disagree with your proposed patch.
And I'll bet that you will continue to disagree with mine.

Can we let the MTD maintainer arbitrate on this?


Nicolas
