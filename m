Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ttKK-00080T-00
	for mtd-list@infradead.org; Thu, 09 Nov 2000 15:09:20 +0000
Date: Thu, 9 Nov 2000 10:21:49 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <28227.973769694@redhat.com>
Message-ID: <Pine.LNX.4.10.10011091000270.927-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



Oh!  here's the third one!  It was sunk in my inbox... ;)

On Thu, 9 Nov 2000, David Woodhouse wrote:

> 
> dwmw2@infradead.org said:
> >  Upon further consideration, it may be cleaner (at the cost of
> > _slightly_ higher io_request_lock contention) just to _not_ drop the
> > spinlock between finishing one request and checking to see if the
> > queue is empty.
> 
> 'further consideration' is all well and good - but upon consumption of 
> generous quantities of coffee, it occurs to me that this doesn't protect us 
> from eating the first request on the queue if one arrives while the kernel 
> thread is still initialising itself.

Well spotted.

(today i'm definitely destined to agree with you whatever you say...)

> Defining a QUEUE_PLUGGED macro isn't that ugly, is it?

No it isn't.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
