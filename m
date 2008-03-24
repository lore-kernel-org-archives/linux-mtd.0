Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jdrfl-0005o9-SY
	for linux-mtd@lists.infradead.org; Mon, 24 Mar 2008 18:45:30 +0000
Date: Mon, 24 Mar 2008 11:45:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH] 2/3 mtd: add support for flash on the SEGA Dreamcast
	Visual Memory Unit
Message-Id: <20080324114518.07533af9.akpm@linux-foundation.org>
In-Reply-To: <20080324145433.GD2899@logfs.org>
References: <1206207805.6324.13.camel@localhost.localdomain>
	<1206209035.6324.29.camel@localhost.localdomain>
	<20080322183200.GD19347@logfs.org>
	<1206211147.6324.48.camel@localhost.localdomain>
	<20080324020832.GA13935@linux-sh.org>
	<1206360384.6283.11.camel@localhost.localdomain>
	<20080324132101.GA2899@logfs.org>
	<1206367120.6283.15.camel@localhost.localdomain>
	<20080324141043.GB2899@logfs.org>
	<1206369796.6283.19.camel@localhost.localdomain>
	<20080324145433.GD2899@logfs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-sh@vger.kernel.org, lethal@linux-sh.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	adrian@newgolddream.dyndns.info
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 24 Mar 2008 15:54:33 +0100
J__rn Engel <joern@logfs.org> wrote:

> On Mon, 24 March 2008 14:43:16 +0000, Adrian McMenamin wrote:
> > 
> > Well, I haven't got round to applying them and testing them yet, though
> > they look ok, obviously, except for one thing: I'm pretty much where you
> > are on the goto versus return thing, but got pretty clear instructions
> > on a previous patch from Andrew Morton that using gotos to ensure
> > functions limit the number of return points is the way to go.
> > 
> > I've added him back in now we aren't exchanging flames, so maybe he can
> > pronouce ex cathedra.
> 
> It is a matter of personal taste.  Having a single return statement is
> nice when using a debugger.  One can set a single breakpoint instead of
> ten.  I guess that is why Andrew prefers it.

Experience has shown that over time, the multiple-return-point approach
leads to locking errors, resource leaks and to much duplicated
unlocking/freeing code.

Because when people add new locking and more dynamic allocations to the function
they need to hunt down each `return' and add unlocking/freeing code to it (this
is bad).   And sometimes they miss one (this is worse).
