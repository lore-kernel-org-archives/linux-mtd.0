Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13td73-00043p-00
	for mtd-list@infradead.org; Wed, 08 Nov 2000 21:50:33 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13td72-00043j-00
	for mtd@infradead.org; Wed, 08 Nov 2000 21:50:33 +0000
Date: Wed, 8 Nov 2000 21:50:28 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <Pine.LNX.4.10.10011070359100.530-100000@xanadu.gn.com>
Message-ID: <Pine.LNX.4.21.0011082149370.1291-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 7 Nov 2000, Nicolas Pitre wrote:

> > Ah. If something is mucking with the request at the head of the queue while 
> >  (q->head_active && !q->plugged) then I think that has to be a kernel bug.
> 
> OK!  Forget all this now.  It wasn't a kernel bug, of course.
> 
> The lesson is:  never use req->nr_sectors in a request function unless
> you're playing special tricks with different segments and you know what
> you're doing.  In the common case req->current_nr_sectors should be used.
> 
> It works beautifully now.

I think we still need to disable plugging to protect the head of the 
list. It's a small race but it's non-zero.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
