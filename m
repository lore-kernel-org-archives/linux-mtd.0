Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11EEq7-0003Cp-00
	for mtd@infradead.org; Tue, 10 Aug 1999 17:33:27 +0100
Date: Tue, 10 Aug 1999 10:33:22 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver. 
In-Reply-To: <E11E7oz-0006h9-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990810100528.4862A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 10 Aug 1999, David Woodhouse wrote:

> > Also, using David's driver as the base driver kinda mucks things up -
> > he uses a different erase mechanism with different meanings, and has
> > some weird cruft from PCMCIA in there.
> 
> Yeah - the idea is that the PCMCIA drivers will be able to use this MTD layer 
> when (if) Linus incorporates in into the standard kernel. However, I'd like to 

I've used the PCMCIA drivers on memory cards, they do not work very well
at all - I -strongly- suspect that many problems would go away simply by
using the fancy detection code that is being put into the mapped layer, so
for me keeping compatibility with the old pcmcia driver isn't such a big
deal. 

> Some extra complexity is required for the erases, though, to allow
> timer-based operation and retries. I didn't really pay much attention to
> erases as I pulled this lot together though - just used what I had last
> time. So feel free to point out anything that's not right. 

That should all go into the highest layer, the device stuff doesn't need
to know it is being called asynchrounously.

> PCMCIA driver? I haven't started on that yet. If the mapped driver supports 
> pageable windows, then the DiskOnChip 1000 driver can use it too. 

The mapped driver is only for pageable windows of 'ordinary'
flash+ram+rom, linear type memories. I don't know how the DoC works so I
can't say if it would be at all usefull. 

If the DoC is just an array of normal flash chips with some paging
mechanism then you could probably do it quite easially.
  
> > Also, do your new NFTL and FTL drivers work over normal block devices?
> 
> No. NFTL cannot work over a block device, and can't easily work over most 
> memory devices either - you need NAND flash, which has 'out of band' data. 

Hum, that's kinda a bummer - Being able to prepare a flash image on my
desktop and then just bang the whole thing onto device is very usefull -
that is our primary means of deploying remote upgrades.
 
> FTL doesn't either - but there's little need for FTL on block devices.
> FTL _provides_ a block device, not an actual mounted filesystem. So if
> you want to take a duplicate copy of an FTL system, you duplicate the
> block device not the underlying structure. 

You still need to format the flash with the FTL information, it is
convient to just have that pre-available in an image.

> I'm not sure that running FFS2 from a block device is going to work in the 
> long term either - you need access to internal MTD stuff like the erase 
> mechanism and erasesize, etc. Your comments in the block device driver and in 
> the FFS2 code seem to support that point of view.

The plan is to make it ask the MTD drive if the device it was mounted
against is a MTD device and get a pointer to the MTD device block. Then it
will not speak block or character, it will just directly manipulate the
device. That solves the problem of having to ensure buffer cache
consistency during erasures and so on..

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
