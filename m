Received: from rrcs-nys-24-97-130-2.biz.rr.com
	([24.97.130.2] helo=nt.sixnet.com ident=fwuser)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cTsz-000241-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 17:42:13 +0100
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E477@NT>
From: Dave Ellis <DGE@sixnetio.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Disk blocks for long periods 
Date: Wed, 7 Aug 2002 12:42:09 -0400 
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

David Woodhouse said:
> DGE@sixnetio.com said:
> > The cfi_udelay() call is part of the problem, since it lets other 
> > processes run, and the one that runs is the erasing process, but it 
> > can't do anything except slow things down since the flash  is busy 
> > writing.
> 
> The erasing process should be sitting in TASK_UNINTERRUPTIBLE and on the 
> chip's wait queue, waiting to be woken when the chip becomes available.
Why 
> is it running?

It is running because of the
        wake_up(&chip->wq);
at the end of do_write_oneword(). So it wakes up for every word written.

With the old code (cfi_cmdset_0002.c 1.56 and before) the next chance it 
gets to run is when cfi_udelay() is called during the next 
do_write_oneword(). Unfortunately, it can't start erasing because 
chip->state is FL_WRITING, so it puts itself back on the wait queue. The
wake_up() at the end of do_write_oneword() wakes it up again, but it
doesn't run until the cfi_delay() in the _next_ call to do_write_oneword().
So it runs and puts itself back on the wait queue for every call to 
do_write_oneword(). Eventually all the words are written, it wakes up to 
find FL_READY and starts the erase. Without the one jiffie delay in 
cfi_delay() each time it wouldn't have been as bad, but erase going off 
and back on the wait queue several thousand times still doesn't seem right.

> > What the erasing process does seem to do (and  I don't understand why) 
> > is cause current->need_resched to be set for every call to 
> > cfi_udelay(), so it calls schedule_timeout(1) and sleeps for a whole 
> > jiffie.
> 
> Sleeping for a whole jiffie is bad. We should udelay() and yield() as you 
> point out; there's no reason to use schedule_timeout() and hence stop 
> ourself from being woken immediately if there's not really anything else
to 
> run. I've committed that change to CVS.

Thanks, I looked at the change and seems much better to me.

> Adding cfi_udelay() to do_write_oneword() is dangerous. You 
> may trigger a bug that's actually already there. ISTR there's 
> a time limit on the 'unlock bypass' mode, and if you 
> schedule() you may find that the chip is no longer 
> in that mode when you return.

Actually I didn't add it, I just moved it to the end, where chip->state
is FL_READY, so the erase can actually start if it wakes up. I think
both the old code and your latest change to cfi_cmdset_0002.c
would have the same problem with a time limit, since they call 
cfi_udelay() or yield() while each word is writing. I didn't
find any time limit for my chip.

I think my change (which really should be cond_resched(), not 
cfi_udelay() since I don't need the delay) would cause a 
different problem with 'unlock bypass' (which I am not using).
The chip is tagged as FL_READY when it really (I guess) 
isn't. But if I schedule() between words with the chip not 
FL_READY, I am right back to the original problem. And if I
don't schedule() until the whole write is done nothing else
can run for a long time.

Maybe if 'unlock bypass' is used the
  chip->state = FL_READY; wake_up(&chip->wq);
should only happen after leaving 'unlock bypass' mode?

I wonder if 'unlock bypass' is worth all the trouble. I think
I'll just not use it and call cond_resched() instead of 
cfi_udelay() at the end of do_write_oneword().
 
> Another thing you might want to do if you really care about write 
> performance is copy the logic for calculating word_write_time 
> from the cfi_cmdset_0001 driver.

Thanks for the suggestion, but the write performance with my
fix is fine so I may not try it for a while. The long delays
(up to 60 seconds) on single write() were the problem. They 
were making a communications protocol time out and making total
load times very long. Without them, the average performance is 
fine.

I am very impressed with jffs2 and mtd. With this one problem
fixed it is exactly what we need and works very well.

Dave Ellis
dge@sixnetio.com
