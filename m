Received: from [131.228.20.173] (helo=mgw-ext14.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gq8gX-00082o-HR
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 13:44:15 +0000
Date: Fri, 1 Dec 2006 15:41:57 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Andy Isaacson <adi@hexapodia.org>
Subject: Re: [2.6 patch] make drivers/mtd/cmdlinepart.c:mtdpart_setup() static
Message-ID: <20061201134157.GA31225@angel.research.nokia.com>
References: <20061125191541.GH3702@stusta.de>
	<1164752386.14595.24.camel@pmac.infradead.org>
	<20061125191541.GH3702@stusta.de>
	<20061130184556.GA23293@hexapodia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20061130184556.GA23293@hexapodia.org>
Cc: Andrew Morton <akpm@osdl.org>, Juha Yrjola <juha.yrjola@solidboot.com>,
	linux-kernel@vger.kernel.org, Adrian Bunk <bunk@stusta.de>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Our bootloader once used mtdpart_setup() for passing mtd partitions to 
kernel. We do not do that any more and instead use the kernel command line 
for passing the information.

Jarkko Lavinen

On Thu, Nov 30, 2006 at 10:45:56AM -0800, ext Andy Isaacson wrote:
> On Sat, Nov 25, 2006 at 08:15:41PM +0100, Adrian Bunk wrote:
> > This patch makes the needlessly global mtdpart_setup() static.
> > 
> > @@ -346,7 +346,7 @@
> >   *
> >   * This function needs to be visible for bootloaders.
> >   */
> > -int mtdpart_setup(char *s)
> > +static int mtdpart_setup(char *s)
> >  {
> >  	cmdline = s;
> >  	return 1;
> 
> Jarkko,
> 
> You're recorded as submitting the original patch to make this
> non-static:
> http://linux.bkbits.net:8080/linux-2.6/diffs/drivers/mtd/cmdlinepart.c@1.11?nav=index.html|src/|src/drivers|src/drivers/mtd|hist/drivers/mtd/cmdlinepart.c
> 
> Is this change correct?
> 
> If so, it should also delete the "needs to be visible" comment.
> 
> -andy
