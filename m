Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGw9H-0007FQ-UM
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2014 19:52:41 +0000
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
 <87txc4w698.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A250B53F4@Exchange1.lawo.de>
 <D7B1B5F4F3F27A4CB073BF422331203F2A250B54E6@Exchange1.lawo.de>
 <877g8ojqsn.fsf@nbsps.com> <53079725.6080105@nod.at>
Date: Fri, 21 Feb 2014 14:45:07 -0500
Message-ID: <87ios8gsho.fsf@nbsps.com>
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


> Am 21.02.2014 18:53, schrieb Bill Pringlemeir:
>> I don't think the spin_lock() will do anything on a UP system like the
>> ARM926's that have encountered this issue.

On 21 Feb 2014, richard@nod.at wrote:

> Also on UP a spin_lock disables preemption.
> So, le->users is protected.

Thanks, now this make sense...

>   sync-7493    0.... 1348758977us : kmem_cache_alloc_trace <-ltree_add_entry
>   sync-7493    0.... 1348758983us : add_preempt_count <-ltree_add_entry
>   sync-7493    0...1 1348758989us : sub_preempt_count <-ltree_add_entry
>   sync-7493    0.... 1348758994us : kfree <-ltree_add_entry

that those are the spinlocks.  I say some thing dumb and get to learn
something.

It looks like ubi_eba_write_leb() is running retries when this happens
in the pre-empted sync-7493 and then sync-7492 goes in and modifies the
tree and some entries.

If the ltree lock is different than the leb write mutex, could the
'down_write' and 'up_write' use different mutexes?  I guess the 'lnum'
is the same and the 'users' count should prevent this.

I don't see any clues from the function tracing then.

Also, it seems that 'sem->wait_list.next' is NULL and this is in the
space allocated by the 'ltree_entry'.  Ie, the head of the list has
NULL; I was thinking something within the list was NULL.

Regards,
Bill Pringlemeir.
