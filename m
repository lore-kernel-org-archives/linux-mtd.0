Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137NZu-0007Gs-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 20:32:54 +0100
Date: Wed, 28 Jun 2000 15:33:31 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Jason Gunthorpe <jgg@ualberta.ca>, Bjorn Wesen <bjorn.wesen@axis.com>,
        jffs-dev@axis.com, mtd@infradead.org
Subject: Re: garbage collect 
In-Reply-To: <Pine.LNX.4.21.0006281950320.1463-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.10.10006281529030.10194-100000@xanadu.vip.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 28 Jun 2000, David Woodhouse wrote:

> On Wed, 28 Jun 2000, Nicolas Pitre wrote:
> 
> > However it will byte you if you use the master device and partitioned
> > devices at the same time.  You'll end up with coherency problems in the
> > buffer cache.
> 
> MTD devices are not even vaguely related to block devices, and don't go
> anywhere near the buffer cache.
> 
> As with block devices, though, using both the whole device and subsets of
> it simultaneously can lead to confusion. Dont Do That Then.

I was thinking about the MTD block interface of course.  That's the only
method to use conventional filesystems with.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
