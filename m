Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JzH5-0002dl-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 15:13:35 +0100
Date: Wed, 2 Aug 2000 16:13:24 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: Markus Thiesmeyer <mthi@gmx.de>, mtd@infradead.org, jffs-dev@axis.com,
        bmatthews@redhat.com
Subject: Re: Is JFFS a full featured filesystem? 
In-Reply-To: <11108.965218269@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000802161220.31962D-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 2 Aug 2000, David Woodhouse wrote:

> 
> alex@cendio.se said:
> >  This could cause consistancy problems though, because we're not using
> > the (possibly modified) mmaped data when writing directly to a file,
> > we also in some way guarantee that all writes are done to the log in
> > the correct order. It will also be an inefficient way to write data to
> > jffs, since we have to rewrite whole pages instead of only the written
> > part.
> 
> I believe that we can address both of those problems - we can write data 
> directly from the page cache and we can also work out which ranges within
> a page have actually been dirtied. 

Exactly how did you plan to work out the dirty ranges? Compare with
on-flash contents?

/ Alex



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
