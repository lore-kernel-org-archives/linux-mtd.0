Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JYIb-0005vi-00
	for mtd-list@infradead.org; Tue, 01 Aug 2000 10:25:21 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13JYIa-0005vc-00
	for mtd@infradead.org; Tue, 01 Aug 2000 10:25:20 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3985C29C.8F37EBC3@colubris.com> 
References: <3985C29C.8F37EBC3@colubris.com> 
To: Stephane Laroche <stephane.laroche@colubris.com>
Cc: mtd@infradead.org
Subject: Re: Erasing more than one sector at a time? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 01 Aug 2000 10:25:16 +0100
Message-ID: <12989.965121916@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


stephane.laroche@colubris.com said:
>  I'm wondering why the parameter validation at the start of those
> function specifically prohibits erasing more than one sector.  Is this
> because the interface is defined this way or is it an oversight?

Unless I'm smoking crack, the CFI command set code _does_ support erases 
longer than one erase block. The three checks which could cause it to 
return EINVAL are:
	1. start address must be erase-block-aligned
	2. length needs to be a multiple of erase block size.
	3. start + length must not exceed the _total_ size of the device.


The DiskOnChip code is different, but that's been/being fixed - depending 
on whether the patch has hit the CVS tree yet or not.




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
