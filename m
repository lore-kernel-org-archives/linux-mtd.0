Received: from ptb-relay02.plus.net ([212.159.14.213])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8Q3S-0000SS-Vm
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 16:46:23 -0500
From: Gareth Bult <gareth@linux.co.uk>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050307210745.GD26318@wohnheim.fh-wedel.de>
References: <1110043569.11425.63.camel@squizzey.bult.co.uk>
	<20050307110413.GD2198@wohnheim.fh-wedel.de>
	<1110200816.11535.15.camel@squizzey.bult.co.uk>
	<20050307142402.GC9597@wohnheim.fh-wedel.de>
	<1110220494.11445.44.camel@squizzey.bult.co.uk>
	<20050307190012.GA24412@wohnheim.fh-wedel.de>
	<1110226862.29792.149.camel@baythorne.infradead.org>
	<1110229064.11284.18.camel@squizzey.bult.co.uk>
	<20050307210745.GD26318@wohnheim.fh-wedel.de>
Content-Type: text/plain
Date: Mon, 07 Mar 2005 21:46:20 +0000
Message-Id: <1110231980.11310.40.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: Re; MTD (2) Block Driver broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> If you insist, I can remove the driver completely and rewrite it from
> scratch, with none of your code remaining.  Tell me to do so and I
> will.

Insist? I didn't either mention or suggest it (!)

Given that very few people use it, spending a week rewriting and testing
would seem a little inefficient (?)

fyi; there are at least 10,000 copies in circulation and no outstanding
bug or problem reports (that I know of) .. that said, most users are
probably unaware they're using it.

> BTW: Thank you for the bug report.  I've noticed this earlier but
> suspected jffs2 or my cowlink work to be at fault.  Despite our
> ability to get mad at each other, both your initial code and the bug
> report were very helpful (and worth any grief on my side).

No problem.

One issue you might like to be aware of ..

To use blkmtd as a module, you do;

modprobe blkmtd device=/dev/sda1 (for example)

For block2mtd, you do;

modprobe block2mtd block2mtd=/dev/sda1 (I think..)

Anyone who's coded up an initrd for example would have to recode for
both a different driver name and a different parameter name. (which
incidentally isn't immediately obvious)

It might (?) make sense to have the new driver replace the old (as an
option, rather than have a new name) and use the same parameter name ..
just as a general principle so people don't have to go and recode to
match the driver upgrade (?)

.. the "write" speed on the new driver is > 100x faster than the old ..
I was unable to think of a practical use for the old driver .. (!)

Gareth.

--
Linux.co.uk - promoting open source software in the UK
"If you have an apple and I have an apple and we exchange apples then
you and I will still each have one apple. But if you have an idea and I
have an idea and we exchange these ideas, then each of us will have two
ideas." - George Bernard Shaw
