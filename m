Date: Mon, 30 Nov 2015 17:15:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de
Subject: Re: [PATCH] mtd: nand: do FIFO processing in nand_get_device()
Message-ID: <20151130161549.GL17308@twins.programming.kicks-ass.net>
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-2-git-send-email-bigeasy@linutronix.de>
 <20151123181811.GO17308@twins.programming.kicks-ass.net>
 <20151125173543.GA17151@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151125173543.GA17151@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 25, 2015 at 06:35:43PM +0100, Sebastian Andrzej Siewior wrote:
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -137,8 +137,25 @@ static void nand_release_device(struct mtd_info *mtd)
>  	/* Release the controller and the chip */
>  	spin_lock(&chip->controller->lock);
>  	chip->controller->active = NULL;
> -	chip->state = FL_READY;
> -	wake_up(&chip->controller->wq);
> +
> +	if (waitqueue_active(&chip->controller->wq)) {
> +		wait_queue_head_t *q;
> +		wait_queue_t *waiter;
> +		unsigned long flags;
> +
> +		q = &chip->controller->wq;
> +		chip->state = FL_HANDOVER;
> +
> +		spin_lock_irqsave(&q->lock, flags);

This lock is actually not required, as your add/remove_wait_queue calls
are also under chip->controller->lock.

> +		waiter = list_first_entry(&q->task_list, wait_queue_t,
> +					  task_list);
> +		spin_unlock_irqrestore(&q->lock, flags);

And the one read instruction under a spinlock is a tad pointless anyway.

> +
> +		chip->controller->handover_waiter = waiter;

You could consider using ->active for this; as it stands you never use
both at the same time. Its a tad icky, but it avoids adding that new
field.

> +		wake_up(q);
> +	} else {
> +		chip->state = FL_READY;
> +	}
>  	spin_unlock(&chip->controller->lock);
>  }
>  
> @@ -843,10 +860,18 @@ nand_get_device(struct mtd_info *mtd, int new_state)
>  	if (!chip->controller->active)
>  		chip->controller->active = chip;
>  
> -	if (chip->controller->active == chip && chip->state == FL_READY) {
> -		chip->state = new_state;
> -		spin_unlock(lock);
> -		return 0;
> +	if (chip->controller->active == chip) {
> +		if (chip->state == FL_READY) {
> +			chip->state = new_state;
> +			spin_unlock(lock);
> +			return 0;
> +		}
> +		if (chip->state == FL_HANDOVER &&
> +		    chip->controller->handover_waiter == &wait) {
> +			chip->state = new_state;
> +			spin_unlock(lock);
> +			return 0;
> +		}
>  	}

That means this would become:

	if (chip->state == FL_HANDOVER && chip->controller->active == &wait) {
		chip->controller->active = chip;
		chip->state = new_state;
	}

	... existing code ...
