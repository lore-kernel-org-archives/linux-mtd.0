Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131jdW-0001QT-00
	for mtd-list@infradead.org; Tue, 13 Jun 2000 06:53:18 +0100
Date: Mon, 12 Jun 2000 23:53:12 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
Reply-To: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: Common Flash Interface probe code.
In-Reply-To: <30028.960811490@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000612232952.6204A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 12 Jun 2000, David Woodhouse wrote:

> Anyone with memory-mapped CFI-compliant NOR flash, especially if it's not 
> in 16-bit mode like the one I'm testing on - could you test this probe code 

Nifty.. I have a FLASH SIMM at work which AFAIK is 32bits wide, with 4
8-bit CFI chips (I hope) interleaved and then another 4 cascaded at the
end of that set. So the bottom two address lines and top address line
select which of the 8 chips and the rest of them index the memory.

You should be able do two things with this sort of flash configuration:
  1) Small erase sectors and slower 8/16bit IO - this is done by abusing
     the address lines and indexing 1 chip at a time.
  2) Large erase sectors and fast 32bit IO, including 4 chip parallel
     writes.

It is hanging right off the CPU's main 32-bit memory bus with a chipselect
controlling a 16meg window to access it.

Assuming the flash is CFI it looks like your detector will find the first
4 chips, but not the second set.

> #ifdef __arm__
> /* Shoot me. Better still, shoot rmk. dwmw2 */
> #undef writeb
> #undef writew
> #undef readb
> #undef readw
> #define readb(l) (*(unsigned char *)(l))
> #define writeb(c,l)  do {*((unsigned char *)(l)) = (c);} while (0)
> #define readw(l) (*(unsigned short *)(l))
> #define writew(c,l)  do {*((unsigned short *)(l)) = (c);} while (0)
> /* It's OK. You can look back now. */
> #endif /* __arm__ */

Wots up with this? Some of the ARM ports have 'interesting' IO..

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
