Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148Msp-0001CD-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 13:32:47 +0000
Received: from web2103.mail.yahoo.com ([128.11.68.247])
	by infradead.org with smtp (Exim 3.16 #2)
	id 148Msn-0001C7-00
	for mtd@infradead.org; Tue, 19 Dec 2000 13:32:46 +0000
Message-ID: <20001219133239.24180.qmail@web2103.mail.yahoo.com>
Date: Tue, 19 Dec 2000 05:32:39 -0800 (PST)
From: Michael Stumpf <michaelstumpf@yahoo.com>
Reply-To: mstumpf@pobox.com
Subject: Re: MTD, generic physmap memory, MTD_BLOCK 
To: David Woodhouse <dwmw2@infradead.org>, shane@agendacomputing.com
Cc: Nicolas Pitre <nico@cam.org>, mstumpf@pobox.com, mtd@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> >  But we are working on XIP for cramfs.  But this requires either
> > expanding the  inode, or stealing a bit or two away from GIDS, or
> > UIDs.  This is only a  "linear addressing" patch. 
> 
> I was looking at doing it in romfs. You can't have compression anyway, for 
> obvious reasons, and it looked a little easier. But I suppose that wouldn't 
> allow you to mix XIP-able and compressed files in the same fs.

I did some work in the direction suggested by (thanks!) Nicolas--modified
mtdram.c to act as a conduit device for plain memory.  I did get a successful
boot from a cramfs rootdisk.  

When I said XIP, I didn't realize that this crowd had a very "serious"
definition of it.  I simply meant I was trying to get around the initrd
buffering issue:  As far as I can tell, up until now the only mechanism that a
CPU (with only RAM and ROM visibility) has at its disposal to boot from is
initrd, that would copy all the ROM image into RAM buffer cache.. and only
understand three file systems (cramfs is not one of them).  I don't mind cramfs
using a buffer page (4k, LinuxPPC) or two to do its work--I was trying to slay
the complete-image-copy daemon.  (My embedded system is 6 meg RAM, 8 meg ROM..
and I want shared libraries, etc)

It seems to me that for the time being and the immediate future, XIP as we're
talking about it would be overkill.  The streamlining and elegance gained in
the operation of XIP is probably offset by the ugliness of implementation and
the potential loss of compression that seems so crucial in embedded devices,
the primary target (right?) of MTD.  I like XIP but I don't think I'd ever use
it.

One very relevant topic that I'd like to discuss is where a generic memory
conduit device belongs.  I would suspect it belongs as a fallback default if
CFI devices can't be probed (I forget the file), but it also might make sense
to give it a separate file for "neatness" sake.  

Cheers,
Michael




=====
=====================================================================
Michael J. Stumpf                              
LinuxPPC enablement
IBM-Austin, TX     512.838.1524 [lab]  512.838.5335 [work]   
http://www.pobox.com/~mstumpf

__________________________________________________
Do You Yahoo!?
Yahoo! Shopping - Thousands of Stores. Millions of Products.
http://shopping.yahoo.com/


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
