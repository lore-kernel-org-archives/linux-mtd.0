Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sK1N-0005iY-HP
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 11:28:53 +0100
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19sK1h-0008E0-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 12:29:13 +0200
To: linux-mtd@lists.infradead.org
From: "John Hall" <john-news1@cambridgetechgroup.com>
Date: Thu, 28 Aug 2003 11:28:18 +0100
Message-ID: <696f.3f4dd944.a899d@irwin2.crw.uk.net>
References: <6306.3f4dd070.667ee@irwin2.crw.uk.net>
	<1062066193.8465.1571.camel@hades.cambridge.redhat.com>
Sender: news <news@sea.gmane.org>
Subject: Re: Lost space on JFFS2 partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"David Woodhouse" <dwmw2@infradead.org> wrote in message
news:1062066193.8465.1571.camel@hades.cambridge.redhat.com...

> > 1. The files in question are log files and so there are lots of
> > small writes happening. How does JFFS2 compress files? Is it on a
> > block basis or per write? If it is the latter then I could imagine
> > that compression is actually having an adverse effect when a file is
> > created from a large number of small writes.

> What do you mean by 'on a block basis'?  JFFS2 does compression within
> each log entry, which in the case of small writes is basically
> per-write. It doesn't hurt though -- if the node payload would grow on
> compression, we write it out uncompressed.

I wasn't sure how JFFS2 does its writes, i.e. whether it did each write
immediately to the flash, or whether it would build a page or block's
worth before writing to the flash. Now I see that each write is done
immediately.

> > 2. A bug in JFFS2 was causing some unused space not to be garbage
> > collected. The version of JFFS2 being used is 9 months old, so
> > perhaps I should merge a later version in anyway.

> Sort of. I think it's related to a NAND-specific bug that I fixed last
> week, where we'd consistently waste space under that usage pattern, and
> not although it's reclaimable we wouldn't account it as free in
> statfs().
>
> We still don't account it as free -- but we don't waste space nearly as
> often as we used to either; we trigger garbage-collection to fill our
> buffer rather than just padding it.

Thanks for your explanation. I guess that I need to look at upgrading
JFFS2 (or more likely MTD).

Cheers,
John
