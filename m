Return-path: <David.Woodhouse@mvhi.com>
Received: from tmmi196-053.telusvelocity.net
	([209.115.196.53] helo=Wakko.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111EUO-0004i7-00
	for mtd@infradead.org; Mon, 5 Jul 1999 20:33:16 +0100
Date: Mon, 5 Jul 1999 13:33:12 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@infradead.org, linux-kernel@vger.rutgers.edu
Subject: Re: FFS2 and MTDs (flash) 
In-Reply-To: <E111E4d-0002HU-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990705131341.23392D-100000@Wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 5 Jul 1999, David Woodhouse wrote:

> jgg@ualberta.ca said:
> >  Things will also run a bit faster if the buffer cache is used to hang
> > onto some often used filesystem meta data in main memory.
> 
> Think of CFI-compliant flash mapped into the host's address space. Why cache 
> it in RAM when you can just point a page table at the original?

CFI? The point here is that flash is not nearly as fast as system memory.
My boards have the flash configured with an 8bit memory bus and the
latency isn't exactly amazing either. It is not a huge deal, but if you
are accessing the same memory again and again to do lookups like FFS2 does
then a caching in system ram does speed things, and you get it for free ;>
 
> > XIP is not directly possible with FFS2 as it places no constraints on
> > alignment (like romfs).
> 
> So what they say on their web site about XIP is all crap? Of course, I suppose 
> that shouldn't surprise me :)

For WinCE? I donno. I -could- be done, but you'd need to page align the
datablocks explicity, some sort of special flag when you create the file I
guess. I only have one board that has un-paged flash (16 bits wide too)
but the flash is small and I'm thinking of using compression, so I am
not very concerned. (and again there is that issue with flash being slower
than system memory)

> Is it possible to run Linux on FFS2 without some kind on UMSDOS-like 
> translation layer? Are we going to want to write our own version which is 
> POSIX-compliant?

The FFS2 spec has room for some extension structures. I'm going to see
what QNX uses for their implementation and follow the same pattern. I need
to have at least devices to be supported..

Unfortunately the QNX folks have decided to create a new FFS for Neutrino
2, and they are not willing to give out any information about it's format
:<

> Yes please - that'd be useful.

http://www.deltatee.com/~jgg/mtd-19990629-jgg.tar.gz

Startup looks something like:

# insmod mtd; insmod octagon-5066
Octagon 5066 SSD IO:0x208 MEM:0xe8000-0xf0000
mtd0: 5066 Socket ROM 512KB (RO)
mtd1: 5066 Internal Flash (AMD Am29F016) 2048KB (RW)

The flash chip type is autoprobed and my board has support for two
distinct 'sockets' The VMax board starts with

mtd1: VMax 301 Internal Flash (3*[AMD Am29F080]) 6144KB (RW)

Indicating three chips were found. It doesn't yet support interleved flash
(flash that address based on the lowest adress bit) And I haven't ported
over the PCMICA driver, I'm not sure what to make of it.. The autoprober
also needs some work to detect ROM/RAM sizes (looking for wrap around)

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
