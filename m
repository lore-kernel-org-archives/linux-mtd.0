Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13K0X1-0002xu-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 16:34:07 +0100
Date: Wed, 2 Aug 2000 17:33:51 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
Reply-To: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: Markus Thiesmeyer <mthi@gmx.de>, mtd@infradead.org, jffs-dev@axis.com,
        bmatthews@redhat.com
Subject: Re: Is JFFS a full featured filesystem? 
In-Reply-To: <24735.965226004@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000802173007.31962E-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 2 Aug 2000, David Woodhouse wrote:

> 
> alex@cendio.se said:
> >  Exactly how did you plan to work out the dirty ranges? Compare with
> > on-flash contents? 
> 
> Apparently it's easy when using generic_file_write, because prepare_write 
> will give you the exact range. 

Ok. I'll have to look at that some day.
 
> When doing writable mmap() we have to do something cleverer - basically yes,
> comparing with the on-flash contents. We can either do that by going and
> reading the flash nodes again on writepage(), or we can keep a copy of the 
> clean page in RAM before it's dirtied. 

I vote for comparing with on-flash content. Keeping the memory
requirements down is important for embedded systems low on memory.
 
> To start with, I'm inclined just to accept the hit of the 4Kb writes, and 
> let the GC combine nodes later as necessary. Comparing with old contents 
> can come later. This is only going to be a problem with writable mmap(), 
> which isn't supported at the moment _anyway_. The normal write() case is 
> fairly simple to optimise.

I agree. The current performance could easily be kept for files that just 
grow, and generic mmap writes in a file is pretty unusual.

/ Alex



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
