Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13vrcG-0000Qv-00
	for mtd-list@infradead.org; Wed, 15 Nov 2000 01:44:00 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13vrcF-0000Qp-00
	for mtd@infradead.org; Wed, 15 Nov 2000 01:43:59 +0000
Date: Wed, 15 Nov 2000 01:43:48 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Alice Hennessy <ahennessy@mvista.com>
cc: Erwin Authried <eauth@softsys.co.at>,
    "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: JEDEC support broken?
In-Reply-To: <3A11E285.1FF18FF7@mvista.com>
Message-ID: <Pine.LNX.4.30.0011150138350.1030-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 14 Nov 2000, Alice Hennessy wrote:

> Do you mean to use map->size instead of bank_size (to spread the
> individual start offsets over if there are gaps between chips)

Nope, discard the concept of bank_size altogether. Each chip needs its own
information structure, much like the 'struct flchip' in
include/mtd/flashchip.h, which contains the start offset of the chip in
the map.

It's reasonable to assume that all chips in the array will be the same
size. You have an array of struct flchip (or your equivalent if you don't
want to use struct flchip) and you index into that by dividing by the
individual chip size - and then just address the chip you've selected by
using the start offset listed for it.

> Also,  is spin_lock support going to be added in jedec.c?

It certainly _needs_ doing. Feel free :)

> I have a board that needs support for both cfi and jedec flashes.
> So, the approach I have taken is to use physmap.c with an array of
> "physmap_info" structures that describe the window address, window
> size, buswidth and number of partitions for each flash.
 < ... deletia ... >

> Is this in keeping with the intent of the map file?

Sounds like it. Show us the code though.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
