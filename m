Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13HOcI-0003hZ-00
	for mtd-list@infradead.org; Wed, 26 Jul 2000 11:40:46 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13HOcG-0003hT-00
	for mtd@infradead.org; Wed, 26 Jul 2000 11:40:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <397EC2F3.88695BD9@evoserve.com> 
References: <397EC2F3.88695BD9@evoserve.com> 
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: XIP on mtdram 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 26 Jul 2000 11:40:39 +0100
Message-ID: <8165.964608039@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Why can you use mtdram but not a normal ramdisk? The main advantage in that 
would be if you could eliminate the block device code and save a few pages 
of kernel code/data - but we haven't actually extracted it from the VM code 
yet, so we can't do that yet.

We don't currently have XIP in place for JFFS. You'd have to make sure the 
actual data in the nodes were page-aligned in the host memory, and remained 
that way on GC. It's possible, but we've not looked at it yet. 

Also, as flash is more expensive than RAM, it's cheaper to do compression, 
which means you obviously can't do XIP.

If you really have to have XIP from a filesystem stored in RAM, look at 
ramfs.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
