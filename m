Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13snZ0-00075v-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 14:47:58 +0000
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13snYy-00075n-00
	for mtd@infradead.org; Mon, 06 Nov 2000 14:47:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10011061235070.697-100000@xanadu.gn.com> 
References: <Pine.LNX.4.10.10011061235070.697-100000@xanadu.gn.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 06 Nov 2000 14:47:45 +0000
Message-ID: <18194.973522065@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nico@cam.org said:
>  So in our case, q->head_active is 1 by default.
> Looking at __make_request() you can see the head of the queue is
> actually skipped when the queue is unplugged.  It is plugged only when
> actually empty and no request are processed until it gets unplugged
> again.  All this is done when io_request_lock is held.  That's why I
> came to the conclusion that requests don't have to be removed earlier.
> 

OK. How about 'plugging'?

The code looks like this...

        /*
         * skip first entry, for devices with active queue head
         */
        if (q->head_active && !q->plugged)
                head = head->next;


It may be that if our request function returns without first ending the 
request (as it does, because all it does is a wake_up()), the queue is 
'plugged' to wait for requests to be merged. 

Then the kernel thread is proceeding to deal with the requests while the 
ll_rw_blk code thinks that the driver's request function isn't running.

I'll see if I can find someone to explain the plugging stuff to me :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
