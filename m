Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 130OGC-0006OB-00
	for mtd-list@infradead.org; Fri, 09 Jun 2000 13:51:40 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 130OGB-0006O5-00
	for mtd@infradead.org; Fri, 09 Jun 2000 13:51:39 +0100
Received: from fafner.axis.se (fafner.axis.se [10.0.2.41])
	by roma.axis.se (8.9.3/8.9.3) with ESMTP id OAA00102
	for <mtd@infradead.org>; Fri, 9 Jun 2000 14:51:02 +0200 (MEST)
Received: from localhost (localhost [127.0.0.1])
	by fafner.axis.se (8.9.3/8.9.3/Debian 8.9.3-21) with SMTP id OAA03463
	for <mtd@infradead.org>; Fri, 9 Jun 2000 14:51:02 +0200
Date: Fri, 9 Jun 2000 14:51:02 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: mtd@infradead.org
Subject: Re: JFFS - ready for submission into 2.[34]?  (fwd)
Message-ID: <Pine.LNX.3.96.1000609145026.2350N-100000@fafner.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

In case you did not get this - there was some mail problems between axis
and infradead.org.

---------- Forwarded message ----------
Date: Fri, 9 Jun 2000 14:24:54 +0200 (CEST)
From: Bjorn Wesen <bjornw@axis.com>
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: JFFS - ready for submission into 2.[34]? 

On Thu, 8 Jun 2000, Jason Gunthorpe wrote:
> > mkfs.jffs and in the filesystem itself of course. But the on-flash
> > node-structure of JFFS is so simple that mkfs.jffs is simple enough to
> > warrant it I think.
> 
> Is the on flash structure documented? I need to write a simple read-only
> driver for bootloaders. (see the boot stuff in MTD CVS, if it is still the
> things I cooked up..)

It's "documented" in the .h file describing the struct, of course :)

In essence if you're just going to read say a file, the simplest is to
write a small function that scans the entire flash looking for the most
up-to-date version of a specified node. Then you do that scan for each
path component of the file you need. Once for /, then for bin, then for
myboot (for example).

Just remember that you do need to scan the entire flash because nodes that
get replaced are still there, so you need to find the one with the highest
version count (or whatever it is).

If you write that simple file-finder, do post it back here, it would be
a useful example tool. 

-Bjorn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
