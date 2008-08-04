Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQ76J-0005QP-8Q
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 20:56:36 +0000
Date: Mon, 4 Aug 2008 22:56:17 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] MTD: OMAP2-NAND: Fix partition reading from board info
Message-ID: <20080804205617.GF31974@xi.wantstofly.org>
References: <9c9fda240807011627v60428f9eh3c2bb17cdc8ce6ea@mail.gmail.com>
	<200808041302.46323.david-b@pacbell.net>
	<20080804201715.GD31974@xi.wantstofly.org>
	<200808041326.38840.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200808041326.38840.david-b@pacbell.net>
Cc: Tony Lindgren <tony@atomide.com>, "Kamat, Nishant" <nskamat@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Kyungmin Park <kmpark@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 04, 2008 at 01:26:38PM -0700, David Brownell wrote:

> > > > Looks like this driver does not exist outside linux-omap tree,
> > > > care to send the whole driver to MTD list?
> > > 
> > > Unless someone created a big-endian OMAP,
> > 
> > Don't they use standard ARM ARM cores, which can all be used in both
> > LE and BE modes?
> 
> And when those cores turn into silicon, the choice is usually
> hard-wired.

I've never seen CPU endianity being hardwired in any ARM system ever
-- but maybe OMAP is different.

(Out of all the ARM subarchs supported in the kernel right now, I've had
ep93xx'es, iop13xx'es, iop32x'es, iop33x'es, ixp2000s, ixp23xx'es,
ixp4xx'es, kirkwoods, mv78xx0's, and orion5x'es all running in BE mode
at some point.)
