Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13so3s-0007Cg-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 15:19:52 +0000
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13so3r-0007Ca-00
	for mtd@infradead.org; Mon, 06 Nov 2000 15:19:51 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10011061506410.530-100000@xanadu.gn.com> 
References: <Pine.LNX.4.10.10011061506410.530-100000@xanadu.gn.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 06 Nov 2000 15:19:47 +0000
Message-ID: <21552.973523987@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nico@cam.org said:
>  Nope.  The only place where the queue can be plugged is:
>         if (list_empty(head)) {
>                 q->plug_device_fn(q, bh->b_rdev); /* is atomic */
> Therefore the queue can't be plugged until we emptied it.

But it starts off empty - so doesn't it get plugged the first time a 
request is added? But it doesn't actually bite us until requests are merged 
- when we do 'cat /dev/mtdblock0' or massive writes.

> To be sure I tried to disable plugging by providing a dummy plug
> function that does nothing.  No difference.

Ah. If something is mucking with the request at the head of the queue while 
 (q->head_active && !q->plugged) then I think that has to be a kernel bug.

Just before the end_request() in mtdblock_handle_request(), can you put in 
a sanity check for req->bh->b_end_io? If it's not a sane value, can you 
print the current values of q->head_active and q->plugged?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
