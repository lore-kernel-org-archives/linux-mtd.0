Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkHMJ-0002NW-F7
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 03:05:48 -0400
To: David Woodhouse <dwmw2@infradead.org>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 13 Jul 2004 01:05:49 -0600
In-Reply-To: <1089699909.8822.9.camel@imladris.demon.co.uk>
Message-ID: <m33c3widyq.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> writes:

> On Mon, 2004-07-12 at 21:13 -0600, Eric W. Biederman wrote:
> > I would like to have the probe functions fill in
> > not the CmdSet number but a structure full of function pointers.
> > And of course the upper layers need to be modified to cope.
> 
> > I have both Intel and AMD chips to test against.  CFI and non CFI
> > all being used as motherboard BIOS chips.  So I should be able
> > to catch the vast majority of problems in testing.  All but the
> > delicate chip interleave case, but I should not actually be touching
> > that part of the code, and at least I am aware of the issue.
> 
> And I just rewrote that part of the code too :)

That part does not look to bad...

Although there has been some error handling from cfi_cmdset_0002.c which
disturbs me.  Seeing as I'm good at finding flaky NOR flash parts...
 
> > Does anyone have any problems with this refactoring?
> 
> No, it seems like a good idea. It'll let us drop half of cfi_cmdset_0020
> too.
> 
> Once I've done some testing on the new interleave / map access code I
> was planning to send an update to Linus this week. That _really_ needs
> to happen this week, so if you're going to do this then either do it
> today, or wait a month. Personally I favour the former -- the whole
> thing needs testing now anyway.
> 
> Can you get to #mtd on irc.freenode.net?


I can do that, although tomorrow is a little busy.  IRC isn't my best medium.

I'm just winding down for bed so and won't be back for 8 hours or so.  It
looks like we both have some definite ideas so a quick chat might be helpful.

That time line is a bit challenging.  My safe guess was about a week to get
everything written and tested... 

Anyway I will do what I can.  I don't want to even think about how
complex a network I had to setup to get IPv6 going behind our firewall
at work this morning.    I stopped waiting for the sysadmins to set
things up properly....

Anyway see you in a couple of hours.

Eric
