Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13w9t1-0003UU-00
	for mtd-list@infradead.org; Wed, 15 Nov 2000 21:14:31 +0000
Message-ID: <61EBF4983550D311808900A0CC39BC2C41E050@hertz.ftel.com>
From: quine@ftel.net
To: dwmw2@infradead.org, ahennessy@mvista.com
Cc: eauth@softsys.co.at, mtd@infradead.org
Subject: RE: JEDEC support broken?
Date: Wed, 15 Nov 2000 13:13:28 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I'm not sure how I got on your email list,  please remove my email address
quine@ftel.net

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tuesday, November 14, 2000 5:44 PM
To: Alice Hennessy
Cc: Erwin Authried; 'mtd@infradead.org'
Subject: Re: JEDEC support broken?


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


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
