Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14kBI3-0001Si-00
	for mtd-list@infradead.org; Mon, 02 Apr 2001 21:51:07 +0100
Received: from gatekeeper.emware.com ([209.140.75.114])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14kBHu-0001Sc-00
	for mtd@infradead.org; Mon, 02 Apr 2001 21:51:00 +0100
Message-ID: <3AC8E6A2.E0E43DC1@emware.com>
Date: Mon, 02 Apr 2001 14:52:50 -0600
From: Tim Bowman <tbowman@emware.com>
MIME-Version: 1.0
To: mtd mailing list <mtd@infradead.org>
Subject: RPX Classic/Lite and byte ordering
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

One more possibilty: 

Would cross-compiling the kernel on an x86 produce different ordering
than compiling natively on a PowerPC (which is how I am building it)? 
Maybe I need to build it on an x86?


Original message:

> I am having trouble with an Embeddded Planet RPX board.  The mtd layer
> seems to be reversing the data by double words.  If I write (then cat)
> some text, every double word is reversed.  I can use a cramfs file
> system, but I have to reverse the dwords myself before writing it to
> flash, then everything works fine.  JFFS and other file systems
> obviously don't work, since the data is written by mtd in the wrong
> order.  I am doing everything on big-endian machines (PowerPC).

I have tried all of the query ordering options in the kernel config, and
even tried changing just the read, and then just the write in
cfi-endian.h to order words and double words, to no avail.  I have the
latest code for both the bk kernel and the cvs mtd.

Eric B. suggested:
"You might want to take a look at .../include/mtd/cfi_endian.h and
be sure you are using __raw_writeb and friends. "

The rpxlite layer seems to be using memcpy_fromio, writeb, writew, etc,
not __raw_writeb.  Should these be replaced with the raw versions?

Finally, could this have something to do with flash interleave?  I am
relatively new at this low-level stuff, but if the interleave is 4 for
the RPX, then I could see how every 4 bytes might be reversed.  The
specific board I am using is a CLCC_E with 8M flash.

Thanks


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
