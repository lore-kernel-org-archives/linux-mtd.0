Received: from imap0.codethink.co.uk ([185.43.218.159])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3iAq-0004xB-QD
 for linux-mtd@lists.infradead.org; Thu, 27 Apr 2017 12:05:30 +0000
Message-ID: <1493294672.10415.142.camel@codethink.co.uk>
Subject: Re: [Linux-kernel] [PATCH 1/1] mtd: mtdblock: avoid __might_sleep
 warnings in mtd_erase
From: Ben Hutchings <ben.hutchings@codethink.co.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, David Woodhouse
 <dwmw2@infradead.org>,  Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org
Date: Thu, 27 Apr 2017 13:04:32 +0100
In-Reply-To: <c5a6e8e4-7e16-6d28-7948-8d2c186cca03@codethink.co.uk>
References: <20170426174609.29433-1-ben.dooks@codethink.co.uk>
 <20170426174609.29433-2-ben.dooks@codethink.co.uk>
 <1493230734.10415.140.camel@codethink.co.uk>
 <c5a6e8e4-7e16-6d28-7948-8d2c186cca03@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2017-04-27 at 09:27 +0100, Ben Dooks wrote:
> On 26/04/17 19:18, Ben Hutchings wrote:
> > On Wed, 2017-04-26 at 18:46 +0100, Ben Dooks wrote:
> >> The mtd_erase() call can hit code that will trigger warnings
> >> from __might_sleep(), such as the do_erase_oneblock() function
> >> on the cfi_cmdset_0002.c file.
> >>
> >> This is due to some of the erase functions doing the work in the
> >> thread they are called in, which means that the erase_write()
> >> should only go into TASK_INTERRUPTIBLE once the mtd_erase call
> >> has returned.
> > [...]
> >> diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
> >> index bb4c14f83c75..4b1cd464f919 100644
> >> --- a/drivers/mtd/mtdblock.c
> >> +++ b/drivers/mtd/mtdblock.c
> >> @@ -68,6 +68,7 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
> >>  	DECLARE_WAITQUEUE(wait, current);
> >>  	wait_queue_head_t wait_q;
> >>  	size_t retlen;
> >> +	long timeout = 1;
> >>  	int ret;
> >>
> >>  	/*
> >> @@ -81,12 +82,10 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
> >>  	erase.len = len;
> >>  	erase.priv = (u_long)&wait_q;
> >>
> >> -	set_current_state(TASK_INTERRUPTIBLE);
> >>  	add_wait_queue(&wait_q, &wait);
> >>
> >>  	ret = mtd_erase(mtd, &erase);
> >>  	if (ret) {
> >> -		set_current_state(TASK_RUNNING);
> >>  		remove_wait_queue(&wait_q, &wait);
> >>  		printk (KERN_WARNING "mtdblock: erase of region [0x%lx, 0x%x] "
> >>  				     "on \"%s\" failed\n",
> >> @@ -94,8 +93,18 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
> >>  		return ret;
> >>  	}
> >>
> >> -	schedule();  /* Wait for erase to finish. */
> >> +	if (erase->state != MTD_ERASE_DONE &&
> >> +	    erase->state != MTD_ERASE_FAILED)
> >> +		timeout = wait_woken(&wait, TASK_INTERRUPTIBLE,
> >> +				     MAX_SCHEDULE_TIMEOUT);
> >
> > If mtd_erase() returns 0 then the wait queue either has been woken or
> > will be woken.  Since we're already on the wait queue, it's safe to wait
> > unconditionally.
> >
> > I think that making the wait conditional results in a race condition
> > that could result in returning too early.
> >
> > Also there seems to be another existing problem here: if this is
> > interrupted and we return early then the driver can use-after-free the
> > wait queue and erase structure.  mtdchar waits uninterruptibly for
> > exactly this reason.
> >
> > We really ought to have an always-synchronous wrapper for mtd_erase(),
> > because this seems to be hard to get right...
> >
> > Ben.
> 
> Ok, so add something like mtd_erase_sync() which uses mtd_erase and then
> waits for the completion and then use it for both mtdblock and mtdchar?

...and any other callers that want synchronous behaviour, especially if
they're doing it wrong now.

Ben.

-- 
Ben Hutchings
Software Developer, Codethink Ltd.
