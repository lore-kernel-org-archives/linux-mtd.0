Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14bD3H-0005jz-00
	for mtd-list@infradead.org; Fri, 09 Mar 2001 02:54:47 +0000
Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14bD3G-0005jt-00
	for mtd@infradead.org; Fri, 09 Mar 2001 02:54:46 +0000
Message-ID: <3AA845F4.4C73221B@mvista.com>
Date: Thu, 08 Mar 2001 18:54:44 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: Kevin Jacobs <jacobs@penguin.theopalgroup.com>
CC: Vipin Malik <vmalik@danielind.com>, mtd@infradead.org,
   ahennessy@mvista.com
Subject: Re: Oh, the many joys of MTD...
References: <Pine.LNX.4.21.0103081232160.7891-100000@penguin.theopalgroup.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Kevin Jacobs wrote:

> On Thu, 8 Mar 2001, Vipin Malik wrote:
> > > The device mapping is done with the ioremap() call which is responsible for
> > > providing a non-cacheable mapping.
> >
> > Actually I had to use ioremap_nocache() call with my ELANSC520 processor
> > (which has a processor I&D cache). This is even with caching actually
> > disabled for the flash banks inside the processor (by the startup
> > processor init code).
>
> This is exactly the configuration I have -- its a Lineo SecureEdge (NETtel)
> 2580 which is based on an AMD Elan SC520 chip.
>
> > Does ioremap() do any caching of it's own? What's the diff between the two?
>
> The difference is:
>
> extern inline void * ioremap (unsigned long offset, unsigned long size)
> {
>         return __ioremap(offset, size, 0);
> }
>
> and
>
> extern inline void * ioremap_nocache (unsigned long offset, unsigned long size)
> {
>         return __ioremap(offset, size, _PAGE_PCD);
> }
>
> This in turn adds _PAGE_PCD to the set_pte() call in __ioremap.  This turns
> off the page cache for the mapped area.  I'm still not sure why this matters
> though I think its inspired me to re-read the literature on the fiddly bits
> of i386 architecture.
>
> -Kevin
>
> --
> Kevin Jacobs
> The OPAL Group - Enterprise Systems Architect
> Voice: (216) 986-0710 x 19         E-mail: jacobs@theopalgroup.com
> Fax:   (216) 986-0714              WWW:    http://www.theopalgroup.com
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

Looks like ioremap is implemented inconsistently over the architectures.  Both
mips
and ppc return no-cache addresses for ioremap at the moment.  i386 looks like it
doesn't.
Perhaps ioremap_nocache is the way to go.

Alice




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
