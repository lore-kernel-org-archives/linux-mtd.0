Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14minx-0000we-00
	for mtd-list@infradead.org; Mon, 09 Apr 2001 22:02:33 +0100
Received: from mail.addcoinc.com
	([12.47.38.2] helo=exchange.addcoinc.com ident=fwuser)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14minw-0000wY-00
	for mtd@infradead.org; Mon, 09 Apr 2001 22:02:32 +0100
Message-ID: <5B08DC7C9AA6D411930E00105A19794B3E23C6@EXCHANGE>
From: "Carson, Jon A." <JACarson@addcoinc.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Formatting problems with DOC2000 / 16 meg.
Date: Mon, 9 Apr 2001 15:58:43 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I am having apparent problems formatting a 16 Meg. Disk On Chip 2000.

Here is the print-out of "./nftl_format /dev/mtd0" which seems to have
failed somehow.
:
------------------ SNIP ---------------
Phase 1. Checking and erasing Erase Zones from 0x00000000 to 0x01000000
	Erasing Zone #0 @ 0x0
	Erasing Zone #1 @ 0x2000
	Erasing Zone #2 @ 0x4000
	--------- a bunch of good stuff -------------
	Erasing Zone #2045 @ 0xffa000
	Erasing Zone #2046 @ 0xffc000
	Erasing Zone #2047 @ 0xffe000
Phase 2.a Writing NFTL Media Header and Bad Unit Table
Phase 2.b Writing Spare NFTL Media Header and Spare Bad Unit Table
Phase 3. Writing Unit Control Information to each Erase Unit
MEMWRITEOOB at 2200: Bad address
MEMWRITEOOB at 4200: Bad address
--------- a bunch of bad stuff -------------
MEMWRITEOOB at fec200: Bad address
MEMWRITEOOB at fee200: Bad address
MEMWRITEOOB at ff0200: Bad address
MEMWRITEOOB at ff2200: Bad address
MEMWRITEOOB at ff4200: Bad address
MEMWRITEOOB at ff6200: Bad address
MEMWRITEOOB at ff8200: Bad address
MEMWRITEOOB at ffa200: Bad address
MEMWRITEOOB at ffc200: Bad address
MEMWRITEOOB at ffe200: Bad address


Please advise,
Thanks,
Jon Carson


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
