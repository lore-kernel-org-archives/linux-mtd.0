Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Gnws-00008Y-00
	for mtd-list@infradead.org; Thu, 11 Jan 2001 20:03:50 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14Gnwr-00008S-00
	for mtd@infradead.org; Thu, 11 Jan 2001 20:03:49 +0000
Date: Thu, 11 Jan 2001 20:03:40 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Alice Hennessy <ahennessy@mvista.com>
cc: <mtd@infradead.org>
Subject: Re: LOCK and UNLOCK functions
In-Reply-To: <3A5E0C73.887353C5@mvista.com>
Message-ID: <Pine.LNX.4.30.0101111956500.5758-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 11 Jan 2001, Alice Hennessy wrote:

> 1. It doesn't appear to me that suspend affects the locking and
> unlocking flowcharts - only program and erase.  Is this a correct
> assumption?

What do you mean? Suspend affects everything, because we're about to turn
off the chip (the oldstate stuff is a thinko). If we're in the middle of
telling the chip to lock/unlock then suspend has return failure till we're
finished.

> 2. The mtdchar.c ioctl call for MEMUNLOCK passes the start and len
> addresses.  The unlock for the STRATA clears all the lock bits.  So I
> intend to include logic to reinstate the locked bits that are outside
> the desired range.  Sound reasonable?

Hmmm. Better to design the API better so it can describe the capabilities
of the chip. You don't have to stick to what I threw together - I'm full
of crap half the time. Hadn't you realised that yet?

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
