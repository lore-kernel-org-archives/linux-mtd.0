Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAC7R-00068S-L3
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 01:45:02 +0000
Received: by bwz5 with SMTP id 5so2609279bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 24 Oct 2010 18:44:58 -0700 (PDT)
Subject: Re: [PATCH 3/5] MTD: blktrans: fix a race vs kthread_stop.
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1287966711.5674.26.camel@macbook.infradead.org>
References: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
	<1287156047-17439-4-git-send-email-maximlevitsky@gmail.com>
	<1287966711.5674.26.camel@macbook.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 03:44:54 +0200
Message-ID: <1287971094.5205.11.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	Maxim Levitsky <maximlevisky@gmail.com>,
	Maciej Rutecki <maciej.rutecki@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-10-25 at 01:31 +0100, David Woodhouse wrote:
> On Fri, 2010-10-15 at 17:20 +0200, Maxim Levitsky wrote:
> > There is small race window that could make kthread_stop hang forever.
> > I found that while hacking the IR subsystem.
> > 
> > Signed-off-by: Maxim Levitsky <maximlevisky@gmail.com>
> > ---
> >  drivers/mtd/mtd_blkdevs.c |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> > index 040c2d9..a919587 100644
> > --- a/drivers/mtd/mtd_blkdevs.c
> > +++ b/drivers/mtd/mtd_blkdevs.c
> > @@ -133,6 +133,10 @@ static int mtd_blktrans_thread(void *arg)
> >  
> >  		if (!req && !(req = blk_fetch_request(rq))) {
> >  			set_current_state(TASK_INTERRUPTIBLE);
> > +
> > +			if (kthread_should_stop())
> > +				set_current_state(TASK_RUNNING);
> > +
> >  			spin_unlock_irq(rq->queue_lock);
> >  			schedule();
> >  			spin_lock_irq(rq->queue_lock);
> 
> 
> Shouldn't we add a break in there too, so it immediately breaks out of
> the loop (with the lock held)?
It doesn't matter here, as schedule() won't make task sleep, so the
thread will break at next iteration.


Best regards
	Maxim Levitsky
