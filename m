Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13szpR-0002hz-00
	for mtd-list@infradead.org; Tue, 07 Nov 2000 03:53:45 +0000
Date: Tue, 7 Nov 2000 04:04:35 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <21552.973523987@redhat.com>
Message-ID: <Pine.LNX.4.10.10011070359100.530-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 6 Nov 2000, David Woodhouse wrote:

> 
> nico@cam.org said:
> >  Nope.  The only place where the queue can be plugged is:
> >         if (list_empty(head)) {
> >                 q->plug_device_fn(q, bh->b_rdev); /* is atomic */
> > Therefore the queue can't be plugged until we emptied it.
> 
> But it starts off empty - so doesn't it get plugged the first time a 
> request is added? But it doesn't actually bite us until requests are merged 
> - when we do 'cat /dev/mtdblock0' or massive writes.
> 
> > To be sure I tried to disable plugging by providing a dummy plug
> > function that does nothing.  No difference.
> 
> Ah. If something is mucking with the request at the head of the queue while 
>  (q->head_active && !q->plugged) then I think that has to be a kernel bug.

OK!  Forget all this now.  It wasn't a kernel bug, of course.

The lesson is:  never use req->nr_sectors in a request function unless
you're playing special tricks with different segments and you know what
you're doing.  In the common case req->current_nr_sectors should be used.

It works beautifully now.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
