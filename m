Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 125mPP-0004oW-00
	for mtd-list@infradead.org; Wed, 05 Jan 2000 09:07:11 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 125mPN-0004oQ-00
	for mtd@infradead.org; Wed, 05 Jan 2000 09:07:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38727F5D.73445B90@ctam.com.au> 
References: <38727F5D.73445B90@ctam.com.au>  <38719CC6.93FB5729@ctam.com.au> <E125Qft-0007VY-00@devel2.axiom.internal> 
To: Brendan.Simon@ctam.com.au
Cc: mtd@infradead.org
Subject: Re: DiskOnChip for PowerPC embedded system. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Jan 2000 09:13:46 +0000
Message-Id: <E125mVm-0001GX-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Brendan.Simon@ctam.com.au said:
> I just noticed something.  48KB of linear ROM space would require a
> minimum of 16 address lines.  As far as I can see, the DOC2000 only
> has 13 address lines (ie. 8KB address space).  I'm a bit confused
> here.

> How does the DOC distinguish between accesses to the linear ROM and
> accesses to the NAND-Flash ? 

The 48Kb of firmware is actually on the flash, before the NFTL starts. You can 
expand that as much as you like, although I'm not sure if M-Systems' drivers 
will be happy with the NFTL starting in a different place. My drivers scan the 
whole of the flash to find it, though.

The 'linear rom' is only about 32 bytes (or 64?) repeated throughout the first 
half of the device's (externally-visible) address space. The second half of 
the address space holds the registers through which you control and access the 
flash.

On ia32, the linear rom holds just enough code to read the next 48Kb off the 
flash into memory, then jump to it.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
