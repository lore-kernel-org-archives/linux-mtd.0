Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137Dgx-0005Xr-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 09:59:31 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 137Dgv-0005Xl-00
	for mtd@infradead.org; Wed, 28 Jun 2000 09:59:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000627124319.12137A-100000@wakko.deltatee.com> 
References: <Pine.LNX.3.96.1000627124319.12137A-100000@wakko.deltatee.com> 
To: Jason Gunthorpe <jgg@ualberta.ca>
Cc: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/kernel cfi_cmdset_0001.c cfi_probe.c nora.c octagon-5066.c vmax301.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 28 Jun 2000 10:02:16 +0100
Message-ID: <9649.962182936@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jgg@ualberta.ca said:
>  The map driver is the only driver that knows what the eletrical
> connection is, if it knows the banks are 4 meg apart then it has to
> communicate that up. The only thing this is used for is detection, the
> detector can jump to the next bank start and do all of the banks. The
> only other option is to probe every block int the mapping region
> looking for bank starts, which is gross since the information is
> available.

Ah - you mean there are two sets of address lines which are unused - for 
example:

 A20-A19 : chip select
 A18-A17 : not even connected on the chip sockets.
 A16-A15 : present but the chips that are plugged in today don't use them
 A14-A0  : connected to the chip and in use

The map driver has no clue about the ones in the third category, but it 
definitely knows about the second, you're right.

I'm inclined to suggest that the map driver should map around the ones 
which are hardwired, and let the flash chip driver sort out the rest, 
having been given a hint as to the bank size.

Do we need to expand the map_info structure any further by including the
bank size, though? It's likely to be needed only at probe time, so shall we
pass it as an extra argument to the _probe functions instead?

> > Hmmm. How about a char * ?
> That might be best.

OK, I'll sort that out as soon as I've worked out why my cfi_cmdset_0001 code 
is oopsing. I need either NOR flash in a PC, or a ksymoops for ARMv4l.


>  No, the C99 named member initializers for structs:
> struct foo = {name: "Hello",size: 1024};
> Makes those big initializers readable. 

Oh right - yeah, that makes sense. Using the form you quote, which is in 
fact a GCC extension - C99 would be:

struct foo = { .name = "Hello", .size = 1024 };



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
