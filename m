Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11S66I-00071v-00
	for mtd@infradead.org; Fri, 17 Sep 1999 23:03:27 +0100
Date: Fri, 17 Sep 1999 16:03:00 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@infradead.org
Subject: Re: mapped helpful functions requiring libgcc.a
In-Reply-To: <E11RzR8-00038d-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990917160014.16406A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Fri, 17 Sep 1999, David Woodhouse wrote:

> I've just noticed that the 'mapped' helper function write_flash(), when 
> compiled with 2.3.17, requires __divdi3 and __moddi3 from libgcc.a 

I'm confused why GCC would not just emit code that performed these
operations instead of using these helper functions - there is nothing
special about them. It sounds like a compiler bug really.
 
Jason
> This is because of these two lines (just after line 500, at the beginning of 
> flash_write):
> 
>       // Compute the page offset and reposition
>       base = map->page(map,start/map->pagesize);
>       off = start %  map->pagesize;
> 
> Given that our map window is always going to be a power of two, I suggest that 
> we ought to use shifts instead of div/mod here, and change mapsize to be a 
> logarithm instead of the actual size.



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
