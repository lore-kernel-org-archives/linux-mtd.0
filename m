Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12UC8W-0001Re-00
	for mtd-list@infradead.org; Sun, 12 Mar 2000 17:26:40 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12UC8V-0001RY-00
	for mtd@infradead.org; Sun, 12 Mar 2000 17:26:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000312180858.29783B-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000312180858.29783B-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org
Subject: Re: More comments 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 12 Mar 2000 17:26:38 +0000
Message-ID: <21948.952881998@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  I'm aware of the normal conventions for read (2), but is this good in
> the kernelspace api? I mean, the only reason for a flash to not read
> all data is if the flash is paged, and you don't want to bother
> changing page in the read function. On the other hand, all places in
> the kernel that  read data from the flash except the char device read
> op (ie. the block device, mtd, flash filesystems etc) needs to loop on
> each read.

In practice, this hasn't mattered because the devices allow you to read up to 
a block at a time, and the block device and flash filesystems usually want to 
read <= 1 block. The only place that has to retry is the mtd chardevice, which 
means the retry is in userspace.

However, that behaviour isn't guaranteed, so strictly speaking, perhaps we 
ought to change it. How about simply declaring that the read() functions MUST 
read up to the end of the block on which they start, and may not return an 
incomplete read unless requested to do a multi-block read.

That would make it safe for all current the kernel-space users, wouldn't it?

>  But if the device is fully memory mapped the current point()/
> unpoint() api is a bit overweight. A pointer and size would be enough.

Fine. Then it can go too. Just as soon as I've stopped ftl.c from using it :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
