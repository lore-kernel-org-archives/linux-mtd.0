Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137MSQ-00070s-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 19:21:06 +0100
Date: Wed, 28 Jun 2000 14:20:53 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Jason Gunthorpe <jgg@ualberta.ca>, Bjorn Wesen <bjorn.wesen@axis.com>,
        jffs-dev@axis.com, mtd@infradead.org
Subject: Re: garbage collect 
In-Reply-To: <13130.962208311@cygnus.co.uk>
Message-ID: <Pine.LNX.4.10.10006281416260.10194-100000@xanadu.vip.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 28 Jun 2000, David Woodhouse wrote:

> 
> jgg@ualberta.ca said:
> >  Well, we don't have any partitioning ability in the MTD stuff yet.
> 
> Not difficult to add, at least the simple and ugly way.
> 
> For each 'partition' define a new MTD device, for which all the methods 
> simply add an offset and pass control to the method for the 'original' MTD 
> device.
> 
> Ugly, but simple and effective.

However it will byte you if you use the master device and partitioned
devices at the same time.  You'll end up with coherency problems in the
buffer cache.



Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
