Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AClhx-0002o1-Ar
	for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2003 21:05:21 +0100
Date: Thu, 23 Oct 2003 13:04:06 -0700
From: Jun Sun <jsun@mvista.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Message-ID: <20031023130406.D1345@mvista.com>
References: <20031022182558.U19834@mvista.com>
	<20031023153307.GA11669@wohnheim.fh-wedel.de>
	<20031023100304.B1070@mvista.com>
	<20031023173148.GC16160@wohnheim.fh-wedel.de>
	<20031023104320.A1345@mvista.com>
	<20031023181541.GE16160@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031023181541.GE16160@wohnheim.fh-wedel.de>;
	from joern@wohnheim.fh-wedel.de on Thu, Oct 23, 2003 at 08:15:41PM +0200
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 23, 2003 at 08:15:41PM +0200, Jörn Engel wrote:
> On Thu, 23 October 2003 10:43:20 -0700, Jun Sun wrote:
> > > 
> > > o All those translate to improvements in the source code.  How about the
> > > binary?  Compile with and without patch and post the kernel image
> > > size.  And remember that noone will use two map files at the same time
> > > in the real world.
> > > 
> > > o Copy and paste is simple.  So simple in fact, that everyone does it,
> > > as you have observed.  Why make it more complicated, unless you have
> > > clear advantages.
> > 
> > ... as if my previous listings are not advantages. :)
> 
> They are, no doubt.  But there are disadvantages as well.
> 
> > > Yes, I like the basic idea, tried to do it myself.  But what's the use
> > > if all your users care about binary size and that increases?
> > 
> > I find it hard to belive this patch would increase kernel size.
> > Can someone using existing propriatary mapping driver apply this 
> > patch, switch to use physmap.c, and let us know the size increase?
> > 
> > How much increase would you start to really care in a typical .5M to 2M
> > kernel?  1K or 10K or 100K?  I think the increase should be minimum if any.
> 
> I don't know and I don't care.  You want the patch in, you show the
> numbers or convince David otherwise.
>

I will do some numbers, but I don't really buy your logic.  I said
"This patch is great" and you are one who said it increases the size.
It seems to me you need to prove your claim. :)

Jun
