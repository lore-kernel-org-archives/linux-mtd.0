Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14b4Pj-0002Ao-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 17:41:23 +0000
Received: from [207.206.34.25] (helo=penguin.theopalgroup.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14b4Pb-0002AT-00
	for mtd@infradead.org; Thu, 08 Mar 2001 17:41:16 +0000
Date: Thu, 8 Mar 2001 12:40:13 -0500 (EST)
From: Kevin Jacobs <jacobs@penguin.theopalgroup.com>
To: Vipin Malik <vmalik@danielind.com>
cc: mtd@infradead.org
Subject: Re: Oh, the many joys of MTD...
In-Reply-To: <3AA7C45C.E7652E1F@danielind.com>
Message-ID: <Pine.LNX.4.21.0103081232160.7891-100000@penguin.theopalgroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 8 Mar 2001, Vipin Malik wrote:
> > The device mapping is done with the ioremap() call which is responsible for
> > providing a non-cacheable mapping.
> 
> Actually I had to use ioremap_nocache() call with my ELANSC520 processor
> (which has a processor I&D cache). This is even with caching actually
> disabled for the flash banks inside the processor (by the startup
> processor init code).

This is exactly the configuration I have -- its a Lineo SecureEdge (NETtel)
2580 which is based on an AMD Elan SC520 chip.

> Does ioremap() do any caching of it's own? What's the diff between the two?

The difference is:

extern inline void * ioremap (unsigned long offset, unsigned long size)
{
        return __ioremap(offset, size, 0);
}

and 

extern inline void * ioremap_nocache (unsigned long offset, unsigned long size)
{
        return __ioremap(offset, size, _PAGE_PCD);
}

This in turn adds _PAGE_PCD to the set_pte() call in __ioremap.  This turns
off the page cache for the mapped area.  I'm still not sure why this matters
though I think its inspired me to re-read the literature on the fiddly bits
of i386 architecture.

-Kevin

--
Kevin Jacobs
The OPAL Group - Enterprise Systems Architect
Voice: (216) 986-0710 x 19         E-mail: jacobs@theopalgroup.com
Fax:   (216) 986-0714              WWW:    http://www.theopalgroup.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
