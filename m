Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mlIB-0002Wc-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 00:41:55 +0100
Received: from [63.229.30.68] (helo=seven.phocussystems.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14mlIA-0002WT-00
	for mtd@infradead.org; Tue, 10 Apr 2001 00:41:54 +0100
Subject: RE: Formatting problems with DOC2000 / 16 meg.
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 9 Apr 2001 16:43:28 -0700
Message-ID: <271FF2B6A3F203418C76438C8A5FDF878420@seven.phocussystems.com>
content-class: urn:content-classes:message
From: "Chris Robson" <robsonc@phocussystems.com>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Same here w/ a 8 Meg DOC 2000.


Chris


-----Original Message-----
From: Carson, Jon A. [mailto:JACarson@addcoinc.com]
Sent: Monday, April 09, 2001 1:59 PM
To: 'mtd@infradead.org'
Subject: Formatting problems with DOC2000 / 16 meg.


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


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
