Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHxqS-0001Ck-OO
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 15:53:29 +0000
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
 <87ios8gsho.fsf@nbsps.com> <87k3coq8di.fsf@nbsps.com>
 <530860B1.9000808@nod.at> <877g8kr1h7.fsf@nbsps.com>
 <530B670B.3090002@nod.at>
Date: Mon, 24 Feb 2014 10:45:50 -0500
In-Reply-To: <530B670B.3090002@nod.at> (Richard Weinberger's message of "Mon,
 24 Feb 2014 16:36:43 +0100")
Message-ID: <87sir8ms41.fsf@nbsps.com>
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


>> On 22 Feb 2014, richard@nod.at wrote:

>>> Hmm, I'm not sure whether I was able to follow your thought.  But
>>> leb_write_unlock() is balanced with leb_write_trylock() in
>>> ubi_eba_copy_leb() which makes perfectly sense to me.  What exactly is
>>> the problem?

> Am 24.02.2014 16:09, schrieb Bill Pringlemeir:

>> There are two things that must be balanced.  The 'reference count'
>> ubi_ltree_entry -> users and the rw_semaphore down/up.  You are right,
>> the trylock needs to be balanced by the 'leb_write_unlock'.  However,
>> the 'leb_write_trylock()' has already decremented 'users' in preperation
>> to move the 'lnum'.  However, in the case of contention,
>> 'ubi_eba_copy_leb' bails and does the 'leb_write_unlock()', which
>> balances the 'trylock', but unbalances the 'users' reference count (I
>> added some comments on the lines).

On 24 Feb 2014, richard@nod.at wrote:

> My first thought here is "If this is true, why does
> ubi_assert(le->users >= 0) not trigger"?

A call to 'ltree_add_entry()' may add a completely new entry for the
'lnum'.  The context switches may happen at any point that the spinlock
is not held.

Here is ubi_eba_copy_leb() with just mutex and reference count.

leb_write_trylock -> ltree_add_entry(ubi, vol_id, lnum) create new or
                        old.
/* could reschedule here... */
leb_write_trylock -> down_write_trylock have write rwsem.
/* could reschedule here... */
leb_write_trylock -> get spin lock and decrement user.
/* could reschedule here... */
on 'if (vol->eba_tbl[lnum] != from)' another thread has this
                        'ltree_entry' so count is >1.
/* could reschedule here... */
call leb_write_unlock() and destroy in use ltree_entry.

Anyone calling 'ltree_add_entry' may create a new entry.  Also, as the
entry has been freed, the memory will be recycled and 'users' could be
anything in a freed node.  It is puzzling if this is related to the
problem that Thorsten and others have seen that the 'assert' never
fires.  However, this path seems to violate the reference count and
double decrements.  I am pretty sure it is an issue although it maybe
unrelated and latent (never triggered).  However, some of the same
'suspects' are involved so I think it is a possibility to explore.

Fwiw,
Bill Pringlemeir.
