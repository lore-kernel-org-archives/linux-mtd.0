Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GTdy-00025J-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 22:22:58 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14GTdx-00025B-00
	for mtd@infradead.org; Wed, 10 Jan 2001 22:22:57 +0000
Date: Wed, 10 Jan 2001 22:22:42 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
cc: =?iso-8859-1?Q?St=E9phane_Laroche?= <stephane.laroche@colubris.com>,
     <mtd@infradead.org>
Subject: Re: CFI problems with 32bit bus and 4 devices
In-Reply-To: <Pine.LNX.4.30.0101101629560.584-100000@xanadu.home>
Message-ID: <Pine.LNX.4.30.0101102149450.1062-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 10 Jan 2001, Nicolas Pitre wrote:

> No.  Usually the actual x16 flash devices are able to operate in 8-bit mode
> (selected with a pin tied to VCC or GND I think).  Then you route four of
> them in parallel on a 32-bit bus.

OK, sorry - I misunderstood. I was thinking of four x16 devices in x16
mode.  (Which would make a certain amount of sense - although you can't
drive them all with a single bus access, you can still have all four
writing simultaneously, hence achieving four times the write bandwidth of
a single chip.)

So in this case, you've essentially got 4 8-bit devices with the address
lines all shifted left by one bit, right?

I thought the whole point in the 8-bit emulation mode was that you just
didn't connect the chips' A0 line, and then you pretended they really were
8-bit chips, rather than having to add all this extra support to the
drivers (and all the extra probe setups, which I've only just started to
understand). Although having seen the schematics for the LART, I suppose
we ought to be grateful that the address lines are at least connected in
_order_ :)

But just like the LART, I think we should probably fix up the address line
miswiring in the map driver, by shifting the requested address back to the
right by one bit to make up for the offset in the hardware. It'll allow us
to keep the actual CFI code simpler.

This kind of thing is really what the separation between chip and map
drivers was designed for - to prevent the CFI drivers from having to know
about the variety of ways in which the chips' address lines can be
connected to the CPU.

So - are x16 devices in x8 mode _really_ compatible with x8 devices if you
shift the address lines over by one? Common sense would imply that's the
case. Bitter experience would imply that the manufacturers have
probably screwed it up in interesting ways.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
