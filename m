Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 133cOO-0000yr-00
	for mtd-list@infradead.org; Sun, 18 Jun 2000 11:33:28 +0100
Date: Sun, 18 Jun 2000 11:33:37 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Larsson <alex@cendio.se>
cc: Joakim Tjernlund <tjernlund@telia.com>, mtd@infradead.org
Subject: Re: HW platform
In-Reply-To: <Pine.LNX.3.96.1000617181808.28964A-100000@biffen.cendio.se>
Message-ID: <Pine.LNX.4.21.0006181127070.1042-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 17 Jun 2000, Alexander Larsson wrote:

> What about them? Most of the build in devices in the 860 (the
> communication controller stuff) already has drivers. You will need to
> write flash (mtd) drivers (the recent CFI stuff might work though).

CFI stuff ought to work fine if you flash is capable of command set #0001
- "Intel/Sharp Extended". Actually my code only uses the basic commands,
so if you change the lookup it should work on "Intel/Sharp
Standard" (0003? I'm at home with no specs ATM).

All you need to do is point the CFI code at the region where the flash is
mapped in memory - see include/linux/mtd/map.h and kernel/nora.c

Probably, all you'll have to do is change the WINDOW_ADDR and possibly
WINDOW_SIZE definitions at the top of nora.c

I may give it a more sensible name at some point in the future :)

The only other thing to be aware of is that I don't believe JFFS has
actually been tested on BE machines - although I don't really expect it to
turn up any problems.

I'll be fixing up the Intel command set code so that it doesn't busy-wait
for erases at some point in the near future - probably after I get back to
the UK next Thursday.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
