Received: from [213.39.233.138] (helo=wohnheim.fh-wedel.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19eXDa-00019x-W1
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2003 10:44:31 +0100
Date: Mon, 21 Jul 2003 11:44:06 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Vikram Mehta <vm6580@hotmail.com>
Message-ID: <20030721094406.GA28360@wohnheim.fh-wedel.de>
References: <Law14-OE48eBIeBoVue0000fcf0@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Law14-OE48eBIeBoVue0000fcf0@hotmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: Garbage collection code
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 21 July 2003 12:28:30 -0700, Vikram Mehta wrote:
> 
> Can someone tell me what is happening in this code copied below
> 
> Specifically what does schedule at the end of the code does.
> 
> Also kindly tell me a link where I can read abt these things in detail.

Look for the documentation to BSD's lfs (log-structured file system),
jffs2 uses the same basic principle.  There is also a jffs2 specific
paper somewhere on redhat's site, google is your friend.

> for (;;) {
>   spin_lock_irq(&current->sigmask_lock);
>   siginitsetinv (&current->blocked, sigmask(SIGHUP) | sigmask(SIGKILL) |
> sigmask(SIGSTOP) | sigmask(SIGCONT));
>   recalc_sigpending(current);
>   spin_unlock_irq(&current->sigmask_lock);

Allow SIGHUP, SIGKILL, SIGSTOP and SIGCONT to reach the gc thread.
(so people can wake us up)

>   if (!thread_should_wake(c)) {

No work to do right now.

>                         set_current_state (TASK_INTERRUPTIBLE);
>    D1(printk(KERN_EMERG "jffs2_garbage_collect_thread sleeping. ..\n"));
>    /* Yes, there's a race here; we checked thread_should_wake() before
>       setting current->state to TASK_INTERRUPTIBLE. But it doesn't
>       matter - We don't care if we miss a wakeup, because the GC thread
>       is only an optimisation anyway. */
>    schedule();

Go to sleep.

> }

Jörn

-- 
ticks = jiffies;
while (ticks == jiffies);
ticks = jiffies;
-- /usr/src/linux/init/main.c
