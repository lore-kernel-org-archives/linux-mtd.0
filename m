Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13tpyu-000731-00
	for mtd-list@infradead.org; Thu, 09 Nov 2000 11:35:00 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13tpys-00072v-00
	for mtd@infradead.org; Thu, 09 Nov 2000 11:34:59 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0011090809270.4610-100000@imladris.demon.co.uk> 
References: <Pine.LNX.4.21.0011090809270.4610-100000@imladris.demon.co.uk> 
Cc: Nicolas Pitre <nico@cam.org>, mtd@infradead.org
Subject: Re: corruption with mtdblock 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 09 Nov 2000 11:34:54 +0000
Message-ID: <28227.973769694@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
>  Upon further consideration, it may be cleaner (at the cost of
> _slightly_ higher io_request_lock contention) just to _not_ drop the
> spinlock between finishing one request and checking to see if the
> queue is empty.

'further consideration' is all well and good - but upon consumption of 
generous quantities of coffee, it occurs to me that this doesn't protect us 
from eating the first request on the queue if one arrives while the kernel 
thread is still initialising itself.

Defining a QUEUE_PLUGGED macro isn't that ugly, is it?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
