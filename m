Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13jsUl-0005PJ-00
	for mtd-list@infradead.org; Fri, 13 Oct 2000 01:14:43 +0100
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13jsUk-0005PD-00
	for mtd@infradead.org; Fri, 13 Oct 2000 01:14:43 +0100
Date: Fri, 13 Oct 2000 01:14:37 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Alice Hennessy <ahennessy@mvista.com>
cc: mtd@infradead.org
Subject: Re: Flash chip locking
In-Reply-To: <39E65472.8A7A2E96@mvista.com>
Message-ID: <Pine.LNX.4.21.0010130114200.1143-100000@imladris.demon.co.uk>
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

Yes, correct.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
