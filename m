Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGXgn-0007Gy-AK
 for linux-mtd@lists.infradead.org; Thu, 20 Feb 2014 17:45:39 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
 <87zjlxy8lj.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>
 <87txc4w698.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A250B53F4@Exchange1.lawo.de>
 <8738jdofu5.fsf@nbsps.com>
Date: Thu, 20 Feb 2014 12:38:07 -0500
In-Reply-To: <8738jdofu5.fsf@nbsps.com> (Bill Pringlemeir's message of "Thu,
 20 Feb 2014 12:26:42 -0500")
Message-ID: <87y515n0qo.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20 Feb 2014, bpringlemeir@nbsps.com wrote:

> You could alter '__rwsem_do_wake',
>
> static inline struct rw_semaphore *
> __rwsem_do_wake(struct rw_semaphore *sem, int wakewrite)
> {
> 	struct rwsem_waiter *waiter;
> 	struct task_struct *tsk;
> 	int woken;
>
	waiter = list_entry(sem->wait_list.next, struct rwsem_waiter, list);
+       if(!waiter) {
+          printk("Bad rwsem\n");
+          printk("activity is %d.\n", sem->activity);
+          BUG();
+       }
	if (waiter->type == RWSEM_WAITING_FOR_WRITE) {
		if (wakewrite)
>
> ... or something like that.
>
> * the rw-semaphore definition
> * - if activity is 0 then there are no active readers or writers
> * - if activity is +ve then that is the number of active readers
> * - if activity is -1 then there is one active writer
> * - if wait_list is not empty, then there are processes waiting...
>
> It seems inconsistent to have a non-empty list with activity as 0 as
> well?  The above is trying to trace when we find a 'NULL' in the
> 'wait_list', which always seems to be the issue, but probably not the
> root cause.
>
> You can also put similar code in '__rwsem_wake_one_writer' if you
> instead get the 'up_read()' fault.

Sorry, this code has to go in the callers before they write to
'activity'.

void __up_write(struct rw_semaphore *sem)
{
	unsigned long flags;
+	struct rwsem_waiter *waiter;


	raw_spin_lock_irqsave(&sem->wait_lock, flags);

+	waiter = list_entry(sem->wait_list.next, struct rwsem_waiter, list);
+       if(!waiter) {
+          printk("Bad rwsem\n");
+          printk("activity is %d.\n", sem->activity);
+          BUG();
+       }

	sem->activity = 0;
	if (!list_empty(&sem->wait_list))
		sem = __rwsem_do_wake(sem, 1);

	raw_spin_unlock_irqrestore(&sem->wait_lock, flags);
}

__up_read() is the other one.  Or you wait to see if the function traces
are helpful.
