Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQ7vU-0004iq-0g
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 21:49:12 +0000
Date: Mon, 4 Aug 2008 23:49:10 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: "Woodruff, Richard" <r-woodruff2@ti.com>
Subject: Re: [PATCH] MTD: OMAP2-NAND: Fix partition reading from board info
Message-ID: <20080804214910.GJ31974@xi.wantstofly.org>
References: <9c9fda240807011627v60428f9eh3c2bb17cdc8ce6ea@mail.gmail.com>
	<200808041302.46323.david-b@pacbell.net>
	<20080804201715.GD31974@xi.wantstofly.org>
	<200808041326.38840.david-b@pacbell.net>
	<13B9B4C6EF24D648824FF11BE89671620361EE1833@dlee02.ent.ti.com>
	<20080804213200.GH31974@xi.wantstofly.org>
	<13B9B4C6EF24D648824FF11BE89671620361EE18A2@dlee02.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13B9B4C6EF24D648824FF11BE89671620361EE18A2@dlee02.ent.ti.com>
Cc: Kyungmin Park <kmpark@infradead.org>, Tony Lindgren <tony@atomide.com>,
	"Kamat, Nishant" <nskamat@ti.com>, David Brownell <david-b@pacbell.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 04, 2008 at 04:45:19PM -0500, Woodruff, Richard wrote:

> > > The most visible BE-ARM seems to be Intel's IXP network processors.
> >
> > The IXPs are one of the few cases where the vendors _ships an all-BE
> > software development environment by default_ -- but that doesn't mean
> > that BE doesn't work on ARM CPUs where the vendor ships a LE software
> > development environment by default (BE has certainly worked on all
> > ARM CPUs I've ever tried it on).
> 
> I wonder how many shipping systems use LE.  A grep of current ARM Linux Kconfig's only shows 3 IXP systems setting CONFIG_CPU_BIG_ENDIAN. Perhaps you are correct about ability but few seem to use it. Seems like a trivia question for ARM Ltd.
> 
> At any rate all OMAPs have been hardwired.

Hmmm.  So bit [7] of the system control register is ignored entirely,
and if you write a 1 to it, nothing at all happens and the system
boots as usual?  (To test, add a line "OBJS += big-endian.o" to the
top of arch/arm/boot/compressed/Makefile.)

Does it also mean that the ARMv6 based OMAPs have the SETEND
instruction behave as NOPs?
