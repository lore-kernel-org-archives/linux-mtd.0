Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12pp7F-0007nD-00
	for mtd-list@infradead.org; Thu, 11 May 2000 10:18:45 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12pp7E-0007n7-00
	for cvs-notify@infradead.org; Thu, 11 May 2000 10:18:44 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/patches grub-diskonchip.patch'
Message-Id: <E12pp7E-0007n7-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 11 May 2000 10:18:44 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/patches
In directory infradead.org:/tmp/cvs-serv29922

Added Files:
	grub-diskonchip.patch 
Log Message:
Add a first version of a patch against CVS grub which teaches it about the
DiskOnChip. So far, this only drives the hardware, and scans it for an
NFTL Media Header. It should be fairly simple to add real NFTL translation
to it, so that it can find and boot a kernel off the filesystem on the
device. It shouldn't even require access to the NFTL documentation - the
code already in kernel/nftl.c ought to be enough.

I'll schedule myself to do that between about 3am and 6am tomorrow
morning; or maybe I'll wait and see if anyone else cares enough to have a
go.

This is sort of orthogonal to the MTD drivers - you could boot a system
with M-Systems' drivers using a DiskOnChip-capable grub too.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
