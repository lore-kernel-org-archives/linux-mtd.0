Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13koiW-0000zC-00
	for mtd-list@infradead.org; Sun, 15 Oct 2000 15:24:48 +0100
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13koiV-0000z6-00
	for mtd@infradead.org; Sun, 15 Oct 2000 15:24:47 +0100
Date: Sun, 15 Oct 2000 15:24:37 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Nick Maximov <maxs@techno.spb.ru>
cc: mtd@infradead.org
Subject: Re: Ampro again
In-Reply-To: <200010131808.WAA17570@virgo.techno.spb.ru>
Message-ID: <Pine.LNX.4.21.0010151510010.20018-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 13 Oct 2000, Nick Maximov wrote:

> 
> I have got no response from anyone. 
> Just one question -- how safe to deal with mtd drivers and firmware
> updates (for grub) on Ampro hardware (CoreModule P5e-Q04).
> One thing stops me -- Ampro has their own format and update
> utilities which are incompatible with M-Systems' ones.

Ampro have their own software which is incompatible with the M-Systems
code but works on DiskOnChip?

> Does mtd utilities works on that modules? I affraid to crash BIOS again...
> May I produce file to load it to extended area via supplied pformat 
> utility? Is that better way?

Yes, and it shouldn't be too difficult. Look at the format of the .EXB
file and compare it with what you can read from the DiskOnChip using the
MTD driver. It should be fairly simple to produce utilities which do the
conversion to/from EXB and raw binary. (Famous last words, I know :)


> And what the latest stable kernel works better with this
drivers? 

Anything 2.2 or 2.4 should work, although if you use an older 2.2 you 
need to nick include/linux/compatmac.h from a newer one.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
