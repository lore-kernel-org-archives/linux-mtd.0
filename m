Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13woO2-0004Aj-00
	for mtd-list@infradead.org; Fri, 17 Nov 2000 16:29:14 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13woO1-0004Ac-00
	for mtd@infradead.org; Fri, 17 Nov 2000 16:29:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.30.0011171121210.17599-100000@xanadu.gn.com> 
References: <Pine.LNX.4.30.0011171121210.17599-100000@xanadu.gn.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: Mike Hill <mhill@bustech.com>, mtd@infradead.org
Subject: Re: MTD on intel 28F320B3 flash memory 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 Nov 2000 16:29:06 +0000
Message-ID: <4577.974478546@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nico@cam.org said:
>  But then you have problem with concurent access to the chip... unless
> the code is tweaked so both mtd devices share the same spinlock and
> wq.

Upon further consideration...

They can just be different 'partitions' of the same underlying device - they
only appear as two separate devices to the upper layers - just like normal 
MTD partitioning.

All we have to do is make the erase routine aware of the nature of the 
chip, and make sure it correctly erases the correct amount of data, 
according to the length passed in as part of the erase request. We have to 
do that anyway, even in the case where we want to pretend it's all 64KiB.

Then it doesn't matter if the registered MTD partitions actually have 
different erase sizes. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
