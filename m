Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14s7Zj-000217-00
	for mtd-list@infradead.org; Tue, 24 Apr 2001 19:30:11 +0100
Received: from mail.addcoinc.com
	([12.47.38.2] helo=exchange.addcoinc.com ident=fwuser)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14s7Zh-000210-00
	for mtd@infradead.org; Tue, 24 Apr 2001 19:30:09 +0100
Message-ID: <5B08DC7C9AA6D411930E00105A19794B3E2405@EXCHANGE>
From: "Carson, Jon A." <JACarson@addcoinc.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Cc: "Meyers, Jerry M." <JMMeyers@addcoinc.com>
Subject: Still having problems with nftl_format
Date: Tue, 24 Apr 2001 13:25:11 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

A while back ( April 9, 2001 ) , I reported a problem with nftl_format. I
know you are busy, but I wanted to state the problem again and also add some
new information.

The problem is that everything is nice until it gets to Phase 3 which deals
with writing some data into the chip.

I plugged in some printf's that show the state of the variables of interest,
before we drop into the "for" loop.  I also added a printf to the for loop
in case something was sucessful.  Please note that the first time through
the loop, the call to the "ioctl" was apparently sucessful.  Every call to
the same ioctl after that failed with errno == 14  (Bad address) .  I have
included an excerpt from the nftl_format.c showing the revesion level of the
code that I am using.

Here is the data:

 /* nftl_format.c: Creating a NFTL partition on an MTD device
 *
 *
 * $Id: nftl_format.c,v 1.13 2000/11/13 16:37:24 lethal Exp $
 */

Phase 3. Writing Unit Control Information to each Erase Unit

/*... my printf's .....
	ezone                 == 0x00000800 ( later gets init in the for
loop  )
	ezones                == 0x00000800 
	startofs              == 0x00000000
	meminfo.erasesize     == 0x00002000 
	oob.start             == 0x00000000 
.....................*/


MEMWRITEOOB at 200: Success
MEMWRITEOOB at 2200: Bad address
MEMWRITEOOB at 4200: Bad address
MEMWRITEOOB at 6200: Bad address
MEMWRITEOOB at 8200: Bad address
MEMWRITEOOB at a200: Bad address
MEMWRITEOOB at c200: Bad address
MEMWRITEOOB at e200: Bad address
MEMWRITEOOB at 10200: Bad address
.... yada yada , ad nauseum ......
MEMWRITEOOB at ff0200: Bad address
MEMWRITEOOB at ff2200: Bad address
MEMWRITEOOB at ff4200: Bad address
MEMWRITEOOB at ff6200: Bad address
MEMWRITEOOB at ff8200: Bad address
MEMWRITEOOB at ffa200: Bad address
MEMWRITEOOB at ffc200: Bad address
MEMWRITEOOB at ffe200: Bad address


I am using a 16 MB DiskOnChip plugged into the M-System's ISA card ( window
at 0xD0000 ) on a 300Mhz Pentium, running SUSE 7.1 with the 2.4.0 kernel all
set up with the MTD drivers.

Please help if you can.

THANKS IN ADVANCE,
Jon Carson
ADDCO Inc.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
