Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12db3N-0001jH-00
	for mtd-list@infradead.org; Fri, 07 Apr 2000 16:52:13 +0100
Date: Fri, 7 Apr 2000 17:54:13 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: get_mtd_device() 
In-Reply-To: <8078.955120318@devel2.axiom.internal>
Message-ID: <Pine.LNX.4.10.10004071730490.14685-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 7 Apr 2000, David Woodhouse wrote:

> alex@cendio.se said:
> > Why was get_mtd_device() removed?
> 
> Locking issues.
> 
> I need to change the __MOD_INC_USE_COUNT(mtd->module) calls in the user 
> modules to use try_inc_mod_count() on 2.3, and to deal appropriately with 
> failure. This will make me mostly happy about the race conditions which
> currently exist with drivers being unloaded at the same time as a user
> module's open() function is being called on a different CPU.
> 
> This means that the driver module unload path goes...
> 
>   Acquire unload_lock in kernel/module.c
>   call cleanup_module()
>   ->	Acquire mtd_table_mutex
> 	Remove the mtd_info from the list
> 	Drop mtd_table_mutex
>   Drop unload_lock
>   
> Now, I'm unhappy that I've just noticed that the unload_lock is a spinlock and 
> hence perhaps cleanup_module() shouldn't be allowed to sleep, and hence can't 
> try to acquire the mtd_table_mutex semaphore.
 Heh. Seems a bit bad yes.

> But besides this problem, which is going to bite a _lot_ of things, the
> behaviour of get_mtd_device would have to be something like...
> 
>   Acquire mtd_table_mutex
>   go through the mtd_table to get the one we want
>   call try_inc_mod_count()
>   -->	Acquire unload_lock
> 	increase the use count
> 	Drop unload_lock
>   Drop mtd_table_mutex
> 
> 
> Spot the deadlock. If you can tell me how to fix it, you can have 
> get_mtd_device() back :)

Hmmm, no obvious solution presents itself. I've just added a private
get_mtd_device() in my tree. When the rest of the fs works I'll try to
come up with a better solution.
 
> >  I need it or something like it in jffs to get the mtd device from the
> > minor device of the mtdblock device i shall mount. 
> 
> Could we add an ioctl() to mtdblock instead, to allow jffs to get direct 
> access to the mtd_info struct that way? 
> 
> Actually, I'd prefer in the end that mtdblock not be required for jffs to work 
> - after all, it's not really necessary except to keep mount(8) happy. 
> We ought to be able to use 'mount /dev/mtd0 -tjffs /mnt/wherever' 

I haven't actually tested this, I just assumed mount would check if
it was a block-device. Maybe it'll just work. I'll test.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
