Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143M1E-00011K-00
	for mtd-list@infradead.org; Tue, 05 Dec 2000 17:36:44 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143M1D-00011E-00
	for mtd@infradead.org; Tue, 05 Dec 2000 17:36:43 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A2D24D4.FC82D90D@echostar.com> 
References: <3A2D24D4.FC82D90D@echostar.com> 
To: ian.nelson@echostar.com
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: Possibly a FAQ or stupid question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Dec 2000 17:30:03 +0000
Message-ID: <8883.976037403@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ian.nelson@echostar.com said:
> Can I just dd to the flash?  Assuming that my AMD flash works with CFI... 

No. you have to use the MEMERASE ioctl first. The doc_loadbios program in 
the utils directory of the CVS tree will do this for you. Ignore the name, 
which I should probably change - it's not just for the DiskOnChip.


ian.nelson@echostar.com said:
>  Right now my boot loader will boot strap a kernel out of flash and
> then I hacked the kernel to scan for my initrd in flash and it will
> decompress it and run, works like a champ but I need a way to put a
> new initrd in there now. 

That works. As RAM is cheaper than flash, it makes a lot of sense to do 
that, in the absence of a compressed writable flash filesystem.

> Is JFFS compressed? 

Not yet. Soon. Watch this space.

> Can I set aside a few K at the end of flash for my boot loader and then a
> few hundred at the beginning for my kernel and use JFFS in the middle?

Yep. You can muck about with the partitioning all you like.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
