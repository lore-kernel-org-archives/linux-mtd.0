Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12VySn-0004mf-00
	for mtd-list@infradead.org; Fri, 17 Mar 2000 15:14:57 +0000
Received: from proxy.datalux.com ([204.111.16.98] helo=datalux_nt1.datalux_nt1)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12VySl-0004mU-00
	for mtd@infradead.org; Fri, 17 Mar 2000 15:14:55 +0000
Message-ID: <38D24BA5.CB487F1F@datalux.com>
Date: Fri, 17 Mar 2000 10:13:41 -0500
From: Ralph Stickley <rstickley@datalux.com>
MIME-Version: 1.0
To: Kyle Harris <kharris@nexus-tech.net>, mtd-list <mtd@infradead.org>
Subject: Re: CF Works !?
References: <38D1281F.63D57D8E@datalux.com> <38D1541C.85DB4CEC@nexus-tech.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



Kyle Harris wrote:
> 
> Ralph,
> 
> Thanks for the update. I'm a little confused (not unusual :). Why is the
> IDE-CF adaptor needed? Does the IDE CF not interface directly to a
> standard IDE? What is the total cost of your 32MB solution?
> 
> Thanks, Kyle.
> 
The CF cards come with a small 50 pin (1mm ??) connector on the edge of
them.
To make the connection with a standard 0.1" IDE connector requires an
adaptor
that has both connectors. AFAIK, the CF pinout is not the same pinout as
IDE...

Total cost for quantity "1"  is about $60 for the adaptor and $89 for
the card
(something like that, I didn't buy them, so I don't know exactly).

In the end, we'd like to layout our board to include the CF connector
directly on our board. I don't know what the cost of CF connector is, 
but the volumes that CF cards are manufactured in ensure their price 
will remain as cheap or cheaper than just buying the flash chips.  

CF design decisions...not just cost:

Availablity is a big problem with flash chips...we've seen them go out 
to 6 months on allocation!  Flash is one of the most difficult chips
to manufacture...for example, MicroChip has recently delayed some new 
"flash" based devices for over 8 months because of yield problems. 

Of course, in due time, you won't be able to buy something as small as
32MB (just like trying to buy a 4GB (or is that 6GB this month ?) hard
drive...
they aren't manufactured anymore!) but we can live with that :-)

Multi-sourced  devices are always going to be cheaper than sole 
sourced devices (like M-Systems)...

Also, the ability to remove and replace the media is worth it for our 
product design.  Added cost of connector may bring this design to same
price as M-System (doubt it) but the replaceability is handy for user
upgrades...(compare with..."ok, now insert screw-driver under that big
chip...")

Good luck,
Ralph


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
