Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cOid-0001AD-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 12:11:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <00512BA4F9D3D311912A009027E9B8F407E474@NT> 
References: <00512BA4F9D3D311912A009027E9B8F407E474@NT> 
To: Dave Ellis <DGE@sixnetio.com>
Cc: "'joakim.tjernlund@lumentis.se'" <joakim.tjernlund@lumentis.se>,
    linux-mtd@lists.infradead.org
Subject: Re: Disk blocks for long periods 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Aug 2002 12:11:06 +0100
Message-ID: <7780.1028718666@redhat.com>
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

DGE@sixnetio.com said:
> The cfi_udelay() call is part of the problem, since it lets other
> processes run, and the one that runs is the erasing process, but it
> can't do anything except slow things down since the flash  is busy
> writing.

The erasing process should be sitting in TASK_UNINTERRUPTIBLE and on the 
chip's wait queue, waiting to be woken when the chip becomes available. Why 
is it running?

> What the erasing process does seem to do (and  I don't understand why)
> is cause current->need_resched to be set for every call to
> cfi_udelay(), so it calls schedule_timeout(1)  and sleeps for a whole
> jiffie. 

Sleeping for a whole jiffie is bad. We should udelay() and yield() as you 
point out; there's no reason to use schedule_timeout() and hence stop 
ourself from being woken immediately if there's not really anything else to 
run. I've committed that change to CVS.

I don't understand why need_resched is being set either, though. 

Adding cfi_udelay() to do_write_oneword() is dangerous. You may trigger a
bug that's actually already there. ISTR there's a time limit on the 'unlock
bypass' mode, and if you schedule() you may find that the chip is no longer 
in that mode when you return.

Another thing you might want to do if you really care about write 
performance is copy the logic for calculating word_write_time from the 
cfi_cmdset_0001 driver.

--
dwmw2
