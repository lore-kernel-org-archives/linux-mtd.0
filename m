Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JHVB-0002sB-00
	for mtd-list@infradead.org; Mon, 31 Jul 2000 16:29:13 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13JHVA-0002s5-00
	for mtd@infradead.org; Mon, 31 Jul 2000 16:29:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <398598C4.D6FC3ED8@arcom.co.uk> 
References: <398598C4.D6FC3ED8@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: Booting from flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 31 Jul 2000 16:29:05 +0100
Message-ID: <25533.965057345@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  How would I go about getting linux to boot of flash.

See Jason's stuff in the boot/ directory of my CVS tree. I haven't looked 
at it. Other people are booting off flash quite happily.

> If I'm using FTL do I need to make GRUB/LILO understand FTL?  

Yes. But why are you using FTL? It's patented and you're not permitted to 
use it on non-PCMCIA devices. You should probably be using JFFS instead.

(You'd need to get your bootloader to understand JFFS, too, but keep an eye 
on handhelds.org where that task is fairly high up on the TODO list.)

> The board I'm using is a standard PC architecture.

Wimp.

> How do all you guys boot?

I don't, on a PC. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
