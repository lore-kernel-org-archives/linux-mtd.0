Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from zen.stanford.edu ([171.65.16.116])
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11EJSx-0003MC-00
	for mtd@infradead.org; Tue, 10 Aug 1999 22:29:52 +0100
Message-ID: <19990810142948.59781@zen.stanford.edu>
Date: Tue, 10 Aug 1999 14:29:48 -0700
From: David Hinds <dhinds@zen.stanford.edu>
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver.
References: <19990810140454.34027@zen.stanford.edu> <Pine.LNX.3.96.990810151540.7675A-100000@white.priv.deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.3.96.990810151540.7675A-100000@white.priv.deltatee.com>; from Jason Gunthorpe on Tue, Aug 10, 1999 at 03:20:36PM -0600
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Tue, Aug 10, 1999 at 03:20:36PM -0600, Jason Gunthorpe wrote:
> 
> As far as memory devices go, detecting is a big part of the entire
> process. I also had lots of weird trouble getting this memory card up, I
> finally did it but it was quite trying.

Hmmm, I'd have thought that getting the flash algorithms right was the
bigger issue (that's certainly what took the most time for me).

> On all the memory cards I've seen the CIS is stored on the flash itself,
> so if you erase the CIS then it's gone. One of our systems here boots
> from a PCMCIA memory card, putting a CIS in there gets in the way. So for
> most of my purposes the current driver doesn't work.

What cards, specifically, are you using?

All Intel Series 2 and 2+ cards put the CIS in a separate chip.  The
Series 100 cards have it in the first flash block.

-- Dave


To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
