Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12U8f9-00015L-00
	for mtd-list@infradead.org; Sun, 12 Mar 2000 13:44:07 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12U8f8-00015F-00
	for mtd@infradead.org; Sun, 12 Mar 2000 13:44:06 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000312130417.7628A-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000312130417.7628A-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org
Subject: Re: More comments 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 12 Mar 2000 13:44:05 +0000
Message-ID: <20561.952868645@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  What is the reason for having the read and write ops not always read/
> write the number of bytes you specify? (I guess that this is what the
> size_t *retlen argument means.)

That's normal - the read() and write() calls of everything have always been
allowed to return a different number of bytes than the number they were asked
to transfer - and not only when the O_NONBLOCK flag is in force. I just chose
to return the actual number of bytes in a separate place to the error code,
that's all.

> What concurrency assumptions does mtd make? 

Absolutely none.

> Since the ops can sleep (could be waiting for a sector erase to finish) 
> there must be some kind of locking. Who does the locking?

Locking issues can be complex and hardware-dependent, depending on your paging 
strategy, on how many different windows you have available for paging, etc...

Therefore, any locking you require is entirely internal to your driver. You 
may be called concurrently by every processor in the system, and if you've 
called schedule() you can be called even more than that.

> What is "int *lock" in struct mtd? 

A mistake, which I believe crept in with mapped.c and its associated drivers.

> (and shouldn't it be a semaphore or a spinlock?) 

No, it should be deleted :)

> Which operations can be called from interrupt-context? 

To declare "operation XXX can be called from interrupt context" we have to 
impose that on the author of _every_ device driver. Unless you want to 
enlighten me, I can't see any reason why we'd want to do that - so my answer 
for now is 'none'.





This touches on one of the reasons why I'd like to phase out the mtd_point()
routines - because I don't like the locking issues involved. If your device
makes use of paging, then you'd have to lock the device at point() and leave it
locked until unpoint() - which could be a long time depending on the caller. So
while I'd like to have the facility, because it will allow us to do XIP, I'm
tempted to restrict it to only those devices which can do it without exclusive
locking - i.e. devices which are completely mem-mapped and not paged.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
