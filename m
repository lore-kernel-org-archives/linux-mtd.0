Return-path: <David.Woodhouse@mvhi.com>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111DS0-0004ft-00
	for mtd@infradead.org; Mon, 5 Jul 1999 19:26:44 +0100
To: Jason Gunthorpe <jgg@ualberta.ca>
Cc: mtd@infradead.org, linux-kernel@vger.rutgers.edu
Subject: Re: Loop Devices over NFS don't work? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Jul 1999 19:26:42 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E111DRz-0002E1-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


jgg@ualberta.ca said:
>  How interesting (It looks simple to me, but is there something I'm
> not aware of?) It beats rebooting my desktop every time I screw up on
> this filesystem driver (MS Flash Filesystem 2 if anyone cares)! 

I use the MTD subsystem itself for testing - my workstation has 128Mb RAM, so I
boot it with 'mem=96M', load the 'physmem' driver to handle the extra 32Mb, 
and play with the filesystem on that. Course, I have these Disks-On-Chip too, 
but I haven't got a MTD system driver for them yet :)

Using FFS2 directly on the MTD layer rather than through an 'intermediate' 
block device should allow us to do clever things like execute-in-place (XIP) 
without too much trouble. Is there any need for FFS2 directly on a block 
device? If there is, I may have to rethink the arrangements to allow it.


----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
