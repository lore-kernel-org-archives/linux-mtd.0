Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Godo-0000JS-00
	for mtd-list@infradead.org; Thu, 11 Jan 2001 20:48:12 +0000
Message-ID: <3A5E1CD3.558C8B23@mvista.com>
Date: Thu, 11 Jan 2001 12:51:31 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org,
   ahennessy@mvista.com
Subject: Re: LOCK and UNLOCK functions
References: <Pine.LNX.4.30.0101111956500.5758-100000@imladris.demon.co.uk> <3A5E19BB.B6F06694@mvista.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Alice Hennessy wrote:

> David Woodhouse wrote:
>
> > On Thu, 11 Jan 2001, Alice Hennessy wrote:
> >
> > > 1. It doesn't appear to me that suspend affects the locking and
> > > unlocking flowcharts - only program and erase.  Is this a correct
> > > assumption?
> >
> > What do you mean? Suspend affects everything, because we're about to turn
> > off the chip (the oldstate stuff is a thinko). If we're in the middle of
> > telling the chip to lock/unlock then suspend has return failure till we're
> > finished.
>
> I was referring to the "Block Erase, Program Suspend" command in the STRATA
> spec
> and was wondering  if I need to add checking for  FL_LOCKING  in
> do_read_onechip() as we do for
> FL_ERASING.   Should have been more specific :)
> BTW: what does "thinko" mean?

After thinking about it  :) this was a pointless  question since locking
doesn't have the time issue
that erase does and there is no good reason to interrupt it for read.

Alice

>
>
> >
> >
> > > 2. The mtdchar.c ioctl call for MEMUNLOCK passes the start and len
> > > addresses.  The unlock for the STRATA clears all the lock bits.  So I
> > > intend to include logic to reinstate the locked bits that are outside
> > > the desired range.  Sound reasonable?
> >
> > Hmmm. Better to design the API better so it can describe the capabilities
> > of the chip. You don't have to stick to what I threw together - I'm full
> > of crap half the time. Hadn't you realised that yet?
>
> Then my choice would be to keep it simple and let userland keep track of
> what lock bits it has set in the past.
>
> Alice
>
> >
> >
> > --
> > dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
