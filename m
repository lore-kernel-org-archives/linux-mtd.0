Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14tYKK-00005e-00
	for mtd-list@infradead.org; Sat, 28 Apr 2001 18:16:12 +0100
Date: Sat, 28 Apr 2001 10:15:55 -0700
From: David Schleef <ds@schleef.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: Re: sharp driver dissimilarities
Message-ID: <20010428101555.A22768@stm.lbl.gov>
Reply-To: David Schleef <ds@schleef.org>
References: <20010428090021.A21620@stm.lbl.gov> <20010427133716.A20218@stm.lbl.gov> <3AE98278.48DA955@daniel.com> <002801c0ceed$28aad830$0a01a8c0@Win1> <3AE98278.48DA955@daniel.com> <22885.988382072@redhat.com> <20010427133716.A20218@stm.lbl.gov> <9152.988454085@redhat.com> <20010428090021.A21620@stm.lbl.gov> <17699.988474317@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17699.988474317@redhat.com>; from dwmw2@infradead.org on Sat, Apr 28, 2001 at 05:11:57PM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, Apr 28, 2001 at 05:11:57PM +0100, David Woodhouse wrote:
> 
> ds@schleef.org said:
> >  I tried and failed, but that may be just my lack of understanding of
> > the CFI driver.  The commands, command write locations, and status
> > bits have no similarity to other chip drivers.
> 
> The commands certainly have some similarity with the cfi_cmdset_0001 code, 
> which isn't particularly surprising as command set 0001 is 'Intel/Sharp'.

Heh...

> However, at the time you did sharp.c, I believe that CFI code wasn't 
> sufficiently generic to deal with 4x8-bit chips. It ought to manage that 
> now, though.

I'm not sure that was the case.  I'd chalk it up to be not being
very observant.

I actually started from the cfi_cmdset_0001.c driver.  In the
process, I noticed a few things that I don't like about it.

The write process uses word_write_time and adjusts it so that it
settles at the average write time.  The problem with that
method is that half the time, you will be sleeping for 10 ms
on something that may finish in 1 more usec of waiting.  Not
pretty.  The sharp driver write speed went up by a factor of
about 10 when I fixed that.  It just uses the braindead "spin
on the status register" for ~100 us.  Perhaps some kind of
hybrid is better, but schedule_timeout is a significant
performance hit.

A similar thing is true about block erase -- the schedule_timeout(HZ)
means that the earliest time the driver will notice that the
chip is done erasing is 1 s.

I also didn't understand how the locking was supposed to work,
so I rewrote it in the sharp driver.  I like it better.

On the other hand, of course, the sharp driver only handles
one interleve.





dave...



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
