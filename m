Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GRd6-0001AB-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 20:13:56 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.home)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14GRd4-0001A5-00
	for mtd@infradead.org; Wed, 10 Jan 2001 20:13:54 +0000
Date: Wed, 10 Jan 2001 15:13:48 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Stiphane Laroche <stephane.laroche@colubris.com>
cc: <mtd@infradead.org>
Subject: Re: CFI problems with 32bit bus and 4 devices
In-Reply-To: <3A5CB4C3.41FC20D1@colubris.com>
Message-ID: <Pine.LNX.4.30.0101101510370.584-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 10 Jan 2001, Stiphane Laroche wrote:

> Hi,
>
> I've just updated to the latest CVS and my CFI AMD chips are not
> accessible anymore.
>
> I lokked briefly into it and saw that the cfi->interleave and
> cfi->device_type were removed from offset calculations when accessing
> the devices.
>
> So, for my setup, which has 4 x16 devices on a 32 bit bus (AMDs),  the
> CFI query structure is located at offsets 0x80, 0x88, 0x90, etc.

[...]

> Any comments?  Is it possible that I'm the only one using that kind of
> geometry?

No.  4 x16 Intel chips on a 32-bit bus is now broken as well.  I didn't
investigate it yet though.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
