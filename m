Received: from rrcs-nys-24-97-130-2.biz.rr.com
	([24.97.130.2] helo=nt.sixnet.com ident=fwuser)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c5ho-0006ZP-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 15:53:04 +0100
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E474@NT>
From: Dave Ellis <DGE@sixnetio.com>
To: "'joakim.tjernlund@lumentis.se'" <joakim.tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Disk blocks for long periods
Date: Tue, 6 Aug 2002 10:53:00 -0400 
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

joakim.tjernlund@lumentis.se said:

> Have you tried to use cfi_udelay(chip->word_write_time) 
> instead of udelay(chip->word_write_time)? That will at least 
> let other processes run, won't it? 

The cfi_udelay() call is part of the problem, since it lets other
processes run, and the one that runs is the erasing process, but
it can't do anything except slow things down since the flash 
is busy writing. What the erasing process does seem to do (and 
I don't understand why) is cause current->need_resched to be set
for every call to cfi_udelay(), so it calls schedule_timeout(1) 
and sleeps for a whole jiffie.

By calling cfi_udelay() at the _end_ of the write of each word,
it still allows the call to schedule_timeout() to happen, but
at a time when the chip state allows other mtd processes operations,
such as erase, to use it, so the one jiffie doesn't happen
for every word written. The word writes are short (10 us typical,
360 us worst case for my chip), so not scheduling during the write
is not so bad.

My change seems to solve the problem for me, but I don't 
understand the scheduling well enough to understand why 
current->need_resched gets set each time.

Maybe cfi_udelay() should be changed so for short delays it
does schedule(); udelay(delay); instead of schedule_timeout(1).
If I get some time later I will try it.
 
Dave Ellis
dge@sixnetio.com

> > --- cfi_cmdset_0002.c	Mon Jul 15 11:13:25 2002
> > +++ cfi_cmdset_0002.fixed.c	Mon Aug  5 14:28:40 2002
> > @@ -386,9 +384,7 @@
> >  
> >  	cfi_write(map, datum, adr);
> >  
> > -	cfi_spin_unlock(chip->mutex);
> > -	cfi_udelay(chip->word_write_time);
> > -	cfi_spin_lock(chip->mutex);
> > +	udelay(chip->word_write_time);
> >  
> >  
> >  	/* Polling toggle bits instead of reading back many 
> times @@ -447,6 
> > +444,7 @@
> >  	chip->state = FL_READY;
> >  	wake_up(&chip->wq);
> >  	cfi_spin_unlock(chip->mutex);
> > +	cfi_udelay(1);	/* just a chance to schedule() */
> >  	
> >  	return ret;
> >  }
