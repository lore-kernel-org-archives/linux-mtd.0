Received: from rrcs-nys-24-97-130-2.biz.rr.com
	([24.97.130.2] helo=nt.sixnet.com ident=fwuser)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bmwZ-00049H-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 19:51:03 +0100
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E473@NT>
From: Dave Ellis <DGE@sixnetio.com>
To: linux-mtd@lists.infradead.org
Subject: RE: Disk blocks for long periods
Date: Mon, 5 Aug 2002 14:50:59 -0400 
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

> I have noticed that if i copy a "big" file(580K) it sometimes 
> take up to 42 seconds before it's finished. Normally it takes 
> about 3-4 seconds. When this long copy happen, top reports 
> that kupdate and the copy(cp) process is in D state, the rest 
> is sleeping. The FS is a 45% usage. FS is about 63MB in size. 
> Using the stable branch.
> 
> Why does it block for so long time?

I've been working on what may be the same problem and I think I 
finally understand it. I've seen it with 2.4.4, 2.4.18 and
with 2.4.18 with the 2.4.19 jffs2 and mtd code. I am using an 
AM29LV641, which uses cfi_cmdset_0002.c, but the code in 
cfi_cmdset_0001.c is similar. I have a possible solution
but I'd like some feedback on it.

The problem occurs when do_erase_oneblock() tries to lock the 
flash while cfi_amdstd_write() is writing a lot of data. The 
erasing thread locks the chip mutex when do_write_oneword() does the
    cfi_spin_unlock(chip->mutex);
    cfi_udelay(chip->word_write_time);
    cfi_spinlock(chip->mutex);
sequence. It sees the state is FL_WRITING, so it puts itself 
back on the wait queue. do_write_oneword() continues and eventually
sets the state back to FL_READY and wakes up the queue, but the
erasing thread doesn't actually run until the cfi_udelay() in 
do_write_oneword() calls schedule() while writing the next word
to the flash. The state is FL_WRITING, so the erasing thread goes
back on the wait queue. This continues until the entire write is
finished, then the erasing thread finally starts the erase.

The effect of all this sheduling is to write exactly one word
to flash for each jiffie! My flash is 16 bits wide, so a single
write of 2400 bytes was sometimes taking 1200 jiffies, or
12 seconds.

This patch to cfi_cmdset_0002.c 1.56 seems solve the problem, but
I am not sure if this is right way to do it. Comments?

Dave Ellis
dge@sixnetio.com

BTW - If I make similar changes to 1.55 or before it solves this
problem, but the write fails occasionally. I am guessing that
with my change it gets to the write completion check faster and the
old check fails, but the new write completion polling works better.

--- cfi_cmdset_0002.c	Mon Jul 15 11:13:25 2002
+++ cfi_cmdset_0002.fixed.c	Mon Aug  5 14:28:40 2002
@@ -386,9 +384,7 @@
 
 	cfi_write(map, datum, adr);
 
-	cfi_spin_unlock(chip->mutex);
-	cfi_udelay(chip->word_write_time);
-	cfi_spin_lock(chip->mutex);
+	udelay(chip->word_write_time);
 
 
 	/* Polling toggle bits instead of reading back many times
@@ -447,6 +444,7 @@
 	chip->state = FL_READY;
 	wake_up(&chip->wq);
 	cfi_spin_unlock(chip->mutex);
+	cfi_udelay(1);	/* just a chance to schedule() */
 	
 	return ret;
 }
