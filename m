Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 130HnT-0005M9-00
	for mtd-list@infradead.org; Fri, 09 Jun 2000 06:57:35 +0100
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 130HnS-0005M3-00
	for mtd@infradead.org; Fri, 09 Jun 2000 06:57:35 +0100
Date: Thu, 8 Jun 2000 23:57:31 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: mtd@infradead.org
Subject: Quick Note on FFS2
Message-ID: <Pine.LNX.3.96.1000608234858.25251B-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hi all,

Just thought I'd say that it does not look like I will ever be working on
the FFS2 stuff again, but I will probably be revisiting the generic linear
flash driver in the next couple moths. I need to add support for
interleved flash for some new arm boards we have and make writing/erasing
more robust.

I don't recommend anyone use the FFS2 stuff, it was just good enough for
what we needed but otherwise it is pretty unfinished. Dave, I think you
should dump it in some sort of obsolete directory if you are including it
in your dist. 

Thanks,
Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
