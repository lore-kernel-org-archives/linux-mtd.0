Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13rswU-0005wA-00
	for mtd-list@infradead.org; Sat, 04 Nov 2000 02:20:26 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13rswS-0005w4-00
	for mtd@infradead.org; Sat, 04 Nov 2000 02:20:26 +0000
Date: Sat, 4 Nov 2000 02:20:12 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: dr john halewood <john@frumious.unidec.co.uk>
cc: mtd@infradead.org
Subject: Re: Couple of Doc Questions
In-Reply-To: <0011031753150E.00500@frumious.unidec.co.uk>
Message-ID: <Pine.LNX.4.21.0011040214350.12726-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 10 Feb 71685, dr john halewood wrote:

>  I've had a couple of issues with DoC's come up in the last few days which more
> knowledgable people might be able to help me with.

>  My development board is a NS Geode box with 2 disk-on-chip sockets. I'm
> developing for both doc2000 & 2001 so I thought I'd put 2 in together (both
> 8MB). This worked okayish with 2.2.16 and one of the tarballs from
> mtd.infradead.org. I then got waylaid by other work for a couple of months.
> Now, running with 2.2.17+cvs I find that only one of the DoCs gets discovered,
> and its always the 2000. I've tried insmodding the drivers in different orders
> etc but it still ends up the same. Any idea why it no longer works? 

You should load the doc2000 and doc2001 drivers first, then load the
docprobe module. I don't know why it's broken - except presumably because
the people who have been working on it recently haven't been testing with
multiple devices present. There's no fundamental reason why this shouldn't
work any more.

> (I intend to move to 2.4.0-pre, but I've got to fix up the driver for
> the ethernet chip on the box - a dp83815 - first). Incidentally I seem
> to keep having to hack an increasing number of references to 2.4isms
> out of the drivers as time goes by to get them to compile on 2.2 -
> e.g. references to linux/blkpg.h &c.

Sorry, I don't have many copies of the 2.2 source around any more, so most
of my testing is done against 2.4. I should be more careful.

>   The other problem has turned up very recently. I finally got hold of a 24MB
> DOC2k (took nearly 3 months to arrive for some reason). As soon as I put it
> into my development board (by itself) and boot, the machine hangs after the
> BIOS check. It won't even go into dos. I suspect I've either been bitten by the
> old lilo incompatibility problem (dunno why seeing as it works with smaller
> chips) or I need a BIOS upgrade. 

The built-in firmware in the DiskOnChip is crap. It's taking up far too
much memory when you have a large device. I think newer versions of LILO
and the kernel can work around this, or you could just replace their
firmware with Grub.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
