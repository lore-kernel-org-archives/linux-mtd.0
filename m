Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sNOX-0006Ny-Rs
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 15:05:01 +0100
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19sNOq-0001xP-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 16:05:20 +0200
To: linux-mtd@lists.infradead.org
From: "John Hall" <john-news1@cambridgetechgroup.com>
Date: Thu, 28 Aug 2003 14:58:31 +0100
Message-ID: <414.3f4e0a87.b6729@irwin2.crw.uk.net>
References: <6306.3f4dd070.667ee@irwin2.crw.uk.net>
	<1062066193.8465.1571.camel@hades.cambridge.redhat.com>
	<696f.3f4dd944.a899d@irwin2.crw.uk.net>
	<1062070043.8465.1615.camel@hades.cambridge.redhat.com>
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

On 28 August 2003 12:27, David Woodhouse <dwmw2@infradead.org> wrote:

> > I wasn't sure how JFFS2 does its writes, i.e. whether it did each
> > write immediately to the flash, or whether it would build a page or
> > block's worth before writing to the flash. Now I see that each write
> > is done immediately.

> Not on NAND. We _can't_ just write out every tiny node as it happens,
> since we could violate the writes-per-page limit for NAND. We batch
> writes with a write-behind buffer, flushing it if it's got dirty data
> in after a certain amount of time. It was that flushing which was
> causing the problem. Now we trigger garbage-collection to fill it,
> instead of just padding and wasting the space.

OK, that makes sense.

Is the current CVS head considered stable, and will it work correctly
under 2.4 (in fact armlinux 2.4.18-rmk7)?

On a completely different note, is it possible to disable compression in
JFFS2 without hacking the sourcecode?

Cheers,
John
