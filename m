Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137MxA-000777-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 19:52:52 +0100
Date: Wed, 28 Jun 2000 19:54:46 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
cc: Jason Gunthorpe <jgg@ualberta.ca>, Bjorn Wesen <bjorn.wesen@axis.com>,
    jffs-dev@axis.com, mtd@infradead.org
Subject: Re: garbage collect 
In-Reply-To: <Pine.LNX.4.10.10006281416260.10194-100000@xanadu.vip.ca>
Message-ID: <Pine.LNX.4.21.0006281950320.1463-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 28 Jun 2000, Nicolas Pitre wrote:

> However it will byte you if you use the master device and partitioned
> devices at the same time.  You'll end up with coherency problems in the
> buffer cache.

MTD devices are not even vaguely related to block devices, and don't go
anywhere near the buffer cache.

As with block devices, though, using both the whole device and subsets of
it simultaneously can lead to confusion. Dont Do That Then.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
