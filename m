Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OM0WC-0000g1-E3
	for linux-mtd@lists.infradead.org; Tue, 08 Jun 2010 15:15:08 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1OM0W7-00045k-Ro
	for linux-mtd@lists.infradead.org; Tue, 08 Jun 2010 17:15:04 +0200
Received: from amg-holding.md ([89.28.62.63])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jun 2010 17:15:03 +0200
Received: from egorkat by amg-holding.md with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jun 2010 17:15:03 +0200
To: linux-mtd@lists.infradead.org
From: Egorkat <egorkat@gmail.com>
Subject: modprobe nftl hangs
Date: Tue, 8 Jun 2010 15:13:37 +0000 (UTC)
Message-ID: <loom.20100608T165617-407@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Good day to ALL!

I'm struggling with M-systems DiskOnChip support under kernel 2.6.34.

Compiled support for DoC as a module under MTD device.
Module loads fine, no errors.
When I make nftl_format /dev/mtd0, I receive warnings:

voyage:~# nftl_format /dev/mtd0
version 1.24 2005/11/07 11:15:13 gleixner
Phase 1. Checking and erasing Erase Zones from 0x00000000 to 0x02000000
Skipping bad zone (factory marked) #0 @ 0x0
Skipping bad zone (factory marked) #1 @ 0x4000
Skipping bad zone (factory marked) #3 @ 0xc000
Skipping bad zone (factory marked) #4 @ 0x10000

After I try to modprobe nftl, I get:
NFTL Media Headers at 0x0 and 0x8000 disagree.
NFTL Media Headers at 0x0 and 0xc000 disagree.
NFTL Media Headers at 0x0 and 0x10000 disagree.
NFTL Media Headers at 0x0 and 0x14000 disagree.
Formatting block 2
Formatting block 5

And in hangs forever...

I think it is a problem in wrong headers at 0x0, which also resides on bad zone
But how to work this around?

With best Regards,
Egorkat.
