Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13pK7T-0004Pl-00
	for mtd-list@infradead.org; Sat, 28 Oct 2000 01:45:11 +0100
Received: from [208.201.248.136] (helo=nt.Broadlink.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13pK7S-0004Pf-00
	for mtd@infradead.org; Sat, 28 Oct 2000 01:45:11 +0100
Message-ID: <39FA2171.E9D9EB63@broadlink.com>
Date: Fri, 27 Oct 2000 17:44:33 -0700
From: John Whipple <john@broadlink.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: DOC + MTD + Advantech Biscuit = nothing?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello,

I'm using a PCM-4823, Linux 2.2.17 with the most recent CVS patch (dated
Oct 25).  I achieve the same result with DOC2000 4MB, DOC2000 8MB, and
Millenium 8MB, whether modular or built-in:

Upon bootup/insertion of modules:

Initializing MTD Layer
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: mtd-patch-2.2.17,v 1.1 2000/10/25 19:04:35 sjhill Exp $

and when I run "fdisk /dev/nftla":

NFTL_open
ENODEV: thisNFTL = 0, minor = 23808, ip = c0a34440, fp = c056a4a0
NFTL_open
ENODEV: thisNFTL = 0, minor = 23808, ip = c0a34440, fp = c056a4a0

Obviously the DOC is not being found, but If I have the address jumpered
to something other than D400, I get:

unable to register NFTL block device

Any helpful hints?  I need them!

-- 
John Whipple / Geek Dept., BroadLink Communications, Inc. / Linux 2.2
Calm down, they're just zeroes and ones.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
