Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12uIf0-0004rB-00
	for mtd-list@infradead.org; Tue, 23 May 2000 18:40:06 +0100
Received: from mail.transzap.net ([207.239.241.226] helo=tzi.transzap.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12uIey-0004r5-00
	for mtd@infradead.org; Tue, 23 May 2000 18:40:05 +0100
From: Patrick Higgins <phiggins@transzap.com>
To: Dvir Oren <dviro@lucidvon.com>
Cc: mtd@infradead.org
Date: Tue, 23 May 2000 11:43:44 -0600 (MDT)
Subject: Re: Write support 
In-Reply-To: <14634.41505.90854.754749@jodie.lucid>
Message-ID: <Pine.LNX.4.21.0005231131490.23843-100000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 23 May 2000, Dvir Oren wrote:

> Patrick Higgins writes ("Re: Write support "):
> > > > So, I went back the not-so-handy dformat and now find that it fails 
> > > > after 4096 kbytes.  If this hardware is failing, it's failing like 
> > > > wildfire.  Have any of your units failed on  you? 
> 
> > Unfortunately, no.  I suppose I need to order a few more.  We ordered the
> > one I have from Flytech, and it took _forever_ to get here.  Do you know
> > of any good suppliers?  Can you buy directly from M-Systems?
> 
> I found that when this happens, I could use docpmap /e, which would erase
> the flsh _entirely_(***), and then I could use dformat, which will restore
> the flash to a usable state.
> 
> ***
> Using docpmap /e is 'prohibited' by M-Systems', and it will not be
> available in the next version.  The problem with this is that it
> erases the bad block table, which will never be restored again.
> 
> What can be done to avoid this is to do dformat /log:<filename>,
> which should save the bad block table to filename, and you can then
> restore it.
> 
> However, from my experience, and as it so happens to be, most flashes
> have 0 bad blocks.
> 
> You can take your chances if you want.

I wish I could still do this...unfortunately, I took my chances already
and used doc_loadbios to write the grub firmware onto the DoC, and now it
won't boot on my system which has a floppy (the only way I've able to get
DOS to boot), but I can still get it to boot Linux with PXE
(netboot).  Would something like:

dd if=/dev/zero of=/dev/mtd0

accomplish the same thing?

Has anyone gotten DOS to work with PXE?  If so, could you please describe
your setup?


Patrick


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
