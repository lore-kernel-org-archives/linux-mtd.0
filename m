Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137JUV-0006OC-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 16:11:03 +0100
Date: Wed, 28 Jun 2000 09:13:51 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c cfi_probe.c nora.c octagon-5066.c vmax301.c' 
In-Reply-To: <9649.962182936@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000628090756.16453A-100000@wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Wed, 28 Jun 2000, David Woodhouse wrote:

> >  The map driver is the only driver that knows what the eletrical
> > connection is, if it knows the banks are 4 meg apart then it has to
> > communicate that up. The only thing this is used for is detection, the
> > detector can jump to the next bank start and do all of the banks. The
> > only other option is to probe every block int the mapping region
> > looking for bank starts, which is gross since the information is
> > available.
> 
> Ah - you mean there are two sets of address lines which are unused - for 
> example:

No, not really..
 
>  A20-A19 : chip select
>  A18-A17 : not even connected on the chip sockets.
>  A16-A15 : present but the chips that are plugged in today don't use them
>  A14-A0  : connected to the chip and in use
 
> The map driver has no clue about the ones in the third category, but it 
> definitely knows about the second, you're right.

These are all just weird special cases of the same thing. If the flash is
banked in any way at all the mapped driver knows the bank size so it can
always say that 'every xxx bytes a new block of flash chips start' the
probe routine can use that to reliably locate all the flash chips.
 
> I'm inclined to suggest that the map driver should map around the ones 
> which are hardwired, and let the flash chip driver sort out the rest, 
> having been given a hint as to the bank size.

It doesn't matter at all, once you add support for any of the cases the
others you get for free.

> Do we need to expand the map_info structure any further by including the
> bank size, though? It's likely to be needed only at probe time, so shall we
> pass it as an extra argument to the _probe functions instead?

You need the bank_size to realign all IO requests from a linear flash
address to a memory address. The value needs to exist, but it could be
hidden in the private structure.
 
> >  No, the C99 named member initializers for structs:
> > struct foo = {name: "Hello",size: 1024};
> > Makes those big initializers readable. 
> 
> Oh right - yeah, that makes sense. Using the form you quote, which is in 
> fact a GCC extension - C99 would be:
> 
> struct foo = { .name = "Hello", .size = 1024 };

Hm.. the one I quoted is used all over the kernel, the C99 version
doesn't seem to be used at all. I thought they had settled on using C99
rather than the extension, oh well.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
