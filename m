Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13K1r3-0003JE-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 17:58:53 +0100
Date: Wed, 2 Aug 2000 09:58:48 -0700
From: Philipp Rumpf <prumpf@uzix.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Alexander Larsson <alex@cendio.se>, Markus Thiesmeyer <mthi@gmx.de>,
	mtd@infradead.org, jffs-dev@axis.com, bmatthews@redhat.com
Subject: Re: Is JFFS a full featured filesystem?
Message-ID: <20000802095848.B20345@fruits.uzix.org>
References: <Pine.LNX.3.96.1000802154249.31703A-100000@biffen.cendio.se> <24735.965226004@cygnus.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <24735.965226004@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, Aug 02, 2000 at 03:20:04PM +0100, David Woodhouse wrote:
> alex@cendio.se said:
> >  Exactly how did you plan to work out the dirty ranges? Compare with
> > on-flash contents? 
> 
> Apparently it's easy when using generic_file_write, because prepare_write 
> will give you the exact range. 

Both prepare_write and commit_write, so we have full control over what
happens.  The arguments to {prepare,commit}_write are offsets within the
actual page (so <= PAGE_SIZE), but page->index holds the higher bits of
the logical offset.

> When doing writable mmap() we have to do something cleverer - basically yes,
> comparing with the on-flash contents. We can either do that by going and
> reading the flash nodes again on writepage(), or we can keep a copy of the 
> clean page in RAM before it's dirtied. 

Or we can just make writable mmap()s fail - applications should handle that
case, and it seems rather easy to fuck up and corrupt an fs by not handling
it correctly.

> To start with, I'm inclined just to accept the hit of the 4Kb writes, and 
> let the GC combine nodes later as necessary. Comparing with old contents 
> can come later. This is only going to be a problem with writable mmap(), 
> which isn't supported at the moment _anyway_. The normal write() case is 

I don't see where a writable mmap() fails in 2.2 - in 2.4 it's obvious.

	Philipp


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
