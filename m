Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JcQl-0006Qb-00
	for mtd-list@infradead.org; Tue, 01 Aug 2000 14:50:03 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13JcQk-0006QP-00
	for mtd@infradead.org; Tue, 01 Aug 2000 14:50:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20000727135944.F27468@one-eyed-alien.net> 
References: <20000727135944.F27468@one-eyed-alien.net> 
To: Matthew Dharm <mdharm-kernel@one-eyed-alien.net>
Cc: Kernel Developer List <linux-kernel@vger.rutgers.edu>,
  Linux USB Storage List <usb-storage@one-eyed-alien.net>, mtd@infradead.org
Subject: Re: SmartMedia translation layer? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 01 Aug 2000 14:49:30 +0100
Message-ID: <13630.965137770@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mdharm-kernel@one-eyed-alien.net said:
>   To do this, we need to have code which can take care of this
> re-mapping system.  We're wondering if anyone out there has such code
> allready (perhaps even in use with Linux).

> If not, we're prepared to write our own management system... but if
> there is existing code out there we can leverage, it would be really
> nice. 

We have a couple of translation layers for flash devices, which do a similar
kind of remapping to emulate a block device. I doubt they're the same, and
in some places they're patented and may only be used on certain hardware.

See drivers/mtd/nftl.c and drivers/mtd/ftl.c for more details.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
