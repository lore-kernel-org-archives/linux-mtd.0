Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137Kl8-0006gc-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 17:32:18 +0100
Date: Wed, 28 Jun 2000 10:34:59 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
Reply-To: Jason Gunthorpe <jgg@ualberta.ca>
To: David Woodhouse <dwmw2@infradead.org>
cc: Bjorn Wesen <bjorn.wesen@axis.com>, jffs-dev@axis.com, mtd@infradead.org
Subject: Re: garbage collect 
In-Reply-To: <13130.962208311@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000628101404.16453C-100000@wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Wed, 28 Jun 2000, David Woodhouse wrote:

> >  Well, we don't have any partitioning ability in the MTD stuff yet.
> 
> Not difficult to add, at least the simple and ugly way.

We could put a partition going up backwards from the bottom of the first
erase block, that would probably not interfere with any boot loader
action. Any boot loaders that are larger than a single erase block can
integrate the ptable into their image somehow. I'd like to advoid using
any space at the start, often very specific things have to be put there,
and sometimes that window is very small..

Something like:

struct PartitionEntry
{
   __u32 Signature;
   __u32 StartEraseBlock;
   __u32 LengthInBlocks;
   __u32 Type;          
};

struct PartitionHeader
{
   struct PartitionEntry[PartitionCount];
   __u32 PartitionCount;
   __u32 Signature;
};

Which is rather alot like how FFS2 works.

> For each 'partition' define a new MTD device, for which all the methods 
> simply add an offset and pass control to the method for the 'original' MTD 
> device.

Yes, that is how other block devices work? Can we somehow reuse that
mechanism, whatever it is..

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
