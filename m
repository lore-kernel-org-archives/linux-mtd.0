Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CX3Od-0007Kv-CS
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2004 15:05:49 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Stephan Linke <Stephan.Linke@epygi.de>
In-Reply-To: <NGENJJFPMHGLPILEKKAMAEAGCFAA.Stephan.Linke@epygi.de>
References: <NGENJJFPMHGLPILEKKAMAEAGCFAA.Stephan.Linke@epygi.de>
Content-Type: text/plain
Date: Wed, 24 Nov 2004 21:05:42 +0100
Message-Id: <1101326743.9481.40.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-Mtd <linux-mtd@lists.infradead.org>
Subject: RE: using multile partitions on one NAND chip
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-11-24 at 19:12 +0100, Stephan Linke wrote:
> Hi Thomas,
> 
> already noticed the spinlocks; thanks anyway.
> 
> On erase the chip is locked in nand_get_chip() and stays locked
> until the ERASE2 > command has been send to the chip to wait for the 
> ready status the chip gets unlcoked since the nand_wait() also tries
> to lock the chip. Additinaly nand_wait() unlocks the chip befor
> calling yield().

retry:
        /* Hardware controller shared among independend devices */
        if (this->controller) {
                spin_lock (&this->controller->lock);
                if (this->controller->active)
                        active = this->controller->active;
                else
                        this->controller->active = this;
                spin_unlock (&this->controller->lock);
        }

        if (active == this) {
                spin_lock (&this->chip_lock);
                if (this->state == FL_READY) {
                        this->state = new_state;
                        spin_unlock (&this->chip_lock);
                        return;
                }
        }
        set_current_state (TASK_UNINTERRUPTIBLE);
        add_wait_queue (&active->wq, &wait);
        spin_unlock (&active->chip_lock);
        schedule ();
        remove_wait_queue (&active->wq, &wait);
        goto retry;

this->state is reset to FL_READY, after the active command is finished.
All waiters on the waitqueue are woken up.

> If another task tries nand_get_chip() at this verry moment the erase
> will be interrupted by sending an RESET command. Looks like this is by
> intention since the erase of the blockis restarted after the 
> nand_wait() returns.

We stopped to interrupt the erase since long, due to broken chips, which
do not handle the erase suspend correctly. 

But the locking was always safe and without race conditions.

On SMP the spinlock is protecting the state variable against concurrent
access by different tasks on different CPU's. 

In case of CONFIG_PREEMPT=y the state variable is protected by 
spin_lock() (contains preempt_disable()) on SMP and UP against
concurrent access by different tasks on the same CPU.

CONFIG_PREEMPT=n does not need further protection at this place.

Which version of nand_base.c are you using ?

tglx
