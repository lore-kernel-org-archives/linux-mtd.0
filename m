Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GVUk-0002vz-00
	for mtd-list@infradead.org; Thu, 11 Jan 2001 00:21:34 +0000
Date: Wed, 10 Jan 2001 19:21:31 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: =?iso-8859-1?Q?St=E9phane_Laroche?= <stephane.laroche@colubris.com>,
        <mtd@infradead.org>
Subject: Re: CFI problems with 32bit bus and 4 devices
In-Reply-To: <Pine.LNX.4.30.0101102149450.1062-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.30.0101101914190.584-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 10 Jan 2001, David Woodhouse wrote:

> On Wed, 10 Jan 2001, Nicolas Pitre wrote:
>
> > No.  Usually the actual x16 flash devices are able to operate in 8-bit mode
> > (selected with a pin tied to VCC or GND I think).  Then you route four of
> > them in parallel on a 32-bit bus.
>
> OK, sorry - I misunderstood. I was thinking of four x16 devices in x16
> mode.  (Which would make a certain amount of sense - although you can't
> drive them all with a single bus access, you can still have all four
> writing simultaneously, hence achieving four times the write bandwidth of
> a single chip.)

This would become ugly IMHO to interleave multiple chips over multiple bus
access.  Rather make one bank follow the other instead.

> So in this case, you've essentially got 4 8-bit devices with the address
> lines all shifted left by one bit, right?
>
> I thought the whole point in the 8-bit emulation mode was that you just
> didn't connect the chips' A0 line, and then you pretended they really were
> 8-bit chips, rather than having to add all this extra support to the
> drivers

>From what I understand that's mostly that, except for the query structure
which gets expanded on twice the address range.  All the rest should be the
same.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
