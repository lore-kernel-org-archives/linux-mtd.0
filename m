Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wo6H-00042p-00
	for mtd-list@infradead.org; Fri, 17 Nov 2000 16:10:53 +0000
Date: Fri, 17 Nov 2000 11:23:19 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Mike Hill <mhill@bustech.com>, <mtd@infradead.org>
Subject: Re: MTD on intel 28F320B3 flash memory 
In-Reply-To: <9558.974470682@redhat.com>
Message-ID: <Pine.LNX.4.30.0011171121210.17599-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Fri, 17 Nov 2000, David Woodhouse wrote:

>
> mhill@bustech.com said:
> >  The 28F320B3 is a BOOT BLOCK flash part.  It contains Eight 8K
> > regions and 63 64K regions.  The CFI code assumes that all regions are
> > of the same size. I am currently using this part in a design.  To get
> > around this problem, I changed the CFI code to treat the 8K regions as
> > a single 64K region.
>
> I think that's the correct way do do things. I don't think the MTD layer
> needs to handle variable erase sizes within a single MTD partition. Either
> your CFI driver registers a single device with 64K erasesize, or it
> registers two devices, one with 8K erasesize and the remainder with 64K
> erasesize.

But then you have problem with concurent access to the chip... unless the
code is tweaked so both mtd devices share the same spinlock and wq.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
