Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13tfNP-0004zw-00
	for mtd-list@infradead.org; Thu, 09 Nov 2000 00:15:35 +0000
Date: Wed, 8 Nov 2000 19:28:05 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <Pine.LNX.4.21.0011082149370.1291-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.10.10011081916440.927-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 8 Nov 2000, David Woodhouse wrote:

> On Tue, 7 Nov 2000, Nicolas Pitre wrote:
> 
> > > Ah. If something is mucking with the request at the head of the queue while 
> > >  (q->head_active && !q->plugged) then I think that has to be a kernel bug.
> > 
> > OK!  Forget all this now.  It wasn't a kernel bug, of course.
> > 
> > The lesson is:  never use req->nr_sectors in a request function unless
> > you're playing special tricks with different segments and you know what
> > you're doing.  In the common case req->current_nr_sectors should be used.
> > 
> > It works beautifully now.
> 
> I think we still need to disable plugging to protect the head of the 
> list. It's a small race but it's non-zero.

Please show me.

After reviewing the code again and again, I can't see where a race could
actually happen.  Plugging is also a good thing (tm) for flash because is
increases the chance of not trashing the mtdblock local cache.  Since the
request function is called only when the queue is unplugged, and because
the queue head is considered active, we can leave the current request on
the queue while it is being processed.  As long as there is a request on
the queue, it won't get re-plugged so we are still safe.  This prevents
unnecessary processing, makes the code look prettier and is more portable
between 2.2.x and 2.4.x.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
