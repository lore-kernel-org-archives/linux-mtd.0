Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13snQc-00074W-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 14:39:18 +0000
Date: Mon, 6 Nov 2000 12:54:59 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock
In-Reply-To: <Pine.LNX.4.21.0011060644560.14068-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.10.10011061235070.697-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 6 Nov 2000, David Woodhouse wrote:

> On Sun, 5 Nov 2000, Nicolas Pitre wrote:
> > 	insmod mtdcore.o
> > 	insmod mtdram.o
> > 	insmod mtdblock.o
> > 	mke2fs /dev/mtdblock0
> > 	mount /dev/mtdblock0 /mnt
> > 	cp -a /sbin /mnt/sbin
> > 	cat /dev/mtdblock0 > /dev/null
> > 	[BOOM! random crash...]
> > 
> > Am I the only one to experience this?
> 
> Nope. I can reproduce it. handle_mtdblock_request is calling
> end_request() when req->bh->b_end_io is NULL, even though it wasn't
> like that at the beginning of handle_mtdblock_request.

In fact, it's not always NULL but rather random garbage.

> Looks like the following comment is incorrect:
>  * The head of our request queue is considered active so there is no need 
>  * to dequeue requests before we are done.

If you look at drivers/block/ll_rw_blk.c

/**
 * blk_queue_headactive - indicate whether head of request queue may be active
 * @q:       The queue which this applies to.
 * @active:  A flag indication where the head of the queue is active.
 *
 * Description:
 *    The driver for a block device may choose to leave the currently active
 *    request on the request queue, removing it only when it has completed.
 *    The queue handling routines assume this by default for safety reasons
 *    and will not involve the head of the request queue in any merging or
 *    reordering of requests when the queue is unplugged (and thus may be
 *    working on this particular request).
 *
 *    If a driver removes requests from the queue before processing them, then
 *    it may indicate that it does so, there by allowing the head of the queue
 *    to be involved in merging and reordering.  This is done be calling
 *    blk_queue_headactive() with an @active flag of %0.
 *
 *    If a driver processes several requests at once, it must remove them (or
 *    at least all but one of them) from the request queue.
 *
 *    When a queue is plugged (see blk_queue_pluggable()) the head will be
 *    assumed to be inactive.
 **/

So in our case, q->head_active is 1 by default.

Looking at __make_request() you can see the head of the queue is actually
skipped when the queue is unplugged.  It is plugged only when actually
empty and no request are processed until it gets unplugged again.  All
this is done when io_request_lock is held.  That's why I came to the
conclusion that requests don't have to be removed earlier.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
