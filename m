Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 126brv-000675-00
	for mtd-list@infradead.org; Fri, 07 Jan 2000 16:04:03 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 126bru-00066z-00
	for mtd@infradead.org; Fri, 07 Jan 2000 16:04:02 +0000
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 126byk-0007xg-00
	for mtd@infradead.org; Fri, 07 Jan 2000 16:11:06 +0000
Received: from dwmw2 by devel2.axiom.internal with local (Exim 1.90 #1)
	for mtd@infradead.org
	id 126byk-0007n8-00; Fri, 7 Jan 2000 16:11:06 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E126bft-00065J-00@infradead.org> 
References: <E126bft-00065J-00@infradead.org>  <E126NIB-0005it-00@infradead.org> 
To: "Dvir Oren" <dviro@lucidvon.com>
Cc: mtd@infradead.org
Subject: Re: Hardware RO & delays [DOC2000] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 07 Jan 2000 16:10:23 +0000
Message-Id: <E126byk-0007n8-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dviro@lucidvon.com said:
> What's the difference between per partition and per NFTL?  Do you
> mean that there should be /dev/nftla1 and /dev/nftlb1, as opposed  to /
> dev/nftla1 and /dev/nftla2?

Yes. Of course you don't need more than one NFTL if you can have _all_ your 
filesystem read-only.

> Is there a way to tell the flash chip itself not to touch certain
> areas? 

Not really.


> > Yes, it does all its flash access, even waiting for erases to finish,
> > with interrupts disabled.

> Do you know if this is true for M-Systems' driver as well? 

I think it is.

> Are the interrupts disabled during read operations as well?  Could it
> be that the driver disables the interrupts even if the flash is not
> mounted?

During read, yes. When the flash isn't mounted, no.

> How long does it take it to finish? 

A week or so of working time, which I'm not going to get for a month or two. 
Are you volunteering?



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
