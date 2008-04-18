Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JmtYr-0002zV-46
	for linux-mtd@lists.infradead.org; Fri, 18 Apr 2008 16:35:41 +0000
Date: Fri, 18 Apr 2008 17:35:36 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: cfi_cmdset_0001.c: Excessive erase suspends
Message-ID: <20080418163536.GD31520@shareable.org>
References: <4807B552.7090501@users.sourceforge.net>
	<Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>,
	Anders =?iso-8859-1?Q?Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexey Korolev wrote:
> > "Newly-erased block contained word 0xffff0000 at offset 0x00180000"
> > on a board using Intel 28F640J5 flash chips.
> > 
> > It looks like the errors are caused by large amounts of erase suspends.
> > Each erase gets suspended around 8500 times and in some extreme cases
> > a lot more. The erase ends without any error bits set but it turns out
> > that it has failed.
> > 
> > It seems like some flash chips have a limit on the number of times that
> > the erase can be suspended. I have not seen any information on the Intel
> > chips but a Spansion AppNote says 5,980 times for some of their devices
> > before running the risk of an erase fail.

That's very interesting, thanks.

> We saw the similar  problem in our tests. As a possible solution I could
> suggest to disable erase suspend on write. 

That's quite bad for write latency, though.  Adding a suspend cycle
counter, and disabling suspend on write when it reaches a certain
number sounds better.

> Regarding limit of suspend/resume cycles: it is rather unclear how
> many cycles would be ok how many cycles would be not.  Special
> investigations are required here.

That's interesting too.

  - Do other chip docs say how many cycles are acceptable?
    Is there a count we can assume is safe for all devices of this
    type - like say 100?

  - Does the time spent in erase suspend matter?  E.g. if it was
    suspended for 1 minute due to lots of pending writes, restarted,
    and then suspended _again_ for 1 minute, etc. does that reduce the
    number of safe suspend-resume cycles due to the unstable
    partially-erased physical state?

  - Is it worth reading a block after erasing it, to verify that it's
    wiped - and mark blocks which have experienced >threshold suspend
    cycles as needing verification and re-erase, rather than meaning
    it's a bad block? ( Verification could be done lazily, on each part
    of the block just before writing. )  But is this good physically,
    or does too many suspends put the block into an unreliable state
    even if it does pass verification, so that it's important to limit
    the suspends rather than allow many and verify afterwards?

-- Jamie
