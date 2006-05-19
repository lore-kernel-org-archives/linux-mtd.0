Received: from the.ipv6.earth.li ([2001:1b40:0:1000:c1c9:c842:0:1]
	helo=the.earth.li)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh1nA-0005f1-2P
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 06:01:18 -0400
Date: Fri, 19 May 2006 11:01:05 +0100
From: Jonathan McDowell <noodles@earth.li>
To: David Vrabel <dvrabel@arcom.com>
Message-ID: <20060519100105.GF7570@earth.li>
References: <20060518160940.GS7570@earth.li>
	<20060518165728.GA26113@wohnheim.fh-wedel.de>
	<20060519090142.GB7570@earth.li> <446D90B5.2090802@arcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <446D90B5.2090802@arcom.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add Amstrad Delta NAND support.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 19, 2006 at 10:32:37AM +0100, David Vrabel wrote:
> Jonathan McDowell wrote:
> > On Thu, May 18, 2006 at 06:57:28PM +0200, Jörn Engel wrote:
> >> On Thu, 18 May 2006 17:09:41 +0100, Jonathan McDowell wrote:
> >>> +	omap_writew(0, (OMAP_MPUIO_BASE + OMAP_MPUIO_IO_CNTL));
> >>                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> Could that be done in a macro?
> > 
> > Is there any benefit to doing so?
> > 
> >>> +	udelay(0.04);
> >> Floating point in the kernel?
> > 
> > Not quite. udelay is a macro on ARM so this ends up as an integer before
> > it ever hits a function call. In an ideal world I'd use "ndelay(40);"
> > but that would result in a delay of over 1µs as ARM doesn't have ndelay
> > defined so we hit the generic fallback.
> 
> Use instead:
> 
> /* delay for at least 40 ns */
> udelay(1);

Using "ndelay(40);" here would seem to make more sense; it's equivalent
at present and means that once I or someone else provided an ndelay
implementation for ARM the driver wouldn't need changed to take
advantage of it.

J.

-- 
                 /------------------------------------\
                 |      Ships log... erm... one.      |
                 | http://www.blackcatnetworks.co.uk/ |
                 \------------------------------------/
