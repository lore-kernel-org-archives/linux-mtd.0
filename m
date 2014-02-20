Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGXVq-0006tt-Kw
 for linux-mtd@lists.infradead.org; Thu, 20 Feb 2014 17:34:19 +0000
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
Date: Thu, 20 Feb 2014 12:26:42 -0500
Message-ID: <8738jdofu5.fsf@nbsps.com>
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


>> Bill Pringlemeir wrote:

>> Disassembly of section .data:

>> 00000000 <.data>:
>> 0:   e48a7004        str     r7, [sl], #4
>> 4:   e5985004        ldr     r5, [r8, #4]
>> 8:   e15a0005        cmp     sl, r5
>> c:   0a000029        beq     0xb8
>> 10:   e595300c        ldr     r3, [r5, #12]

>> 'r5' is NULL.  It seems to be the same symptom.  If you run your ARM objdump
>> 	with -S on either vmlinux or '__up_write', it will help confirm that
>> 	it is the list corrupted again.  The assembler above should match.

On 20 Feb 2014, Thorsten.Wiedemer@lawo.com wrote:

> I don't have running a objdump on my ARM system at the moment, but
> 	rwsem-spinlock.c compiled with debug info, objdump -S -D gives for
> 	__up_write():
> ...
> 	sem->activity = 0;
> 29c:	e3a07000 	mov	r7, #0
> 2a0:	e1a0a008 	mov	sl, r8

> 2a4:	e48a7004 	str	r7, [sl], #4
> 2a8:	e5985004 	ldr	r5, [r8, #4]
> 	if (!list_empty(&sem->wait_list))
> 2ac:	e15a0005 	cmp	sl, r5
> 2b0: 0a000029 beq 35c <__up_write+0xe0> /* if we are allowed to wake writers
> 	try to grant a single write lock * if there's a writer at the front of
> 	the queue * - we leave the 'waiting count' incremented to signify
> 	potential * contention */ if (waiter->flags & RWSEM_WAITING_FOR_WRITE)
> 	{
> 2b4:	e595300c 	ldr	r3, [r5, #12]
> {
> ...

> Seems to match ...

It doesn't matter where it runs.  I just want to make sure it is always
the 'waiter' variable.

>> What is 'RAVENNA_streame'?  Is this your standard test and not the
>> '8k binary' copy test or are you doing the copy test with this
>> process also running?

> This is an application which runs parallel to our copy test. The last
> days, Emanuel set up another test environment which seems to reproduce
> the error more reliably (at least on some hardwares, not on all).  At
> the moment, there are running proprietary applications in parallel,
> but I'll try to strip it down to a sequence which I can provide you,
> if you like.

I think scheduling is important to this issue, that is why I asked.

> We could reproduce the error now with function tracing enabled, so we
> have two hopefully valuable traces. But they are rather big (around
> 4MB each). Shall I use pastebin and cut them in several peaces to
> provide them? Or off-list as email attachment?  The trace Emanuel
> posted Wednesday may be not valuable. Perhaps there is a (different)
> error triggered due to memory pressure caused by the function tracing.

After looking, the allocation is not due to memory pressure.  It is due
to different tasks waiting on the rwsem with 'waiter' allocated on the
stack; I guess the task is gone, handling a signal or something
else. However, the function traces are great.  As you note they are
rather big, so it will take anyone some time to analyze them.

You could alter '__rwsem_do_wake',

static inline struct rw_semaphore *
__rwsem_do_wake(struct rw_semaphore *sem, int wakewrite)
{
	struct rwsem_waiter *waiter;
	struct task_struct *tsk;
	int woken;

	waiter = list_entry(sem->wait_list.next, struct rwsem_waiter, list);
+       if(!waiter) {
+          printk("Bad rwsem\n");
+          printk("activity is %d.\n", sem->activity);
+          BUG();
+       }
	if (waiter->type == RWSEM_WAITING_FOR_WRITE) {
		if (wakewrite)

... or something like that.

 * the rw-semaphore definition
 * - if activity is 0 then there are no active readers or writers
 * - if activity is +ve then that is the number of active readers
 * - if activity is -1 then there is one active writer
 * - if wait_list is not empty, then there are processes waiting...

It seems inconsistent to have a non-empty list with activity as 0 as
well?  The above is trying to trace when we find a 'NULL' in the
'wait_list', which always seems to be the issue, but probably not the
root cause.

You can also put similar code in '__rwsem_wake_one_writer' if you
instead get the 'up_read()' fault.

Fwiw,
Bill Pringlemeir.
