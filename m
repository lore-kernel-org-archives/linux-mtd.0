Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GTWr-00022X-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 22:15:37 +0000
Received: from web2106.mail.yahoo.com ([128.11.68.250])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14GTWp-00022R-00
	for mtd@infradead.org; Wed, 10 Jan 2001 22:15:36 +0000
Message-ID: <20010110221533.7759.qmail@web2106.mail.yahoo.com>
Date: Wed, 10 Jan 2001 14:15:33 -0800 (PST)
From: Michael Stumpf <michaelstumpf@yahoo.com>
Reply-To: mstumpf@pobox.com
Subject: Re: howto
To: Livio Plos <livioplos@bigfoot.com>
Cc: mtd@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Sorry for the slow response; been on vacation.

> Can I boot totally from flash without any other storage support?

I'm doing some work requiring precisely this--flash chips, preprogrammed,
intended to boot linux with a read-only filesystem, preferrably compressed,
from a well-known ROM address.

I originally hacked up mtdram.c to do what has already been done, quite
elegantly infact..

There is a patch out there somewhere (search this list, if you can't find it,
let me know and I'll get it to you.) that adds a block device to the kernel
called "/dev/rom".. it has two modes of operation:

1)  Encodes the binary filesystem image and compiles it directly into the
kernel, bloating its final size

or 2)  Allow you to point it to a "well known" memory address that has (this is
unclear) 4 bytes containing the filesystem size (in bytes), 4 bytes of "00",
and then the filesystem image, whatever that may be.  I use cramfs with great
success on a very memory-constrained target.
 
> Is there any howto or high level docs to configure and compile?

Patch it in, enable it in config, refer to above notes.  Let me know if you're
still lost.

Regards,
Michael


=====
=====================================================================
Michael J. Stumpf                              
LinuxPPC enablement
IBM-Austin, TX     512.838.1524 [lab]  512.838.5335 [work]   
http://www.pobox.com/~mstumpf

__________________________________________________
Do You Yahoo!?
Yahoo! Photos - Share your holiday photos online!
http://photos.yahoo.com/


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
