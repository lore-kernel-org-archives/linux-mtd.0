Received: from rezznor.smb.utfors.se ([195.58.112.22])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c5xS-0006ei-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 16:09:14 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Dave Ellis" <DGE@sixnetio.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Disk blocks for long periods
Date: Tue, 6 Aug 2002 17:09:12 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLKEIGFFAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <00512BA4F9D3D311912A009027E9B8F407E474@NT>
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

> 
> joakim.tjernlund@lumentis.se said:
> 
> > Have you tried to use cfi_udelay(chip->word_write_time) 
> > instead of udelay(chip->word_write_time)? That will at least 
> > let other processes run, won't it? 
> 
> The cfi_udelay() call is part of the problem, since it lets other
> processes run, and the one that runs is the erasing process, but
> it can't do anything except slow things down since the flash 
> is busy writing. What the erasing process does seem to do (and 
> I don't understand why) is cause current->need_resched to be set
> for every call to cfi_udelay(), so it calls schedule_timeout(1) 
> and sleeps for a whole jiffie.

hmm, I just noticed that the BIG kernel lock is held while the
erasing thread executes, since kupdate takes it in sync_old_buffers()
(if I understand this code correctly). Maybe that is causing
current->need_resched to be set?

Also, is it not a bad idea to hold the kernel lock for, possibly, seconds while
erasing sectors?

> 
> By calling cfi_udelay() at the _end_ of the write of each word,
> it still allows the call to schedule_timeout() to happen, but
> at a time when the chip state allows other mtd processes operations,
> such as erase, to use it, so the one jiffie doesn't happen
> for every word written. The word writes are short (10 us typical,
> 360 us worst case for my chip), so not scheduling during the write
> is not so bad.

I assume your chip does not support buffered writes? or is it just do_write_one_word()
that is causing the log delays?

 Jocke
