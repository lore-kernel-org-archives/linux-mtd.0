Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H4Oe-0008O9-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 14:05:20 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13H4Ob-0008O3-00
	for mtd@infradead.org; Tue, 25 Jul 2000 14:05:18 +0100
Date: Tue, 25 Jul 2000 15:02:18 +0200 (CEST)
From: Bjorn Wesen <bjornw@axis.com>
To: Finn Hakansson <finn@axis.com>
cc: "mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write 
In-Reply-To: <Pine.LNX.4.21.0007251206470.17368-100000@vvv.axis.se>
Message-ID: <Pine.LNX.3.96.1000725145702.8086O-100000@fafner.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 25 Jul 2000, Finn Hakansson wrote:
> > After making a few copies of /usr and /lib, then deleting them, I saw it
> > take an hour and a half with a 16Mb flash which was about half-full.
> 
> Then something else must be very wrong. A garbage collect shouldn't take
> more than a few seconds at most. Unless you have a really slow flash chip.

It usually takes about 1-2 seconds to erase a sector, so if you really
need to erase the entire 16 mb flash during GC, that's 250 sectors times 2
seconds, about 8 minutes. Mileage may vary depending on flash manufacturer
- I've never used 16 mbyte flashes in anything.. 

Now of course this should not be necessary, because under normal
circumstances you're not dirtying that many sectors, but we have not
implemented the more flexible sector allocation scheme yet so we cannot
take advantage of that. So instead of the GC needing to erase redundant
sectors * erasetime, it needs to erase used-sectors * erasetime which is
usually much more.

> > But it's still done in process context, and writes of new nodes have to 
> > wait while it's happening. Shifting that into its own kernel thread would 
> > be nice, and would also allow us to merge writes. 

Yes that would be more nice. The GC could interleave its operations
incrementally in the thread. There is no state in the GC operation (except
keeping writes from coming into the sector we're about to clear :) so it
should be easy to do.

-Bjorn




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
