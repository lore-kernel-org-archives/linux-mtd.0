Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ctlZ-0002hl-00
	for mtd-list@infradead.org; Tue, 13 Mar 2001 18:43:29 +0000
Message-ID: <3AAE6A90.B6844ACC@mvista.com>
Date: Tue, 13 Mar 2001 10:44:33 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: =?iso-8859-1?Q?K=E1ri=20Dav=ED=F0sson?= <kd@flaga.is>, mtd@infradead.org,
   ahennessy@mvista.com
Subject: Re: erase.c
References: <Pine.LNX.4.30.0103130802440.6091-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> On Mon, 12 Mar 2001, [iso-8859-1] Kári Davíðsson wrote:
>
> > Maybe it is ambigous to do force unlocking of sectors like this.
> > Should we maybe have a separate utility to lock/unlock sectors?
>
> Use a separate utility. Locking isn't very useful if the code
> automatically unlocks the chip for you if you try to overwrite it :)
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

I've checked in utility files unlock.c and lock.c  and a new Makefile to
include them.

I still need to fix the parameter checking in mtdpart.c and
cfi_cmdset_0001.c to insure
that the unlock is for the entire flash.

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
