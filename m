Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8PSI-0008OJ-8Y
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 16:07:59 -0500
Date: Mon, 7 Mar 2005 22:07:45 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Gareth Bult <gareth@linux.co.uk>
Message-ID: <20050307210745.GD26318@wohnheim.fh-wedel.de>
References: <1110043569.11425.63.camel@squizzey.bult.co.uk>
	<20050307110413.GD2198@wohnheim.fh-wedel.de>
	<1110200816.11535.15.camel@squizzey.bult.co.uk>
	<20050307142402.GC9597@wohnheim.fh-wedel.de>
	<1110220494.11445.44.camel@squizzey.bult.co.uk>
	<20050307190012.GA24412@wohnheim.fh-wedel.de>
	<1110226862.29792.149.camel@baythorne.infradead.org>
	<1110229064.11284.18.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1110229064.11284.18.camel@squizzey.bult.co.uk>
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

On Mon, 7 March 2005 20:57:43 +0000, Gareth Bult wrote:
> 
> Well, my inclination is to go with "please remove it".
> 
> My priority is working code, working documentation and working Linux.

Fwiw, I've found and fixed the bug.  Patch, along with the removal of
your name, is on the way to Linus.

If you insist, I can remove the driver completely and rewrite it from
scratch, with none of your code remaining.  Tell me to do so and I
will.

BTW: Thank you for the bug report.  I've noticed this earlier but
suspected jffs2 or my cowlink work to be at fault.  Despite our
ability to get mad at each other, both your initial code and the bug
report were very helpful (and worth any grief on my side).

Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack
