Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13rl1r-0002z8-00
	for mtd-list@infradead.org; Fri, 03 Nov 2000 17:53:27 +0000
Received: from firewall.unidec.co.uk ([195.166.19.2])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13rl1q-0002z2-00
	for mtd@infradead.org; Fri, 03 Nov 2000 17:53:26 +0000
Received: from frumious.unidec.co.uk (frumious.unidec.co.uk [195.166.20.93])
	by firewall.unidec.co.uk (8.9.3/8.9.3) with ESMTP id RAA07108
	for <mtd@infradead.org>; Fri, 3 Nov 2000 17:53:15 GMT
Received: from localhost (localhost [[UNIX: localhost]])
	by frumious.unidec.co.uk (8.11.1/8.11.1) id eA3HrFq11347
	for mtd@infradead.org; Fri, 3 Nov 2000 17:53:15 GMT
From: dr john halewood <john@frumious.unidec.co.uk>
Reply-To: john@frumious.unidec.co.uk
To: mtd@infradead.org
Subject: Couple of Doc Questions
Date: Sat, 10 Feb 71685 18:51:36 +0000
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <0011031753150E.00500@frumious.unidec.co.uk>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

 I've had a couple of issues with DoC's come up in the last few days which more
knowledgable people might be able to help me with.
 My development board is a NS Geode box with 2 disk-on-chip sockets. I'm
developing for both doc2000 & 2001 so I thought I'd put 2 in together (both
8MB). This worked okayish with 2.2.16 and one of the tarballs from
mtd.infradead.org. I then got waylaid by other work for a couple of months.
Now, running with 2.2.17+cvs I find that only one of the DoCs gets discovered,
and its always the 2000. I've tried insmodding the drivers in different orders
etc but it still ends up the same. Any idea why it no longer works? (I intend
to move to 2.4.0-pre, but I've got to fix up the driver for the ethernet chip
on the box - a dp83815 - first). Incidentally I seem to keep having to hack an
increasing number of references to 2.4isms out of the drivers as time goes by
to get them to compile on 2.2 - e.g. references to linux/blkpg.h &c.
  The other problem has turned up very recently. I finally got hold of a 24MB
DOC2k (took nearly 3 months to arrive for some reason). As soon as I put it
into my development board (by itself) and boot, the machine hangs after the
BIOS check. It won't even go into dos. I suspect I've either been bitten by the
old lilo incompatibility problem (dunno why seeing as it works with smaller
chips) or I need a BIOS upgrade. Anyone know of a specsheet that mentions what
bios /revisions/firmwares are needed for specific sizes of DoC ?(the award bios
on the box briefly flashes up 'M-Systems utils 3.3.7' at the end of
initialization so it's only a few months out of date)

 Thanks in advance for any light you can shed on these matters. I'm off home
now because the floodwater at the bottom of the street has nearly breached the
flood defences...

cheers
john (York, UK, very, very wet)


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
