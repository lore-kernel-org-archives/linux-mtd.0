Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FHFj-0000Ab-00
	for mtd-list@infradead.org; Thu, 20 Jul 2000 15:24:43 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13FHFi-0000AV-00
	for mtd@infradead.org; Thu, 20 Jul 2000 15:24:42 +0100
Date: Thu, 20 Jul 2000 15:24:40 +0100 (BST)
From: David Woodhouse <dwmw2@passion.cygnus.co.uk>
To: Matt Hortman <mbhortman@ieee.org>
cc: mtd@infradead.org
Subject: Re: using int 13h to access DOC
In-Reply-To: <20000719183341.B26693@khayman.mavrik.com>
Message-ID: <Pine.LNX.4.21.0007201521560.23213-100000@passion.cygnus.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 19 Jul 2000, Matt Hortman wrote:

> Shoot this down: Since the M-Sys firmware in the DOC simply installs
> an int 13h handler, why not use it to access the DOC using "bios"
> calls.  I realize that the kernel probably overwrites that handler but
> that could be fixed.  I don't know, however, about using a real-mode
> interrupt from a device driver.  It seems too simple to work.  What
> have I overlooked?

It's complex and unreliable. You can't trust BIOSen and the M-Systems code
requires a _lot_ of low memory to be untouched.

There was, however, a patch for the 1.1 kernel which did this, I
believe. It is theoretically possible. Better just to complete the
existing GPL'd driver that we have though - it's probably easier.

Note - with the new 2.02 boot protocol for the Linux kernel, we should be
able to boot happily from DiskOnChip even with the huge EBDA that its
firmware requires. New bootloaders and 2.4 kernels should 'just work'
according to hpa. There's a patch available for the 2.2 kernel to support
the 2.02 protocol too.

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
