Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Zwi0-0003ie-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 15:11:04 +0100
Date: Tue, 28 Mar 2000 16:11:08 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: Preliminary documentation.
In-Reply-To: <18200.954240543@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000328155631.345A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 28 Mar 2000, David Woodhouse wrote:

> 
> I've now put written up the documentation I wrote out by hand last night.
> It's at http://www.linux-mtd.infradead.org/tech/
> 
> Comments, please. I haven't yet filled in my suggested restrictions on the 
> read/write functions, but I have removed the retlen arguments.
> 
> As I said, I'm changing the notifier stuff to make it cleaner. I have yet to 
> actually change the code to fit in with my new documentation. 

A suggested API for fully memory-mapped devices:

 void lock(struct mtd_info *mtd);
 void unlock(struct mtd_info *mtd);
 u_char *mapped; /* may be NULL if not memory mapped device */

(The "mapped" name could be better...)
  
Then just remove the point/unpoint calls.
 
> Also, a couple of questions on the decisions I've made:
> 
> 1. Is mtd->sync() enough, or could users want more access to the erase queue?
> 
> 	We could add 
> 		struct erase_info *mtd->eraseq;
> 		spin_lock_t	mtd->eraseq_lock;
> 	... and allow users to use that.

Nah, i don't think many people would use that. And it would limit the
driver implementation a bit.
 
> 2. Is the callback in the erase_info OK or would we be better off having a 
> wait_queue_head_t instead (or as well)?

I think the callback is enough, if people need a wait queue they could
make one themself from the callback.

Another thing. The void *priv field in the struct mtd isn't neccesary. As
the structure is allocated by the driver the driver could allocate a
larger structure (with a struct mtd as first field) and completely hide
internal data.

Why is there a size field in struct erase_info if it must always be the
size of the mtd erase block size?

Is struct erase_info.mtd filled in by driver or user?

I like the driverpriv proposal.

/ Alex





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
