Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13rSta-0006wT-00
	for mtd-list@infradead.org; Thu, 02 Nov 2000 22:31:42 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13rStZ-0006wN-00
	for mtd@infradead.org; Thu, 02 Nov 2000 22:31:41 +0000
Date: Thu, 2 Nov 2000 22:31:31 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: mark.langsdorf@amd.com
cc: mtd@infradead.org
Subject: RE: Problems with AMD CFI chips 
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F19F@txexmta8.amd.com>
Message-ID: <Pine.LNX.4.21.0011022225290.17678-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 2 Nov 2000 mark.langsdorf@amd.com wrote:

> 	Interleave 2, 4 byte buswidth, to support 2 16 bit chips.
> Again, that all looks pretty consistent.

Should be fine. ISTR that's what the original author was using.

> 	I think it may be some kind of interaction with jffs,
> because I've had limited success with creating directories 
> and deleting files, but not consistently.  I'm not sure where
> I should look in the jffs code to get more information, though,
> and would appreciate some pointers.

Make sure you've got up-to-date JFFS code. Or the code in the 2.4 kernel
is known good.

Hack flash_safe_write() to read back the data afterwards and verify it.

> 	Also, when does jffs attempt to clean out the dirty
> space?  thread_should_wake reports upwards of 2 megs of
> dirty space, which is about 16 sectors and 14% of the available
> memory.  I'd think that should get returned to the free list
> much earlier, especially during the reboots.

When the free space goes below gc_minfree_threshold or the dirty space
goes above gc_maxdirty_threshold. These are defined as 5% and 33% of the
total size of the flash partition, respectively. 

It's inefficient to GC too much before it's needed. In an ideal world,
we'd always have just enough free space to handle the next write without
having to wait for GC to happen.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
