Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mm14-0002gQ-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 01:28:18 +0100
Date: Mon, 9 Apr 2001 20:27:06 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Brett Carswell <BrettC@nulec.com.au>
cc: "'David Woodhouse'" <dwmw2@infradead.org>,
        "'mtd@infradead.org'" <mtd@infradead.org>
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 
In-Reply-To: <1072F1A27E99D3119747005004B9A380EB98B0@MAIL>
Message-ID: <Pine.LNX.4.33.0104092021450.555-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 10 Apr 2001, Brett Carswell wrote:

> > To confirm:
> >  buswidth: obvious. (4 bytes)
> >  interleave: Number of devices accessible through a single
> > bus-width access (4)
> >  device type: _Device_ type (2). You ignore the 'A-1' line
> > because the magic
> > 	addresses still need to be on the 'A0' line and above,
>
> This last point does not seem to be the case. The datasheet says :
> Addresses are A19:A0 in word mode (BYTE# = V IH ), A19:A-1 in byte mode
> (BYTE# = V IL ).

At tis point it may all depend on how your hardware folks wired the chips...

> Not really much to be too confident about - but setting the LSB seems to be
> the only difference between a non-working and a working system.

To be sure, do a coherency test on your flash i.e. if you have 16MB then
generate 16MB of random data, write it to flash through MTD, read it back,
and compare.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
