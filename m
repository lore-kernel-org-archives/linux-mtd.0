Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14EEeD-0006nr-00
	for mtd-list@infradead.org; Thu, 04 Jan 2001 17:57:57 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14EEeC-0006nl-00
	for mtd@infradead.org; Thu, 04 Jan 2001 17:57:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3.0.6.32.20010104184851.0082a4e0@popmail.libero.it> 
References: <3.0.6.32.20010104184851.0082a4e0@popmail.libero.it> 
To: Livio Plos <livioplos@bigfoot.com>
Cc: mtd@infradead.org
Subject: Re: howto 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 04 Jan 2001 17:57:54 +0000
Message-ID: <10818.978631074@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


livioplos@bigfoot.com said:
>  I'm trying to build a system with flash chips instead of an hard disk
> or a disk on module and this seems to be the  most advanced project to
> help me doing this.

> Neverthless, it is not easy to begin understanding how to  move
> between sources, configuration, modules...

Documentation is moving up the TODO list very slowly, as I get the code 
closer to a state where I'm happy with it.

> Can I boot totally from flash without any other storage support?

Yes, as long as you have the flash mapped where the CPU startup vector 
points, or the board's firmware has support for starting the Linux kernel
from flash (RedBoot does).

> Is there any howto or high level docs to configure and compile? 

Drop the latest code from CVS on top of your 2.4 kernel tree. Enable all the
CFI stuff, enable CONFIG_MTD_PHYSMAP and set the address, size and bus width
for your flash mapping appropriately. Boot it and see what happens.

If you want to partition the flash, as most people do, you'll want to copy
one of the other 'map' drivers (eg. pnc2000.c) and change the numbers
accordingly.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
