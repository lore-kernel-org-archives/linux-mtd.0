Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11DvSx-0002cs-00
	for mtd@infradead.org; Mon, 9 Aug 1999 20:52:15 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11DvSx-0005cS-00; Mon, 9 Aug 1999 20:52:15 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11DvSw-0005kV-00; Mon, 9 Aug 1999 20:52:14 +0100
To: mtd@infradead.org
Subject: mtd-19990809 including readonly DiskOnChip driver.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Aug 1999 20:52:14 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11DvSw-0005kV-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I've updated the MTD package to include the modifications and new drivers made
by Jason Gunthorpe, and also the current version of my DiskOnChip and NFTL
code. 

It's available at:
	ftp://ftp.linux-mtd.infradead.org/pub/mtd/mtd-19990809.tar.gz

It should contain working drivers for:
	slram		- uncached system memory
	doc1000		- The old DiskOnChip 1000 and ISA flash cards.
	doc2000 	- DiskOnChip2000 (not yet Millennium)
	octagon-5066	- Memory-mapped flash found on a Single Board Computer
	vmax301 	- Likewise.

The devices are presented to the user by default as a character device. 
However, three block devices are available:
	
	ftl		- The original FTL filesystem, as used by PCMCIA
	nftl		- The new (NAND) FTL system, for the DiskOnChip
	mtdblock	- Direct block device access to the MTD

For some reason, the mtdblock_request routine seem to never be called. I'm 
obviously doing something stupid, so I'll let one of you tell me why that is :)

Also included is Jason's FFS2 implementation. The bootloader stuff is also 
present, but commented out in the top-level Makefile because I haven't yet 
upgraded my as86. I'd prefer it if we could make this work without 
bleeding-edge utilites. Jason, is that possible?

Soon, I'm intending to merge Alexander Larsson's 'flash.diff' for onboard 
CFI-compliant memories. Volunteers to do that would be appreciated, because it 
would let me concentrate on completing the DiskOnChip and NFTL code.

Happy Hacking.

----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
