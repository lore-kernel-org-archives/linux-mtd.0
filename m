Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDeYX-0004zf-Up
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 18:29:10 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
Subject: Re: AW: AW: UBI leb_write_unlock NULL pointer Oops (continuation)
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
Date: Wed, 12 Feb 2014 13:21:19 -0500
In-Reply-To: <87txc4w698.fsf@nbsps.com> (Bill Pringlemeir's message of "Wed,
 12 Feb 2014 13:11:31 -0500")
Message-ID: <87ppmsw5sw.fsf@nbsps.com>
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


On 12 Feb 2014, bpringlemeir@nbsps.com wrote:

> We have 'IRQs off', which makes sense for __up_write.  Trying
> 'ftrace_dump_on_oops' as Richard suggests would be helpful to find out
> what went on before.  It might also make sense to dump some
> 'rwsem_waiter' nodes on the error?  It looks like '__up_write' might
> normally have an empty list?  Certainly an non-empty 'rwsem_waiter' is
> going to trigger the condition more often?  I guess I can look to see
> what might cause this, even if I can not reproduce it.  The
> 'preemp_count' has been two every time you have this; is that true?

Wouldn't a smaller MTD trigger the condition more often?  It looks like
the locking is done per erase block and several files in the same erase
block with simultaneous reading/writing will trigger this kind of
effect?

Does that sound right Richard?  Will it matter if I use a fixed or
dynamic volume size?  Can I make a small UBI/UbiFS MTD partition and use
that for testing?  My dynamic partition is about 200MB big.  Usually we
never come near filling it, so there is lots of opportunity to use other
erase blocks.

Fwiw,
Bill Pringlemeir.
