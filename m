Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12UQoL-0002uv-00
	for mtd-list@infradead.org; Mon, 13 Mar 2000 09:06:49 +0000
Date: Mon, 13 Mar 2000 10:06:45 +0100 (CET)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: More comments 
In-Reply-To: <21948.952881998@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000313094651.32523A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Sun, 12 Mar 2000, David Woodhouse wrote:

> 
> alex@cendio.se said:
> >  I'm aware of the normal conventions for read (2), but is this good in
> > the kernelspace api? I mean, the only reason for a flash to not read
> > all data is if the flash is paged, and you don't want to bother
> > changing page in the read function. On the other hand, all places in
> > the kernel that  read data from the flash except the char device read
> > op (ie. the block device, mtd, flash filesystems etc) needs to loop on
> > each read.
> 
> In practice, this hasn't mattered because the devices allow you to read up to 
> a block at a time, and the block device and flash filesystems usually want to 
> read <= 1 block. The only place that has to retry is the mtd chardevice, which 
> means the retry is in userspace.
> 
> However, that behaviour isn't guaranteed, so strictly speaking, perhaps we 
> ought to change it. How about simply declaring that the read() functions MUST 
> read up to the end of the block on which they start, and may not return an 
> incomplete read unless requested to do a multi-block read.

I don't know. It still sounds a bit strange to me. I can understand it
being better in the case of the char device, there you can avoid
sleeping in the kernel and just return to userspace. But I'm planning
to port Axis journaling flash file system to MTD, and it writes all
data in a linear log (like a circular buffer) meaning that writes could
easily be over block boundaries. That means i have to wrap all write
and reads in a function that loops over the read/write call.
 
> That would make it safe for all current the kernel-space users, wouldn't it?
> 
> >  But if the device is fully memory mapped the current point()/
> > unpoint() api is a bit overweight. A pointer and size would be enough.
> 
> Fine. Then it can go too. Just as soon as I've stopped ftl.c from using it :)

Hmm, i think i spoke to soon. It would still need some kind of locking.
How about an explicit read_lock()/read_unlock(). It could even use
rw_semaphores to allow concurrent reads from several readers.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
