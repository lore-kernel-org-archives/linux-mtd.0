Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14j2w7-0000Z3-00
	for mtd-list@infradead.org; Fri, 30 Mar 2001 18:43:47 +0100
Received: from gatekeeper.emware.com ([209.140.75.114])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14j2uF-0000XF-00
	for mtd@infradead.org; Fri, 30 Mar 2001 18:41:52 +0100
Message-ID: <3AC4C5D9.13DACBF5@emware.com>
Date: Fri, 30 Mar 2001 10:43:53 -0700
From: Tim Bowman <tbowman@emware.com>
MIME-Version: 1.0
To: mtd mailing list <mtd@infradead.org>
Subject: RPX Classic/Lite and byte ordering
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I am having trouble with an Embeddded Planet RPX board.  The mtd layer
seems to be reversing the data by double words.  If I write (then cat)
some text, every double word is reversed.  I can use a cramfs file
system, but I have to reverse the dwords myself before writing it to
flash, then everything works fine.  JFFS and other file systems
obviously don't work, since the data is written by mtd in the wrong
order.  I am doing everything on big-endian machines (PowerPC).

If someone can point me to the right code I would be glad to work on
this.

-TDB


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
