Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12neUo-0003hJ-00
	for mtd-list@infradead.org; Fri, 05 May 2000 10:34:06 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12neUn-0003hD-00
	for mtd@infradead.org; Fri, 05 May 2000 10:34:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <390FEAA1.A4358BF8@zentropix.com> 
References: <390FEAA1.A4358BF8@zentropix.com> 
To: Trevor Woolven <trevw@zentropix.com>
Cc: mtd@infradead.org
Subject: Re: DOC Write Support and the TODO list 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 05 May 2000 10:38:25 +0100
Message-ID: <32697.957519505@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Sorry for the delay - it's taking me a while to catch up.

trevw@zentropix.com said:
> To business, I think I've fallen foul of some of the missing write
> functionality:

> When I rebooted my DOC system yesterday it stopped after
> 'Uncompressing Linux...' with the error message:

> crc error   

> 	-- System halted

> When I rebooted into my standard hdd-based system, the NFTL
> initialisation routine complained:

> EUN 317: Erasemark not 0x3c69 (0x3461 0x3461 instead) 
> EUN 356:	dittto

Odd. I can understand a few bits going south - but the _same_ bits in four 
different places? Sounds more like hardware to me - the high bit was tied 
low, perhaps during the write of the Erasemark.

> I was able to mount the device, etc but it would not boot (and it's
> been mothballed for weeks).

Can you check the data in the most recently changed files - see if the high 
bits are all zeroed? That would probably explain a CRC error during 
uncompress :)

> The plot thickens:- I then altered the device to boot a kernel using
> the M-Systems driver, which worked and then....I went back to my MTD
> driver kernel and that worked fine too!

> So, what do you think?

I'd have thought that's fairly unlikely to be bad blocks of flash - the
chances of 8 bits going bad, all coincidentally being the high bit of a
byte, are quite low. I'm more inclined to blame it on the system bus or 
DiskOnChip ASIC rather than the flash chips themselves. 

> Is this an example of a block going bad, being
> ignored by the nftl code but found and fixed by the M-Systems driver?

There's nothing the M-Systems driver can do to make us stop attempting to 
use those blocks. If the MTD driver is working now, then those blocks are 
(now) fine. 



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
