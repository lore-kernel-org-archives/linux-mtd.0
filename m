Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137KIT-0006YZ-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 17:02:41 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 137KIQ-0006YT-00
	for mtd@infradead.org; Wed, 28 Jun 2000 17:02:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000628091427.16453B-100000@wakko.deltatee.com> 
References: <Pine.LNX.3.96.1000628091427.16453B-100000@wakko.deltatee.com> 
To: Jason Gunthorpe <jgg@ualberta.ca>
Cc: Bjorn Wesen <bjorn.wesen@axis.com>, jffs-dev@axis.com, mtd@infradead.org
Subject: Re: garbage collect 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 28 Jun 2000 17:05:11 +0100
Message-ID: <13130.962208311@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jgg@ualberta.ca said:
>  Well, we don't have any partitioning ability in the MTD stuff yet.

Not difficult to add, at least the simple and ugly way.

For each 'partition' define a new MTD device, for which all the methods 
simply add an offset and pass control to the method for the 'original' MTD 
device.

Ugly, but simple and effective.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
