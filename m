Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12AWdQ-0002YR-00
	for mtd-list@infradead.org; Tue, 18 Jan 2000 11:17:16 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12AWdP-0002YL-00
	for mtd@infradead.org; Tue, 18 Jan 2000 11:17:15 +0000
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 12AWmF-0000nd-00
	for mtd@infradead.org; Tue, 18 Jan 2000 11:26:23 +0000
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 12AWmF-0008PT-00; Tue, 18 Jan 2000 11:26:23 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: DiskOnChip bootloader.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 18 Jan 2000 11:26:23 +0000
Message-Id: <E12AWmF-0008PT-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


I've just taken a look at the grub source code, and it looks like:

	a. It should easily it in the 48Kb which we have for DoC firmware.		b. It should be fairly easy to make it talk DiskOnChip.

This is promising - we should be able to replace the DiskOnChip built-in BIOS 
with a version of grub which is capable of reading DOS and ext2 partitions off 
the DiskOnChip, and booting kernels it finds on them.

All we need to do is modify stage1 to handle the fact that the whole 
thing's already been loaded into memory - stage1 could probably be eliminated, 
in fact, if we modify stage2 to be aware that it may be loaded at a different 
address to normal.

I reckon it'd be a few minutes work to get Grub running from the DiskOnChip 
firmware, and about half a day more to add primitive read-only DiskOnChip 
support to its rawread() routine so it can actually boot a kernel off the 
DiskOnChip too.

If only I had that time available ATM :)




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
