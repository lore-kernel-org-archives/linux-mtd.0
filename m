Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hepY-0005gW-00
	for mtd-list@infradead.org; Mon, 26 Mar 2001 22:47:16 +0100
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14hepW-0005gQ-00
	for mtd@infradead.org; Mon, 26 Mar 2001 22:47:15 +0100
Received: from dwmw2 (helo=localhost)
	by imladris.demon.co.uk with local-esmtp (Exim 3.20 #2)
	id 14hepT-00079l-00
	for mtd@infradead.org; Mon, 26 Mar 2001 22:47:11 +0100
Date: Mon, 26 Mar 2001 22:47:11 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: <mtd@infradead.org>
Subject: Directory restructure?
Message-ID: <Pine.LNX.4.30.0103262244130.27497-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


It's getting a bit cluttered... I'm pondering the wisdom of rearranging it 
into something like...

drivers/mtd/chips - CFI, JEDEC, ROM, RAM, amd_flash, etc.
drivers/mtd/maps - all the map drivers
drivers/mtd/devices - all-in-one drivers like mtdram, doc2000, etc.
drivers/mtd/users - nftl,ftl,mtdblock,mtdchar etc.

Then there's the core code and the helper stuff like mtdpart.c and 
redboot.c - maybe that and the 'users' code should all remain in 
drivers/mtd - there's not too much of that.

Thoughts? Suggestions?

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
