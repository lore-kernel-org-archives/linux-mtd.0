Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from tmmi196-012.telusvelocity.net
	([209.115.196.12] helo=Wakko.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 119EEn-0001bo-00
	for mtd@infradead.org; Tue, 27 Jul 1999 21:54:15 +0100
Date: Tue, 27 Jul 1999 14:53:31 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
Reply-To: Jason Gunthorpe <jgg@ualberta.ca>
To: Mike Panetta <mpanetta@realminfo.com>, dony <dony.he@huawei.com.cn>,
    mtd@infradead.org
Subject: FFS2 and MTD stuff
Message-ID: <Pine.LNX.3.96.990727144902.20266A-100000@Wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Here is another drop of my code base. This version has a few bug fixes to
the base MTD stuff, but sports a new FFS2 r/w filesystem and a FF2 bios
extension boot loader for linux.

I now have a complete stand alone system that boots from flash and uses
/dev/mtd1 as it's root device.

Unfortunately the FFS2 stuff isn't as complete as I would like it it be
and I have to leave it for awhile as I have to add features to the product
that all this is supporting :>

Basically right now it is just a fancy WORM filesystem, but all the
structures are there to implement more advanced writing functions - see
the todo list..

My code is at 

http://www.deltatee.com/~jgg/mtd/mtd/mtd-19990727.tar.gz

Enjoy!

Jason




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
