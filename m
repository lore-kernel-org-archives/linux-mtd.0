Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wmLc-0003kF-00
	for mtd-list@infradead.org; Fri, 17 Nov 2000 14:18:36 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13wmLb-0003k9-00
	for mtd@infradead.org; Fri, 17 Nov 2000 14:18:35 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <004601c0509e$b10d5630$e3e8b2c6@hawk> 
References: <004601c0509e$b10d5630$e3e8b2c6@hawk>  <20001117005926.A829@portablue.linux-apollo.org> <3A14EFF6.EE574112@auriga.ru> 
To: "Mike Hill" <mhill@bustech.com>
Cc: mtd@infradead.org
Subject: Re: MTD on intel 28F320B3 flash memory 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 Nov 2000 14:18:02 +0000
Message-ID: <9558.974470682@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mhill@bustech.com said:
>  The 28F320B3 is a BOOT BLOCK flash part.  It contains Eight 8K
> regions and 63 64K regions.  The CFI code assumes that all regions are
> of the same size. I am currently using this part in a design.  To get
> around this problem, I changed the CFI code to treat the 8K regions as
> a single 64K region. 

I think that's the correct way do do things. I don't think the MTD layer 
needs to handle variable erase sizes within a single MTD partition. Either 
your CFI driver registers a single device with 64K erasesize, or it 
registers two devices, one with 8K erasesize and the remainder with 64K 
erasesize.

I can't think of any situation in which you'd want to _use_ the multiple 
erasesize without actually using the boot blocks for a separate purpose to 
the remainder of the flash, in which case they should be in different MTD 
devices anyway, as far as the MTD layer is concerned.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
