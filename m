Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11IBGP-0001SU-00
	for mtd@infradead.org; Sat, 21 Aug 1999 14:32:53 +0100
To: andre@suse.com
Cc: mtd@infradead.org, linux-kernel@vger.rutgers.edu
Subject: Re: First release of write support for DiskOnChip 2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 21 Aug 1999 14:32:51 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11IBGN-0008Pc-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


andre@suse.com said:
>  Do you have the lowlevel block interface between Linux and M-Systems?
> Will you GPL it and submit it?

I don't have their code, no. I wrote my own, which is GPL'd. 

> Since M-Systems currently has the only know API to the kernel and no
> plans to GPL that which is not theirs..........The DiskOnChips support
> as an IDE block device, just is not going to happen.

DiskOnChip isn't anything like IDE - it's NAND flash accessed through a memory 
mapped window. It has a flash filing system on it which is developed from the 
FTL which is used on PCMCIA cards, but changed to be useful on NAND flash.

> Complain to them and not me.....

I did. Then I did some more. After that, I got lots of other people to complain
to them too. Then they gave me the specs for both the device and for NFTL. 

> Now, if you have a version that can be submitted....WOOHOO!!!

It needs some work before it's ready to be given to Linus, but hopefully it'll 
be ready soon. 

It's part of a generic system for handling memory devices, which will include
the original FTL, and will be used by the PCMCIA drivers for memory devices
too. It will allow all such devices to be used as root filesystems, for 
embedded systems.

I was hoping to be able to submit it to Linus before the 2.3 feature freeze,
but I'm not sure I'll be ready in time. We'll see - as it's only a driver
addition he might let me get away with it. 



----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
