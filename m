Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GSvn-0001kD-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 21:37:19 +0000
Date: Wed, 10 Jan 2001 16:37:12 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: =?iso-8859-1?Q?St=E9phane_Laroche?= <stephane.laroche@colubris.com>,
        <mtd@infradead.org>
Subject: Re: CFI problems with 32bit bus and 4 devices
In-Reply-To: <Pine.LNX.4.30.0101102011550.13913-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.30.0101101629560.584-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 10 Jan 2001, David Woodhouse wrote:

> On Wed, 10 Jan 2001, [iso-8859-1] Stéphane Laroche wrote:
>
> > So, for my setup, which has 4 x16 devices on a 32 bit bus (AMDs),  the
> > CFI query structure is located at offsets 0x80, 0x88, 0x90, etc.
> >
> > cfi_read_query()  uses only the buswidth to calculate the offset, which
> > is not general enough (it used to be like that before I played with the
> > code a bit last summer).  It's obviously wrong in my case ( 0x10 << 2 !=
> > 0x80 ).
>
> Sorry, mea culpa. I'd forgotten - or just didn't realise this arrangement
> was used. How did {amd,cfi}_send_gen_cmd() send a command to all four
> chips? With two separate 32-bit writes?

No.  Usually the actual x16 flash devices are able to operate in 8-bit mode
(selected with a pin tied to VCC or GND I think).  Then you route four of
them in parallel on a 32-bit bus.  So in this case buswidth=4, interleave=4,
chip_type=2.  That was the case that needed to be fixed for the Intel write
buffer size lately.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
