Received: from relais.videotron.ca ([24.201.245.36])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IgMH0-0006oF-UY
	for linux-mtd@lists.infradead.org; Fri, 12 Oct 2007 16:18:02 +0100
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-0.15 (built Feb  9 2007))
	with ESMTP id <0JPT00IF40ZO39G0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 12 Oct 2007 11:14:13 -0400 (EDT)
Date: Fri, 12 Oct 2007 11:14:13 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: Recursion in CFI driver. Is it really necessary to have.
In-reply-to: <Pine.LNX.4.64.0710121547550.21455@pentafluge.infradead.org>
Message-id: <alpine.LFD.0.9999.0710121112450.19446@xanadu.home>
References: <Pine.LNX.4.64.0710121547550.21455@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 12 Oct 2007, Alexey Korolev wrote:

> Nicolas,
> 
> > 
> > Please be more clear about your problem first.
> > 
> The problem I've found is kernel deadlock on JFFF2 simultaneous operations.
> Also debugging showed that the issue is caused by tons of recursions in
> get_chip call. This is the stack dump I could catch before the deadlock.
> 
> 124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
> [<c0124a44>] (get_chip+0x0/0x808) from [<c01276d0>] (do_erase_oneblock+0x3c/0x700)
[...]

Wow.  That's certainly bad.

It's been a while that I wrote that code, but looking at it now I just 
can't see how that could happen.  It is like if it was recursing on 
itself, but the code explicitly guards against that.  See:

		if (contender && contender != chip) {
			[...]
			ret = get_chip(map, contender, contender->start, mode);

So from that point, 'chip' and 'contender' must be equal when get_chip() 
is called again, and therefore recursion should stop there.


Nicolas
