Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137ccw-0000aN-00
	for mtd-list@infradead.org; Thu, 29 Jun 2000 12:37:02 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 137ccv-0000aH-00
	for mtd@infradead.org; Thu, 29 Jun 2000 12:37:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10006281529030.10194-100000@xanadu.vip.ca> 
References: <Pine.LNX.4.10.10006281529030.10194-100000@xanadu.vip.ca> 
To: Nicolas Pitre <nico@cam.org>
Cc: Jason Gunthorpe <jgg@ualberta.ca>, Bjorn Wesen <bjorn.wesen@axis.com>,
  jffs-dev@axis.com, mtd@infradead.org
Subject: Re: garbage collect 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 29 Jun 2000 12:39:57 +0100
Message-ID: <8697.962278797@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nico@cam.org said:
>  I was thinking about the MTD block interface of course.  That's the
> only method to use conventional filesystems with. 

The only time the mtdblock interface is useful is when the underlying 
memory device is RAM. AFAIK Linux doesn't allow you to register a block 
device with a blocksize as large as the erase blocks of most flash chips we 
use.

So it's not really likely to be used that often, and especially not with 
partitioning. JFFS only uses it to find a handle to the real MTD device, 
and I'm hoping to change that fairly shortly.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
