Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from lutra.sztaki.hu ([193.225.86.1])
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111b9O-0005S9-00
	for mtd@infradead.org; Tue, 6 Jul 1999 20:45:07 +0100
Received: from localhost by sztaki.hu (PMDF V5.2-32 #35728)
 with ESMTP id <0FEG00301S75GS@sztaki.hu> for mtd@infradead.org; Tue,
 6 Jul 1999 21:45:05 +0200 (MET DST)
Date: Tue, 06 Jul 1999 21:45:05 +0200 (MET DST)
From: Gergely Madarasz <gorgo@sztaki.hu>
Subject: Re: Flash drivers and filesystem (fwd)
In-reply-to: <Pine.LNX.3.96.990706105307.17432C-100000@white.priv.deltatee.com>
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: David Woodhouse <David.Woodhouse@mvhi.com>,
 Alexander Larsson <alex@cendio.se>, mtd@infradead.org
Message-id: <Pine.GSO.4.10.9907062135350.29061-100000@lutra.sztaki.hu>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 6 Jul 1999, Jason Gunthorpe wrote:

> 
> On Tue, 6 Jul 1999, David Woodhouse wrote:
> 
> > jgg@deltatee.com said:
> > >  What is this applied against? This looks remarkably like it would fit
> > > nicely with the more general chagnes I made... 
> > 
> > Against Alex's original patch, I believe.
> 
> Hm, I don't have that code, just the original MTD stuff that was posted on
> lwn some weeks back.
>  
> > > Everyone rewriting the flash chip code for every new device is getting
> > > old :> 
> > 
> > Indeed. I'm working on recombining them all into one - was yours based upon
> > mine, or were they both based on something I can't find any more (I honestly
> > can't remember)?
> 
> Well, mine is the most different of all of them and has a bit of a strange
> history. I started with the MTD (which was originally derived from the
> PCMICA code) stuff I mentioned above and wrote a complete working driver
> for that then I talked to my friend Gergely who had written a from scratch
> block driver for his flash board, I also needed a block driver so I took

Actually my driver was a transparent block device with some hacks to make 
big writes in 64k blocks, did erase on the fly, so there was no need to
specifically erase it, so any rw filesystem could be put on it.. of course
it would wear out quickly...
I managed to boot linux from it using a small bios extensions which
emulated a floppy, and a few hacks to the ll_rw_blk and ramdisk code to
allow the kernel to load a ramdisk from this special device.
This was the fastest way I could produce something interesting to show to
the people because we had attended a conference/expo a couple of weeks
after this flash board has been finished... linux started booting from
it two days before the expo :) 
It booted, ran nicely, I could save the configuration, etc.

Anyway, Jasons code seems very nice, this board (a sync serial board btw
with a flash piggyback attached) works with it ok (except when it
hangs when I want to write a byte which hasn't been erased :)) and there
are still some small scheduling issues... 

Greg



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
