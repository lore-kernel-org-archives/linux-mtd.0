From: David Woodhouse <dwmw2@infradead.org>
To: Dan Post <postster@gmail.com>
In-Reply-To: <9f920bdf05011209455115963b@mail.gmail.com>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<20050112170256.GF25638@wohnheim.fh-wedel.de>
	<6934efce050112092246ae9277@mail.gmail.com>
	<1105551293.26551.133.camel@hades.cambridge.redhat.com>
	<9f920bdf05011209455115963b@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 12 Jan 2005 17:52:02 +0000
Message-Id: <1105552322.26551.143.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-12 at 09:45 -0800, Dan Post wrote:
> Which can cause severe application performance problems in
> RAM-constrained systems.  Your system will slow to a crawl if the page
> cache is thrashed a lot... and I've seen this problem a number of
> times.  If the page is always present, there is no page cache penalty
> for executing code.

Remember, you're comparing with the case where that page wasn't present
at _all_ so the page is always absent. If you miscalculate your RAM
budget with XIP, you're fairly quickly screwed as you run out of memory.
If you miscalculate with non-XIP, you have a certain amount of slack
because pages can be discarded and re-read. Yes, that can be suboptimal
if you get into thrashing, but there's often going to be a reasonable
number of pages you can discard before you get to that.

> We'll see what we can do to post numbers.
> (No pun intended.)

:)

That'd be interesting. I can't imagine them showing that application XIP
really is a long-term win, but we may find that some kind of partial
XIP, or faulting parts of the kernel into RAM as we start up, or
something like that, may be beneficial. I have an open mind -- mostly
because I lack the wit to remember what I said before and hence be
consistent :)

-- 
dwmw2
