Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12UByi-0001PB-00
	for mtd-list@infradead.org; Sun, 12 Mar 2000 17:16:32 +0000
Date: Sun, 12 Mar 2000 18:16:28 +0100 (CET)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: More comments 
In-Reply-To: <20561.952868645@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000312180858.29783B-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Sun, 12 Mar 2000, David Woodhouse wrote:

> alex@cendio.se said:
> >  What is the reason for having the read and write ops not always read/
> > write the number of bytes you specify? (I guess that this is what the
> > size_t *retlen argument means.)
> 
> That's normal - the read() and write() calls of everything have always been
> allowed to return a different number of bytes than the number they were asked
> to transfer - and not only when the O_NONBLOCK flag is in force. I just chose
> to return the actual number of bytes in a separate place to the error code,
> that's all.

I'm aware of the normal conventions for read (2), but is this good in the
kernelspace api? I mean, the only reason for a flash to not read all data
is if the flash is paged, and you don't want to bother changing page in
the read function. On the other hand, all places in the kernel that 
read data from the flash except the char device read op (ie. the block
device, mtd, flash filesystems etc) needs to loop on each read. This
looks like a lot of overhead code that is easy to forget (the current ftl
code doesn't seem to do any looping on reads).
 
> > What concurrency assumptions does mtd make? 
> 
> Absolutely none.
 Good.
 
> > What is "int *lock" in struct mtd? 
> 
> A mistake, which I believe crept in with mapped.c and its associated drivers.
> 
> > (and shouldn't it be a semaphore or a spinlock?) 
> 
> No, it should be deleted :)

 Exterminate it with extreme prejudice.
 
> This touches on one of the reasons why I'd like to phase out the mtd_point()
> routines - because I don't like the locking issues involved. If your device
> makes use of paging, then you'd have to lock the device at point() and leave it
> locked until unpoint() - which could be a long time depending on the caller. So
> while I'd like to have the facility, because it will allow us to do XIP, I'm
> tempted to restrict it to only those devices which can do it without exclusive
> locking - i.e. devices which are completely mem-mapped and not paged.

But if the device is fully memory mapped the current point()/unpoint()
api is a bit overweight. A pointer and size would be enough.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
