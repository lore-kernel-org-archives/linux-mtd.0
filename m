Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H4Q6-0008P2-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 14:06:50 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13H4Q5-0008Ow-00
	for mtd@infradead.org; Tue, 25 Jul 2000 14:06:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <397D90F2.69D2D5DD@arcom.co.uk> 
References: <397D90F2.69D2D5DD@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: do_map_probe() can't find cfi_probe() 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jul 2000 14:06:47 +0100
Message-ID: <23903.964530407@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  do_map_probe() can't find cfi_probe() in the cfi_probe module.  Some
> hints/suggestion on what may cause this problem would be appreciated. 

Make sure that...

 1. The cfi_probe module is available - either.
	a. It's linked into the kernel statically.
	b. It's in a directory where modprobe(8) can find it.
	c. It's already loaded.

 2. You don't have CONFIG_MODVERSIONS enabled.

Failing that, post more details.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
