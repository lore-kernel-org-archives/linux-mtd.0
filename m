Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11FHSb-0004sa-00
	for mtd@infradead.org; Fri, 13 Aug 1999 14:33:29 +0100
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 13 Aug 1999 14:33:28 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11FHSa-0001NU-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
> On Tue, 10 Aug 1999, David Woodhouse wrote:
> > Some extra complexity is required for the erases, though, to allow
> > timer-based operation and retries. I didn't really pay much attention to
> > erases as I pulled this lot together though - just used what I had last
> > time. So feel free to point out anything that's not right. 

>  That should all go into the highest layer, the device stuff doesn't
> need to know it is being called asynchrounously. 

That's what I originally thought. However, erases take a long time, and we 
often don't need them to be done synchronously - mostly we'll keep a spare 
erase block already clean, and the newly-erased ones won't be used immediately.

Also, in multi-chip devices, an erase can be in progress on one chip while 
other things are happening to the other chips. Erases can even be interrupted, 
I believe, to allow reads to be performed. That kind of optimisation isn't 
possible unless we allow asynchronous erases.


>  If the DoC is just an array of normal flash chips with some paging
> mechanism then you could probably [use the mapped driver] quite easially.

The DiskOnChip 1000 is. So it should be quite simple, yes. But I have no access 
to DiskOnChip 1000 hardware at the moment - they're out of production. 
M-Systems are trying to see if they can lay their hands on some for me.
If we can't get them, then I'll probably just pull the DoC1000 driver 
completely.

>  Hum, that's kinda a bummer - Being able to prepare a flash image on
> my desktop and then just bang the whole thing onto device is very
> usefull - that is our primary means of deploying remote upgrades.

>  You still need to format the flash with the FTL information, it is
> convient to just have that pre-available in an image. 

Convenience is just a matter of having the tools readily available. If we 
provide a tool which can take a block device image and dump that to flash, 
formatting an NFTL partition as it does so, then it's just as convenient, 
surely? And we can use a standard loopback mount to create and maintain the 
filesystem for the device.

I agree that formatting and then populating the NFTL partition isn't 
quite as convenient (two command lines instead of one), but even that's 
scriptable.

It's fairly easy to make a dump/restore utility dumps the whole of the flash
intact, but that's of limited usefulness. Blindly duplicating the flash will
copy block erase counts and other such information that then becomes invalid on
the new media. For duplicating onto production systems, you'd do just as well
to use the format-as-you-go approach above.


jgg@deltatee.com said (re FFS2 on block devices):
>  The plan is to make it ask the MTD drive if the device it was mounted
> against is a MTD device and get a pointer to the MTD device block.
> Then it will not speak block or character, it will just directly
> manipulate the device. That solves the problem of having to ensure
> buffer cache consistency during erasures and so on.. 

Good - that's exactly what I was thinking of.

----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
