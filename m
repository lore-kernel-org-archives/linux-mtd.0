Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13s8xt-0000AC-00
	for mtd-list@infradead.org; Sat, 04 Nov 2000 19:26:57 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13s8xr-0000A6-00
	for mtd@infradead.org; Sat, 04 Nov 2000 19:26:56 +0000
Date: Sat, 4 Nov 2000 19:26:50 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Alice Hennessy <ahennessy@mvista.com>
cc: mtd@infradead.org
Subject: Re: Flash chip locking
In-Reply-To: <39E65472.8A7A2E96@mvista.com>
Message-ID: <Pine.LNX.4.21.0011041925440.13737-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 12 Oct 2000, Alice Hennessy wrote:

> Was the  "has the erase finished yet?" timer the only reason for using
> spin_lock_bh instead of spin_lock?   Since the timer isn't implemented yet,
> spin_lock can be used at the moment, correct?   I'm experimenting with the
> driver in an environment that can  only tolerate disabling the bottom half for
> very brief periods.

Actually, even in the case where the timer _may_ be used, it's safe to
check whether a timer is _actually_ pending and only disable bottom halves
if it is. Because you hold the spinlock you know no other routine is going
to set a timer until you've finished.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
