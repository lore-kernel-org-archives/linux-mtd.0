Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13HPEA-0003oc-00
	for mtd-list@infradead.org; Wed, 26 Jul 2000 12:19:54 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13HPE7-0003oW-00
	for mtd@infradead.org; Wed, 26 Jul 2000 12:19:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <397ECCB6.3AF014DF@evoserve.com> 
References: <397ECCB6.3AF014DF@evoserve.com>  <397EC2F3.88695BD9@evoserve.com> <8165.964608039@cygnus.co.uk> 
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
Cc: mtd@infradead.org
Subject: Re: XIP on mtdram 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 26 Jul 2000 12:19:45 +0100
Message-ID: <12458.964610385@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rogelio@evoserve.com said:
> I really have to because i can have no more than 32 M ram and 4 M
> norflash. Can ramfs be mounted as root partition? I can almost boot
> linux straight off the bios chip now. I need to read a filesystem
> image off the flash, mount it as root and mount the flash filesystem
> array.

At the moment, you _have_ to execute your binaries from RAM. There's no 
alternative. Using a ramdisk, ramfs, or mtdram will all use up pages of 
that RAM, so there's no advantage in doing that over just using JFFS on the 
flash and having the page cache store it for you.

In fact, by using JFFS on the flash, at least the kernel can discard the
pages from RAM when they're not in use, so in fact you're better off that
way.

With some hacking, it's theoretically possible to get XIP working on JFFS. 
You're unlikely to get that running in a week, though. My advice is to go 
with JFFS directly on the flash.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
