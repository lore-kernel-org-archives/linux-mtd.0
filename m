Received: from shyguy.smb.utfors.se ([195.58.112.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17chPq-0004Ae-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 08:09:02 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Dave Ellis" <DGE@sixnetio.com>,
	"'David Woodhouse'" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Disk blocks for long periods 
Date: Thu, 8 Aug 2002 09:08:59 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLMEJEFFAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <00512BA4F9D3D311912A009027E9B8F407E477@NT>
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

> David Woodhouse said:
> > DGE@sixnetio.com said:
> > > The cfi_udelay() call is part of the problem, since it lets other 
> > > processes run, and the one that runs is the erasing process, but it 
> > > can't do anything except slow things down since the flash  is busy 
> > > writing.
> > 
> > The erasing process should be sitting in TASK_UNINTERRUPTIBLE and on the 
> > chip's wait queue, waiting to be woken when the chip becomes available.
> Why 
> > is it running?
> 
> It is running because of the
>         wake_up(&chip->wq);
> at the end of do_write_oneword(). So it wakes up for every word written.
> 
> With the old code (cfi_cmdset_0002.c 1.56 and before) the next chance it 
> gets to run is when cfi_udelay() is called during the next 
> do_write_oneword(). Unfortunately, it can't start erasing because 
> chip->state is FL_WRITING, so it puts itself back on the wait queue. The
> wake_up() at the end of do_write_oneword() wakes it up again, but it
> doesn't run until the cfi_delay() in the _next_ call to do_write_oneword().
> So it runs and puts itself back on the wait queue for every call to 
> do_write_oneword(). Eventually all the words are written, it wakes up to 
> find FL_READY and starts the erase. Without the one jiffie delay in 
> cfi_delay() each time it wouldn't have been as bad, but erase going off 
> and back on the wait queue several thousand times still doesn't seem right.

You can move the wake_up() call up one step(xxxx_write_words()) and call it just before 
you leave that function. I tried that and it's a improvement(note, I using buffer writes, so
word writes should see an even better improvement), but that will also
hold reads back(not that I noticed anything) until xxx_write_words has completed. 
We can fix that by having separate wait queues for read and erase.

   Jocke
