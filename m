Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13snlI-00078f-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 15:00:40 +0000
Date: Mon, 6 Nov 2000 15:11:55 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <18194.973522065@redhat.com>
Message-ID: <Pine.LNX.4.10.10011061506410.530-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 6 Nov 2000, David Woodhouse wrote:

> 
> nico@cam.org said:
> >  So in our case, q->head_active is 1 by default.
> > Looking at __make_request() you can see the head of the queue is
> > actually skipped when the queue is unplugged.  It is plugged only when
> > actually empty and no request are processed until it gets unplugged
> > again.  All this is done when io_request_lock is held.  That's why I
> > came to the conclusion that requests don't have to be removed earlier.
> > 
> 
> OK. How about 'plugging'?
> 
> The code looks like this...
> 
>         /*
>          * skip first entry, for devices with active queue head
>          */
>         if (q->head_active && !q->plugged)
>                 head = head->next;
> 
> 
> It may be that if our request function returns without first ending the 
> request (as it does, because all it does is a wake_up()), the queue is 
> 'plugged' to wait for requests to be merged. 

Nope.  The only place where the queue can be plugged is:

        if (list_empty(head)) {
                q->plug_device_fn(q, bh->b_rdev); /* is atomic */

Therefore the queue can't be plugged until we emptied it.

To be sure I tried to disable plugging by providing a dummy plug function
that does nothing.  No difference.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
