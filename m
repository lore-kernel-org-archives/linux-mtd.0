Received: from rezznor.smb.utfors.se ([195.58.112.22])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c1Eb-0005s7-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 11:06:37 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Dave Ellis" <DGE@sixnetio.com>,
	<linux-mtd@lists.infradead.org>
Subject: RE: Disk blocks for long periods
Date: Tue, 6 Aug 2002 12:06:34 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLAEIBFFAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <00512BA4F9D3D311912A009027E9B8F407E473@NT>
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

Hi Dave

This is interesting ...

> I've been working on what may be the same problem and I think I 
> finally understand it. I've seen it with 2.4.4, 2.4.18 and
> with 2.4.18 with the 2.4.19 jffs2 and mtd code. I am using an 
> AM29LV641, which uses cfi_cmdset_0002.c, but the code in 
> cfi_cmdset_0001.c is similar. I have a possible solution
> but I'd like some feedback on it.

Yes, cfi_cmdset_0001.c has the same problem and I think do_write_buffer() is
even more sensitive since is has an extra unlock,udelay,lock pair in it.

> 
> The problem occurs when do_erase_oneblock() tries to lock the 
> flash while cfi_amdstd_write() is writing a lot of data. The 
> erasing thread locks the chip mutex when do_write_oneword() does the
>     cfi_spin_unlock(chip->mutex);
>     cfi_udelay(chip->word_write_time);
>     cfi_spinlock(chip->mutex);
> sequence. It sees the state is FL_WRITING, so it puts itself 
> back on the wait queue. do_write_oneword() continues and eventually
> sets the state back to FL_READY and wakes up the queue, but the
> erasing thread doesn't actually run until the cfi_udelay() in 
> do_write_oneword() calls schedule() while writing the next word
> to the flash. The state is FL_WRITING, so the erasing thread goes
> back on the wait queue. This continues until the entire write is
> finished, then the erasing thread finally starts the erase.
> 
> The effect of all this sheduling is to write exactly one word
> to flash for each jiffie! My flash is 16 bits wide, so a single
> write of 2400 bytes was sometimes taking 1200 jiffies, or
> 12 seconds.
> 
> This patch to cfi_cmdset_0002.c 1.56 seems solve the problem, but
> I am not sure if this is right way to do it. Comments?

I am not sure this is the the rigth way either, but I will test and see what happens.

BTW, is it neccesary to use spin_lock_bh()? Can we not get away with just spin_lock()?
I am not very good at locking, but I think xxx_bh is only needed when interrupts can
can execute the locked code and currently there are no interrupts in this code path(I think).

Is it not true that xxx_bh() also disables interrupts? If so, there must be rather long
periods with interrupts turned off in cfi_cmdset_xxxx.c?

Have you tried to use cfi_udelay(chip->word_write_time) instead of udelay(chip->word_write_time)?
That will at least let other processes run, won't it? 

Perhaps David can comment?

> 
> Dave Ellis
> dge@sixnetio.com
> 
> BTW - If I make similar changes to 1.55 or before it solves this
> problem, but the write fails occasionally. I am guessing that
> with my change it gets to the write completion check faster and the
> old check fails, but the new write completion polling works better.
> 
> --- cfi_cmdset_0002.c	Mon Jul 15 11:13:25 2002
> +++ cfi_cmdset_0002.fixed.c	Mon Aug  5 14:28:40 2002
> @@ -386,9 +384,7 @@
>  
>  	cfi_write(map, datum, adr);
>  
> -	cfi_spin_unlock(chip->mutex);
> -	cfi_udelay(chip->word_write_time);
> -	cfi_spin_lock(chip->mutex);
> +	udelay(chip->word_write_time);
>  
>  
>  	/* Polling toggle bits instead of reading back many times
> @@ -447,6 +444,7 @@
>  	chip->state = FL_READY;
>  	wake_up(&chip->wq);
>  	cfi_spin_unlock(chip->mutex);
> +	cfi_udelay(1);	/* just a chance to schedule() */
>  	
>  	return ret;
>  }
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
