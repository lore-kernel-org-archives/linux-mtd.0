Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8QIj-0000fR-4R
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 17:02:10 -0500
Date: Mon, 7 Mar 2005 23:01:38 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Gareth Bult <gareth@linux.co.uk>
Message-ID: <20050307220138.GF26318@wohnheim.fh-wedel.de>
References: <1110043569.11425.63.camel@squizzey.bult.co.uk>
	<20050307110413.GD2198@wohnheim.fh-wedel.de>
	<1110200816.11535.15.camel@squizzey.bult.co.uk>
	<20050307142402.GC9597@wohnheim.fh-wedel.de>
	<1110220494.11445.44.camel@squizzey.bult.co.uk>
	<20050307190012.GA24412@wohnheim.fh-wedel.de>
	<1110226862.29792.149.camel@baythorne.infradead.org>
	<1110229064.11284.18.camel@squizzey.bult.co.uk>
	<20050307210745.GD26318@wohnheim.fh-wedel.de>
	<1110231980.11310.40.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1110231980.11310.40.camel@squizzey.bult.co.uk>
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

On Mon, 7 March 2005 21:46:20 +0000, Gareth Bult wrote:
> 
> > If you insist, I can remove the driver completely and rewrite it from
> > scratch, with none of your code remaining.  Tell me to do so and I
> > will.
> 
> Insist? I didn't either mention or suggest it (!)

Good.

> One issue you might like to be aware of ..
> 
> To use blkmtd as a module, you do;
> 
> modprobe blkmtd device=/dev/sda1 (for example)
> 
> For block2mtd, you do;
> 
> modprobe block2mtd block2mtd=/dev/sda1 (I think..)

Correct.

> Anyone who's coded up an initrd for example would have to recode for
> both a different driver name and a different parameter name. (which
> incidentally isn't immediately obvious)
> 
> It might (?) make sense to have the new driver replace the old (as an
> option, rather than have a new name) and use the same parameter name ..
> just as a general principle so people don't have to go and recode to
> match the driver upgrade (?)
> 
> .. the "write" speed on the new driver is > 100x faster than the old ..
> I was unable to think of a practical use for the old driver .. (!)

The old driver also got the interface wrong.  In your example, with
just a single device to use, it doesn't matter.  But once you deal
with several devices, the old variant really sucks.  That is why I
changed it (and why I renamed the driver).

That said, I would like to agree with you.  If the new driver could
mimikri the old one, that would be a clear advantage.  The question
is, how can both advantages - better interface and compatibility - be
combined.  At the moment, I don't have an answer, but I'll keep
thinking about it.

Jörn

-- 
The grand essentials of happiness are: something to do, something to
love, and something to hope for.
-- Allan K. Chalmers
