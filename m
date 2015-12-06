Received: from linutronix.de ([2001:470:1f0b:db:abcd:42:0:1]
 helo=Galois.linutronix.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5a8r-0003Yy-KV
 for linux-mtd@lists.infradead.org; Sun, 06 Dec 2015 14:18:23 +0000
Date: Sun, 6 Dec 2015 15:17:57 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de
Subject: Re: [PATCH] mtd: nand: do FIFO processing in nand_get_device()
Message-ID: <20151206141757.GA5816@linutronix.de>
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-2-git-send-email-bigeasy@linutronix.de>
 <20151123181811.GO17308@twins.programming.kicks-ass.net>
 <20151125173543.GA17151@linutronix.de>
 <20151130161549.GL17308@twins.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20151130161549.GL17308@twins.programming.kicks-ass.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Peter Zijlstra | 2015-11-30 17:15:49 [+0100]:

>On Wed, Nov 25, 2015 at 06:35:43PM +0100, Sebastian Andrzej Siewior wrote:
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -137,8 +137,25 @@ static void nand_release_device(struct mtd_info *mtd)
>>  	/* Release the controller and the chip */
>>  	spin_lock(&chip->controller->lock);
>>  	chip->controller->active = NULL;
>> -	chip->state = FL_READY;
>> -	wake_up(&chip->controller->wq);
>> +
>> +	if (waitqueue_active(&chip->controller->wq)) {
>> +		wait_queue_head_t *q;
>> +		wait_queue_t *waiter;
>> +		unsigned long flags;
>> +
>> +		q = &chip->controller->wq;
>> +		chip->state = FL_HANDOVER;
>> +
>> +		spin_lock_irqsave(&q->lock, flags);
>
>This lock is actually not required, as your add/remove_wait_queue calls
>are also under chip->controller->lock.

yeah. And there can be only one wakeup and only after this function here
made it happen. So yes, not required. dropped it.

>> +
>> +		chip->controller->handover_waiter = waiter;
>
>You could consider using ->active for this; as it stands you never use
>both at the same time. Its a tad icky, but it avoids adding that new
>field.

There is this FL_PM_SUSPENDED which derefences `active` even if its state
is not FL_READY. So I think that we could go boom here.
Also in order to share that member we need either an union or an
explicit cast because it is a different type. Puh.
My estimate here is 3 * pointer + 2 * sizeof spinlock. So on 32bit we
should always end up in kmalloc-32 (except with spinlock debugging which
inflates this struct anyway so this extra pointer should not matter
much).

Sebastian
