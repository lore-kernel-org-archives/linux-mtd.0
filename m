Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137ftL-00010i-00
	for mtd-list@infradead.org; Thu, 29 Jun 2000 16:06:11 +0100
Date: Thu, 29 Jun 2000 11:06:58 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: mtdblock interface 
In-Reply-To: <8697.962278797@cygnus.co.uk>
Message-ID: <Pine.LNX.4.10.10006291039200.14225-100000@xanadu.vip.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 29 Jun 2000, David Woodhouse wrote:

> 
> nico@cam.org said:
> >  I was thinking about the MTD block interface of course.  That's the
> > only method to use conventional filesystems with. 
> 
> The only time the mtdblock interface is useful is when the underlying 
> memory device is RAM. AFAIK Linux doesn't allow you to register a block 
> device with a blocksize as large as the erase blocks of most flash chips we 
> use.
> 
> So it's not really likely to be used that often, and especially not with 
> partitioning. 

For those who are interested:

The SA1100 patches I maintain at
ftp://ftp.arm.linux.org.uk/pub/linux/arm/people/nico/ contains a block
driver for Intel flash parts i.e. Strataflash and friends. Since the erase
block size is at least 64k, the driver implements a local cache to allow
the use of small block with the kernel block device interface for write
access.

This driver is currently in use by many embedded projects so it has a
rough idea of different flash configurations, addressing methods and
partitions. This was developed in order to use generic filesystems like
ext2, cramfs, etc.  Of course, jffs could be a much better choice for
Flash storage, but it wasn't available at the time and read-only
filesystems like cramfs still require a block device.

The major item on the wish list is to port this driver (at least the
low-level flash access) into the MTD framework, but nobody currently using
it found the time to do so yet.  I wanted to mention it here just in case
someone else might be interested to look at it.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
