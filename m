Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111YYK-0005Nu-00
	for mtd@infradead.org; Tue, 6 Jul 1999 17:58:40 +0100
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: Disk-On-Chip 2000 and Linux 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Jul 1999 17:58:39 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E111YYJ-0006Bm-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  Speading of partitions, It would be really nice to be able to have
> partitions built into the upper mtd layers. Every one of my devices
> has a partition of some sort and most of them are unmarked :<

What do you mean? If you want multiple filesystems on a single piece of flash, 
aren't you better off using a single FTL and making standard partitions on 
that, rather than splitting the MTD into multiple flash filesystems?

> I am thinking it would be fairly simply to make the upper layer mtd
> stuff accept some sort of argument to specify the partition sizes
> would work, but it sounds a bit ugly to implement. I need this to
> happen at boot time, and others need it to happen at card insertion
> time (from the CIS block I think)...  

Currently, the FTL driver searches the first megabyte of the device for an FTL 
header, so happily avoids any BIOS code or whatever happens to be at the 
beginning of the device. I believe that ftl_format takes an argument which 
tells it to skip a specified length at the beginning of the device, too. Isn't 
that enough?

----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
