Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xnf0-00010k-00
	for mtd-list@infradead.org; Fri, 02 Jun 2000 10:22:34 +0100
Date: Fri, 2 Jun 2000 10:04:20 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: Bjorn Wesen <bjorn.wesen@axis.com>,
        Finn Hakansson <finn.hakansson@axis.com>, mtd@infradead.org,
        alan@redhat.com
Subject: Re: JFFS - ready for submission into 2.[34]? 
In-Reply-To: <28185.959934825@devel2.axiom.internal>
Message-ID: <Pine.LNX.4.10.10006020957280.1038-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Jun 2000, David Woodhouse wrote:

> 
> alex@cendio.se said:
> > Possibly. But i suppose the real reason is that the current way would
> > be the way you normally use it in embedded systems (like those axis
> > are doing). You generate your root fs on the build machine, create a
> > jffs image and download it into the flash memory of the target system.
> 
> Yeah, but it's still not imperative to create the image in one go from mkfs.
Actually I'm not sure jffs needs a special mkfs at all. An empty flash
should work just as well. It will just creates a root node at mount time.
 
> We create our Linux (and even NT) workstations by just taking a dump of the
> filesystem after installation, and dd'ing that onto the target. That would
> work just as well for JFFS.
That doesn't work well in a factory producing thousands of cameras a
week.
 
> Either way - once we get it working on NAND flash, and having to map round 
> bad blocks, we're going to have difficulties with just dumping an image on
> to the flash anyway. 

Well. The bad block remapping can certainly be problematic since the
journal won't be linear anymore. I suppose the lower layer mtd driver does
the remapping automatically?

/ Alex



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
