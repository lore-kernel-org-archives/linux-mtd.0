Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SE2F-0000V9-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 08:08:35 +0000
From: Christer Weinigel <wingel@acolyte.hack.org>
To: dwmw2@infradead.org
Subject: Re: Maybe FAQ, but I don't know te answer...
Cc: mtd@infradead.org
In-Reply-To: <15502.981449891@redhat.com>
Message-Id: <20010212080547.94DD9F5B@acolyte.hack.org>
Date: Mon, 12 Feb 2001 09:05:47 +0100 (CET)
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

dwmw2@infradead.org wrote:
>You can leave the original firmware in place, which makes it pretend to be 
>a BIOS-supported hard drive. So you can use any bootloader, although some 
>versions of LILO have problems with the amount of memory that the firmware 
>eats. We can also load Grub into the DiskOnChip in place of the original 
>firmware, and we've done about 90% of the work required to make grub 
>capable of loading a kernel from the DiskOnChip - just needs a few bugs 
>fixed.

Whre can I find that version of Grub?  I'm just playing around a bit
with a DiskOnChip module right now, and I hacked the stage1 loader
from the mtd/grub directory so that it can load etherboot and then
added a some very primitive DOC support to etherboot (it was available
and has a framework for serial consoles which works).

So now I load etherboot from the DOC and then scan the DOC for a tag
which identifies an etherboot nbi image and loads that.

If anyone is interested, I can probably clean up the sources a bit and
put it up on a website somewhere.

  /Christer


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
