Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136LTJ-0005Rp-00
	for mtd-list@infradead.org; Mon, 26 Jun 2000 00:05:49 +0100
Date: Sun, 25 Jun 2000 17:08:04 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: Compile problems
In-Reply-To: <Pine.LNX.4.21.0006251044510.1019-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.3.96.1000625165745.15303B-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Sun, 25 Jun 2000, David Woodhouse wrote:

> > Just been working on getting the latest MTD cvs to compile on
> > 2.3.99-pre8-rmk2 for an ARM platform.
 
> I've tested it on 2.4/ia32 and 2.2/ARM. Not yet 2.4/ARM although I didn't
> expect it to break.

Well, I am also using a very odd arm sub-arch (cl-ps7500fe)

> > The first two are due to the init/cleanup functions being declared static.
> 
> That's known and harmless. They're not unused; they're aliased. Consider
> it a GCC bug and ignore it.

Thats what I thought.. I wonder has anyone told the GCC people?
 
> > The '.section .modinfo\n.previous' comes from the kernel module.h header,
> > the second section declaration directly after comes from GCC.. I don't
> > recall seeing this when compiling the kernel proper, so maybe there is
> > something strange about the MTD stuff?
> 
> Not knowingly. Prod rmk or a gcc hacker. Also try cutting out stuff till
> it goes away and work out exactly what's causing it. Do you have MTD_DEBUG
> defined?

No, I don't think I do. I'll ask on the ARM list later then..
 
> > 2) ioremap, memcpy_fromio, etc seem to be PCI things
> > 
> > Most of the low level drivers won't even compile, mostly because my ARM
> > arch doesn't have PCI or ISA io functions :> 
> 
> Ah - on mine they're defined to panic()

Heh, on my arch they just aren't defined :| Thats OK, I shouldn't be
compiling most of those drivers as they are i386 only (particularly the
SBC drivers)
 
> Yes, vmax and oct should use the isa_ functions. Also, they should only be
> configurable if CONFIG_ISA is set, if they're ISA boards.

Well, they are SBCS, so they should be available if CONFIG_ISA and
whatever the I386 test is set.
 
> To get the DiskOnChip drivers to work, just stick #ifndef __arm__ around:
> 
> #define ReadDOC(adr, reg)      readb(((unsigned long)adr) + DoC_##reg)
> #define WriteDOC(d, adr, reg)  writeb(d, ((unsigned long)adr) + DoC_##reg)
> 
> ... in include/linux/mtd/doc2000.h and #else the appropriate alternative.
> Also ifdef the ioremap in docprobe.c and the iounmap in docprobe.c and
> doc200[01].c

Having not looked at it, shouldn't the DOC access be regulated to a lower
level driver, like we have for the other flash stuff? If I were to slap a
DOC on an ARM board here it would probably have quite different access (32
bit for one thing). 

BTW, I am almost finished redoing my JEDEC stuff to be more like your CFI
stuff [turns out my SIMM was made in 1995, no CFI] and adding support for
interleved and banked memories.. will send you a patch soon. 

I did add two new things to the struct map to make this possible:

  unsigned bus_width;    // Number of data bits between host<->memregion
  unsigned long bank_size;   // Bytes in a bank. size = bank_size*bank_count

Both should always be settable by a low level driver, they are determined
by the eletrical connections of the device. bus_width is 8/16/32 and
bank_size is to basically support FLASH SIMMS which have 4 chip select
lines E[0-4] that select 1 of 4 banks of chips. It is expected that these
lines will be driven by the host at some specific address interval, mine
is 4Meg. So if you have less than 4 meg of chips you end up with spaces
between them and the driver has to advoid them and probe differently. 

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
