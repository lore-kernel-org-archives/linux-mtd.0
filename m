Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xoAk-00019i-00
	for mtd-list@infradead.org; Fri, 02 Jun 2000 10:55:22 +0100
Date: Fri, 2 Jun 2000 11:00:41 +0200 (CEST)
From: Finn Hakansson <finn.hakansson@axis.com>
To: Alexander Larsson <alex@cendio.se>
cc: David Woodhouse <dwmw2@infradead.org>, Bjorn Wesen <bjorn.wesen@axis.com>,
        Finn Hakansson <finn.hakansson@axis.com>, mtd@infradead.org,
        alan@redhat.com
Subject: Re: JFFS - ready for submission into 2.[34]? 
In-Reply-To: <Pine.LNX.4.10.10006020957280.1038-100000@tammy.signum.se>
Message-ID: <Pine.LNX.4.21.0006021041020.10738-100000@vvv.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Jun 2000, Alexander Larsson wrote:

> On Fri, 2 Jun 2000, David Woodhouse wrote:
> 
> > 
> > alex@cendio.se said:
> > > Possibly. But i suppose the real reason is that the current way would
> > > be the way you normally use it in embedded systems (like those axis
> > > are doing). You generate your root fs on the build machine, create a
> > > jffs image and download it into the flash memory of the target system.
> > 
> > Yeah, but it's still not imperative to create the image in one go from mkfs.
> Actually I'm not sure jffs needs a special mkfs at all. An empty flash
> should work just as well. It will just creates a root node at mount time.

That's correct. One feature of JFFS is that one can mount a totally empty
device. The root node can thus be missing.


> [...]

> > Either way - once we get it working on NAND flash, and having to map round 
> > bad blocks, we're going to have difficulties with just dumping an image on
> > to the flash anyway. 
> 
> Well. The bad block remapping can certainly be problematic since the
> journal won't be linear anymore. I suppose the lower layer mtd driver does
> the remapping automatically?

I don't see why there should be more difficulties with NAND flashes. The
dumping of a file system image could be done in the same way as before and
besides, the bad block detection mechanism should be implemented for NOR
flashes as well. A bad-sector tracking mechanism is on our TODO list.

/Finn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
