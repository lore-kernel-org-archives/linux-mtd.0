Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131lJi-0001b2-00
	for mtd-list@infradead.org; Tue, 13 Jun 2000 08:40:58 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 131lJh-0001aw-00
	for mtd@infradead.org; Tue, 13 Jun 2000 08:40:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000612232952.6204A-100000@white.priv.deltatee.com> 
References: <Pine.LNX.3.96.1000612232952.6204A-100000@white.priv.deltatee.com> 
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: Common Flash Interface probe code. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Jun 2000 08:40:55 +0100
Message-ID: <29382.960882055@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  Assuming the flash is CFI it looks like your detector will find the
> first 4 chips, but not the second set. 

That's correct so far. Don't worry - the machine I'm working with has two 
flash chips mapped one after the other, so I'm going to be fixing that.

I'll even throw in actual read/write/erase code, rather than just probe :)

jgg@deltatee.com said:
>  Wots up with this? Some of the ARM ports have 'interesting' IO..

#define readb(p)	(panic("readb called, but not implemented"),0)

Which brings me to the other thing I wanted to discuss with you - because
Linux drivers basically needs to have a readb function per bus, the old
'mapped' code isn't quite generic enough.

I've put together a 'struct map_info' which contains read/write functions 
for the raw memory addresses, and these can handle paging if necessary. See 
include/linux/mtd/map.h and what I've done to kernel/vmax301.c for details.

There's an indirection per access, but it's cleaner like that, and in fact 
the overhead isn't _too_ horrible - flash is bloody slow anyway so we don't 
care too much about it there, and for accessing RAM or even reading flash, 
you have the copy_from() and copy_to() functions where the cost is O(1).

Care to offer an opinion? Especially as it's your code I'm replacing, so I 
know you've thought about this stuff.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
