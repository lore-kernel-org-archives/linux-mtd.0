Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wo9L-000439-00
	for mtd-list@infradead.org; Fri, 17 Nov 2000 16:14:03 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13wo9K-000433-00
	for mtd@infradead.org; Fri, 17 Nov 2000 16:14:02 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.30.0011171121210.17599-100000@xanadu.gn.com> 
References: <Pine.LNX.4.30.0011171121210.17599-100000@xanadu.gn.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: Mike Hill <mhill@bustech.com>, mtd@infradead.org
Subject: Re: MTD on intel 28F320B3 flash memory 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 Nov 2000 16:13:53 +0000
Message-ID: <3177.974477633@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nico@cam.org said:
>  But then you have problem with concurent access to the chip... unless
> the code is tweaked so both mtd devices share the same spinlock and
> wq. 

Yep. That's not difficult. Actually, I think that's why the struct flchip 
contains both a spin_lock_t *mutex and the spinlock itself - so that you 
can point to a spinlock elsewhere if you want to.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
