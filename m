Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 126VNz-0005ve-00
	for mtd-list@infradead.org; Fri, 07 Jan 2000 09:08:43 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 126VNx-0005vY-00
	for mtd@infradead.org; Fri, 07 Jan 2000 09:08:41 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E126NIB-0005it-00@infradead.org> 
References: <E126NIB-0005it-00@infradead.org> 
To: Dvir Oren <dviro@lucidvon.com>
Cc: MTD <mtd@infradead.org>
Subject: Re: Hardware RO & delays [DOC2000] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 07 Jan 2000 09:15:40 +0000
Message-Id: <E126VUj-0006ne-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dviro@lucidvon.com said:
>  1.  Is there a way to tell the flash (DoC2000) to mark a certain part
>  of it as read only?  I know I can mount a certain partition as read
> only, but can I protect it at a lower level?

Not per partition, but per NFTL. Yes - if you modify nftl.c to register the 
blockdevice as readonly, then refuse to process any writes to that device, 
you'll be fine.

You can have more than one NFTL 'drive' on each DiskOnChip, arccording to my 
reading of the specifications - although I'm not sure if the firmware will see 
both of them. You might need to make sure the boot drive is the first one on 
the DiskOnChip, so that the BIOS sees it. 


> 2.  Does the driver block the system?  I'm experience delays in
> sending udp packets over ethernet for periods of 50-300  miliseconds.
> I have a function that is supposed to send every  several miliseconds
> a packets, and when going over the logs, I  once in a while see a
> packet that is delayed for several tens of  miliseconds, which is not
> acceptable by me.

Yes, it does all its flash access, even waiting for erases to finish, with 
interrupts disabled.

> Any ideas? 

Yes. I know exactly how I'm going to thread it, and lock the device / each 
chip etc. against multiple accesses. I just haven't done it yet.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
