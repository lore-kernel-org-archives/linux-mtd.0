Received: from florence.buici.com ([206.124.142.26])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BbTsG-0002GV-Tg
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2004 20:38:28 -0400
Date: Fri, 18 Jun 2004 17:38:18 -0700
From: Marc Singer <elf@buici.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20040619003818.GB21609@buici.com>
References: <20040613214329.GA2282@buici.com> <20040614005455.GA4070@buici.com>
	<20040618170514.A6101@mvista.com>
	<200406190216.29671.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200406190216.29671.tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD Maps driver for Sharp LH7a40x
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 19, 2004 at 02:16:29AM +0200, Thomas Gleixner wrote:
> Jun,
> 
> On Saturday 19 June 2004 02:05, Jun Sun wrote:
> >
> > How about just using physmap mapping driver and keep all your
> > board specific stuff to your board directory?   See
> > include/linux/mtd/physmap.h for more details.
> 
> Thanks for jumping in. That's what I was trying to point out. 
> 
> In fact most of the board drivers in drivers/mtd/maps could / should go away. 
> The reason to have one is crappy hardware, unusual chip constellations or 
> other anomalities.
> 
> The common case can just be solved by using the physmap driver and the command 
> line partition parser. Maybe we should think about an extension to physmap so 
> the board support code can supply an appropriate partitioning scheme along 
> with the chip description. 
> 
> I was thinking about simliar support for the NAND driver too, but there it 
> turns out that the anomalities are given per design, although it should not 
> be an unsolvable problem.

I've chatted with Russell King about this, too.  I think we agree that
board-specific code would be a bad idea.  The better solution appears
to be something on the command line.  I'm going to look into it.  For
now, consider this PATCH discarded.
