Date: Mon, 23 Nov 2015 19:18:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de
Subject: Re: [RFC PATCH 1/2] mtd: nand: schedule() after releasing the device
Message-ID: <20151123181811.GO17308@twins.programming.kicks-ass.net>
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-2-git-send-email-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448302147-19272-2-git-send-email-bigeasy@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 23, 2015 at 07:09:06PM +0100, Sebastian Andrzej Siewior wrote:
>  	/* Release the controller and the chip */
>  	spin_lock(&chip->controller->lock);
>  	chip->controller->active = NULL;
>  	chip->state = FL_READY;
> +	/*
> +	 * Check if we have a waiter. If so we will schedule() right away so the
> +	 * waiter can grab the device while it is released and not after _this_
> +	 * caller gained the device (again) without leaving the CPU in between.
> +	 */
> +	if (waitqueue_active(&chip->controller->wq))
> +		do_sched = true;
>  	wake_up(&chip->controller->wq);
>  	spin_unlock(&chip->controller->lock);
> +	if (do_sched)
> +		schedule();

I've not looked at the code, but this _cannot_ be a correct fix.

schedule() can be a no-op, that is, current can be the most eligible
task to run and be selected again.

(with FIFO and this the highest prio task in the system that is a
guarantee)

I'll try and have an actual look at the problem description later.
