Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8QnQ-0001si-9T
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 17:33:53 -0500
Date: Mon, 7 Mar 2005 23:33:29 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Gareth Bult <gareth@linux.co.uk>
Message-ID: <20050307223329.GG26318@wohnheim.fh-wedel.de>
References: <1110043569.11425.63.camel@squizzey.bult.co.uk>
	<20050307110413.GD2198@wohnheim.fh-wedel.de>
	<1110200816.11535.15.camel@squizzey.bult.co.uk>
	<20050307142402.GC9597@wohnheim.fh-wedel.de>
	<1110220494.11445.44.camel@squizzey.bult.co.uk>
	<20050307190012.GA24412@wohnheim.fh-wedel.de>
	<1110226862.29792.149.camel@baythorne.infradead.org>
	<1110229064.11284.18.camel@squizzey.bult.co.uk>
	<1110230771.4591.12.camel@localhost.localdomain>
	<1110233417.11311.58.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1110233417.11311.58.camel@squizzey.bult.co.uk>
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

On Mon, 7 March 2005 22:10:17 +0000, Gareth Bult wrote:
> 
> When I get time I'll test it. If it works, I may even use it. I'm not
> however desperate to have my name on it. Everyone screws up code - it's
> not a problem .. submitting changed code however without testing it is a
> little .. overconfident (?)

When I wrote it, I lacked the hardware to test it.  Then I tested it
with mtdblock, and it worked.  Then I tested it with jffs2 and that
didn't work.  I suspected jffs2, spent a week (about 50-60 hours) on
that one, wrote 34 seperate patches for jffs2 and still couldn't find
it.

Bug was actually in block2mtd, mtdblock just didn't trigger it.  Darn!

Only after testing did I submit the code to cvs, so I was not
overconfident.  Stupid is more to the point.

> I don't work on code for credit, I work on it because I enjoy it.

Well, the credit is free advertisement.  On the next job interview, a
"just grep the kernel sources" comment explains my qualifications and
may keep me from unemployment here or raise my salary there.

Credit is never the reason to write code in the first place.  My
block2mtd patches were written for fun and because I would like to
replace my hard driver with a USB key.  But the free extra doesn't
hurt, at least until I win the lottery (and I never play).

Jörn

-- 
Don't patch bad code, rewrite it.
-- Kernigham and Pike, according to Rusty
