Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OI1R-0007wN-00
	for mtd-list@infradead.org; Thu, 01 Feb 2001 11:35:29 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14OI1Q-0007wH-00
	for mtd@infradead.org; Thu, 01 Feb 2001 11:35:28 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001701c08be1$0c1be0f0$8412f2c3@drakanworkst> 
References: <001701c08be1$0c1be0f0$8412f2c3@drakanworkst> 
To: "Andrey Glazunov" <lhfrjgtn@peterlink.ru>
Cc: mtd@infradead.org
Subject: Re: lrp booting from M-Systems ISA flash card 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 01 Feb 2001 11:35:21 +0000
Message-ID: <1464.981027321@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


lhfrjgtn@peterlink.ru said:
> the main question - i need only boot from this flash card but not use
> it as hardrive (drive),  are there any ideas how to prevent system's
> hang ?

I think it's probably hanging because the built-in BIOS extension takes up 
too much memory. Can you try a newer version of SYSLINUX or using loadlin 
instead?

The kernel patches won't help you get it booting, but you may to be able to
use the flash card from within Linux - it was the first device ever
supported by the MTD code, although I had a 4MiB version. If the bitrot
hasn't got to it yet, try doc1000.c - you may need to hardcode the size of
the device and the physical location at which it's found.

You'll also want to enable FTL (not NFTL). 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
