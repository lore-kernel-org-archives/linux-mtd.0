Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14tYUe-00006f-00
	for mtd-list@infradead.org; Sat, 28 Apr 2001 18:26:52 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14tYUd-00006Z-00
	for mtd@infradead.org; Sat, 28 Apr 2001 18:26:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010428101555.A22768@stm.lbl.gov> 
References: <20010428101555.A22768@stm.lbl.gov>  <20010428090021.A21620@stm.lbl.gov> <20010427133716.A20218@stm.lbl.gov> <3AE98278.48DA955@daniel.com> <002801c0ceed$28aad830$0a01a8c0@Win1> <3AE98278.48DA955@daniel.com> <22885.988382072@redhat.com> <20010427133716.A20218@stm.lbl.gov> <9152.988454085@redhat.com> <20010428090021.A21620@stm.lbl.gov> <17699.988474317@redhat.com> 
To: David Schleef <ds@schleef.org>
Cc: mtd@infradead.org
Subject: Re: sharp driver dissimilarities 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 28 Apr 2001 18:26:26 +0100
Message-ID: <19377.988478786@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ds@schleef.org said:
>  The write process uses word_write_time and adjusts it so that it
> settles at the average write time.  The problem with that method is
> that half the time, you will be sleeping for 10 ms on something that
> may finish in 1 more usec of waiting.

We only sleep for that long if current->need_resched.

But you're right that udelay() is fairly pointless - we should just spin 
polling the flash. Assuming there aren't power consumption issues - but as 
udelay is always a CPU spin anyway, I think that's OK.


ds@schleef.org said:
>  A similar thing is true about block erase -- the schedule_timeout(HZ)
> means that the earliest time the driver will notice that the chip is
> done erasing is 1 s. 

There's a tradeoff here between performance of the flash driver and 
performance of the rest of the system. We should probably sleep only if 
current->need_resched, I suppose.


ds@schleef.org said:
>  I also didn't understand how the locking was supposed to work, so I
> rewrote it in the sharp driver.  I like it better. 

The problem with having a single generic _wait function is that they're not 
actually the same. When you want to read, you can interrupt erases or 
writes. When you want to write, you can interrupt erases.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
