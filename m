Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1398jH-0004AN-00
	for mtd-list@infradead.org; Mon, 03 Jul 2000 17:05:52 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 1398jG-0004AG-00
	for mtd@infradead.org; Mon, 03 Jul 2000 17:05:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E1397tM-0004tu-00@the-village.bc.nu> 
References: <E1397tM-0004tu-00@the-village.bc.nu> 
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: nico@cam.org (Nicolas Pitre), jgg@ualberta.ca (Jason Gunthorpe),
  bjorn.wesen@axis.com (Bjorn Wesen), jffs-dev@axis.com, mtd@infradead.org
Subject: Re: garbage collect 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 03 Jul 2000 17:09:38 +0100
Message-ID: <21897.962640578@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


alan@lxorguk.ukuu.org.uk said:
> The interesting question is should they.

I don't (currently) think so. It's fairly difficult to fit flash into the
block device model.

JFFS is the primary user of MTD devices now - everything else (i.e. FTL,
NFTL) is a second class citizen. JFFS writes variable-size nodes, and doing
that on a block device would mean wasting RAM on grouping writes into
blocksized chunks.

And what do you set your blocksize to? On most NOR flash devices, it's 
something like 128Kb. We need to support sub-blocksize writes, and we need 
that to be explicitly controlled by the user, so it can optimally balance the 
journalling requirements with the desire to have as few write cycles as 
possible. 

> Withouth them going via the block layer you wont be able to mirror 
> them 

Mirrored flash? That's just sick. And anyway, it needs to be done at a 
higher level than the individual flash chips - on which you may have bad 
blocks in different places, which need to be mapped round differently on 
each chip.

Currently, if you want mirrored flash, you have to use {N,}FTL to provide
emulated block devices on top of which you stick your RAID array.

It's feasible to add direct mirroring support to JFFS, though, if it's 
really a necessary feature.

> or potentially run a loopback fs over them soon 

That's even sicker, and should arguably be done in userspace with nbd.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
