Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GnY9-0008PF-00
	for mtd-list@infradead.org; Thu, 11 Jan 2001 19:38:17 +0000
Received: from [12.44.186.158] (helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14GnY8-0008P9-00
	for mtd@infradead.org; Thu, 11 Jan 2001 19:38:16 +0000
Message-ID: <3A5E0C73.887353C5@mvista.com>
Date: Thu, 11 Jan 2001 11:41:39 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: mtd@infradead.org
CC: ahennessy@mvista.com
Subject: LOCK and UNLOCK functions
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I need to implement the lock and unlock functions in cfi_cmdset_0001.c.
for STRATA chips.
Most of the hooks are already there in mtdchar.c and mtdpart.c for these
2 functions.
I do need to fix the if statements in mtdpart.c that doesn't set the
slave->mtd.lock
and slave->mtd.unlock correctly.
But other than that, I have a few questions:

1. It doesn't appear to me that suspend affects the locking and
unlocking flowcharts -
only program and erase.   Is this a correct assumption?

2. The mtdchar.c ioctl call for MEMUNLOCK  passes the start and len
addresses.  The
unlock for the STRATA clears all the lock bits.  So I intend to include
logic to reinstate the
locked bits that are outside the desired range.   Sound reasonable?

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
