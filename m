Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13iYuv-000780-00
	for mtd-list@infradead.org; Mon, 09 Oct 2000 10:08:17 +0100
Received: from dyna252.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13iYuu-00077u-00
	for mtd@infradead.org; Mon, 09 Oct 2000 10:08:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20001008181349.C16501@flapjack> 
References: <20001008181349.C16501@flapjack> 
To: kevin@moore-and-moore.com
Cc: mtd@infradead.org
Subject: Re: Grub support in DiskOnChip. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Oct 2000 10:07:54 +0100
Message-ID: <31553.971082474@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kevin@moore-and-moore.com said:
> I have an Allwell STB1030N (small form-factor solid state x86 box)
> with a 16 MB DOC Millenium, and I'm having difficulties getting grub
> to work. 

Grub doesn't yet support the DiskOnChip Millennium. It shouldn't be 
difficult to fix that, it's just that I did my development on DiskOnChip 
2000.

First you need to add Millennium support to Grub itself - you can boot Grub
from a floppy to test this. Once Grub can detect and read the DiskOnChip,
you also need to add Millennium support to the Grub loader found in the 
grub/ directory of my CVS tree. 


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
