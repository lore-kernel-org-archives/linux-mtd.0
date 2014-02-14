Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEMQD-0007pe-A3
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 17:19:30 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: Richard Weinberger <richard@nod.at>
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
 <87txc4w698.fsf@nbsps.com> <87ppmsw5sw.fsf@nbsps.com>
 <52FBDE01.9030207@nod.at>
Date: Fri, 14 Feb 2014 12:11:30 -0500
In-Reply-To: <52FBDE01.9030207@nod.at> (Richard Weinberger's message of "Wed,
 12 Feb 2014 21:48:01 +0100")
Message-ID: <87d2ipwrel.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "Wiedemer, Thorsten \(Lawo AG\)" <Thorsten.Wiedemer@lawo.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Am 12.02.2014 19:21, schrieb Bill Pringlemeir:

>> Does that sound right Richard?  Will it matter if I use a fixed or
>> dynamic volume size?  Can I make a small UBI/UbiFS MTD partition and use
>> that for testing?  My dynamic partition is about 200MB big.  Usually we
>> never come near filling it, so there is lots of opportunity to use other
>> erase blocks.

On 12 Feb 2014, richard@nod.at wrote:

> Yeah, I had the same idea and setup a MTD using nandsim.
> So far I was unable to trigger the issue.

> Let's wait for more results from Thorsten.

Ok, but I would like to try with one of my ARM926 systems.  I think that
this is not a simple race.  In rwsem-spinlock.c there are two places
where 'rwsem_waiter' are 'allocated'.  Those are '__down_read' and
'__down_write_nested'.  The 'rwsem_waiter' is allocated on the kernel
stack and the current task is halted.  This is patched into the list of
the 'rwsem' rooted in ubi's ubi_ltree_entry.  Ie, the list 'allocation'
are across various task's thread_info.

If a task is killed and/or the 'sp' is not in a good state, we may be a
weird value linked in the 'rwsem' list.  On the ARM926, there are no
lock free primitives except 'swp' and in order to RMW the platform locks
interrupts.  However, UbiFS/UBI maybe called via a data fault handler
and these can not be locked.  If this is the case, you will never be
able to replicate it on anything but an ARM926 or an architecture with
this type of atomic primitives.  This is why I was originally cross
posting to the ARM list.

I think having a better test case would be constructive?  At least we
should explore the fact that it is an 'arch dependent' issue?  All of
the cases reported seem to be confined to the ARM926.

It seems like many readers/writer to a small UBI partition would be the
best type of test case.  I am not sure if UbiFS will actually call UBI
to write/read during a data fault, or is this deferred somehow?

Thanks,
Bill Pringlemeir.

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/kernel/locking/rwsem-spinlock.c#n123
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/kernel/locking/rwsem-spinlock.c#n189
